Return-Path: <linux-media+bounces-14626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2079927242
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 10:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7724C1F21457
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 08:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3C51A3BBB;
	Thu,  4 Jul 2024 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o278vWFW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5B1A4F22
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083371; cv=none; b=oSKgGkzJ6qCTHMHkHd1u2edW9ZETRJR7DzkFBrWaaNqh12pwtwsYbdjUPJfqFhf1wEGZENHVR+QNxygf+yk9uUrblGLqf7mdQwEu0Dyrnnt43kkZV8RTpU/rNSF3LZp6HwJCWg1Bz16wl649bdz4oxQIEnj5105ARm/eMd5aAUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083371; c=relaxed/simple;
	bh=vrwaL7XAie9A3JobDeUAOKjvOjxR6tXoiBc/79/ClSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVHXXfJYYz33MJin9rUikg5NjDFAF3+Spr6IQeGzNDSofGjt5UHYXh2duSrCA4EbMXHykC9se6yZ9QcYTcZvO0WhJiWbii5p9QsZKscNXnerpA29AEuGL+SYp9CyrCsWJz13CRPHu0L4+CjiDn5WK3r99UB5Amkdjo7SXzq+3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o278vWFW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0151541;
	Thu,  4 Jul 2024 10:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720083335;
	bh=vrwaL7XAie9A3JobDeUAOKjvOjxR6tXoiBc/79/ClSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o278vWFW5E1S35YQfchcuqxhfxR6VsvqkblTkbtN2F5KuZXS/DRStH/rQt1kmIe/D
	 RB6Fnlksb4F5oq3dn2XPvv1mKQLL6tAuTKjNBM5RWvqK7JGvO6AdhQO+ZFp9pO2/0D
	 zc6DJW6RqtnmdI/1QQ9nR7LKs2QfenWHrAsGWQh8=
Date: Thu, 4 Jul 2024 10:56:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 3/5] media: rkisp1: Add register definitions for the
 companding block
Message-ID: <v5vuf7p6cbcwhdk5hwqpvnhafuz4arpqobg7euurnatjtx2fwn@qvazhzzwkmnj>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
 <20240703222533.1662-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240703222533.1662-4-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jul 04, 2024 at 01:25:31AM GMT, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> To prepare for adding support for the companding block to the rkisp1
> driver for the version of the ISP on the i.MX8MP, add the register
> definitions for it, including relevant register field values.
>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index fccf4c17ee8d..f516c9c1b822 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -704,6 +704,11 @@
>  #define RKISP1_CIF_ISP_DPF_SPATIAL_COEFF_MAX		0x1f
>  #define RKISP1_CIF_ISP_DPF_NLL_COEFF_N_MAX		0x3ff
>

The other blocks are preceded by a comment, should you add

/* COMPAND */

here ?
> +#define RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE	BIT(0)
> +#define RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE	BIT(1)
> +#define RKISP1_CIF_ISP_COMPAND_CTRL_SOFT_RESET_FLAG	BIT(2)
> +#define RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE		BIT(3)
> +
>  /* =================================================================== */
>  /*                            CIF Registers                            */
>  /* =================================================================== */
> @@ -1394,6 +1399,23 @@
>  #define RKISP1_CIF_ISP_VSM_DELTA_H		(RKISP1_CIF_ISP_VSM_BASE + 0x0000001c)
>  #define RKISP1_CIF_ISP_VSM_DELTA_V		(RKISP1_CIF_ISP_VSM_BASE + 0x00000020)
>
> +#define RKISP1_CIF_ISP_COMPAND_BASE			0x00003200
> +#define RKISP1_CIF_ISP_COMPAND_CTRL			(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_COMPAND_BLS_A_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000004)
> +#define RKISP1_CIF_ISP_COMPAND_BLS_B_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000008)
> +#define RKISP1_CIF_ISP_COMPAND_BLS_C_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x0000000c)
> +#define RKISP1_CIF_ISP_COMPAND_BLS_D_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000010)
> +#define RKISP1_CIF_ISP_COMPAND_EXPAND_PX_N(n)		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000014 + (n) * 4)
> +#define RKISP1_CIF_ISP_COMPAND_COMPRESS_PX_N(n)		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000040 + (n) * 4)
> +#define RKISP1_CIF_ISP_COMPAND_EXPAND_Y_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x0000006c)
> +#define RKISP1_CIF_ISP_COMPAND_EXPAND_Y_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000070)
> +#define RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000074)
> +#define RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000078)
> +#define RKISP1_CIF_ISP_COMPAND_EXPAND_X_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x0000007c)
> +#define RKISP1_CIF_ISP_COMPAND_EXPAND_X_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000080)
> +#define RKISP1_CIF_ISP_COMPAND_COMPRESS_X_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000084)
> +#define RKISP1_CIF_ISP_COMPAND_COMPRESS_X_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000088)
> +

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  #define RKISP1_CIF_ISP_CSI0_BASE		0x00007000
>  #define RKISP1_CIF_ISP_CSI0_CTRL0		(RKISP1_CIF_ISP_CSI0_BASE + 0x00000000)
>
> --
> Regards,
>
> Laurent Pinchart
>

