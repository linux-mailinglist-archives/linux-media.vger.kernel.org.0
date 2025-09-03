Return-Path: <linux-media+bounces-41679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBEB42037
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6493C1BA5D70
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A235230102A;
	Wed,  3 Sep 2025 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u3/jVWRA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5B19C569
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904442; cv=none; b=PC/9kDmRteXqoqY2pkw/709YYJ3UEnVSAo1WVJOpTRI248bEJzuA56D9rTe4Q4V0zcMje2u3c6vF9lIgdzCG8K9pLh2XjJEbIs3f9sNhJNYnBnwCX7ohgzAzzgan0eQOrwl+3gskMtGLFzqjZTXlw7wAsdHqT61LetDUTkU/Usg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904442; c=relaxed/simple;
	bh=pO+260DbGixKaoTb9dn9C42PA5iGOQ141yu21b8cKAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHvS3VYi1225yWKaBPv/ssXr1WJsjZngFOpcM0PE/9damF1C1Ydfe8yvucA8IzLg1pmBWQKw4XVz/5730apx9IRlJ2LsULRkrwGEJFCmxsC+q57/h+XA787R+T2w/G8i+FdntWq3Q++hIZghYyP3Rp74rcZ3lbIuQ7dJmi9JLuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u3/jVWRA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C2AA88FA;
	Wed,  3 Sep 2025 14:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756904369;
	bh=pO+260DbGixKaoTb9dn9C42PA5iGOQ141yu21b8cKAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3/jVWRA61kmYRpymYncqDv34ZMLjme9afVHbjZQuEg00/4wBFh8dR2nm5IvHlpN8
	 OQ6UUJdZ56o8FAUe+ZydnNdKceo1f/jU1aYzJK1BD01JzPfg+yHdhcMoHZU2qcZ9aX
	 jFBZyw0sABKU8uHc8yXqOGRrMrXhsHIEZWQQDFYM=
Date: Wed, 3 Sep 2025 15:00:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 01/66] media: Documentation: Clean up figure titles
Message-ID: <20250903130018.GC3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Aug 25, 2025 at 12:50:02PM +0300, Sakari Ailus wrote:
> Remove DocBook (?) conversion leftovers from figure titles, including
> obsolete numbering and highlighting. This aligns these titles with others.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/v4l/dev-raw-vbi.rst    | 6 +++---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst     | 6 +++---
>  Documentation/userspace-api/media/v4l/subdev-formats.rst | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> index 2bec20d87928..1f7bb8fd15e7 100644
> --- a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> @@ -221,7 +221,7 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
>      :alt:   vbi_hsync.svg
>      :align: center
>  
> -    **Figure 4.1. Line synchronization**
> +    Line synchronization
>  
>  .. _vbi-525:
>  
> @@ -229,7 +229,7 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
>      :alt:   vbi_525.svg
>      :align: center
>  
> -    **Figure 4.2. ITU-R 525 line numbering (M/NTSC and M/PAL)**
> +    ITU-R 525 line numbering (M/NTSC and M/PAL)
>  
>  .. _vbi-625:
>  
> @@ -237,7 +237,7 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
>      :alt:   vbi_625.svg
>      :align: center
>  
> -    **Figure 4.3. ITU-R 625 line numbering**
> +    ITU-R 625 line numbering
>  
>  Remember the VBI image format depends on the selected video standard,
>  therefore the application must choose a new standard or query the
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 225a45fef994..24a69c419dfe 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -459,7 +459,7 @@ selection will refer to the sink pad format dimensions instead.
>      :alt:   subdev-image-processing-crop.svg
>      :align: center
>  
> -    **Figure 4.5. Image processing in subdevs: simple crop example**
> +    Image processing in subdevs: simple crop example
>  
>  In the above example, the subdev supports cropping on its sink pad. To
>  configure it, the user sets the media bus format on the subdev's sink
> @@ -476,7 +476,7 @@ pad.
>      :alt:   subdev-image-processing-scaling-multi-source.svg
>      :align: center
>  
> -    **Figure 4.6. Image processing in subdevs: scaling with multiple sources**
> +    Image processing in subdevs: scaling with multiple sources
>  
>  In this example, the subdev is capable of first cropping, then scaling
>  and finally cropping for two source pads individually from the resulting
> @@ -492,7 +492,7 @@ an area at location specified by the source crop rectangle from it.
>      :alt:    subdev-image-processing-full.svg
>      :align:  center
>  
> -    **Figure 4.7. Image processing in subdevs: scaling and composition with multiple sinks and sources**
> +    Image processing in subdevs: scaling and composition with multiple sinks and sources
>  
>  The subdev driver supports two sink pads and two source pads. The images
>  from both of the sink pads are individually cropped, then scaled and
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 2a94371448dc..9ef1bc22ad9c 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2631,7 +2631,7 @@ be named ``MEDIA_BUS_FMT_SRGGB10_2X8_PADHI_LE``.
>      :alt:    bayer.svg
>      :align:  center
>  
> -    **Figure 4.8 Bayer Patterns**
> +    Bayer Patterns
>  
>  The following table lists existing packed Bayer formats. The data
>  organization is given as an example for the first pixel only.

-- 
Regards,

Laurent Pinchart

