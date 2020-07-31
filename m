Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFDC2343D4
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732418AbgGaJ7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:59:53 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41684 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732162AbgGaJ7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:59:52 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200731095951euoutp01b0fd68a59a5e2c358fc8ebc912594736~mzfnn5mx51967319673euoutp01k
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 09:59:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200731095951euoutp01b0fd68a59a5e2c358fc8ebc912594736~mzfnn5mx51967319673euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596189591;
        bh=/UTyw2WVp/qW81MDBjWkfGq6wWaWgdQ5KcsoHv0rets=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=OUwQa1/V/gYNXbWyToJqDSpAQiUW4mF4Qr42tTcb4BTpb1vtcSxrvBBEeuwCBmkwz
         5t+Qzpmc2wYsb3EPTT3kbY0bGpo1jYMDObf+s3aJWtIwDR+6OpUZQ5adfwBXlTrxDL
         /QqLUhE4G37RYKcBAF8KJ2kNvygojG6Zz0ja86uc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200731095950eucas1p2119893fda0e9692ba35e8a48bb74f6ec~mzfnY70E_2084920849eucas1p22;
        Fri, 31 Jul 2020 09:59:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 34.44.05997.69BE32F5; Fri, 31
        Jul 2020 10:59:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200731095950eucas1p14f135c91930e8ab6a2fe40086fd846d0~mzfnDVqed3203832038eucas1p1E;
        Fri, 31 Jul 2020 09:59:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200731095950eusmtrp28e1d8db7dd7ad625add3a6a537998e19~mzfnCelsK1695216952eusmtrp2U;
        Fri, 31 Jul 2020 09:59:50 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-0c-5f23eb960b7a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id EA.98.06314.69BE32F5; Fri, 31
        Jul 2020 10:59:50 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200731095949eusmtip1f3c1f903267bd22e85bb137adad7dfef~mzfmD46WJ0043800438eusmtip1x;
        Fri, 31 Jul 2020 09:59:49 +0000 (GMT)
Subject: Re: [PATCH v2 11/11] dt-bindings: media: Correct samsung-fimc
 parallel port numbering
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <7313c052-5bfb-3958-06a8-aa96f6950f36@samsung.com>
Date:   Fri, 31 Jul 2020 11:59:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB0660B938349CA15DE7BCC5BBA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djPc7rTXivHG0y6bWwx/8g5Vov+x6+Z
        Lc6f38BucbbpDbvFpsfXWC0u75rDZtGzYSurxYzz+5gslm36w2TRuvcIu8XFiXdZHLg9Nq3q
        ZPPYvKTeY9HNHywefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlfHzww7Ggt/MFQcWPGdpYJzK
        3MXIySEhYCJxePJnti5GLg4hgRWMEj8urGeEcL4wSqyc85oJwvnMKHFmeicbTMvEZ4+YIRLL
        GSU2vz3ADuF8ZJR48nc9O0iVsECCxOKutSxdjBwcIgLqEtef8oHUMAv0MUksfdHPCFLDJmAo
        0Xu0D8zmFbCTWHnpIFgvi4CqxJ7rjWAHigrESWw9fpUJokZQ4uTMJywgNqdArMThXe2sIDaz
        gLjErSfzmSBseYntb+eAXSchcIldYubpzywQZ7tIzNswEeoFYYlXx7ewQ9gyEv93zmeCaGhm
        lOjZfZsdwpnAKHH/+AJGiCpriTvnfrGBvMMsoCmxfpc+iCkh4Chx6qklhMknceOtIMQNfBKT
        tk1nhgjzSnS0CUHMUJH4vWo6E4QtJdH95D/LBEalWUg+m4Xkm1lIvpmFsHYBI8sqRvHU0uLc
        9NRio7zUcr3ixNzi0rx0veT83E2MwFR1+t/xLzsYd/1JOsQowMGoxMObcEkpXog1say4MvcQ
        owQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2CyTJx
        cEo1MNq519f6LlyguLg6rU5Lflb/wiMtX18FVf701Fw2TebFP/cS8w/rq71LSrU95VPjYtq+
        /bu5RW3q73uaybkr56/L+r+p6bt95NyALSWFQVHGEaVZypJrqm59iph2dHa6xbX/WlUVi2pM
        nC87uR+JiTwfu7tLW6D2dqhT/blMj4L9Qmw/n06pVWIpzkg01GIuKk4EAHxYlV1RAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xu7rTXivHG8zrlraYf+Qcq0X/49fM
        FufPb2C3ONv0ht1i0+NrrBaXd81hs+jZsJXVYsb5fUwWyzb9YbJo3XuE3eLixLssDtwem1Z1
        snlsXlLvsejmDxaPvi2rGD0+b5ILYI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
        tTIyVdK3s0lJzcksSy3St0vQy/j5YQdjwW/migMLnrM0ME5l7mLk5JAQMJGY+OwRmC0ksJRR
        4tCR4i5GDqC4lMT8FiWIEmGJP9e62LoYuYBK3jNKLDqwkhUkISyQILG4ay0LSL2IgLrE9ad8
        IDXMAn1MEsfn32WBaLjDKPF99m9GkAY2AUOJ3qN9YDavgJ3EyksH2UFsFgFViT3XG8GOEBWI
        k3jc+58ZokZQ4uTMJywgNqdArMThXe1gi5mBlv2Zd4kZwhaXuPVkPhOELS+x/e0c5gmMQrOQ
        tM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBEbmtmM/N+9gvLQx+BCj
        AAejEg9vwiWleCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQFem4is5Ro
        cj4waeSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamCUZqll1ntz
        8P7xqf+CPv/t1fTuCfnfue/EIyHDhSqJr5OLnku/SzLh4e1cdsXXV9/qzeTPM46uMP3mEeN5
        57h162TfC3Mq7th9fh/REcHUm8rYl/XqXWVaxG/JGy6/y41u2j8TWjtzWd77CMfUT7ICy5fa
        nba6uOk4b0LfrKV5u57Xz2l6Z7dZiaU4I9FQi7moOBEAY+3oB+ICAAA=
X-CMS-MailID: 20200731095950eucas1p14f135c91930e8ab6a2fe40086fd846d0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200730230226eucas1p289b3086e47eb52bcdfc02ef660abd0b9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200730230226eucas1p289b3086e47eb52bcdfc02ef660abd0b9
References: <20200730230114.8572-1-xc-racer2@live.ca>
        <CGME20200730230226eucas1p289b3086e47eb52bcdfc02ef660abd0b9@eucas1p2.samsung.com>
        <BN6PR04MB0660B938349CA15DE7BCC5BBA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31.07.2020 01:01, Jonathan Bakker wrote:
> The parallel port nodes should be numbered 1 and 2, not 0 and 1
> for A and B respectively.  The driver has always implemented 1
> and 2 and the in-tree Goni DTS uses 1 as port A as well.  Update
> the documentation to match this behaviour.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thanks for all those improvements, whole series looks good to me.

-- 
Regards,
Sylwester
