Return-Path: <linux-media+bounces-13781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C83289100BA
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D3681F25F94
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBD71A4F1F;
	Thu, 20 Jun 2024 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9/DfuhL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238DB2594
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876839; cv=none; b=sLjqxSzHQWEwVkqUiZh2nW5/o7o7z1NYKoaP/Zg85SLURspB2V61BnoGNXQP6Wk8LGz/+UaPjV93i1Tq6RGGSpLrtIMhiO6PVqCFWGal3c6h9uX1nB9FGAR79T44fo3mA69HsSUzm3dDnHuWuWQyZJdDa5AD8oRq6KvMxhFqvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876839; c=relaxed/simple;
	bh=xAGDVdqYGF7Dwk7Zyu4pSEXvweYAZad19JaVU5lJBn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iJFjeI7brQIhJnM0u8LcunQyyEY0ZNWZvI17ABTuWbyBMKp2TKo+Wjl5QAmyJ97aC8TOWuF7ZINw1+oPFXZKVsqGD9PLGSPMjmNbPcnaiIfdk4IVI0irjS2yghHHZQxgYS5fW0S12utrGvQkKetfPSAas43KYOeif7/VkIfKrHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9/DfuhL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso11238455e9.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718876836; x=1719481636; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKctuEYUZwkLxrC3E1PmqrbhxPoOg9q030v+QYhbC/c=;
        b=F9/DfuhLVya2HqMV4h5BezECni/i001H4v6Bc+ATQuInBRcHYixnV2NEsEbDb8RP26
         +LoC9bhyBhrB/kx4AscfTJuxuqF8loW015rc+J4/OpfFg8HUFscqvdmdhHXekl1WBtx3
         56KsgErKJvumgHr+uPnFph69ZP2WaG7SulT8IWTaw1g/P3AokjbtGrQ81RxZNTZdk75Y
         uU73UGAFpz6/jL7I1djcIBpf9mHihyVhaKJKSrpuJmukyclhAi6k76098lZ3/bSfKW3L
         q4uImUlNkOXaQXv2ZGzsvmNSBDDD0774Sz6ld8h34FqTvx1gp22WdMadXZ/rPyUoy6Z+
         aVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876836; x=1719481636;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKctuEYUZwkLxrC3E1PmqrbhxPoOg9q030v+QYhbC/c=;
        b=hcq5TfqzeLqfoNNdfyImJgA5schidM8Nl4kY76iTvFJq81GnNMBOSxswjgzCtTL23u
         FS0UGANxiodCWr9kW7Z9YJ+F6JYyasq673bSYVDEHkelFzzXGg8/wV1Mz1MIdQIpqzyp
         VBws0wQqL91Njs56UFF13NXm2zpKb0mAQr00R2nQzAbcMdW533sfIDbQnQ3Id8w/eVyS
         fMtAvaWC+UjXaMIhl+Jxk4HJJH+mv1QnYAJwOsixGbREtPmGwZVmVrobejiLMEuWe/b+
         SJ3KfqBGgTVQNT4/2GzpMUw+57FM0KCQ2i1FWZECVctsQGZXRuo7SSYKWp1Ei3TRKwlU
         qNfg==
X-Forwarded-Encrypted: i=1; AJvYcCVDa2FLYznS4mlcqT/B79d4OwK8I+RwNACzcSpxOX4GBqhuEkyuATGuRLnSjhiwJin585TUmmGJVDSxcRqP93Xul7lOkkoLFjfMnBQ=
X-Gm-Message-State: AOJu0YyCf6/n+PDA0SyN6fMcZy1qj2n8HWZ1b4qw2robhIjIoyNjhRgV
	jBj/fkrfRZs/6smkvKW1GQndLkFEw6Cg6LO3wANWxLvjyc/nZERh
X-Google-Smtp-Source: AGHT+IHQvG+njfu7Jbt33yKTwN3jzRduYIPw/O+RD8GZ4LC50ZQL/fKwWEW0MXBXDYbLYss3cQPfQg==
X-Received: by 2002:a7b:cc19:0:b0:424:7871:2e9e with SMTP id 5b1f17b1804b1-42478712f14mr37774595e9.6.1718876836028;
        Thu, 20 Jun 2024 02:47:16 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b6bsm19782365e9.32.2024.06.20.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:47:15 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Martin Kepplinger <martink@posteo.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, imx@lists.linux.dev, Purism Kernel Team
 <kernel@puri.sm>
Subject: Re: [PATCH] media: imx-mipi-csis: Use v4l2_subdev_enable_streams()
In-Reply-To: <20240619232431.5708-1-laurent.pinchart@ideasonboard.com>
References: <20240619232431.5708-1-laurent.pinchart@ideasonboard.com>
Date: Thu, 20 Jun 2024 10:47:14 +0100
Message-ID: <m3h6do3pzx.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hey Laurent,
Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> To support sources that implement the .enable_streams() and
> .disable_streams() operations, replace the manual calls to the subdev
> .s_stream() operation with the v4l2_subdev_enable_streams() and
> v4l2_subdev_disable_streams() helpers. The helpers fall back to
> .s_stream() if the source doesn't implement the new operations, so
> backward compatibility is preserved.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for this, LGTM.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index f49b06978f14..b9729a8883d6 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -320,7 +320,11 @@ struct mipi_csis_device {
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[CSIS_PADS_NUM];
>  	struct v4l2_async_notifier notifier;
> -	struct v4l2_subdev *src_sd;
> +
> +	struct {
> +		struct v4l2_subdev *sd;
> +		const struct media_pad *pad;
> +	} source;
>  
>  	struct v4l2_mbus_config_mipi_csi2 bus;
>  	u32 clk_frequency;
> @@ -597,7 +601,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  	u32 lane_rate;
>  
>  	/* Calculate the line rate from the pixel rate. */
> -	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
> +	link_freq = v4l2_get_link_freq(csis->source.sd->ctrl_handler,
>  				       csis_fmt->width,
>  				       csis->bus.num_data_lanes * 2);
>  	if (link_freq < 0) {
> @@ -958,7 +962,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>  
>  	if (!enable) {
> -		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> +		v4l2_subdev_disable_streams(csis->source.sd,
> +					    csis->source.pad->index, BIT(0));
>  
>  		mipi_csis_stop_stream(csis);
>  		if (csis->debug.enable)
> @@ -986,7 +991,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	mipi_csis_start_stream(csis, format, csis_fmt);
>  
> -	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
> +	ret = v4l2_subdev_enable_streams(csis->source.sd,
> +					 csis->source.pad->index, BIT(0));
>  	if (ret < 0)
>  		goto err_stop;
>  
> @@ -1233,12 +1239,14 @@ static int mipi_csis_link_setup(struct media_entity *entity,
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		if (csis->src_sd)
> +		if (csis->source.sd)
>  			return -EBUSY;
>  
> -		csis->src_sd = remote_sd;
> +		csis->source.sd = remote_sd;
> +		csis->source.pad = remote_pad;
>  	} else {
> -		csis->src_sd = NULL;
> +		csis->source.sd = NULL;
> +		csis->source.pad = NULL;
>  	}
>  
>  	return 0;
>
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
> -- 
> Regards,
>
> Laurent Pinchart

