Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8272343BF
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732325AbgGaJyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:54:46 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39754 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732075AbgGaJyq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:54:46 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200731095443euoutp019c202bcd5288c15ef0236fed085ac886~mzbJWjD-V1388913889euoutp01g
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 09:54:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200731095443euoutp019c202bcd5288c15ef0236fed085ac886~mzbJWjD-V1388913889euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596189283;
        bh=kzxpbYTCVDFUL9r0oYD9eQhwj95h17pWawu87WQH3Tw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=CdVFgx5ve6RCw3QeK1unNKNXJXeINWZLrJGOgoVLlf0jZEkr7MH9DUyT8NTltoxyl
         DXFXL3EW0x5Lu2PeeM57isJP9QWMMZupJ/pPQDBBu50lZ3UDAHIibM6eNxgGlNfVEH
         pZFYsYF6QHWfWTzLnHGDVwpbWGuvrViZNJqOJb+M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200731095443eucas1p1cf16316d0ef393e40c4a9263e67b0c06~mzbJKWYD60727507275eucas1p1i;
        Fri, 31 Jul 2020 09:54:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 3A.9D.06318.36AE32F5; Fri, 31
        Jul 2020 10:54:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200731095443eucas1p2006dbbd3874265a8a49081b3c8dba7da~mzbIrhZ1P3148831488eucas1p2O;
        Fri, 31 Jul 2020 09:54:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200731095443eusmtrp1f613eb532de5cecab6f6eaa0a94049f9~mzbIq4mWp2137621376eusmtrp1A;
        Fri, 31 Jul 2020 09:54:43 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-63-5f23ea6317aa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A1.EA.06017.26AE32F5; Fri, 31
        Jul 2020 10:54:43 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200731095442eusmtip181539015b365d5ffd5112be76d18aaab~mzbH_NmA-2935229352eusmtip1j;
        Fri, 31 Jul 2020 09:54:42 +0000 (GMT)
Subject: Re: [PATCH v2 10/11] media: exynos4-is: Handle duplicate calls to
 vidioc_streamoff
To:     Jonathan Bakker <xc-racer2@live.ca>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <e99235a5-0d8a-9948-596e-beff3da4b12e@samsung.com>
Date:   Fri, 31 Jul 2020 11:54:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB06606A36716392E7634CF8DCA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0iTYRTHe/a+uzibvE7DM42kVYRdtKEf3kiGStI+VETQF0Pn0heVdMrm
        LP3S1BS1aV4gbWmTShNRtDnXvE28riZupSR2MSFN8IaKillabXuT/PY75/zPc/5/eDgYv5fp
        y0mSp1MKuSxZyOLixuFt29m4hWPSc6+6j5K6QRuTfDiziJF2eyubHM1ZYpP6mQkmOd5ZzSI1
        re1MsspuZpD1+h0GmdczyCbfl03hYe4SfWMhS9L24p7k2ccfuKTE0Igk6/oj15hR3NB4Kjkp
        g1IEiWO5ieO6DiwtB7/b9LWOpUZ6rAi5cYAIAXuFycV8ogHBYpOA5g0EbfNXixDXwesICos3
        8L0Fk1rHpgcvEaxtjLPoYg1Ble4J26nyIqIhO78Acw68iRYE9RWrDGeBEfkInu6qXSoWIYLi
        oRLkZB4hBrNpnulknDgBzyfmXKYOETHQbvnAoDWe8PbxrMuHm+OC1Wh2vYMRPvBpVseg2R9e
        L1e7LgMxxoatoXZEG78Ik7lVTJq9YMFiYNN8GEYqNDi9kItA0/WZTRelCKYttf+2L8AX209H
        Uo7jRAC0dAbR7XDoq7MynG0gPGBy2ZM24QHlxkqMbvOgIJ9Pq4/Dr8ZKBs2+8GD2D16KhNp9
        0bT74mj3xdH+v1uL8EbkQ6mUKQmUMlhO3QlUylKUKnlCYFxqih45vtXIb8umCZl3bvUjgoOE
        B3mxY0IpnynLUGam9CPgYEJvXsToSAyfFy/LzKIUqVKFKplS9iM/Di704QU/m4/mEwmydOo2
        RaVRir0pg+Pmq0Y60TBhyRXbO7205c3nr4QGdGXrr6/sdlg10uYqyApKEvg/Iqd8TqZORZaG
        wAG3G0091lVBZG+fCnfvrjGWLQp0A4bwJfn32ZXNOa0mLy9SZEC5ZwZC33hsvovKjgwTn54W
        VbO+TRB+I1t+2w33IxZNtks1xTcr00Tcy7XlQlyZKBOdwhRK2V8KtR9RUgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xu7rJr5TjDS48YbSYf+Qcq0X/49fM
        FufPb2C3ONv0ht1i0+NrrBaXd81hs+jZsJXVYsb5fUwWyzb9YbJo3XuE3eLixLssDtwem1Z1
        snlsXlLvsejmDxaPvi2rGD0+b5ILYI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
        tTIyVdK3s0lJzcksSy3St0vQy7g8fydzQRNLxZp7S9kaGDcxdzFyckgImEjsaJjP3sXIxSEk
        sJRRYsmaJpYuRg6ghJTE/BYliBphiT/Xutggat4zShxs7mAFSQgLxEo0tnWADRIRWM8oceCE
        GEgRs0Abo8TkzZOYIDruMEosW3sIrIpNwFCi92gfI4jNK2AnsW/HS7BJLAKqEouvPQOrERWI
        k3jc+58ZokZQ4uTMJywgNifQtlPb9rGD2MwC6hJ/5l1ihrDFJW49mc8EYctLbH87h3kCo9As
        JO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHRue3Yzy07GLveBR9i
        FOBgVOLhTbikFC/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYS
        Tc4HJo68knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MC2T+Xnov
        dXBLKG+udptJsdkEyy/cG3jYjkYqZ344UGMfKC+2bUKr5s+Ic0fvnSs4dX3a7buK3dpyPF/j
        n607/dAi21R+maPFSu52kwkJW9bkOF+/sLnR5umFRG7tDTzhLqqMrk9OiqpbP3z5131Wh5Pp
        38SFm6dK2Wqfn2Opqnjx2rpP5QeuKrEUZyQaajEXFScCAKx/8ZrkAgAA
X-CMS-MailID: 20200731095443eucas1p2006dbbd3874265a8a49081b3c8dba7da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200730230219eucas1p1eed6b7966e17507c3a817e6d86ea84c0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200730230219eucas1p1eed6b7966e17507c3a817e6d86ea84c0
References: <20200730230114.8572-1-xc-racer2@live.ca>
        <CGME20200730230219eucas1p1eed6b7966e17507c3a817e6d86ea84c0@eucas1p1.samsung.com>
        <BN6PR04MB06606A36716392E7634CF8DCA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31.07.2020 01:01, Jonathan Bakker wrote:
> vidioc_streamoff can be called multiple times from userspace, but we
> should only call media_pipeline_stop when we're actually setup.
> 
> This became more noticeable after commit 2a2599c66368 ("[media] media:
> entity: Catch unbalanced media_pipeline_stop calls") was merged as it
> added a WARN for unbalanced calls to media_pipeline_stop.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
