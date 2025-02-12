Return-Path: <linux-media+bounces-26075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFE2A32CC0
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 18:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7AA1621A8
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 17:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4E8230D0E;
	Wed, 12 Feb 2025 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AgFdjHyP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF3C271838
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379779; cv=none; b=s/G/xsxW9MxCylxB6uwM/ryvKRqOm6ve9d8H4/JC/Nx1IQhxJlacwJuc4db+N6mLXAQkmFxU11IsJZss7a/SPlUtrplZPX5XiV72ojvCucXIJ0vL9v17zYkw/x2FYAR5h/f/UfpuKNg7X+qaTcCnM4KgdcP0HJyUMnqjoTOFG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379779; c=relaxed/simple;
	bh=i2aViueIDXo730VZY/wT8GO2tY32x7UCeDuXUElhWPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gxz2/KFQJrL6peZxeSd8ib187nB1frPa2pRmRjwU9pMawclNSiaAQQlH8s2slf56Rzi6+Oqs/yoxrgpp/lhaWgcz/f3om2t11yP+RDBMN+m2bGZ+vbJha5fy7xTYRvn5Pe5evIiuCXEwcCcNWOGzF0tXzkNaGnSeSNCF3vZu9kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AgFdjHyP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0ACE455;
	Wed, 12 Feb 2025 18:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739379697;
	bh=i2aViueIDXo730VZY/wT8GO2tY32x7UCeDuXUElhWPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgFdjHyPzC23SNzBXb/1H8nbRcJ0W6G8UlTDZOdc1QtT5vxQxzzz4Tvypazns32me
	 X8PuR2BlGRIi0+/tUINmT38nm61481GBDBN4S8STz/jmLQnBDYk2ioRczFs7uKngtT
	 ssjaIQiXny9In+p0L5CNZmdptSrKYSkugeJRCvGM=
Date: Wed, 12 Feb 2025 18:02:52 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] media: uapi: rkisp1-config: Fix typo in extensible
 params example
Message-ID: <e275man56x7ympofkwptm32h3cbfjbw5pn6dkez4f5obhuhxen@gkxnt3ewsbnt>
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

Hi Niklas

On Wed, Feb 12, 2025 at 05:50:53PM +0100, Niklas Söderlund wrote:
> The define used for the version in the example diagram do not match what
> is defined in enum rksip1_ext_param_buffer_version, nor the description
> above it. Correct the typo to make it clear which define to use.
>
> Fixes: e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for spotting
Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.48.1
>

