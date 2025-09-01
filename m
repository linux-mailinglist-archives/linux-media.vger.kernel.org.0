Return-Path: <linux-media+bounces-41457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9032BB3E95F
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B61C1B2190A
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F6F368098;
	Mon,  1 Sep 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fN5FCQlj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DF352065
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739286; cv=none; b=k4n5XAtWYrUXk+FlmEH2+rSGGcpCR1obQ/29lXUnrE/QLo9zzHdQaJi1YKqoipbqIEPwk7RaukSBmxq85EORCa5aqEL07xM8aFPSJd8p6uH8PNt4HgJnSftl1ZdeyY5dKha6d04nSQoOO/xRgBOid2llfzP8Zq9rt3kbk6CjiqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739286; c=relaxed/simple;
	bh=olhTGIsE8oLmTWBFxEyhYRe+AJQ60FIySVO6IDiTE1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4QaB3rIDNdY1squ+XAvC2GlP0DkJfNqutN4t1SdNBzC6SWoiHZtyxePXL7zPRYQ8xCMNVnCjUMystBXxr08uxU9Q0Zv9UgxjQFhcStz9/LvGfHVLldH/Wpf+pLhhxaJ5Vg9JbKEEPhU/whO+pJNwezppKC111+EmPxXr+njsCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fN5FCQlj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27363DF3;
	Mon,  1 Sep 2025 17:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756739213;
	bh=olhTGIsE8oLmTWBFxEyhYRe+AJQ60FIySVO6IDiTE1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fN5FCQljsCjPocsLGMtHJouSP+qeDA5jg5RUmtqE1CGL6S9CHHdugJVqH+Jn9mT/3
	 VTrcLL2Rsg/Rayr0FE8YLh3TYQG8dfwhGKyAM207OsLHfkSKZAXxgbv3PowWE9g7o9
	 0ufMK23K6oYzsd4vALfSNc0mjC11iL61juAAf7aQ=
Date: Mon, 1 Sep 2025 17:07:55 +0200
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
Subject: Re: [PATCH v11 24/66] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
Message-ID: <qeuueahbuofjmeird3dr7xtcosfhymk72ceuma4dibudf2nn3s@z6smlg4yn2rf>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-25-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-25-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:25PM +0300, Sakari Ailus wrote:
> The metadata layout control defines the layout of the metadata on the bus.
> It is used on sub-devices that use generic metadata mbus codes on at least
> on one of the pads.

Ideally:
1) we have per pad controls
2) s/V4L2_CID_COLOR_PATTERN/V4L2_CID_DATA_PATTERN
3) we use V4L2_CID_DATA_PATTERN for both color components ordering and
   metadata layouts. A sub-device will expose the same control, but on
   different pads

I know we don't want to block this series to wait for per-pad
controls, but I'm a bit afraid V4L2_CID_METADATA_LAYOUT will be made
redundant before it gets used for real (which maybe it's not a big
deal as if no one uses it, we will be able to easily replace it).

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
>  include/uapi/linux/v4l2-controls.h                          | 2 ++
>  3 files changed, 9 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 3cb7ee1b0aed..64c0f9ff5b1b 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -145,3 +145,9 @@ Image Source Control IDs
>      of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
>      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
>      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> +
> +``V4L2_CID_METADATA_LAYOUT (integer)``
> +    The metadata layout control defines the on-bus metadata layout for metadata
> +    streams. The control is used in conjunction with :ref:`generic metadata
> +    formats <media-bus-format-generic-meta>` formats to specify the layout of the
> +    data.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 9ec65998a8f7..a7ea380de5ee 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
>  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
>  	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
> +	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
>
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index eb9ffdd74d32..74e22a930be4 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1239,6 +1239,8 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_COLOR_PATTERN_FLIP_BOTH \
>  	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
>
> +#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> +

Intentional empty line ?

For the time being
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  /* Image processing controls */
>
> --
> 2.47.2
>
>

