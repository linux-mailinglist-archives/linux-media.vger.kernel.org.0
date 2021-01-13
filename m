Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D343C2F4B0C
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 13:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbhAMMMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 07:12:03 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45493 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727062AbhAMMMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 07:12:02 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zezckLzZ0VfyLzezfktJvB; Wed, 13 Jan 2021 13:11:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610539880; bh=Eyuz39YgzNPFa82TqC/9wp9lrmUhTMdbwj81g67iPHM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OD2iIBA7j2LjCHdnNvEYBzWBGSliP5DiGPX2d7PqWSgaehGXZfm57eLYWRFCJRUK4
         gc/MuIdDY5AXXkOXf2RvuvZL9itzSJmTuopEycmuLgDjYIgIoZgE/RzCrYNyaoFHQN
         4cgdW4+VaTU9Hna2VULi42nqL+voS59w+sYdgTu+k4jjaHORQYCWbqBZmgjarvCdjO
         lOmK3WktuD1FyKIVYdN0Ev4ArSmEf8o+w7A/5ulaEespYlkpFCdcwcoin6CctS8lna
         WJRiXHsXvUwAm06n2bIVNf4h8G9Cy5L4BMZ+CCF8WHlZCigkXx7aU1PLzgb1cACbir
         cT9CBgldvizNw==
Subject: Re: [PATCH 2/2] media: imx7: csi: Fix pad link validation
To:     Rui Miguel Silva <rui.silva@linaro.org>,
        sakari.ailus@linux.intel.com
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20210107104726.1294538-1-rmfrfs@gmail.com>
 <20210107104726.1294538-3-rmfrfs@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <54f32ef2-3dbd-48b7-9b74-d6e5a6be3614@xs4all.nl>
Date:   Wed, 13 Jan 2021 13:11:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107104726.1294538-3-rmfrfs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEXPCi1pifRop4x16WoOZ6HR1cvYIZkB6G1V13mHh7JYgcS88SAqrBlKkLQrIzElM3kHMSKoP013KY5wZZnWjIjUQjS0EabYnz0cG7NdscZ5XLjbC1Hk
 KnVBBR/+EGMZwkcX8qO/3KT6Vvy/NswsovhHbteGYZOiuUVktVXje7Teq+XMzPA1SqOAc03okCdguOrQmC9N/OZyitUvjPSmBpg73OVNqvH57DyRR3ZNhQUd
 cN8P4Ks11ms2Ua+1DXDcy5Cl+/ue+FQYC+vChYTpSIiWhM70HSq/at4STSYFfDSp+gDznEFSBVCvT4RXhoK1TeMatkEnrBNfjsej76HjRsbaqV+cNS/hBSJd
 dNCEjX9J8ULVxy0ZN0//fl7ojpO7wg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/01/2021 11:47, Rui Miguel Silva wrote:
> We can not make the assumption that the bound subdev is always a CSI
> mux, in i.MX6UL/i.MX6ULL that is not the case. So, just get the entity
> selected by source directly upstream from the CSI.

scripts/checkpatch.pl --strict:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Rui Miguel Silva <rui.silva@linaro.org>' != 'Signed-off-by: Rui Miguel Silva
<rmfrfs@gmail.com>'

I can fix this if you let me know which email address I should pick.

Regards,

	Hans

> 
> Fixes: 86e02d07871c ("media: imx5/6/7: csi: Mark a bound video mux as a CSI mux")
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Tested-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 31e36168f9d0..ac52b1daf991 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -499,6 +499,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_format *sink_fmt)
>  {
>  	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
> +	struct media_entity *src;
>  	struct media_pad *pad;
>  	int ret;
>  
> @@ -509,11 +510,21 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>  	if (!csi->src_sd)
>  		return -EPIPE;
>  
> +	src = &csi->src_sd->entity;
> +
> +	/*
> +	 * if the source is neither a CSI MUX or CSI-2 get the one directly
> +	 * upstream from this CSI
> +	 */
> +	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
> +	    src->function != MEDIA_ENT_F_VID_MUX)
> +		src = &csi->sd.entity;
> +
>  	/*
> -	 * find the entity that is selected by the CSI mux. This is needed
> +	 * find the entity that is selected by the source. This is needed
>  	 * to distinguish between a parallel or CSI-2 pipeline.
>  	 */
> -	pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
> +	pad = imx_media_pipeline_pad(src, 0, 0, true);
>  	if (!pad)
>  		return -ENODEV;
>  
> 

