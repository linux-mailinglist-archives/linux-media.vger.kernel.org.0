Return-Path: <linux-media+bounces-30656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2038A957BB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 23:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01BD516DE01
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C3720F09B;
	Mon, 21 Apr 2025 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bzYJdNJg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6D20DD51;
	Mon, 21 Apr 2025 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745269622; cv=none; b=Ch7SH7cyxh70zauHzLp/FUXH8FdISC2c1LN0rV8mAwpK3R8jc2OuOlBYWYJKzSmMZytIexZxffGK1Lc9wG5ZJ6gQCVhdAUZkQCYSvZtmmxjXECoywEC56n0YUYP5SGN7089O9sPmeJVi7lK2Ruw0lyK2d0OSmTsmwNPgPjJNRVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745269622; c=relaxed/simple;
	bh=zZ9QfTcAgGyVYVMs/hFgm2shARK8oqJFBREnc4yd/O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7977fMti+lGvdeeNwYoTurzxBvZpxHHlLxfKwxZRDz9Ljmp1Zuj31QmJgmcyGMI0rYoSWvuObjPP/9SagKrHNm02p20tXKRtoseW4jqHo80SM+8FmHc5y5EvKIezfiRfDNWLymxeY0iAHeGWYcspdKc1wDL957gJIPV4PHH5OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bzYJdNJg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7B066D6;
	Mon, 21 Apr 2025 23:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745269492;
	bh=zZ9QfTcAgGyVYVMs/hFgm2shARK8oqJFBREnc4yd/O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzYJdNJg/LuvQBr4OL4eciqJS2M7kpo4FXjah87Kf7KRD64nt+dZ34NKjUjp0i/c/
	 RNz9SWLBw/TuFNcM9G+FcaTDoV5dyQNmdsvlTrT9YqCbNRuI0udA42xi88w5Dt08vj
	 09s2rEjqY68jvRrSv4nHsMH/oVeQWNkPySkyIrfo=
Date: Tue, 22 Apr 2025 00:06:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 03/13] media: nxp: imx8-isi: Remove unused offset in
 mxc_isi_reg and use BIT() macro for mask
Message-ID: <20250421210655.GM17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-3-ef695f1b47c4@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-3-ef695f1b47c4@nxp.com>

Hi Frank,

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:01PM -0400, Frank Li wrote:
> Preserve clarity by removing the unused 'offset' field in struct mxc_isi_reg,
> as it duplicates information already indicated by the mask and remains unused.

The commit message line length limit is normally 72 characters. I can
reflow when applying if no other change to the series is needed.

> 
> Improve readability by replacing hex value masks with the BIT() macro.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 25 +++++++++++-----------
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 -
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 1e79b1211b603..ecfc95882f903 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -3,6 +3,7 @@
>   * Copyright 2019-2020 NXP
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
> @@ -247,24 +248,24 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
>  
>  /* For i.MX8QXP C0 and i.MX8MN ISI IER version */
>  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
> -	.oflw_y_buf_en = { .offset = 19, .mask = 0x80000  },
> -	.oflw_u_buf_en = { .offset = 21, .mask = 0x200000 },
> -	.oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
> +	.oflw_y_buf_en = { .mask = BIT(19) },
> +	.oflw_u_buf_en = { .mask = BIT(21) },
> +	.oflw_v_buf_en = { .mask = BIT(23) },
>  
> -	.panic_y_buf_en = {.offset = 20, .mask = 0x100000  },
> -	.panic_u_buf_en = {.offset = 22, .mask = 0x400000  },
> -	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
> +	.panic_y_buf_en = { .mask = BIT(20) },
> +	.panic_u_buf_en = { .mask = BIT(22) },
> +	.panic_v_buf_en = { .mask = BIT(24) },
>  };
>  
>  /* For i.MX8MP ISI IER version */
>  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
> -	.oflw_y_buf_en = { .offset = 18, .mask = 0x40000  },
> -	.oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
> -	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
> +	.oflw_y_buf_en = { .mask = BIT(18) },
> +	.oflw_u_buf_en = { .mask = BIT(20) },
> +	.oflw_v_buf_en = { .mask = BIT(22) },
>  
> -	.panic_y_buf_en = {.offset = 19, .mask = 0x80000  },
> -	.panic_u_buf_en = {.offset = 21, .mask = 0x200000 },
> -	.panic_v_buf_en = {.offset = 23, .mask = 0x800000 },
> +	.panic_y_buf_en = { .mask = BIT(19) },
> +	.panic_u_buf_en = { .mask = BIT(21) },
> +	.panic_v_buf_en = { .mask = BIT(23) },
>  };
>  
>  /* Panic will assert when the buffers are 50% full */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 9c7fe9e5f941f..e7534a80af7b4 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -114,7 +114,6 @@ struct mxc_isi_buffer {
>  };
>  
>  struct mxc_isi_reg {
> -	u32 offset;
>  	u32 mask;
>  };
>  

-- 
Regards,

Laurent Pinchart

