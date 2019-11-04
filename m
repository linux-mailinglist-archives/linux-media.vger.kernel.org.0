Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80918EDBB1
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 10:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKDJeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 04:34:46 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:15507 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfKDJeq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 04:34:46 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20191104093443epoutp0420cbd3789d3a652dc8e5161eadb37f58~T6_mCSixp0741807418epoutp047
        for <linux-media@vger.kernel.org>; Mon,  4 Nov 2019 09:34:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20191104093443epoutp0420cbd3789d3a652dc8e5161eadb37f58~T6_mCSixp0741807418epoutp047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572860083;
        bh=KZJhenEMisppLBvIbXK5xxvbga+5PmcgE95jmXgehLQ=;
        h=Date:From:Reply-To:To:CC:Subject:In-Reply-To:References:From;
        b=kIZJ6wDOKHYRPuKI60JDEDFCosb7XruUREvmA4OnxsVG8PHzPWFqrftcyWlXxt0Bo
         Ilp1phJOoJZoqYXmdqvgGXtEeyl+Plbzu91NZVRDTa6BvTDwvuAGzGu2ktmSkCl4/k
         EbHSlN3B2PrtWKdgf46vFbvrVKj83bpDreLIDzJQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191104093442epcas1p226272be4f04e75286cf4a6d496d0c9ca~T6_lvzzrg0465604656epcas1p20;
        Mon,  4 Nov 2019 09:34:42 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 47671B62N1zMqYm5; Mon,  4 Nov
        2019 09:34:38 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        54.56.04068.EA0FFBD5; Mon,  4 Nov 2019 18:34:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20191104093438epcas1p3763243991efd0f5430b7dceab7debd62~T6_hyAoUW3095730957epcas1p30;
        Mon,  4 Nov 2019 09:34:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191104093438epsmtrp23db0a737e73c14dcfff2a1ccb57df63e~T6_hxUd-92200522005epsmtrp26;
        Mon,  4 Nov 2019 09:34:38 +0000 (GMT)
X-AuditID: b6c32a39-f47ff70000000fe4-6e-5dbff0ae4d6f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        84.14.24756.EA0FFBD5; Mon,  4 Nov 2019 18:34:38 +0900 (KST)
Received: from [10.113.221.222] (unknown [10.113.221.222]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191104093438epsmtip2c98be478dad64ecb47c119cfc6b44fab~T6_hhIoF62656826568epsmtip2K;
        Mon,  4 Nov 2019 09:34:38 +0000 (GMT)
Message-ID: <5DBFF146.6070903@samsung.com>
Date:   Mon, 04 Nov 2019 18:37:10 +0900
From:   Seung-Woo Kim <sw0312.kim@samsung.com>
Reply-To: sw0312.kim@samsung.com
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:16.0) Gecko/20121011
        Thunderbird/16.0.1
MIME-Version: 1.0
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        mchehab@kernel.org, krzk@kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH] media: exynos4-is: fix wrong mdev and v4l2 dev order in
 error path
In-Reply-To: <fdd591ce-f0b3-8737-bd1f-27645035ce7e@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmk+LIzCtJLcpLzFFi42LZdlhTV3fdh/2xBvP3GVmcP7+B3aJnw1ZW
        ixnn9zFZLNv0h8ni8Jt2IHfySzYHNo9NqzrZPPq2rGL0+LxJLoA5KtsmIzUxJbVIITUvOT8l
        My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB2ivkkJZYk4pUCggsbhYSd/Opii/
        tCRVISO/uMRWKbUgJafAskCvODG3uDQvXS85P9fK0MDAyBSoMCE74+yJWUwFz7krfj1+ztzA
        +Jizi5GTQ0LARGL2h7fMXYxcHEICOxglFqyYwA7hfGKUWP/qBVTmG6PElNvfGGFaTvy7C1W1
        l1Fix4JFrBDOe0aJtsc9rCBVvAJaEncOzWQBsVkEVCVa/vxkArHZBHQk9i/5DVYjJKAgcWHr
        DDYQW1QgTGLGwX5GiF5BiZMzn4D1igjoSyxZdZENZAGzwCRGiZ7tfWDNwgKREnNvrgFr5hSw
        l7g1bT3YAmYBeYnmrbPB7pYQOMMmcev6EWaIu10kZlxZzw5hC0u8Or4FypaS+PxuLxuEXS2x
        fcJPdojmDqBt7Y0sEAljif1LJwNt4ADaoCmxfpc+RFhRYufvuYwQi/kk3n0F+Z4DKM4r0dEm
        BFGiIrHz6CQ2iLCUxKwNwRBhD4n1Uy8wTWBUnIXk5VlIPpiFsGsBI/MqRrHUguLc9NRiwwJT
        5CjexAhOiFqWOxiPnfM5xCjAwajEw/uCc3+sEGtiWXFl7iFGCQ5mJRHeizP2xgrxpiRWVqUW
        5ccXleakFh9iNAXGzkRmKdHkfGCyziuJNzQ1MjY2tjAxNDM1NFQS53VcvjRWSCA9sSQ1OzW1
        ILUIpo+Jg1OqgbFtSruH8rO7v5YbvLhnonT1gfEZhW0B0XMUJxbe/6Q/VffT/5Vrf8j0qvZd
        fLT3XMLvSftrksMqJQOL/FmOvVCd76b6tHqGQjtDq2aFj5A0q6VyPTNPyguZxQekNN+lLvQ/
        8Iad5TPjyycP27+z/mfKOq1TW35RbO30OfOOfthpbOeVzWL6bKESS3FGoqEWc1FxIgA2JqY8
        ngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSvO66D/tjDX4sFrc4f34Du0XPhq2s
        FjPO72OyWLbpD5PF4TftQO7kl2wObB6bVnWyefRtWcXo8XmTXABzFJdNSmpOZllqkb5dAlfG
        2ROzmAqec1f8evycuYHxMWcXIyeHhICJxIl/d9lBbCGB3YwS51/4Q8SlJOZ+287YxcgBZAtL
        HD5c3MXIBVTyllHizpu5bCA1vAJaEncOzWQBsVkEVCVa/vxkArHZBHQk9i/5zQoxU0HiwtYZ
        YPWiAiESvz5eYYXoFZQ4OfMJWK+IgL7EklUX2UAWMAtMZZTYeXo1WEJYIFKidfs9JojNpxgl
        Pi/4DXYpp4C9xK1p65lArmMWUJdYP08IJMwsIC/RvHU28wRGoVlIdsxCqJqFpGoBI/MqRsnU
        guLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzg4NfS3MF4eUn8IUYBDkYlHt4XnPtjhVgTy4or
        cw8xSnAwK4nwXpyxN1aINyWxsiq1KD++qDQntfgQozQHi5I479O8Y5FCAumJJanZqakFqUUw
        WSYOTqkGRtVAs0Vss37WdN0W37CaJSLtyeU6z7eP/V3uJX99KF3IrxMn06Eeu0ctLZnFP/rP
        x+M1WR2h9nU3JS/fPlSi6xJ5eLq3S+Ka189PnDrbfOhxBeOJLRuvzPxjeSDzLkfhQQc324Sg
        Ul/9pRMsF2vY78lJqNVIN6leLC3ocMj5kFF3n1/a9dB2JZbijERDLeai4kQAIezn53oCAAA=
X-CMS-MailID: 20191104093438epcas1p3763243991efd0f5430b7dceab7debd62
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1
References: <CGME20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1@epcas1p3.samsung.com>
        <1571623084-2705-1-git-send-email-sw0312.kim@samsung.com>
        <fdd591ce-f0b3-8737-bd1f-27645035ce7e@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sylwester,

On 2019년 11월 04일 18:18, Sylwester Nawrocki wrote:
> Hi Seung-Woo,
> 
> On 10/21/19 03:58, Seung-Woo Kim wrote:
>> When driver is built as module and probe during insmod is deferred
>> because of sensor subdevs, there is NULL pointer deference because
>> mdev is cleaned up and then access it from v4l2_device_unregister().
>> Fix the wrong mdev and v4l2 dev odder in error path of probe.
> 
>> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> 
> The patch looks good, however we need to also call media_device_cleanup()
> when v4l2_device_register() fails.

You are right. I will send the 2nd version with the missing error handle.

Thanks,
- Seung-Woo Kim

> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
>> ---
>>  drivers/media/platform/exynos4-is/media-dev.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
>> index a838189..3685c91e6 100644
>> --- a/drivers/media/platform/exynos4-is/media-dev.c
>> +++ b/drivers/media/platform/exynos4-is/media-dev.c
>> @@ -1520,8 +1520,8 @@ static int fimc_md_probe(struct platform_device *pdev)
>>  err_clk:
>>  	fimc_md_put_clocks(fmd);
>>  err_md:
>> -	media_device_cleanup(&fmd->media_dev);
>>  	v4l2_device_unregister(&fmd->v4l2_dev);
>> +	media_device_cleanup(&fmd->media_dev);
>>  	return ret;
>>  }
> 

-- 
Seung-Woo Kim
Samsung Research
--

