Return-Path: <linux-media+bounces-35494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8573AE1C2E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 15:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3356B4C0573
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CF028C855;
	Fri, 20 Jun 2025 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bsg5/sXy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65A7494
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425992; cv=none; b=tOaA411WVzEl6CTWjoZmrP6tsPO8OqcoMzpDEtwIgik3VnTLuPWE4/jm5F8/ST0p2rzjZBM1JNqGo2m7DTP7YPUTBmzeMbedNcghqWkswwDo54bsgy8GWQwVBRDohaGymQEvOZMg35g4pRGheq+FHs+Ltut1gpTrEvNwjpuQ+s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425992; c=relaxed/simple;
	bh=9YlJCmXRHh2/KG0qAmOniLSY1YRZhHkAqIdJnac73yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay6eotuT/AUijiFT+8OUY+oqMtSOFYq3coelimqbT1pkHFBVrEr9laYKizYrfZ/nHuywgSNER7w3SLkNG49m3hdIQMcqU2Y3nIRdFie1IU+KH6vEoqKmEtN2JzrPkduO51elQ8zj+/RhD6NJJXsqd1OMDHtgczYzxzSD09wegAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bsg5/sXy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C2B4C0B;
	Fri, 20 Jun 2025 15:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750425973;
	bh=9YlJCmXRHh2/KG0qAmOniLSY1YRZhHkAqIdJnac73yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bsg5/sXyobuMhLUlHt3TZvNMqzA/R4i0T4xsz/ROGNoXTN6Vv+p61Zb5KZQHl2Dfb
	 QkYIlE+UqIkNtDzvW9ax8EykLodkvLPjmAh4mld4xw7i9/fAgePH+E35ZX0riDkdsh
	 6trUgXL5wF/MIjhUxRPtOx73Ht1RrFdhsJjNyMXY=
Date: Fri, 20 Jun 2025 15:26:25 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 38/64] media: uapi: Correct generic CSI-2 metadata
 format 4cc
Message-ID: <lgm4ufdwzeg7tnpv25h27kausizxn2wilzhgfwvramiug67e6h@jndtb26w2paf>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-39-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-39-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:58:10PM +0300, Sakari Ailus wrote:
> Rework the pixelformat 4cc for CSI-2 generic metadata. This can be done as
> no driver uses this yet and the interface is disabled.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/metafmt-generic.rst      |  2 +-
>  include/uapi/linux/videodev2.h                       | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> index e8824b5a65d6..e0d675d1ec07 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> @@ -1,7 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
>
>  ********************************************************************************************************************************************************************************************************************************************************************************
> -V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
> +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_META_FMT_GENERIC_CSI2_12 ('MECC'), V4L2_META_FMT_GENERIC_CSI2_14 ('MECE'), V4L2_META_FMT_GENERIC_CSI2_16 ('MECG'), V4L2_META_FMT_GENERIC_CSI2_20 ('MECK'), V4L2_META_FMT_GENERIC_CSI2_24 ('MECO')
>  ********************************************************************************************************************************************************************************************************************************************************************************
>
>
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 855cbe2a97d8..6f0dacd69ab3 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -893,12 +893,12 @@ struct v4l2_pix_format {
>   * adding new ones!
>   */
>  #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */

Why GENERIC_8 is still 'MET' and all others are 'MEC' ?

> -#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'E', 'C', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'E', 'C', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
>  #endif
>
>  /* priv field value to indicates that subsequent fields are valid. */
> --
> 2.39.5
>
>

