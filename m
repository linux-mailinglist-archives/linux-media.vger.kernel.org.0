Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC135218C2D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 17:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730311AbgGHPqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 11:46:49 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55444 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730071AbgGHPqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 11:46:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200708154647euoutp01056562d127c62d3449574ca9bf1c6bfe~f0Y_NYIIt0668906689euoutp01a
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 15:46:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200708154647euoutp01056562d127c62d3449574ca9bf1c6bfe~f0Y_NYIIt0668906689euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594223207;
        bh=8UYjgIC4s42kEpwbg4AQF/Erybejcy2vPCZCsfSKt1k=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=oCYnI0GGMg1sI6jh7fZdFWO7Kfl0vLpXTG+os6zheEFxszJ6JrvNGBH5v2MnLqU/j
         MdbbSyRgW7tzY/Qn48VWTOhR3EilTo8/040p3zJ/ycDLAY9HidVsOn0vYDSNgILRTq
         kM5P6ma/YlSEyjAHPocv63cBH+MXo6bc2EEYXFF0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200708154647eucas1p118e3edc13777ca1c2cdff5f70ede7426~f0Y_CG1n83001130011eucas1p1p;
        Wed,  8 Jul 2020 15:46:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 83.2B.06318.76AE50F5; Wed,  8
        Jul 2020 16:46:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200708154646eucas1p239d761cb198f46a64b86617907cec800~f0Y9oP2bP0511205112eucas1p2n;
        Wed,  8 Jul 2020 15:46:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200708154646eusmtrp2565eb3d54c950bdd163b1f0e3e68f412~f0Y9njynU2618426184eusmtrp2s;
        Wed,  8 Jul 2020 15:46:46 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-18-5f05ea677cde
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 45.37.06017.66AE50F5; Wed,  8
        Jul 2020 16:46:46 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708154645eusmtip2c92455d951a7686a833a96e90c25dae5~f0Y8rlzbM0401804018eusmtip2N;
        Wed,  8 Jul 2020 15:46:45 +0000 (GMT)
Subject: Re: [PATCH 06/11] media: exynos4-is: Properly set JPEG options when
 not using CSIS
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <f741b326-b1f1-858d-ca39-2ef1694541bd@samsung.com>
Date:   Wed, 8 Jul 2020 17:46:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB06606F63C7ACE765B57331A1A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djP87rpr1jjDdYcELXof/ya2eL8+Q3s
        Fmeb3rBbbHp8jdXi8q45bBY9G7ayWsw4v4/JYtmmP0wWFyfeZXHg9Ni0qpPNY/OSeo9FN3+w
        ePRtWcXo8XmTXABrFJdNSmpOZllqkb5dAlfGmXlb2AuuM1Wcu1jSwDiPqYuRk0NCwETiTNtH
        5i5GLg4hgRWMEj07X0A5Xxgl/t+bwwpSJSTwmVFi38pCmI6Xe+6yQRQtZ5T4/PU4C0TRR0aJ
        U8uLQWxhgViJQx3PGUGKRASamSSerZjJBpJgEzCU6D3axwhi8wrYSXTdbgFrZhFQkfhy7DdY
        XFQgTmL9y+1MEDWCEidnPgGr4QQaOmHqMbAaZgFxiVtP5jNB2PIS29/OATtbQmATu8Sft3vZ
        IE51kfjRu4QFwhaWeHV8CzuELSPxfydIM0hDM9DTu2+zQzgTGCXuH1/ACFFlLXHn3C+gSRxA
        KzQl1u/Shwg7SnQf/AcWlhDgk7jxVhDiCD6JSdumM0OEeSU62oQgqlUkfq+aDg1rKYnuJ/+h
        zvGQeDT/HusERsVZSN6cheS1WUhem4VwwwJGllWM4qmlxbnpqcXGeanlesWJucWleel6yfm5
        mxiBSen0v+NfdzDu+5N0iFGAg1GJh/fFJtZ4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW
        5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXA6JOc3X0is4xrm7KR6KQ6
        3d2uHe4cKk8yzRbtXeZWMXu3eeTKGZbmbztiNyyu9H3XvEzV5YNY8ZbMma8C4i8elkuxrdvw
        I+NWn2f9j1Uzd8nujlz5TuXc/2P72I8c7vz37vHzq5lcSkKtdro3Z+1Tb5vfasG40emi+ryl
        qqp1M9w41yWwi/ZWKrEUZyQaajEXFScCAEiX7mlGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xe7ppr1jjDXqaLSz6H79mtjh/fgO7
        xdmmN+wWmx5fY7W4vGsOm0XPhq2sFjPO72OyWLbpD5PFxYl3WRw4PTat6mTz2Lyk3mPRzR8s
        Hn1bVjF6fN4kF8AapWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqT
        WZZapG+XoJdxZt4W9oLrTBXnLpY0MM5j6mLk5JAQMJF4uecuWxcjF4eQwFJGidmf5wA5HEAJ
        KYn5LUoQNcISf651QdW8Z5Q4t+keWLOwQKzEoY7njCAJEYFmJon/y7exQFTdZZSYdmwvO0gV
        m4ChRO/RPkYQm1fATqLrdgsLiM0ioCLx5dhvsLioQJzE8i3z2SFqBCVOznwCVsMJtGHC1GNg
        NcwC6hJ/5l1ihrDFJW49mc8EYctLbH87h3kCo+AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5
        xUZ6xYm5xaV56XrJ+bmbGIHxtu3Yzy07GLveBR9iFOBgVOLhfbGJNV6INbGsuDL3EKMEB7OS
        CK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTAV5JfGGpobmFpaG5sbmxmYWSuK8
        HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYr1+SuOu4hv3ILN4ZO6ZVxs80fn3F5JK6+o2brl1h
        jlk7pA3XbmO4aVN/JiLy/xNRl7RVLxqmpXw1Oeylq/co48XC+mmV9nKsPq92KT1VFZiUZXxa
        llmNZaLW951+VsG/S41iS3eWKd2cfFssPeOAne5apySlj2eZ+Y+sqUnewZSw996zvt4VSizF
        GYmGWsxFxYkAatWuPs0CAAA=
X-CMS-MailID: 20200708154646eucas1p239d761cb198f46a64b86617907cec800
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200426022740eucas1p132625bc68acf42ee44a69e2a39e80ac9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200426022740eucas1p132625bc68acf42ee44a69e2a39e80ac9
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <CGME20200426022740eucas1p132625bc68acf42ee44a69e2a39e80ac9@eucas1p1.samsung.com>
        <BN6PR04MB06606F63C7ACE765B57331A1A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.04.2020 04:26, Jonathan Bakker wrote:
> Commit ee7160e57c98 ("[media] s5p-fimc: Add support for JPEG capture")
> added support for JPEG capture, but missed setting a register when the
> CSIS device wasn't in use.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

