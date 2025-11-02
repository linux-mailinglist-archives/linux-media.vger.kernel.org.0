Return-Path: <linux-media+bounces-46169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C455C299CA
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE8993AD330
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 23:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6787C2472BD;
	Sun,  2 Nov 2025 23:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="POvKaHNI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A69148850;
	Sun,  2 Nov 2025 23:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762125298; cv=none; b=JNdf0xlo/dwBqLRIFALIjIKb854YZjEzLuKPkG0a2FcSv0i4GHO0gOcstctJXJjRrqeeRwT6bLs0GHfnjwnWSBnmjhUigiZsBW9Nn7LNm118f9GOCIOMJHcB7/1KvEHe7dkhmDoom/Js3erF/xRTYqsFiOtXz1w7oZGjdYT3qek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762125298; c=relaxed/simple;
	bh=kUr0faM6nmdPvF981v46JyOf4dm270I/HG8+3rNC3ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/xh9MYSfL30FerEzFlaITG9xcHBUY7z1jtZ66GyTyXmBGPH18ZrB9mpHP7LGZurdyvsLfIxsyL95s3JdmO+XhIKvbJIHwxMjltlBrQWNM0ic8CE421xaIDqvcgkiJrYdQSfiHR3LMMjIT+yd8HxMJQZbPT3YMAuKQ39EX8j+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=POvKaHNI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 326738BE;
	Mon,  3 Nov 2025 00:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762125182;
	bh=kUr0faM6nmdPvF981v46JyOf4dm270I/HG8+3rNC3ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POvKaHNIoRGL2MDfaf4h+sVBVTp/25n5QTk44MkrPN+bHGnQkSvs9/xku5f1aIP93
	 1bW22IONVmWJ4i0tgiSOBzj3GRepC2d7vjbbzqNvK3XBDWyIacsrdCmzImFAxuArkE
	 7KtorvEnqRRHFJPWiREarPEv37ZxQLecceM0y5rY=
Date: Mon, 3 Nov 2025 01:14:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by
 using helper macro
Message-ID: <20251102231440.GA1933@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
 <20250921221325.GB10540@pendragon.ideasonboard.com>
 <AS8PR04MB9080158655C3EA188BE7FE7AFA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080158655C3EA188BE7FE7AFA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>

On Mon, Sep 22, 2025 at 02:03:44AM +0000, G.N. Zhou wrote:
> On Monday, September 22, 2025 6:13 AM, Laurent Pinchart wrote:
> > On Fri, Sep 05, 2025 at 02:55:59PM +0800, Guoniu Zhou wrote:
> > > Simplify code by using helper macro FIELD_PREP() and GENMASK().
> > 
> > I'm not necessarily against this change, but how does it "simplify code"
> > ? There's no change in the code beside the macros, and they don't look
> > particularly simpler.
> 
> How about the message body change to " Make code more readable and easier to maintain by
> using the FIELD_PREP and GENMASK(). macro" and title change to "Refine code by using helper macro"?
> If you agree, I could apply it in next version.

No need to send a new version, I'll update the commit message myself.

> > > No functions changed.
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > index
> > >
> > f69c3b5d478209c083738477edf380e3f280c471..2f5e7299b537d612fb1fe668
> > 8c1b
> > > 75bfd2d6049b 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright 2019-2023 NXP
> > >   */
> > >
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bits.h>
> > >  #include <linux/regmap.h>
> > >
> > >  #include <media/mipi-csi2.h>
> > > @@ -16,8 +18,7 @@
> > >  #define GASKET_BASE(n)                               (0x0060 + (n) * 0x30)
> > >
> > >  #define GASKET_CTRL                          0x0000
> > > -#define GASKET_CTRL_DATA_TYPE(dt)            ((dt) << 8)
> > > -#define GASKET_CTRL_DATA_TYPE_MASK           (0x3f << 8)
> > > +#define GASKET_CTRL_DATA_TYPE(dt)            FIELD_PREP(GENMASK(13, 8),
> > (dt))
> > 
> > I think you can omit the parentheses around dt here, and around x below.
> 
> Ok, will apply in next version.
> 
> > 
> > >  #define GASKET_CTRL_DUAL_COMP_ENABLE         BIT(1)
> > >  #define GASKET_CTRL_ENABLE                   BIT(0)
> > >
> > > @@ -58,7 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
> > >   */
> > >
> > >  #define DISP_MIX_CAMERA_MUX                     0x30
> > > -#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> > > +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)
> > FIELD_PREP(GENMASK(8, 3), (x))
> > >  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> > >
> > >  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,

-- 
Regards,

Laurent Pinchart

