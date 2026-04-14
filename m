Return-Path: <linux-media+bounces-58754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLWoAo5j3mlqDgAAu9opvQ
	(envelope-from <linux-media+bounces-58754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:55:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 169AB3FC36C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 367FB301068B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAB233123B;
	Tue, 14 Apr 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Na3azW+M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E027740DFB7
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182136; cv=none; b=fo0PA2wJ14MYfk7+1yZ6uwC5YS9ZGtrmXj6qNIquOc3oiV4EmgVLd+MCDdSrxtgz9xhi0X4bpihLqh8b3S1Y0SMjUUzR0GNcJMpkIjeHftJ0dU2sh/QpaZS64hoA982JkjFSCW337RRgOHkviJ1x2qXYqaMX4U0bbLpKEAlP7ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182136; c=relaxed/simple;
	bh=+EqxjLeuFn9ZYC4DX/68jy8FmVG2eirxw9/yToRe3gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bsm0WJU9tZm+fmkifgsKrcgwrWgVCXvkhHJI60PhigTyKT0eZz/+orHPvvFxeKVgIt98pXLtbP2oX73V/z4NJRM5jIblIcvb1Qqrhvhj/DURWwWcw4opXbdmg/ppLoDUDHM1mHZXNxCK/qEGnR+oz7/EjASOAIl3wns8QZ6DiLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Na3azW+M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0754225;
	Tue, 14 Apr 2026 17:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776182039;
	bh=+EqxjLeuFn9ZYC4DX/68jy8FmVG2eirxw9/yToRe3gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Na3azW+MfDjLXuwOeLqUlH2dE4De/ycyofWZ2yz8gqTv//oagehshmJW+8JfV/WNp
	 2V5oBfWsm0ddEywyWEbxA2rtsSsv6QwLXqjzX8Ylm+5J/n7ohbLfeC+YxfmjXhLSIZ
	 IN5R1+XRha71m18hIRr3N4U1SS+upbeC1Cx92qtg=
Date: Tue, 14 Apr 2026 17:55:28 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 27/86] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <ad5jAqaTkHbIiUcA@zed>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-28-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409201501.975242-28-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58754-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 169AB3FC36C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:14:02PM +0300, Sakari Ailus wrote:
> Add V4L2_CID_BINNING control for configuring binning and enumerating a

Seems like the control is now named V4L2_CID_BINNING_FACTORS ?
Also applies to the patch subject

Have I missed something ?
$ git grep CID_BINNING include/
include/uapi/linux/v4l2-controls.h:#define V4L2_CID_BINNING_FACTORS             (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)

> camera sensor's binning capabilities. The control combines horizontal and
> vertical binning into a single control as the two are generally related.
>
> New drivers should use this control to configure binning.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 12 ++++++++
>  .../media/v4l/ext-ctrls-image-source.rst      | 30 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  2 ++
>  4 files changed, 46 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index d8ba809486c5..12f075379bc8 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
>
> +Binning
> +-------
> +
> +Binning has traditionally been configured using :ref:`the compose selection
> +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING

This needs to be updated as well ?

> +<image_source_control_binning_factors>` control is also available for binning
> +configuration and users should use it when it's available. Drivers supporting
> +the control shall also support the compose rectangle, albeit the rectangle may
> +be read-only when the control is present.
> +
> +Binning isn't affected by flipping.
> +
>  .. _media_using_camera_sensor_drivers_embedded_data:
>
>  Embedded data
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 490cd16186cd..0ef76b02a6e1 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -160,3 +160,33 @@ Image Source Control IDs
>      interface for metadata streams. The control is used in conjunction with
>      :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
>      specify the layout of the data.
> +
> +.. _image_source_control_binning_factors:
> +
> +``V4L2_CID_BINNING_FACTORS (integer menu)``
> +
> +    This control determines horizontal and vertical binning factors. Binning
> +    combines several horizontal, vertical or both pixel values into a single
> +    pixel. It is a way to scale an image. Binning typically produces fairly good
> +    quality output.
> +
> +    Determines both horizontal and vertical binning factors for a camera
> +    sensor. The values are encoded in the following way:
> +
> +.. flat-table::
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Bits
> +      - Synopsis
> +    * - 48--63
> +      - Horizontal binning numerator.
> +    * - 32--47
> +      - Horizontal binning denominator.
> +    * - 16--31
> +      - Vertical binning numerator.
> +    * - 0--15
> +      - Vertical binning denominator.
> +
> +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> +(horizontally) * 3/2 (vertically).
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 4618252d24f2..fee343667b69 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1160,6 +1160,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
>  	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
>  	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
> +	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
>
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1438,6 +1439,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_HDR_SENSOR_MODE:
>  		*type = V4L2_CTRL_TYPE_MENU;
>  		break;
> +	case V4L2_CID_BINNING_FACTORS:
>  	case V4L2_CID_LINK_FREQ:
>  		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 1bf6d298e3c4..5496b1664432 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1249,6 +1249,8 @@ enum v4l2_jpeg_chroma_subsampling {
>
>  #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
>
> +#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
> +
>  /* Image processing controls */
>
>  #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
> --
> 2.47.3
>
>

