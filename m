Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67E99FD51
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 10:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfH1Ij6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 04:39:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44493 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfH1Ij6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 04:39:58 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190828083955euoutp02b83c6dd9d485bfdf0689fdade8bf4982~-CXWPVIDv0739707397euoutp02G
        for <linux-media@vger.kernel.org>; Wed, 28 Aug 2019 08:39:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190828083955euoutp02b83c6dd9d485bfdf0689fdade8bf4982~-CXWPVIDv0739707397euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566981595;
        bh=nCO1CGbNKa5rvO48tD1eLJmbBQi/YQi3un/pIVM1ksQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=GyUvhO6HUlrozwZ+TG0uHeVIsHhZiuw7lkq26iTfRYh/mXQq/HVm2f0FZ4Q2Brefi
         /go/dCadcvFZSwQaJ4kn/7fqD7oQyo9qjS24MxWdthRrAkgHTAx+NJqdHM7UHBHp5L
         S0CF7Js9555sE7kx4Y1RZlliA8d1Tv4DUheaz7QA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190828083955eucas1p2c5ef161d4b0934ff1def119ebe330278~-CXVc2gpu2348323483eucas1p2z;
        Wed, 28 Aug 2019 08:39:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 0A.DD.04374.ADD366D5; Wed, 28
        Aug 2019 09:39:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190828083954eucas1p2b8dc8e6d795b984ec607a7e49911ff2b~-CXUm5jQe2349023490eucas1p2h;
        Wed, 28 Aug 2019 08:39:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190828083953eusmtrp1093ab1005f1cbb6474ace28275f78049~-CXUYPHem2582525825eusmtrp1x;
        Wed, 28 Aug 2019 08:39:53 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-b1-5d663dda61d3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D7.07.04117.9DD366D5; Wed, 28
        Aug 2019 09:39:53 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190828083953eusmtip198a24422c79bd0cf39db371dda376fb4~-CXTs6pHN0415604156eusmtip1z;
        Wed, 28 Aug 2019 08:39:53 +0000 (GMT)
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
Date:   Wed, 28 Aug 2019 10:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-10-darekm@google.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3bO2Y7D6WkavqybDfujIs2MOmVZQcSBIIIoYyW27KTSZrbT
        uhJ5AfGy6XJRuVatErR102XzVkZqDZMaUoQpa5JCqUnknGBeltuZ5H+/532f93veFz4Sk/4g
        ZGRm1hlWk6VUyYVi3P5u4uPanm0nUtZ1F8fS+o8dAtpnv4rRlY6HiP7s/S2kuypcOF3uNuD0
        z29dOF3WP4zRTmeNiP6Q90tE2/q/EPSnJrOQ1tW8IOibzhYBfdM4KNwRzrwat+CMxaZlbNYi
        IVM/3kcw7hKHgHleeYUprbMixmNbxrz3ekT7QhTircdZVeZZVhOXdFScca15lMhuCz1vnviJ
        5aAqcTEKIYHaAK6rPYJiJCalVDUCS25xUIwheGvXI154EPwqdKK5EXf+oIhvVCG4Wz8UFCMI
        XDN/cL8rglLAtOuR0N+IpIoQPNCPBwRGVWCQ224Q+F1CKh70b0sD70qoJDB+MBN+xqmVMGOb
        CNQXUYdgtK+N4D0LoaNiIJAQQm0Coy434MGoKMgbe0jwvBzqR8yYPwyoIhKG/74KLr4L7M52
        Ic8RMOSoE/G8BDqNOpwfyEega+4V8cKAwO2wBKcToc3RNRtBzkasgmdNcX4Eaif0vVDxGAbd
        Iwv5HcKg3H4D48sSKCyQ8m/EwKT1hoBnGZQM+HADkpvmXWaad41p3jWm/7EWhFtRFKvl1Oks
        l5DFnovllGpOm5Uem3ZKbUOz369zxuFtQC1Tx1oRRSJ5qKQwnE2REsqz3AV1KwISk0dKvsfM
        liTHlRcusppTqRqtiuVa0WISl0dJLi3oOyyl0pVn2JMsm81q5roCMkSWg0JtUUeTahWjntKc
        38k1BUmENe70Cvflgarke3dueauv9ywzNEq96w5M/tn7MmUqc+nmg7UmRVnbYEWe6xz96MmT
        L0OpTRunDkfXDdsOJnZz62WNr/fcr6a2xzyd7k+IeOxTR2fcbX1sUPs+NfjSCm/3Kr6uMTX9
        OJJt3r3/zZb+khw5zmUo41djGk75D83/noN6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xu7o3bdNiDV7M0bPoPXeSyeL/tonM
        FkuOr2S0uPL1PZvFxZl3WSwm3Z/AYvHi3kUWi/7Hr5ktzp/fwG5xtukNu8Wmx9dYLS7vmsNm
        0bNhK6vFjPP7mCxmTH7J5sDvsffbAhaPBZtKPTat6mTz2P7tAavH/e7jTB6bl9R79G1Zxejx
        eZOcx6mvn9kDOKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
        Uov07RL0Mqbs/sRacJinYs7PF8wNjMu5uhg5OSQETCTuN79k72Lk4hASWMoo8fHhHcYuRg6g
        hJTE/BYliBphiT/Xutggal4zSnzfso8RJCEsECXx9+5qsISIQCejxK47t1lAHGaBmcwSu1b0
        QI3dxijxZ8kWVpAWNgFDid6jfWDtvAJ2EpPPzgGLswioSvzb9BMsLioQIXF4xyyoGkGJkzOf
        sIDYnALmEpN7GsHizALqEn/mXWKGsMUlmr6sZIWw5SW2v53DPIFRaBaS9llIWmYhaZmFpGUB
        I8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwGjfduznlh2MXe+CDzEKcDAq8fB28KfGCrEm
        lhVX5h5ilOBgVhLhfaQCFOJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YCLKK4k3NDU0t7A0
        NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAWHk/8qHuefNNd5nnltxWXRTqWXXl
        y2nn3wfm7brHqOHCeant5InlAk7si0tEVi09KF/4ZqOfC+P5kBei//tM4j9HL0+68izsilSt
        /jzR4IYXEoeWcXqFRU75ylH0TVdjzkZ1ZptntxK0jj3dbphVotGx/j27adNijwOdrae2mmVq
        Cx+LmLwnQYmlOCPRUIu5qDgRAAkeheoMAwAA
X-CMS-MailID: 20190828083954eucas1p2b8dc8e6d795b984ec607a7e49911ff2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71
References: <20190814104520.6001-1-darekm@google.com>
        <CGME20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71@epcas3p4.samsung.com>
        <20190814104520.6001-10-darekm@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 12:45, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v2:
> 	- removed unnecessary call to invalidate phys address before
> 	deregistering the notifier,
> 	- use cec_notifier_phys_addr_invalidate instead of setting
> 	invalid address on a notifier.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index bc1565f1822ab..d532b468d9af5 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c

> @@ -2006,12 +2020,6 @@ static int hdmi_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	hdata->notifier = cec_notifier_get(&pdev->dev);
> -	if (hdata->notifier == NULL) {
> -		ret = -ENOMEM;
> -		goto err_hdmiphy;
> -	}
> -
>  	pm_runtime_enable(dev);
>  
>  	audio_infoframe = &hdata->audio.infoframe;
> @@ -2023,7 +2031,7 @@ static int hdmi_probe(struct platform_device *pdev)
>  
>  	ret = hdmi_register_audio_device(hdata);
>  	if (ret)
> -		goto err_notifier_put;
> +		goto err_runtime_disable;


> -err_notifier_put:
> -	cec_notifier_put(hdata->notifier);
> +err_runtime_disable:
>  	pm_runtime_disable(dev);

nit: I think err_rpm_disable or err_pm_runtime_disable could be better 
     label names.

-- 
Thanks,
Sylwester
