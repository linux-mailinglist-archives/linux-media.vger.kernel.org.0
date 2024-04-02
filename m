Return-Path: <linux-media+bounces-8346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58628894D57
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 10:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF181F229E7
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 08:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5E53D97D;
	Tue,  2 Apr 2024 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="L7Le20FA"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413373D57A
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712046030; cv=pass; b=uOYMWcCBuTIqG3+KFU1++r7m3jHePyHLgnJy5cp4ve7x7WOp48MPvyWd1v2Hv9XEKkvVbTv4KsWUADLyuqGjR2JCYbpTb6NWbferns/Zhe68DgeM0CpN2kZHHWetAWgEPEdUbwoHliEpZ3IqetZrHmSv09JQLdH7sCpXLpfPCZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712046030; c=relaxed/simple;
	bh=/C1w0mIFbdqpvwOo61MStGa1/eyrHeda1Q9tWN9auI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uauyRSqKHVz9MHvYvQbdYJmhbZV6uV4hjqI6nX4LpVHfx1BKusdx1Pe6cilttZxk+jvdSaJjfH9qzfx5g4J3fRT/epDRurBetYdfWb/QYV+FxAkBNhfDgbrtkSBUGlA1xFpAkr3ECJv0kSYnePBbpTVoWFEdgX7NFlylYlAaC8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=L7Le20FA; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4V81604PHMzySr;
	Tue,  2 Apr 2024 11:20:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1712046024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKfHjUiZqyPz4TJJraHNisiq/BcH05xe231pRrOXc0E=;
	b=L7Le20FAJIkRm+GU/9C0qjB0B722b7p+dLw0t40YbWY4dUbe/5idRQB89tI4tFLeewNYOJ
	819YCuTFdPvm5KGeyMOf8XLExZP0FojxM8oOctXtqJ7qS0Uz/NnnFYAhxQSZ8Ps4onalYq
	N6QeMSkXbKuhjSJG/BCGTWrt6KvsE6s=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1712046024; a=rsa-sha256; cv=none;
	b=a2R0tw2BZAjBMjP3QwHPsrIk096iwVOEt42TG44+MX96C4ToU+XgnCFWeNv6nEXPZHgIj+
	yH8H8mjrXA/IwVk2oZYFrOPP6JcKxAUcCCK/bmBC+JSla/Wc5/mFZBMQbIysk7gAgcJNTc
	+pFut6TNtLXYfnfKnEuE4Cg6qxaNysQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1712046024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pKfHjUiZqyPz4TJJraHNisiq/BcH05xe231pRrOXc0E=;
	b=gy4Rt7Trn3QsF98fnAZFLmHwdWZlocIW7wuAvpjKhohGGKvV9p2ZioEROpw2miBXIFsv9h
	p85wr04G/TDINmq91cZR42u2qVuHX3IlJEKpWnoTibsUXYmAc4lKZ/vMPT7UeeYXGcX0ml
	AXRE/3p7ifSUPxgcGatxB2JiRz8fVLo=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35BE9634C93;
	Tue,  2 Apr 2024 11:20:23 +0300 (EEST)
Date: Tue, 2 Apr 2024 08:20:22 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Fix stream handling for crop API
Message-ID: <Zgu_xhcadm2F1Rxl@valkosipuli.retiisi.eu>
References: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>

Moi,

On Tue, Apr 02, 2024 at 02:37:25AM +0300, Laurent Pinchart wrote:
> When support for streams was added to the V4L2 subdev API, the
> v4l2_subdev_crop structure was extended with a stream field, but the
> field was not handled in the core code that translates the
> VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.

The field is indeed in the UAPI headers. But do we want to support the CROP
IOCTL for streams? Shouldn't the callers be using the [GS]_SELECTION
instead?

> 
> Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4c6198c48dd6..45836f0a2b0a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -732,6 +732,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
>  		sel.pad = crop->pad;
> +		sel.stream = crop->stream;
>  		sel.target = V4L2_SEL_TGT_CROP;
>  
>  		rval = v4l2_subdev_call(
> @@ -756,6 +757,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
>  		sel.pad = crop->pad;
> +		sel.stream = crop->stream;
>  		sel.target = V4L2_SEL_TGT_CROP;
>  		sel.r = crop->rect;
>  
> 
> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f

-- 
Terveisin,

Sakari Ailus

