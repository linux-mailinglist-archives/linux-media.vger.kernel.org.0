Return-Path: <linux-media+bounces-38557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7FB13AD2
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85BB3B0D8C
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0BE265CAA;
	Mon, 28 Jul 2025 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BQ3dK+jP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9002222A3
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753707320; cv=none; b=eWZmwV4hyhG9JNC8frRUHPibMOVPTgYA9LEIU8RHF1zRfG9rgmvYvxuokKYd/GPZH15iDdXXLIZd0Sj6YI/mvpbo7HTFqEsZCEIsjpkLOV4Yj47/aF27UTk+uUXmlT7LkV2WgdSpSy5eIA8eZ0zYqNv6iodT2GMZCZOqJoxMLvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753707320; c=relaxed/simple;
	bh=8lbjOcxvy55Uh5WFwLyAOe89hzmXN6f4/1DLnti+fa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUa1BRv+ZmGEHYrxMIa1Svw/m6vqtPSDdDW+lMbkTRFAvcBnyhrftA3dFSW4HRZDbSAmM1ybbXKACAkKXPBKWUiXViZtKa5sBRqp01E952iKWXffiOeYwLSr8U8eU3MEoD41+qXaGZgxZJETBSygDGYTUrhpLqE8R6I7jHfst/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BQ3dK+jP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FED7446;
	Mon, 28 Jul 2025 14:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753707271;
	bh=8lbjOcxvy55Uh5WFwLyAOe89hzmXN6f4/1DLnti+fa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQ3dK+jPGaVGfaTyncFtq/03gvJ7A6v2s7W6VtN/N7adubGgTCwedVfD5Q8uXDQXK
	 p7UqDg6EsvqUKsIyyNyHqPwOYg3c4evzglfqZz8UFh+oFwi60kQnj3a7a987fcZas0
	 uqbuQg4Z+u/stmC3LW2j4DOzE8Jx4MBdlmenpnpQ=
Date: Mon, 28 Jul 2025 14:55:10 +0200
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
Subject: Re: [PATCH v10 03/64] media: Documentation: Clean up figure titles
Message-ID: <yhrlfesj5dxdufuzuudnfezboeid6fbe6gdvap5kxqalr3wetg@geajygftoiux>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-4-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:35PM +0300, Sakari Ailus wrote:
> Remove DocBook (?) conversion leftovers from figure titles, including
> obsolete numbering and highlighting. This aligns these titles with others.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

This patch seems to be missing a tag

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.39.5
>
>

