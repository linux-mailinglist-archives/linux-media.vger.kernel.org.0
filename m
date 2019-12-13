Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A82611DEFC
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 08:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfLMH70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 02:59:26 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54997 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbfLMH70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 02:59:26 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ffr8ijy78apzpffr9ics5l; Fri, 13 Dec 2019 08:59:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576223964; bh=aIkMTWnJX2xbH8Hd4OhdeFKvTee3qPsBUdUXoX0uA80=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SJeEDvsRx5+2fkzEFqnDDPF3xVxoX/7uaQ6BgloHF1iCtqCL2deiS77+eg9wb/2D8
         TmwFOFOAbcQeSkprZQO7vznrI9i0g5ccS6L5ul1nN03miZF06sRdmItXSQ2oOJ5g4C
         YDHqmykn8yRf7MopBC9Q/NYgJ8k2izgJpU842/jv3bf3l0fuKYVysSXQykVVk4KGq7
         k2qb+NwXgSjfIQksQSmlJdqsE47IFbNLOb20jRiJfYUErhLPipS2IfQpSp16AHK1bV
         KLe6aLIaSM+ANJroUbxbh+STRyypgYCK3cPopMvk5il4pMRAShScCC/Au0vo7pxsPb
         9+TJs4Nnb6M8w==
Subject: Re: [PATCH] media: imx7-mipi-csis: remove subdev_notifier
To:     Rui Miguel Silva <rui.silva@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191212191714.812249-1-rmfrfs@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <13a26524-fa5e-1619-5026-d9b076271988@xs4all.nl>
Date:   Fri, 13 Dec 2019 08:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212191714.812249-1-rmfrfs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPOTBWUTn9fhKWGOUb5aVkzir0tKVgGeyxKllU5eEr8tM3zzyYN4nsBO1+IBRyc9egJ9VCqTQ8YjsDpSEdbLl2e5ZhmS/asm0AqLwBhMZpff0sXZ/qhJ
 tA7rhT/oNMxUtAlAg8ay2TfRw+z67cu+I1crztjR4byHVdgsT98pasfJ47nk2OKslOx9YE4/zFRXuNe+dsimPlGd3f8g/WiTdL2MafNaAfrxU0y/Fo1MKji3
 4HsHZkSDPgC5HdZ70r3YAAfM71DXeC/Ya//u84zdeGDE9czkrYMZAaPuYOd4ra+IP86Fg3A8f5oBM58oLsndxWafESaW+DAI+4/i588w6I6VlJwY/Gk4DCXD
 oi5gcgjqea02/pth16YVTM+rQKDlMjHIWIm+kla84Ya8/SuXIBNgExxO7BQVRWdtN9Ar9IpKj0Bwp3mhQ8h+VznNasMSkaholY7b+pIqyRDd+/y+F4113Oe6
 CfWPdPlZe5+NSifj
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/12/19 8:17 PM, Rui Miguel Silva wrote:
> It was defined a notifier in the csi_state structure that is never
> allocated. And besides that it's unregister in the remove, even though
> it is a no-op, just remove both.
> 
> Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>

Mismatch between this Signed-off-by and your email address.
Is it OK if I use your linaro email in this Signed-off-by?

Regards,

	Hans

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 99166afca071..383abecb3bec 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -251,8 +251,6 @@ struct csi_state {
>  
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  
> -	struct v4l2_async_notifier subdev_notifier;
> -
>  	struct csis_hw_reset hw_reset;
>  	struct regulator *mipi_phy_regulator;
>  	bool sink_linked;
> @@ -1104,7 +1102,6 @@ static int mipi_csis_remove(struct platform_device *pdev)
>  
>  	mipi_csis_debugfs_exit(state);
>  	v4l2_async_unregister_subdev(&state->mipi_sd);
> -	v4l2_async_notifier_unregister(&state->subdev_notifier);
>  
>  	pm_runtime_disable(&pdev->dev);
>  	mipi_csis_pm_suspend(&pdev->dev, true);
> 

