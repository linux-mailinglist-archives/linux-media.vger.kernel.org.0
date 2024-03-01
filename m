Return-Path: <linux-media+bounces-6277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE28486EB98
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 23:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6CCE1C21582
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8771659154;
	Fri,  1 Mar 2024 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wI+8Q+Gz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C214295
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709331021; cv=none; b=RO+VAzgmKlK+tKQVk/CscaUBvfMKuglRgORQXBDQdkPYQQLhqYGeoo9OLRvZKOSXNZzRZik2VsrgSCcNGA3lB4NC26OfKFsU3ts916ORY5nLp8W8yeVzper1Inrn9NiKyxNCbawWdUllSiCfZCezaEeT6K4H5Jv0x3NxX4mtCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709331021; c=relaxed/simple;
	bh=dQ++JXZpbsEithDuiKsPRZT5Vh/U46Dv9W/cqSoqcAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDWbqvNmuXT0dca2oTzbnXaWt4LPvxR3Gvt7gC4fVm7D/CovqypznKDg9eQCOijai/qDOfo+hDWl7bKv2mC1dDPexXTO8v2TVKhJKhgNjBpcuEaVJvsk3AKIJJehz8LeFrz9nSCAg6KptJ5wQDxkrU0dztsRLSOgtDMvl2dW0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wI+8Q+Gz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0F4B9CE;
	Fri,  1 Mar 2024 23:10:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709331004;
	bh=dQ++JXZpbsEithDuiKsPRZT5Vh/U46Dv9W/cqSoqcAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wI+8Q+GzFtI/eJrDTi/WI1rABYaPiFkTJAbONtmrn42kxSI7zrVvtMQpLw4zQS/gT
	 peheDHFBvRu+pFLWyeSjyaqoEmtj7KbHpCUhrk4QrAy60qXpkiU+W9zTxfXjKKg8Fb
	 UVgU0lxJHzK9FENsg/KFbYnLA2Gp8H0ZkV+UIrzo=
Date: Sat, 2 Mar 2024 00:10:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 3/9] media: uapi: pixfmt-luma: Document MIPI CSI-2
 packing
Message-ID: <20240301221020.GR30889@pendragon.ideasonboard.com>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
 <20240223163012.300763-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223163012.300763-4-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 23, 2024 at 05:30:05PM +0100, Jacopo Mondi wrote:
> The Y10P, Y12P and Y14P format variants are packed according to
> the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
> specification. Document it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index 3af6e3cb70c4..8e313aaeb693 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -209,3 +209,7 @@ are often referred to as greyscale formats.
>      For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
>      padding zeros in the 4 low bits, in contrast to the Y12 format, which has
>      its padding located in the most significant bits of the 16 bit word.
> +
> +    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
> +    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
> +    specification.

-- 
Regards,

Laurent Pinchart

