Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE95F23437F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732107AbgGaJoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:44:32 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43165 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732076AbgGaJoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:44:32 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200731094429euoutp02a52e2695bc96fc5316c7fe16a764865c~mzSNgDEWJ1290112901euoutp02a
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 09:44:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200731094429euoutp02a52e2695bc96fc5316c7fe16a764865c~mzSNgDEWJ1290112901euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596188669;
        bh=+5Joqj7QrRDxPJyzHMJjnbyfdzDpF2c8FTY9byCVINU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kmtJXgYuIyfqj7eGgUwPnyN8SDfv8k6Yr11TBXQFzX8k/4EztisyDIc8oIBTThPPU
         91sW6wOsO1AuYm0W4Sis+8DV0KCOB+iapXHTPKr2MJ05pjXwngEZ6VbnQu6PNI/z2u
         ofhuP6A84GFE+Pn9aouEwb821mZskMAILdhCmhOc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200731094429eucas1p1e3370b878522bffd703d4d72322c8941~mzSNKxRdc2573425734eucas1p1y;
        Fri, 31 Jul 2020 09:44:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 23.32.05997.DF7E32F5; Fri, 31
        Jul 2020 10:44:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200731094428eucas1p1b4b54a983777de85c16bad3a1005ca65~mzSMwlScL2573425734eucas1p1x;
        Fri, 31 Jul 2020 09:44:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200731094428eusmtrp2085c2bd09665fd1e19c8e42dccd80db6~mzSMv4JzC0738707387eusmtrp2Y;
        Fri, 31 Jul 2020 09:44:28 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-ca-5f23e7fd393f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4E.79.06017.CF7E32F5; Fri, 31
        Jul 2020 10:44:28 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200731094427eusmtip2ba9a642a3bcad03c8669a6dda911a984~mzSLwEoRQ0239802398eusmtip2F;
        Fri, 31 Jul 2020 09:44:27 +0000 (GMT)
Subject: Re: [PATCH v2 06/11] media: exynos4-is: Use global num_sensors
 rather than local index
To:     Jonathan Bakker <xc-racer2@live.ca>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <2ac8f74a-354e-aa28-fac3-71afa09594f8@samsung.com>
Date:   Fri, 31 Jul 2020 11:44:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB066025E2D254EF0E5383B7FCA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djP87p/nyvHG/xrFLSYf+Qcq0X/49fM
        FufPb2C3ONv0ht1i0+NrrBaXd81hs+jZsJXVYsb5fUwWyzb9YbJo3XuE3eLixLssDtwem1Z1
        snlsXlLvsejmDxaPvi2rGD0+b5ILYI3isklJzcksSy3St0vgypi9g7+gm6WioW82WwPjSuYu
        Rk4OCQETidt3XrN2MXJxCAmsYJS4dKIVyvnCKHHo4QVmCOczo8S+1sWMMC1zn/xhhEgsZ5S4
        e+E3O4TzkVGi5f1qJpAqYYFEiQWHrzCBJEQE1jNKLJv8AcxhFmhjlJj3t4EdpIpNwFCi92gf
        2FxeATuJf0vPs4DYLAKqEt/XXwCrERWIk9h6/CoTRI2gxMmZT8BqOAViJW5PP8wGYjMLiEvc
        ejKfCcKWl9j+dg7Y4RIC19glPvyezgZxuIvEuVUzmSBsYYlXx7ewQ9gyEv93zmeCaGhmlOjZ
        fZsdwpnAKHH/+AKot60l7pz7BTSJA2iFpsT6XfoQYUeJTT9PMIGEJQT4JG68FYQ4gk9i0rbp
        zBBhXomONiGIahWJ36umQ50gJdH95D/LBEalWUhem4XknVlI3pmFsHcBI8sqRvHU0uLc9NRi
        o7zUcr3ixNzi0rx0veT83E2MwHR1+t/xLzsYd/1JOsQowMGoxMObcEkpXog1say4MvcQowQH
        s5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2CyTJxcEo1
        MHapxSz1YO24qxen+DeM5WmlR/T9tytLNuxNVlLP2rPyn4XInG0rikMNDsZU9z/hq5bT9G8O
        CqnY2sR4s23ObLeuDS5XT1718BUO2b//lbb2pDnOHl/MI0/fvdYqupvzUM7rLNcpV72XBr4S
        Od+v4RDcd8P51DcLL6YNb+NeJvjed1Ngudx7SImlOCPRUIu5qDgRALemcUpTAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7p/nivHG3x/YGox/8g5Vov+x6+Z
        Lc6f38BucbbpDbvFpsfXWC0u75rDZtGzYSurxYzz+5gslm36w2TRuvcIu8XFiXdZHLg9Nq3q
        ZPPYvKTeY9HNHywefVtWMXp83iQXwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwe
        a2VkqqRvZ5OSmpNZllqkb5eglzF7B39BN0tFQ99stgbGlcxdjJwcEgImEnOf/GHsYuTiEBJY
        yihx+8Q79i5GDqCElMT8FiWIGmGJP9e62CBq3jNKrNv7lgmkRlggUWL35CSQGhGB9YwSB06I
        gdQwC7QxSkzePIkJouEOo8SpBZdYQKrYBAwleo/2MYLYvAJ2Ev+WngeLswioSnxff4EdxBYV
        iJN43PufGaJGUOLkzCdgNZwCsRK3px9mA7GZBdQl/sy7xAxhi0vcejKfCcKWl9j+dg7zBEah
        WUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECI3PbsZ9bdjB2vQs+
        xCjAwajEw5twSSleiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYTYGem8gs
        JZqcD0waeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGDfI3Dn2
        59Ikztnv7i66LPfyilr1mY3Tp+62nuoetFFswtkGm1nHbr5I/f/8B6vPbsHN0purz+05ZxBf
        9DtVMe99OZ/7uurVLaffXWa2OSh0sFF84sa2A4uKPApTlU8GV6X/nekT6PZAL8KqkHO9J1eP
        bEOErva5KpMbWtPeOP6oPHPXaOPu2MNKLMUZiYZazEXFiQDPXrZh4gIAAA==
X-CMS-MailID: 20200731094428eucas1p1b4b54a983777de85c16bad3a1005ca65
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200730230239eucas1p2b12c39ca08601b52a54f28c228ae6441
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200730230239eucas1p2b12c39ca08601b52a54f28c228ae6441
References: <20200730230114.8572-1-xc-racer2@live.ca>
        <CGME20200730230239eucas1p2b12c39ca08601b52a54f28c228ae6441@eucas1p2.samsung.com>
        <BN6PR04MB066025E2D254EF0E5383B7FCA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31.07.2020 01:01, Jonathan Bakker wrote:
> Instead of keeping a local copy of how many sensors we've probed
> (which may not even properly represent the number of sensors
> probed if we have a port without a sensor), use the global
> num_sensors counter that has the actual number used.
> 
> This will also make it easier to add support for multiple sensors
> being connected to the same port.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
