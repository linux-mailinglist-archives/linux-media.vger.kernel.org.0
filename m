Return-Path: <linux-media+bounces-26131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1105A34F7B
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 21:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86603A4F26
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 20:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34692661A2;
	Thu, 13 Feb 2025 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="etePu+d7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E474245B1B
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479017; cv=none; b=kKG9r0ZkS9C2+O4nDT5NkWFgoOxhCoFXomP4uO/zH2/7iAxLu4tPbjO4nCpEGGd1CRpc7CIMTPIPdHVNop9uqFqTvk/SkaXpDWHSiBfLX50skARJyJcVVtymRUNrnNds1TcyPJGUpKcP/0E/TFMZz7kdt4MnCYhE4Trk+0Ulg5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479017; c=relaxed/simple;
	bh=AT9agPH4PRe4q5DUfxxOCeLU58k/P7DNVMVqvfeamEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3oap7fBYrQPrqdsiTifcvcLAhDddaHori5GKfgKS9evXwCe1RqtWiRfo4KDRJb8Wx9R0lbjTkMsebY/gys0VEtW5OMm/gXIjUCQIxSTJcQcTbh6zUdXh2qM1QQ5pmZB0hV5sTmXl0f0DQKg114p/h+BhlXQPkbv7cMzkaBerkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=etePu+d7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D562594;
	Thu, 13 Feb 2025 21:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739478934;
	bh=AT9agPH4PRe4q5DUfxxOCeLU58k/P7DNVMVqvfeamEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etePu+d7Ub9AYGPDKkIuqIvdTx0QDJX9toUG+PD0eZZxUUbSaRZ32pCCBugWvjTUn
	 YdLivYv3uRKl5exiSs/hZn4tUFXAd3p1ISXFMbrogMIxvgfk70pcR/KPPHAyBhkj3l
	 vswqgrTfchS+HVDEHG8h6IWCueobbe4AYblxCWLU=
Date: Thu, 13 Feb 2025 22:36:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] media: uapi: rkisp1-config: Fix typo in extensible
 params example
Message-ID: <20250213203641.GA22998@pendragon.ideasonboard.com>
References: <20250212165053.3378513-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212165053.3378513-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, Feb 12, 2025 at 05:50:53PM +0100, Niklas Söderlund wrote:
> The define used for the version in the example diagram do not match what

s/do/does/

> is defined in enum rksip1_ext_param_buffer_version, nor the description
> above it. Correct the typo to make it clear which define to use.
> 
> Fixes: e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/uapi/linux/rkisp1-config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 430daceafac7..2d995f3c1ca3 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -1528,7 +1528,7 @@ enum rksip1_ext_param_buffer_version {
>   * The expected memory layout of the parameters buffer is::
>   *
>   *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> - *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
> + *	| version = RKISP1_EXT_PARAM_BUFFER_V1;                               |
>   *	| data_size = sizeof(struct rkisp1_ext_params_bls_config)             |
>   *	|           + sizeof(struct rkisp1_ext_params_dpcc_config);           |
>   *	| +------------------------- data  ---------------------------------+ |

-- 
Regards,

Laurent Pinchart

