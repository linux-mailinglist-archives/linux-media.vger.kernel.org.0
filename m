Return-Path: <linux-media+bounces-30654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD850A9575C
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99AFD7A6CAB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC731F0987;
	Mon, 21 Apr 2025 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OUsx6qFV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2A1EB182
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745267367; cv=none; b=O+TeCZUHfeqvIKDEWNbW1OGTVwE61AsvAmmQXD+220sAXXA5lE2x16ykbKxwSq0nZHl9mAgitSxImcRN/8LklD/CXdKhy2/qT9f25rnYhdD6ZDJQVFuSX+w5rj3wGsFtjl/8w+CcAfBfAhj2aO27EFg9wfSYvMqeLzzKRPQv7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745267367; c=relaxed/simple;
	bh=3GnkZRPgi4kswyQgB/RpGLvyavrZWVKNJIT4jOIl0JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8wU6lH1t0r/Qp0ZnEIMDspQdohdeFN4Q+dC/DKpjBnAWGzN/T/Sch7UOuZwWDs8AqliXuJhwLW3Ra5+DVJzutLzh29vikdfejeTNbLh3WHexy4Jr85QFzZKC7HSYqGRdrSq9T59S0hod17yKszazErWvJhsXwqbR5kmk1PN0Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OUsx6qFV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25B9A6D6;
	Mon, 21 Apr 2025 22:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745267237;
	bh=3GnkZRPgi4kswyQgB/RpGLvyavrZWVKNJIT4jOIl0JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUsx6qFVSqSxJqjzzJoNT9EZNaiI8/iZF8BfBge9fe+3nJU//qyJ9W08SzqEJJFzw
	 eaR9JL45a9X28VgNJ2TlUmEhfOz6jcRf8S3ep+91CveJg3Bcq0VhG8YBNPjykFDAWt
	 QBP0UfZfiUz2YXqaR7Et8H8zk6sCdJuZTMajcm5c=
Date: Mon, 21 Apr 2025 23:29:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 11/11] media: ccs-pll: Document the CCS PLL flags
Message-ID: <20250421202921.GL17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-12-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:54AM +0300, Sakari Ailus wrote:
> Document the CCS PLL flags with short comments. The CCS spec has more
> information on them while the added documentation helps finding the
> relevant information in the CCS spec.

Oohhhh, documentation, that's nice :-)

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs-pll.h | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> index e8297db45460..6e503fe2d591 100644
> --- a/drivers/media/i2c/ccs-pll.h
> +++ b/drivers/media/i2c/ccs-pll.h
> @@ -18,19 +18,40 @@
>  #define CCS_PLL_BUS_TYPE_CSI2_DPHY				0x00
>  #define CCS_PLL_BUS_TYPE_CSI2_CPHY				0x01
>  
> -/* Old SMIA and implementation specific flags */
> -/* op pix clock is for all lanes in total normally */
> +/* Old SMIA and implementation specific flags. */
> +/* OP PIX clock is for all lanes in total normally. */
>  #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
> -#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> +
>  /* CCS PLL flags */
> +
> +/* The sensor doesn't have OP clocks at all. */
> +#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> +/* System speed model if this flag is unset. */
>  #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
> +/* If set, the pre-PLL divider may have odd values, too. */
>  #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
> +/*
> + * If set, the OP PIX clock doesn't have to exactly match with data rate, it may
> + * be higher. See "OP Domain Formulas" in MIPI CCS 1.1 spec.
> + */
>  #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
> +/* If set, the VT domain may run faster than the OP domain. */
>  #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
> +/* If set, the VT domain may run slower than the OP domain. */
>  #define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
> +/* If set, the PLL tree has two PLLs instead of one. */
>  #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
> +/*
> + * If set, the OP SYS clock is a dual data rate clock, transferring two bits per
> + * cycle instead of one.
> + */
>  #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
> +/*
> + * If set, the OP PIX clock is a dual data rate clock, transferring two bits per
> + * cycle instead of one.

Should this be "two pixels per cycle" ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + */
>  #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
> +/* If set, the PLL multipliers are required to be even. */
>  #define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(11)
>  
>  /**

-- 
Regards,

Laurent Pinchart

