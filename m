Return-Path: <linux-media+bounces-45590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77291C0B6DD
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE323B7DDB
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9B73002C1;
	Sun, 26 Oct 2025 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VBCCWUzq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0A2FFF95;
	Sun, 26 Oct 2025 23:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520361; cv=none; b=o1h6DKyZSmEfwrBU/QSfakl4M0Glj7eAp5lqSHdgkx/t678709h76En/Xr4/m7tAOmRlu1VI3GDqBTosRaYi2ry3oJUsZYNsxot5o2P8flCkmFpiP/PQUPnUWEp7Ix+V9dVVJ2txAIQpSUEdSQG1dzF4ktQfruwjNeZ8nbA10+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520361; c=relaxed/simple;
	bh=ICLjiDhsn73eXnFpFDS6pKCZTB2u0DspfKsmlJxdMxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc0nsmzYDnxF6kcIiG1J34htODIuuMesMpbLs8Nl+YBgNeiBFexSEZ+di/iGD2HrZ1wUHtpwq36+PMTpVLyoPgTmJINhogmLNBYWN8xrsLuO8Txw+OIxp3TALlBpkQt9T32o+jV7mVwXy2XPVcXNH9gPrF+TN0A+6lhZ9dS0A2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VBCCWUzq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 12C837E0;
	Mon, 27 Oct 2025 00:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761520247;
	bh=ICLjiDhsn73eXnFpFDS6pKCZTB2u0DspfKsmlJxdMxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBCCWUzqmGw0dzInn348Ts/Iek+pCR5R7wGhrAHiVwgoamXaPznNAvQM63LNZ1SKN
	 qSx0k03AwmwNTZ8uOHjCkTzG4jxpnWYRjksh6V4LbkhkowwdtazJRImtu5KtQCwFzD
	 PdxQTl7mQtmzm1GgFbiNXkxCA7UrHj1LHix5wLS0=
Date: Mon, 27 Oct 2025 01:12:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mats Randgaard <matrandg@cisco.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 1/4] media: uapi: Clarify MBUS color component order
 for serial buses
Message-ID: <20251026231218.GA9719@pendragon.ideasonboard.com>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
 <20251013-csi-bgr-rgb-v4-1-55eab2caa69f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013-csi-bgr-rgb-v4-1-55eab2caa69f@kernel.org>

Hi Maxime,

Thank you for the patch.

On Mon, Oct 13, 2025 at 01:01:33PM +0200, Maxime Ripard wrote:
> The subdev format documentation has a subsection describing how to use
> the media bus pixel codes for serial buses. While it describes the
> sampling part well, it doesn't really describe the current convention
> used for the components order.
> 
> Let's improve that.

A long due improvement, thanks for working on it.

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/userspace-api/media/v4l/subdev-formats.rst | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 2a94371448dc07e5c7097421bd82f42dcd7e21aa..8e92f784abd8123f9ea950f954a60af56ee76dbe 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -158,16 +158,18 @@ formats in memory (a raw Bayer image won't be magically converted to
>  JPEG just by storing it to memory), there is no one-to-one
>  correspondence between them.
>  
>  The media bus pixel codes document parallel formats. Should the pixel data be
>  transported over a serial bus, the media bus pixel code that describes a
> -parallel format that transfers a sample on a single clock cycle is used. For
> -instance, both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used
> -on parallel busses for transferring an 8 bits per sample BGR data, whereas on
> -serial busses the data in this format is only referred to using
> -MEDIA_BUS_FMT_BGR888_1X24. This is because there is effectively only a single
> -way to transport that format on the serial busses.
> +parallel format that transfers a sample on a single clock cycle is used. The
> +color component order used is the same used on the serial bus. For instance,
> +both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used on parallel
> +busses for transferring an 8 bits per sample BGR data, whereas on serial busses
> +the data in this format is only referred to using MEDIA_BUS_FMT_BGR888_1X24,
> +with BGR meaning that the blue component is transmitted first, then green, then
> +red. This is because there is effectively only a single way to transport that
> +format on the serial busses.

I find this confusing. The text says that on serial buses
MEDIA_BUS_FMT_BGR888_1X24 is used, without mentioning this is an example
specific to CSI-2. Here's an attempt at improving the paragraph:


While the media bus pixel codes are named based on how pixels are transmitted on
parallel buses, serial buses do not define separate codes. By convention, they
use the codes that transfer a sample on a single clock cycle. and whose names
correspond to the order in which colour components are transmitted on the serial
bus. For instance, the MIPI CSI-2 24-bit RGB (RGB888) format uses the
MEDIA_BUS_FMT_BGR888_1X24 media bus code because CSI-2 transmits the blue colour
component first, followed by green and red. While used for 24-bit RGB data on
parallel buses, the MEDIA_BUS_FMT_BGR888_3X8 or MEDIA_BUS_FMT_RGB888_1X24 codes
must not be used for CSI-2.

>  
>  Packed RGB Formats
>  ^^^^^^^^^^^^^^^^^^
>  
>  Those formats transfer pixel data as red, green and blue components. The
> 

-- 
Regards,

Laurent Pinchart

