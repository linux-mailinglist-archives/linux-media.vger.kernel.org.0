Return-Path: <linux-media+bounces-20060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC639AB71D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 21:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0E2CB243A8
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 19:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63671CCEC7;
	Tue, 22 Oct 2024 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rv2AAJN6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C111CCB4C
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729626183; cv=none; b=MDhwLjyxPJFV60flc6YRiFJaxTQiqKWVxckz4F015oif0ZSMIbVtO1Ea8EZltJb+Oax2QqzFk5O9L4yJoEB0Bn5vQRaxd07+C7xvelLNjK6W5Ug3obdKGPaD79w2DlKoTevmq+h/i2UientDXthZnWPVeZLekpo9TnhMTy5nxO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729626183; c=relaxed/simple;
	bh=jm22gRQ6G23h5NMqR1iDDxjje1KNS7jqDdEHq5dXzFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPNpzvtBcWigUWzmGUZMLS6Q8xxAqb2N7Gh1X38jTcbniZ+8brFKhZigaVVkjjEReDpRbqIuLL7MZIqdbT520veWTqVNT2kiGtPZG6enGgHwWz8yks59YKRFdz6pV66Wsj/xJUctfjdpEzme0bP0AtwTd6Ql9gNgPGCzk6qqK+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rv2AAJN6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15B1EA47;
	Tue, 22 Oct 2024 21:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729626073;
	bh=jm22gRQ6G23h5NMqR1iDDxjje1KNS7jqDdEHq5dXzFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rv2AAJN6nQhwsjtbE55OEPztw0AUft8A7RTsOWlVdDP5nU86wLXChyKq0JXABYk3l
	 A1T6gRNkHi5rlJYAVewl5ud6nHdUEIQhLqjlHKUBtFu5GoznI4JsyEh9ynq662CAzz
	 l+k4VCyDavDtEBOE5dO6ytgdztV9OZYH3uRbyeco=
Date: Tue, 22 Oct 2024 22:42:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 4/4] media: v4l: ctrl: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <20241022194253.GE9497@pendragon.ideasonboard.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011075535.588140-5-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Oct 11, 2024 at 10:55:35AM +0300, Sakari Ailus wrote:
> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
>  .../userspace-api/media/v4l/subdev-config-model.rst          | 2 ++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
>  include/uapi/linux/v4l2-controls.h                           | 3 +++
>  4 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 27803dca8d3e..928e8e3eed7f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -55,3 +55,7 @@ Image Process Control IDs
>      control value divided by e.g. 0x100, meaning that to get no
>      digital gain the control value needs to be 0x100. The no-gain
>      configuration is also typically the default.
> +
> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> +    Which configuration models the sub-device supports. Please see
> +    :ref:`media_subdev_config_model`.
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> index 8ec801998f5f..d4ae921b69c8 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
>  
> +.. _media_subdev_config_model:
> +

This could be moved to 3/4.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  Sub-device configuration models
>  ===============================
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 6b9188a4a220..378657a52cd5 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1167,6 +1167,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
>  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
>  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
>  
>  	/* DV controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1489,6 +1490,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_DV_RX_POWER_PRESENT:
>  		*type = V4L2_CTRL_TYPE_BITMASK;
>  		break;
> +	case V4L2_CID_CONFIG_MODEL:
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		*type = V4L2_CTRL_TYPE_BITMASK;
> +		break;
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..0152240229ab 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
>  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
>  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> +
> +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1ULL << 0)
>  
>  /*  DV-class control IDs defined by V4L2 */
>  #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)

-- 
Regards,

Laurent Pinchart

