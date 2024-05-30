Return-Path: <linux-media+bounces-12309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BC8D55D3
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 00:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFA2B1F2397D
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C471D183089;
	Thu, 30 May 2024 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LiiV9/G6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC917545;
	Thu, 30 May 2024 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109704; cv=none; b=bCo93no/s7mLp1UxS7RKMvE157QwIDw9qoauuGbdpID8XqLEZmNf3xr1Hdp6nvX/w+0Yj59neGNBvaJhPLz9E4YxZ75pXNJdyp+mZNYpmavBhFL+JH/MSyXf1Q+ib59QbSyLul//mdiUWkoxCAgy9xhq6a22NsQy/Qb6VCk0ZD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109704; c=relaxed/simple;
	bh=whRluBV3GKS+ywYXZqa7OzxXuiHvou3IvZZC/JmDv/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/8uha1Srip7sYC/eyrXQUS6wj2xzn1WISk+CyU4U+ZAxVMk3v+teF7JOC2mPDYkj2sOtJa+1634sOjahWCc1I4a9OyPpNOCReUfpS5l4vsKkFLsAjAwZEei7NxJ2qY9ukRjoPMGEeBeZwcH0uGxTWP/jZmoVKobkBUbcukVuQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LiiV9/G6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08DEFA06;
	Fri, 31 May 2024 00:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717109696;
	bh=whRluBV3GKS+ywYXZqa7OzxXuiHvou3IvZZC/JmDv/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiiV9/G6pljAL2FXCgM/zh9HLSa6etHXeQhnHYJoMUj4rJNlcmBDyf6ruIItGIrA9
	 XyT5xVcej26EGHM2aHQvAT8/pXatOpC99wpe37GJMqX+L9T02lA44bTx81rw4hxR90
	 BXibrRRne5ibr8Z56HR3HpkI4Qxzuny26943+VkU=
Date: Fri, 31 May 2024 01:54:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 16/16] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <20240530225447.GF5213@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-17-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-17-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, May 29, 2024 at 04:28:58PM +0100, Daniel Scally wrote:
> Document the mali-c55 parameter setting by expanding the relevant
> pages in both admin-guide/ and userspace-api/.
> 
> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v5:
> 
> 	- New patch
> 
>  Documentation/admin-guide/media/mali-c55.rst  | 19 +++++-
>  .../media/v4l/metafmt-arm-mali-c55.rst        | 65 ++++++++++++++++++-
>  2 files changed, 79 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
> index b75437f6e96a..c5e6ac826c99 100644
> --- a/Documentation/admin-guide/media/mali-c55.rst
> +++ b/Documentation/admin-guide/media/mali-c55.rst
> @@ -380,9 +380,24 @@ the processing flow the statistics can be drawn from::
>                         +-------------+   |    +-------------+
>                                           +-->  AWB-1
>  
> -At present all statistics are drawn from the 0th tap point for each algorithm;
> +By default all statistics are drawn from the 0th tap point for each algorithm;
>  I.E. AEXP statistics from AEXP-0 (A), AWB statistics from AWB-0 and AF
> -statistics from AF-0. In the future this will be configurable.
> +statistics from AF-0. This is configurable for AEXP and AWB statsistics through
> +programming the ISP's parameters.
> +
> +.. _mali-c55-3a-params:
> +
> +Programming ISP Parameters
> +==========================
> +
> +The ISP can be programmed with various parameters from userspace to apply to the
> +hardware before and during video stream. This allows userspace to dynamically
> +change values such as black level, white balance and lens shading gains and so
> +on.
> +
> +The buffer format and how to populate it are described by the
> +:ref:`V4L2_META_FMT_MALI_C55_PARAMS <v4l2-meta-fmt-mali-c55-params>` format,
> +which should be set as the data format for the `mali-c55 3a params` video node.
>  
>  References
>  ==========
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> index 219a5dd42d70..c359d2c83858 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> @@ -1,10 +1,11 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> +.. _v4l2-meta-fmt-mali-c55-params:
>  .. _v4l2-meta-fmt-mali-c55-3a-stats:
>  
> -****************************************
> -V4L2_META_FMT_MALI_C55_3A_STATS ('C55S')
> -****************************************
> +********************************************************************************
> +V4L2_META_FMT_MALI_C55_3A_STATS ('C55S'), V4L2_META_FMT_MALI_C55_PARAMS ('C55P')
> +********************************************************************************
>  
>  3A Statistics
>  =============
> @@ -22,6 +23,64 @@ of the C structure :c:type:`mali_c55_stats_buffer` defined in
>  
>  For details of the statistics see :c:type:`mali_c55_stats_buffer`.
>  
> +Configuration Parameters
> +========================
> +
> +The configuration parameters are passed to the
> +:ref:`mali-c55 3a params <mali-c55-3a-params>` metadata output video node, using
> +the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
> +sub-structs for each configurable area of the ISP, parameters for the Mali-C55
> +are defined as distinct structs or "blocks" which may be added to the data
> +member of struct mali_c55_params_buffer. Userspace is responsible for populating
> +the data member with the blocks that need to be configured by the driver, but
> +need not populate it with **all** the blocks, or indeed with any at all if there
> +are no configuration changes to make. Populated blocks **must** be consecutive
> +in the buffer. To assist both userspace and the driver in identifying the
> +blocks each block-specific struct should embed

s/should embed/embeds/

> +struct mali_c55_params_block_header as its first member and userspace must
> +populate the type member with a value from enum mali_c55_param_block_type. Once

It would be nice to add references to the struct and enum.

> +the blocks have been populated into the data buffer, the combined size of all
> +populated blocks should be set in the total_size member of

s/should be/is/

or "must" or "shall".

> +struct mali_c55_params_buffer. For example:
> +
> +.. code-block:: c
> +
> +	struct mali_c55_params_buffer *params =
> +		(struct mali_c55_params_buffer *)buffer;
> +
> +	params->version = MALI_C55_PARAM_BUFFER_V0;

I think applications will likely handle the size as follows:

	params->total_size = 0;

> +
> +	void *data = (void *)params->data;
> +
> +	struct mali_c55_params_awb_gains *gains =
> +		(struct mali_c55_params_awb_gains *)data;
> +
> +	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> +	gains->header.enabled = true;
> +	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> +
> +	gains->gain00 = 256;
> +	gains->gain00 = 256;
> +	gains->gain00 = 256;
> +	gains->gain00 = 256;
> +
> +	data += sizeof(struct mali_c55_params_awb_gains)

	params->total_size += sizeof(struct mali_c55_params_awb_gains);

> +
> +	struct mali_c55_params_sensor_off_preshading *blc =
> +		(struct mali_c55_params_sensor_off_preshading *)data;
> +
> +	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> +	blc->header.enabled = true;
> +	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> +
> +	blc->chan00 = 51200;
> +	blc->chan01 = 51200;
> +	blc->chan10 = 51200;
> +	blc->chan11 = 51200;
> +
> +	params->total_size = sizeof(struct mali_c55_params_awb_gains) +
> +			     sizeof(struct mali_c55_params_sensor_off_preshading);

	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);

I could be wrong though. Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  Arm Mali-C55 uAPI data types
>  ============================
>  

-- 
Regards,

Laurent Pinchart

