Return-Path: <linux-media+bounces-34403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B2FAD320F
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FAE3A616B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7D828A708;
	Tue, 10 Jun 2025 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="unCEQU8P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0F1F0984;
	Tue, 10 Jun 2025 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547871; cv=none; b=o2fIx8UDR2KSQB/PcRp0iKKRpDjNTrTDkCn1nb/hp12cv1K5y2P9/N/NmMblivf3MKsM7ecZTpXpgHvHOTto5LXDATxPJawSalImGnsvMYMH7ZlHrPvKVnDszkvwOVibs4osCoTZ4m2DuklpMLUZIc1EqMykDymTmPrU35aLQiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547871; c=relaxed/simple;
	bh=RJnqcxMbNIxlr5WHFTB3DtfDPYl9c+Ani7yndG3QX+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUh/L7KChYIa7QeoGdoet1iBB6csx+HwlcufJkZiqbYj/C+zQiaIlksEEP9q/dshjWGHQCYCdGLSJkpEadd3AZmn+sN1Bi6P+ROHhd9j0iemAt70V6s3ucLijvEIzvkcTw2hG0aMgYq2Fcj0Ev3rXvgedvJAqnjbbzuUPLlvjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=unCEQU8P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D56DD2EC;
	Tue, 10 Jun 2025 11:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749547860;
	bh=RJnqcxMbNIxlr5WHFTB3DtfDPYl9c+Ani7yndG3QX+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unCEQU8PyvSu0fK2raePwS5YJoY3Ob2A/0SliXK2qoRY8mSjX6XNLukOVwdfarZOf
	 IdbuEhFp6bms0SqvLkOxz2cooHIGTC5JGEku5p1hNZw6awHYnDVZwwyDmlH4UDIjbo
	 KAN2uTRLL7tmm+BN0ieAzWovP5Qr6PirfR155trk=
Date: Tue, 10 Jun 2025 12:30:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] media: imx-mipi-csis: Initial support for multiple
 output channels
Message-ID: <20250610093054.GN27510@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-9-laurent.pinchart@ideasonboard.com>
 <2230307.irdbgypaU6@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2230307.irdbgypaU6@steina-w>

On Tue, Jun 10, 2025 at 11:01:20AM +0200, Alexander Stein wrote:
> Am Montag, 9. Juni 2025, 01:58:40 CEST schrieb Laurent Pinchart:
> > Some CSIS instances feature more than one output channel. Parse the
> > number of channels from the device tree, and update register dumps and
> > event counters accordingly. Support for routing virtual channels and
> > data types to output channels through the subdev internal routing API
> > will come later.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 224 ++++++++++++++-------
> >  1 file changed, 146 insertions(+), 78 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 080e40837463..4cc358d93187 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -98,12 +98,12 @@
> >  #define MIPI_CSIS_INT_SRC_ODD_AFTER		BIT(28)
> >  #define MIPI_CSIS_INT_SRC_ODD			(0x3 << 28)
> >  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
> 
> As a side note: I just noticed Bits 28-31 are only defined on i.MX7. They
> are reserved on i.MX8M (Mini, Nano, Plus).

They are many bit marked as reserved that are actually implemented. The
CSIS is a big pain point :-(

> > -#define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
> > -#define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
> > +#define MIPI_CSIS_INT_SRC_FRAME_START(n)	BIT((n) + 24)
> > +#define MIPI_CSIS_INT_SRC_FRAME_END(n)		BIT((n) + 20)
> >  #define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
> > -#define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
> > -#define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
> > -#define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
> > +#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)	BIT((n) + 12)
> > +#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)	BIT((n) + 8)
> > +#define MIPI_CSIS_INT_SRC_ERR_OVER(n)		BIT((n) + 4)
> 
> Similar here. Only i.MX7 has the bits for CH1, CH2 and CH3 defined.
> 
> >  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
> >  #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
> >  #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
> > @@ -205,23 +205,23 @@
> >  /* Debug control register */
> >  #define MIPI_CSIS_DBG_CTRL			0xc0
> >  #define MIPI_CSIS_DBG_INTR_MSK			0xc4
> > -#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT	BIT(25)
> > -#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE	BIT(24)
> > -#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE	BIT(20)
> > -#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME	BIT(16)
> > -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE		BIT(12)
> > -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS		BIT(8)
> > -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL	BIT(4)
> > -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE	BIT(0)
> > +#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT		BIT(25)
> > +#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE		BIT(24)
> > +#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> > +#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME(n)	BIT((n) + 16)
> > +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE(n)		BIT((n) + 12)
> > +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS(n)		BIT((n) + 8)
> > +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> > +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE(n)	BIT((n) + 0)
> >  #define MIPI_CSIS_DBG_INTR_SRC			0xc8
> > -#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT	BIT(25)
> > -#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE	BIT(24)
> > -#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE	BIT(20)
> > -#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME	BIT(16)
> > -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE		BIT(12)
> > -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS		BIT(8)
> > -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
> > -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
> > +#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT		BIT(25)
> > +#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE		BIT(24)
> > +#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> > +#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(n)	BIT((n) + 16)
> > +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(n)		BIT((n) + 12)
> > +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(n)		BIT((n) + 8)
> > +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> > +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(n)	BIT((n) + 0)
> 
> Out of curiosity: Where do these bits come from? I can't find them in RM.

They are documented in the i.MX7D RM, and they appear to be implemented
on the i.MX8MP as the interrupts fire in the expected way.

> > [snip]

-- 
Regards,

Laurent Pinchart

