Return-Path: <linux-media+bounces-25195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA5A1A159
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 10:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94EAF1608F7
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1536020D51C;
	Thu, 23 Jan 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B9XB/mK8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934A1C54BB;
	Thu, 23 Jan 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737626361; cv=none; b=aaF/EKHmHqlBLSVtayBnXkO6MmGDDJM0xcXAMfB/ontL4ZPyBXUhxVXsaky1UQcoY8e6dSI7qPxSCDSrUIyEtvX53Gb1wajYEs2csJqfxIZ/Km07wupDh4/OYAkKI/q/L+uJGzkKQBcBXYE11pIkarllfZ5pnPNrATzdBynt/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737626361; c=relaxed/simple;
	bh=likhyS6C+9VCEERkb5XgdxsvfTH2bz2qpSAGLws7cio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAlGzJzk8catCxvMWOn+9shQotk2XtTmNFzigOD1BC03itWUgloudnjopG0I0BdDhKs+TSnGlVZaCj6v+Bmy0jswvATYSkLl8ZZ5Wcr/BbxhZfauyIGn41nG+A/+5kuttMk5HRiwIOwN7/1v0F4Sls6ihCeGCEvE8CV+huiiWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B9XB/mK8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DE0F3A4;
	Thu, 23 Jan 2025 10:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737626293;
	bh=likhyS6C+9VCEERkb5XgdxsvfTH2bz2qpSAGLws7cio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9XB/mK8+pE4nclVrusebe0O0CeT/rmrXemAMGZZCQH3d9wXbfyVn4Yy6BloezvBl
	 MT5G/QnORoLAGQE+QtxFi9WW0H4RnU5GLIydPXRYNhlLia5ZmwsxtC+/U6vJ5quDY9
	 S35dLVklFbYr2VO3eO+ksGl2RVUjQbDLlzBZ09m8=
Date: Thu, 23 Jan 2025 10:59:13 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v5 09/10] Documentation: media: add documentation file
 metafmt-c3-isp.rst
Message-ID: <36vk5fefzoqy2d5b3un6ukyar653uzozsmc2iejk2xlnneguhn@fiuvdork5qpc>
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-9-c7124e762ff6@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227-c3isp-v5-9-c7124e762ff6@amlogic.com>

Hi Keke

On Fri, Dec 27, 2024 at 03:09:18PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> Add the file 'metafmt-c3-isp.rst' that documents
> the meta format of c3-isp.
>
> Signed-off-by: Keke Li <keke.li@amlogic.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../userspace-api/media/v4l/metafmt-c3-isp.rst     | 86 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 88 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 86ffb3bc8ade..bb6876cfc271 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
>  .. toctree::
>      :maxdepth: 1
>
> +    metafmt-c3-isp
>      metafmt-d4xx
>      metafmt-generic
>      metafmt-intel-ipu3
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
> new file mode 100644
> index 000000000000..b15c40841266
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
> @@ -0,0 +1,86 @@
> +.. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +.. _v4l2-meta-fmt-c3isp-stats:
> +.. _v4l2-meta-fmt-c3isp-params:
> +
> +***********************************************************************
> +V4L2_META_FMT_C3ISP_STATS ('CSTS'), V4L2_META_FMT_C3ISP_PARAMS ('CPRM')
> +***********************************************************************
> +
> +.. c3_isp_stats_info
> +
> +3A Statistics
> +=============
> +
> +The C3 ISP can collect different statistics over an input Bayer frame.
> +Those statistics are obtained from the "c3-isp-stats" metadata capture video nodes,
> +using the :c:type:`v4l2_meta_format` interface.
> +They are formatted as described by the :c:type:`c3_isp_stats_info` structure.
> +
> +The statistics collected are  Auto-white balance,
> +Auto-exposure and Auto-focus information.
> +
> +.. c3_isp_params_cfg
> +
> +Configuration Parameters
> +========================
> +
> +The configuration parameters are passed to the c3-isp-params metadata output video node,
> +using the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
> +sub-structs for each configurable area of the ISP, parameters for the C3-ISP
> +are defined as distinct structs or "blocks" which may be added to the data
> +member of :c:type:`c3_isp_params_cfg`. Userspace is responsible for
> +populating the data member with the blocks that need to be configured by the driver, but
> +need not populate it with **all** the blocks, or indeed with any at all if there
> +are no configuration changes to make. Populated blocks **must** be consecutive
> +in the buffer. To assist both userspace and the driver in identifying the
> +blocks each block-specific struct embeds
> +:c:type:`c3_isp_params_block_header` as its first member and userspace
> +must populate the type member with a value from
> +:c:type:`c3_isp_params_block_type`. Once the blocks have been populated
> +into the data buffer, the combined size of all populated blocks shall be set in
> +the data_size member of :c:type:`c3_isp_params_cfg`. For example:
> +
> +.. code-block:: c
> +
> +	struct c3_isp_params_cfg *params =
> +		(struct c3_isp_params_cfg *)buffer;
> +
> +	params->version = C3_ISP_PARAM_BUFFER_V0;
> +	params->data_size = 0;
> +
> +	void *data = (void *)params->data;
> +
> +	struct c3_isp_params_awb_gains *gains =
> +		(struct c3_isp_params_awb_gains *)data;
> +
> +	gains->header.type = C3_ISP_PARAMS_BLOCK_AWB_GAINS;
> +	gains->header.flags = C3_ISP_PARAMS_BLOCK_FL_ENABLE;
> +	gains->header.size = sizeof(struct c3_isp_params_awb_gains);
> +
> +	gains->gr_gain = 256;
> +	gains->r_gain = 256;
> +	gains->b_gain = 256;
> +	gains->gb_gain = 256;
> +
> +	data += sizeof(struct c3_isp__params_awb_gains);
> +	params->data_size += sizeof(struct c3_isp_params_awb_gains);
> +
> +	struct c3_isp_params_awb_config *awb_cfg =
> +		(struct c3_isp_params_awb_config *)data;
> +
> +	awb_cfg->header.type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;
> +	awb_cfg->header.flags = C3_ISP_PARAMS_BLOCK_FL_ENABLE;
> +	awb_cfg->header.size = sizeof(struct c3_isp_params_awb_config);
> +
> +	awb_cfg->tap_point = C3_ISP_AWB_STATS_TAP_BEFORE_WB;
> +	awb_cfg->satur = 1;
> +	awb_cfg->horiz_zones_num = 32;
> +	awb_cfg->vert_zones_num = 24;
> +
> +	params->data_size += sizeof(struct c3_isp_params_awb_config);
> +
> +Amlogic C3 ISP uAPI data types
> +===============================
> +
> +.. kernel-doc:: include/uapi/linux/media/amlogic/c3-isp-config.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d92427630bfa..b2626a370cc0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1248,6 +1248,7 @@ M:	Keke Li <keke.li@amlogic.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
> +F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
>  F:	drivers/media/platform/amlogic/c3/isp/
>  F:	include/uapi/linux/media/amlogic/
>
>
> --
> 2.47.1
>
>

