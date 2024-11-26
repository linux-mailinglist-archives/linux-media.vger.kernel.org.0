Return-Path: <linux-media+bounces-22113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9F9D9D19
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 19:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57C76282769
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 18:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363751DC05F;
	Tue, 26 Nov 2024 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kMaZzu/0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF61DB522;
	Tue, 26 Nov 2024 18:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732644390; cv=none; b=qaazW9VB3koJpkDqzkoYik4U+gr8ErLsnMe2fHBTjly+d1kqtyXLPMohMCRId+XAJylV0yNcWUfIq5Uju7XzhAd/aoK6/K3Sbx7p26jcEOKA9oGsU3wvYts+P+qxuKYRUi1X2pOk1TQYIlyRfusyARbror6l2rwXH9uZcDIqKvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732644390; c=relaxed/simple;
	bh=KxsIqHPypuOykgv7rlUrLVVwdzbC6mnetSa+3Smk8lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THmzwZlit5DtFsx5SY7nyGehuNCRvCk1ZlbWaK75+Ke58Pljecs2YUmYzENLF4ylhz7P+jQ6YRcOfw5Smo4LwvFconVYW3cUlBTaqRDCipOd9Ld1WeyVj6tDwFTjs7o1NVpi6z1B7VyWR7HEHORZhpqkBRGQCiv7bu0/SRkOLTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kMaZzu/0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52FD2B63;
	Tue, 26 Nov 2024 19:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732644363;
	bh=KxsIqHPypuOykgv7rlUrLVVwdzbC6mnetSa+3Smk8lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kMaZzu/0qI06eIdztvRxfkHCEFUDJlub44U5JyPS5SDW2rhULhBYHmoo6l0XR5HZC
	 E7Qe/PlIR0fdnUTEBlv47d7j4ec0zcPzce0JfE2ViIqCLG71o0BiTRnjwofhPsC/7U
	 z2QOT4I5QV1RFtHqwlrDwoWSZ1YxWhd33g3vBKEQ=
Date: Tue, 26 Nov 2024 20:06:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: uvcvideo: Support partial control reads
Message-ID: <20241126180616.GL5461@pendragon.ideasonboard.com>
References: <20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org>
 <20241120-uvc-readless-v4-1-4672dbef3d46@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120-uvc-readless-v4-1-4672dbef3d46@chromium.org>

On Wed, Nov 20, 2024 at 03:26:19PM +0000, Ricardo Ribalda wrote:
> Some cameras, like the ELMO MX-P3, do not return all the bytes
> requested from a control if it can fit in less bytes.
> Eg: Returning 0xab instead of 0x00ab.
> usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> 
> Extend the returned value from the camera and return it.
> 
> Cc: stable@vger.kernel.org
> Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index cd9c29532fb0..482c4ceceaac 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -79,6 +79,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (likely(ret == size))
>  		return 0;
>  
> +	/*
> +	 * In UVC the data is usually represented in little-endian.

I had a comment about this in the previous version, did you ignore it on
purpose because you disagreed, or was it an oversight ?

> +	 * Some devices return shorter USB control packets that expected if the
> +	 * returned value can fit in less bytes. Zero all the bytes that the
> +	 * device have not written.

s/have/has/

And if you meant to start a new paragraph here, a blank line is missing.
Otherwise, no need to break the line before 80 columns.

> +	 * We exclude UVC_GET_INFO from the quirk. UVC_GET_LEN does not need to
> +	 * be excluded because its size is always 1.
> +	 */
> +	if (ret > 0 && query != UVC_GET_INFO) {
> +		memset(data + ret, 0, size - ret);
> +		dev_warn_once(&dev->udev->dev,
> +			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> +			      uvc_query_name(query), cs, unit, ret, size);
> +		return 0;
> +	}
> +
>  	if (ret != -EPIPE) {
>  		dev_err(&dev->udev->dev,
>  			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",

-- 
Regards,

Laurent Pinchart

