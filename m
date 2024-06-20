Return-Path: <linux-media+bounces-13769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F290FCC9
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 08:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DCDC1F2148A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 06:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FAB38FA5;
	Thu, 20 Jun 2024 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b8bHIowx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF640849
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718865303; cv=none; b=ky6/O0Qs6Dq9kG87FCHXrM8pkirnS/9mG2PWHHhmAXGKWNYpPGi7wo3HwaYzCwxEkS0qBfR/gtW1w3x96N+3Q+trdV5Hq48ueyw7xVy+vnHABU+g3Pqan8/Zn8W/Jf1frfV0HdQTg66thFAOJJza07nzqhnTNwR2SSCLvt8vEBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718865303; c=relaxed/simple;
	bh=URN7KvW8KBERrb2PUlWof2P+ERmUiv++FPlzQKQicnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liDytdBYU0hZpJaW9++8VutiiYKFqvWGCDM423GHHX7xouauXB+xIrDPQo+WBmEvSeD4xcbipbOtS4/mWh1tbNSblFjFT3FLP3gMvQwJJpNbOHFfuAuqyKYz4xQSiaTPxjL7K/D6aDmvoJ5IRVSjDgCEW9TXfS1HK2DGN4x5Y70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b8bHIowx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9DF566F;
	Thu, 20 Jun 2024 08:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718865281;
	bh=URN7KvW8KBERrb2PUlWof2P+ERmUiv++FPlzQKQicnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b8bHIowxxqeRSIi/He9pH4gZ4H19RpYp8zg9P/IJtnoy3U+ni5c0hAdyBJUEDykMh
	 wbhf2DWhQMcRXlod0mUajQX/AdR4fGy9nSEeKBnRnYzSDz3qAk88pe5KbG/83EDWhD
	 Xm6dnjtc9fFLbid3BVDfP6vFqhAvwqMVPBWKGPhI=
Message-ID: <08df0971-8e0d-463e-a128-e9faae68dc30@ideasonboard.com>
Date: Thu, 20 Jun 2024 09:34:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-mipi-csis: Use v4l2_subdev_enable_streams()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger
 <martink@posteo.de>, imx@lists.linux.dev, Purism Kernel Team <kernel@puri.sm>
References: <20240619232431.5708-1-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240619232431.5708-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/2024 02:24, Laurent Pinchart wrote:
> To support sources that implement the .enable_streams() and
> .disable_streams() operations, replace the manual calls to the subdev
> .s_stream() operation with the v4l2_subdev_enable_streams() and
> v4l2_subdev_disable_streams() helpers. The helpers fall back to
> .s_stream() if the source doesn't implement the new operations, so
> backward compatibility is preserved.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/nxp/imx-mipi-csis.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index f49b06978f14..b9729a8883d6 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -320,7 +320,11 @@ struct mipi_csis_device {
>   	struct v4l2_subdev sd;
>   	struct media_pad pads[CSIS_PADS_NUM];
>   	struct v4l2_async_notifier notifier;
> -	struct v4l2_subdev *src_sd;
> +
> +	struct {
> +		struct v4l2_subdev *sd;
> +		const struct media_pad *pad;
> +	} source;
>   
>   	struct v4l2_mbus_config_mipi_csi2 bus;
>   	u32 clk_frequency;
> @@ -597,7 +601,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>   	u32 lane_rate;
>   
>   	/* Calculate the line rate from the pixel rate. */
> -	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
> +	link_freq = v4l2_get_link_freq(csis->source.sd->ctrl_handler,
>   				       csis_fmt->width,
>   				       csis->bus.num_data_lanes * 2);
>   	if (link_freq < 0) {
> @@ -958,7 +962,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>   	int ret;
>   
>   	if (!enable) {
> -		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> +		v4l2_subdev_disable_streams(csis->source.sd,
> +					    csis->source.pad->index, BIT(0));
>   
>   		mipi_csis_stop_stream(csis);
>   		if (csis->debug.enable)
> @@ -986,7 +991,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>   
>   	mipi_csis_start_stream(csis, format, csis_fmt);
>   
> -	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
> +	ret = v4l2_subdev_enable_streams(csis->source.sd,
> +					 csis->source.pad->index, BIT(0));
>   	if (ret < 0)
>   		goto err_stop;
>   
> @@ -1233,12 +1239,14 @@ static int mipi_csis_link_setup(struct media_entity *entity,
>   	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>   
>   	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		if (csis->src_sd)
> +		if (csis->source.sd)
>   			return -EBUSY;
>   
> -		csis->src_sd = remote_sd;
> +		csis->source.sd = remote_sd;
> +		csis->source.pad = remote_pad;
>   	} else {
> -		csis->src_sd = NULL;
> +		csis->source.sd = NULL;
> +		csis->source.pad = NULL;
>   	}
>   
>   	return 0;
> 
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


