Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8891A2823CD
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 13:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJCLW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 07:22:27 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41671 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgJCLW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 07:22:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OfZekjIBgTHgxOfZhk6bEB; Sat, 03 Oct 2020 13:22:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601724143; bh=SrIug3qpOAiuSFr6U/yS7Rn0eFN46Emp41MwllPybCQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lIEZoRG5CjtoeoEGPkLY/BIIasiZFbFulBjKPxpLjT+IpicVyZDErY75NewaGbHPc
         Qs/B3vZ8qEYRVyAgVcca3wvfUSKKQK2YLyys9BAdQwRc/ERAyXE1qpgxc31u8jSZLu
         EO6VyPvRaQBKeM11Rgdy9m+uOSJFCa3uOC82qjS7g94z2CVb4kFmZGA56LpSjDv3Fc
         ZHjbMmQ/4Sd7AcMUGXNAOBgLq+qO4BXZILehJKGCeMTh5qCzqLnnPyN/W6pbWQElp6
         8lGctRToXbv3dnwMbMm8dRPxkP2TmEEjDElxUcfUMSHg9L85hJxTqRL6QIWgf0/skv
         KTes3GM/39rCA==
Subject: Re: [PATCH 2/3] media: mtk-vcodec: add missing put_device() call in
 mtk_vcodec_init_dec_pm()
To:     Yu Kuai <yukuai3@huawei.com>, tiffany.lin@mediatek.com,
        andrew-ct.chen@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
References: <20200924081802.1061024-1-yukuai3@huawei.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f155ec8b-9036-55b4-2624-a042b6e26866@xs4all.nl>
Date:   Sat, 3 Oct 2020 13:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924081802.1061024-1-yukuai3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJuldRTWhFqMmLPFuJSzU6XO6AcWXdH+xgdSGhNL9Iuz8Y9k8ajM8u1BN4mGtyFF5ZIEqQLmb3tapojSVpcHG56c/vQPXPK3ki9mw2qOzMXpJBboPsaw
 rNGssIMs1rGBwTUqaYOxdibW/AopGfHIuMaqBoCvpm+G7ZY4/u7hlMKPTUnMVtyQ23mfhqA6GbYSQoNwi8FPKWBWWyAqNjy0LWvhs+wogDotBhbdXRm/8Np+
 6brEA6w1YVztWW5fYPIOkISbehcGG2VfWG5f3KPIrynfoekCaw39M5qNQj0ncWtshCsDzH1OkdF6TOqxovOBd0N4xMvhmcHUWFZpzWXz5xEQ6Z2442ObyW7/
 jjQGRFdSWasQ4vhek+wG8N9sTJxPji9H3isACSv/+9csZlBw99BNFv8f8y6UDfQeRYFgUnkiHmBwuzx9/exGDoqdmI3d8rQmYvIuwCTFyrvr+ekD2/OdM7o8
 MY/DlpN7DR3foEyq9pExlzFMKIkB9A20JACAnqSsScAeo9MH97ZpCiy3oAE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/09/2020 10:18, Yu Kuai wrote:
> if of_find_device_by_node() succeed, mtk_vcodec_init_dec_pm() doesn't have
> a corresponding put_device(). Thus add jump target to fix the exception
> handling for this function implementation.
> 
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 5a6ec8fb52da..01e680ede9bd 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -48,11 +48,14 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>  		dec_clk->clk_info = devm_kcalloc(&pdev->dev,
>  			dec_clk->clk_num, sizeof(*clk_info),
>  			GFP_KERNEL);
> -		if (!dec_clk->clk_info)
> -			return -ENOMEM;
> +		if (!dec_clk->clk_info) {
> +			ret = -ENOMEM;
> +			goto put_device;
> +		}
>  	} else {
>  		mtk_v4l2_err("Failed to get vdec clock count");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto put_device;
>  	}
>  
>  	for (i = 0; i < dec_clk->clk_num; i++) {
> @@ -61,19 +64,22 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>  			"clock-names", i, &clk_info->clk_name);
>  		if (ret) {
>  			mtk_v4l2_err("Failed to get clock name id = %d", i);
> -			return ret;
> +			goto put_device;
>  		}
>  		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>  			clk_info->clk_name);
>  		if (IS_ERR(clk_info->vcodec_clk)) {
>  			mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
>  				clk_info->clk_name);
> -			return PTR_ERR(clk_info->vcodec_clk);
> +			ret = PTR_ERR(clk_info->vcodec_clk);
> +			goto put_device;
>  		}
>  	}
>  
>  	pm_runtime_enable(&pdev->dev);
> -
> +	return 0;
> +put_device:
> +	put_device(pm->larbvdec);
>  	return ret;
>  }
>  
> 

A similar question as with the previous patch: shouldn't there be a
put_device(pm->larbvdec); in the mtk_vcodec_release_dec_pm() function?

Same for the next patch.

Regards,

	Hans
