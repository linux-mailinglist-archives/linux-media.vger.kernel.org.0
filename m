Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C052343AD
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732080AbgGaJtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:49:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37923 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732243AbgGaJtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:49:39 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200731094937euoutp0125c3cb14a870e611570cabff39ba51fe~mzWsaGMOs1136611366euoutp01p
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 09:49:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200731094937euoutp0125c3cb14a870e611570cabff39ba51fe~mzWsaGMOs1136611366euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596188977;
        bh=Auf/Y7T0ZSXckA925t899qPP3Dpx8eVNM9/B0OueJEY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=I8Mp4TZIQV/6qXN5wXEGb1KNltyFge/9ZGlDEaNu0fd9Nm/Ixf/C9/O6+b510SSMS
         H8a0h+d44ve3uN2RU5jhSZptQ2Yf9ZN+fS3y70pLDEbypXB2EbUMOE42TQ7LUQyk8x
         jGBjeE7wZOJDMLttkRG+e0WGss0bP0zJ6LdbYeeg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200731094937eucas1p1e81eb0b6f47be64a836514ba6582f1b4~mzWsLFojb0679706797eucas1p19;
        Fri, 31 Jul 2020 09:49:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.DC.06318.139E32F5; Fri, 31
        Jul 2020 10:49:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200731094937eucas1p267cb8d22b8d6455c3b7d59bb82b1fc39~mzWr2BBpm1213212132eucas1p2L;
        Fri, 31 Jul 2020 09:49:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200731094937eusmtrp1d5a319bd2a0c81a7ba821a9cf31e4d8a~mzWr1Wd1W1823518235eusmtrp14;
        Fri, 31 Jul 2020 09:49:37 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-00-5f23e931cb57
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 12.3A.06017.139E32F5; Fri, 31
        Jul 2020 10:49:37 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200731094936eusmtip1cf26c9c88e8a55397ba8e1112ebb69db~mzWrAktlk2426624266eusmtip1U;
        Fri, 31 Jul 2020 09:49:36 +0000 (GMT)
Subject: Re: [PATCH v2 07/11] media: exynos4-is: Add support for multiple
 sensors on one port
To:     Jonathan Bakker <xc-racer2@live.ca>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <83a13e5e-b172-7d95-195c-6d129f0005db@samsung.com>
Date:   Fri, 31 Jul 2020 11:49:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB0660571351D03A3A4FEDCD2CA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2znbOS5nn1PzzcxoKpXlDf1xoBTTfqw/IRFlgc6ZB5W8taml
        f7IiyUvewRyWYmY6MOe8ok1NzGtOsiyvWCiUmZRMwUpnzjPJf+/7PM/7vO/z8dGE+BXfgY6J
        T2IV8fJYiUBItvT9HnX3XnSWeekNjkx5r57P5M0vEczoqIZiRu79oBjt/Ec+8769TMDkaJr5
        zOPRTh5Trd3gMQ90vRTzrmCWDNgn1aozBdLGqjvSysl1UprbpEZSg9YpmH9NeCaSjY1JYRWe
        /uHC6GdDc1RiC++2oSaTSkdGlIUsaMC+ULaUK8hCQlqMaxCsf2nlmQgxXkWQ0eDKEQYEFVOb
        1O6E5rOK5IgXCNrrdOZmZXtc1bbtS9E2WAZbgSbYFtcjqC76xTM1BM5A8HQzfcdJgL3h0Zvc
        nTtE2B+K8r9ti2iaxK7QvXbcBNvhMGjuH+dxEmsYLF0gTbUFDoXXxtodnMD2MLVQbq6PQOty
        GWHaBXiMgo6OZsLkCfgclAzIuAA28L2/yRzGEYaLckhOfx9BTsc0xTX5COb6K8yPdBpm9H8E
        JiMCn4D6dk8OPgu6zjzE+VvBxLI1d4MVFLaUmNeK4GGGmFO7wF91CY+rHSB7YYvMRxLVnmSq
        PWlUe9Ko/u+tQKQa2bPJyrgoVukTz97yUMrjlMnxUR7XE+K0aPtPDRv719pQ50ZED8I0kliK
        wsckMjFfnqJMjetBQBMSW1HgyHCYWBQpT01jFQkyRXIsq+xBh2hSYi/yqVwMFeMoeRJ7g2UT
        WcUuy6MtHNKR2r/PcvK5+4Fit3Xdz1nXxLrWme6Q1FQ7r4ns4icjF/Iix70iqozjk13CAOHy
        /kahaNW5xO1lSN0sqbl80LrpWLLTrOJUDUUMrFw1DOsOT0/e1a8W1qVdmindIIO6sgbxTL5x
        /or+68kPRTeDXD5d9PM9/7bgaHBD7VCNi5/RrlJCKqPl3m6EQin/B5na085PAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xu7qGL5XjDVZ+ZLeYf+Qcq0X/49fM
        FufPb2C3ONv0ht1i0+NrrBaXd81hs+jZsJXVYsb5fUwWyzb9YbJo3XuE3eLixLssDtwem1Z1
        snlsXlLvsejmDxaPvi2rGD0+b5ILYI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
        tTIyVdK3s0lJzcksSy3St0vQy1h86j57wTamis8rOtkbGP8xdjFyckgImEhseDCLpYuRi0NI
        YCmjxO6OCUAOB1BCSmJ+ixJEjbDEn2tdbBA17xkl/sy6y97FyM4hLBAv8d8JpEREYD2jxIET
        YiAlzAJtjBKTN09igqi/wygx8UoPG0gVm4ChRO/RPrDFvAJ2EpMnvGAC2cUioCpx4KsGSFhU
        IE7ice9/ZogSQYmTM5+wgNicArESB/+tZAKxmQXUJf7Mu8QMYYtL3HoyHyouL7H97RzmCYxC
        s5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIExuW2Yz+37GDsehd8
        iFGAg1GJhzfhklK8EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xmgL9NpFZ
        SjQ5H5gy8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MLot/nl6
        k0DD8QMrJN5KVewoFHNN05d5NF2eiT1NjYfBfT/HLVH2TieJrwHeLqVbw+/lRFUwbfzSY3jM
        +2+DRuyeUxdcWiS9LyktnsrzaJNDr9Ya4fq2Cy6u1ZNVS14pRCp+WsVUJmZ1aSO/sIlD5Y36
        vxqau8WddaZELJ7v5r/sTPD//61NSizFGYmGWsxFxYkATocZ+OECAAA=
X-CMS-MailID: 20200731094937eucas1p267cb8d22b8d6455c3b7d59bb82b1fc39
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200730230238eucas1p29ff428328092ab522d04907ca9ea6522
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200730230238eucas1p29ff428328092ab522d04907ca9ea6522
References: <20200730230114.8572-1-xc-racer2@live.ca>
        <CGME20200730230238eucas1p29ff428328092ab522d04907ca9ea6522@eucas1p2.samsung.com>
        <BN6PR04MB0660571351D03A3A4FEDCD2CA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31.07.2020 01:01, Jonathan Bakker wrote:
> On some devices, there may be multiple camera sensors attached
> to the same port.  Make sure we probe all of them, not just the
> first one.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
