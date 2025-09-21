Return-Path: <linux-media+bounces-42854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F17E5B8E87E
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 00:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8351895FDA
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 22:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903C22566D9;
	Sun, 21 Sep 2025 22:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jas5FmLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86438188715;
	Sun, 21 Sep 2025 22:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758493153; cv=none; b=CNtxa6agDK4FdD2dz3O70xWBLpWUbzVwbjlX+epgdbiHHrNk+IX3cbUXtXEWMiWvcN8ddc93KbJg6ccBoU3/dgILsD0yxMOqjUsLpUxnpaOVEgJCOTpIWCLVEebUlq1xP05ICYGlJegPE3Ml8dgy/JE1+3TMksrqOs+/fhNrTeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758493153; c=relaxed/simple;
	bh=6qGPQVj1x+TxAivO8rmsctxEatL7jxZoOEKgA2zySW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWZ/kYGIFOwzvJH3MyTzueLg3R+nV+ocWOI5wFGwCGXZK0E9d3ULS0N42cV4+KLgvRpZ1SuK3eusk93v1V6wr+BNvRaWWZKSwA3g82kMdkmQF88RGhq+pSXBLrjwQaJrDPDX1D46mNyvOdd2iEHC9H4FIVxVMWgJrT3lTpES1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jas5FmLJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 983FB10C4;
	Mon, 22 Sep 2025 00:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758493067;
	bh=6qGPQVj1x+TxAivO8rmsctxEatL7jxZoOEKgA2zySW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jas5FmLJ811U2Nkd+brDKUy7BmrDI6SYcoz7kCLXyWoUl+LBUq+xAdvDt3vOeUQPc
	 cEdBTwGdzMh8uhhWUYmH2Vn2C2bgxGe051sZFfEDt/T1FsqR8Mt87Iee6IGUkQAsHq
	 2DyNcJHxGpikhAsdtieqRyTzXW5F3wUP/fv0xZF4=
Date: Mon, 22 Sep 2025 01:18:38 +0300
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
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v2 3/5] media: nxp: imx8-isi: Add parallel camera input
 support
Message-ID: <20250921221838.GC10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-3-37db5f768c57@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-3-37db5f768c57@nxp.com>

Hi Guoniu,

Thank you for the patch.

The subject line should mention the i.MX93:

media: nxp: imx8-isi: Add parallel camera input support for i.MX93

On Fri, Sep 05, 2025 at 02:56:00PM +0800, Guoniu Zhou wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> The ISI module on i.MX93 implements one camera input which can be
> connected to either of MIPI CSI-2 or parallel camera. The source
> type can be selected by setting camera mux control register.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index 2f5e7299b537d612fb1fe6688c1b75bfd2d6049b..42b2ed2bbdf7259bc83d0678256343a3b606568a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -61,6 +61,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>  #define DISP_MIX_CAMERA_MUX                     0x30
>  #define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
>  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> +#define DISP_MIX_CAMERA_MUX_GASKET_SRC          BIT(17)

Let's spell this out fully to match the reference manual:

#define DISP_MIX_CAMERA_MUX_GASKET_SOURCE_TYPE  BIT(17)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>  				    const struct v4l2_mbus_frame_desc *fd,
> @@ -71,6 +72,16 @@ static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>  
>  	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
>  	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +
> +	/*
> +	 * CAMERA MUX
> +	 * - [17]:	Selects source input to gasket
> +	 *		0: Data from MIPI CSI
> +	 *		1: Data from parallel camera
> +	 */
> +	if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL)
> +		val |= DISP_MIX_CAMERA_MUX_GASKET_SRC;
> +
>  	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
>  }
>  

-- 
Regards,

Laurent Pinchart

