Return-Path: <linux-media+bounces-42853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC7B8E860
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 00:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7A5C17D5CD
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 22:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E462C375A;
	Sun, 21 Sep 2025 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y5rG/NnT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58B25A642;
	Sun, 21 Sep 2025 22:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758492839; cv=none; b=nvPE5YuScokEByFBihopHW0RKJ88e0pzmURcfNYkMvmby4AIAbrsIFFdfITkYvTzcF8NQOVH0Dj4Xy3UNHx/gUZ9SeowdMjAJBkKmOsVFbvtuPA7+TSWTpRrIGZ/EBQU8wCsy99nZvY24Fm9LzIfx/M6KwVUHzGB0I8x/nltLNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758492839; c=relaxed/simple;
	bh=cfJqWM3gbOoRfqSqWNMf7IHBruDGEX51ga3z4ZjwmqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw2JrdguQ4SpailAbpn3odBldELkr0bOkuKabXkgsNNjIDidYBQaehQqdJYyMxnRi6k+eGHhXA9buLw7/qK61UODqTvusUagAho0IgI8mN0eSCRSysaD2HtyyONUNXcH6IoIs4RLtXkoELtASDPjiiAktbCfq4MgTVRfqqLJNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y5rG/NnT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 48C4F10C4;
	Mon, 22 Sep 2025 00:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758492754;
	bh=cfJqWM3gbOoRfqSqWNMf7IHBruDGEX51ga3z4ZjwmqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5rG/NnT90EfM7ku/M+IctoCHC/iHip/8CBCnVNVmUJ1L53wVMrte0qwa5mueAryt
	 9OZ+jMWcA15HUbc0zezqBCKRH1OkMLpAeob8KrmZPJttWB8mlLpwOQ65TR1FDjRBl0
	 boM5P9DWU9nXeYjZD2FbcUq+8usIZ0gKRehV8z44=
Date: Mon, 22 Sep 2025 01:13:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by using
 helper macro
Message-ID: <20250921221325.GB10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Fri, Sep 05, 2025 at 02:55:59PM +0800, Guoniu Zhou wrote:
> Simplify code by using helper macro FIELD_PREP() and GENMASK().

I'm not necessarily against this change, but how does it "simplify code"
? There's no change in the code beside the macros, and they don't look
particularly simpler.

> No functions changed.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index f69c3b5d478209c083738477edf380e3f280c471..2f5e7299b537d612fb1fe6688c1b75bfd2d6049b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -3,6 +3,8 @@
>   * Copyright 2019-2023 NXP
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/regmap.h>
>  
>  #include <media/mipi-csi2.h>
> @@ -16,8 +18,7 @@
>  #define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
>  
>  #define GASKET_CTRL				0x0000
> -#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
> -#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
> +#define GASKET_CTRL_DATA_TYPE(dt)		FIELD_PREP(GENMASK(13, 8), (dt))

I think you can omit the parentheses around dt here, and around x below.

>  #define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
>  #define GASKET_CTRL_ENABLE			BIT(0)
>  
> @@ -58,7 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>   */
>  
>  #define DISP_MIX_CAMERA_MUX                     0x30
> -#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
>  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
>  
>  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,

-- 
Regards,

Laurent Pinchart

