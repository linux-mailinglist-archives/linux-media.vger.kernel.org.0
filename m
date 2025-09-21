Return-Path: <linux-media+bounces-42841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E393B8DEA7
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 18:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FF17189C75A
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 16:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594C925A2C3;
	Sun, 21 Sep 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="guX3vtQ1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89936254AF5;
	Sun, 21 Sep 2025 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758470866; cv=none; b=t3oOxysxIcit3Sixed4eNag6ZYoMEwPPHjEgTze4jNQ8a1C0x0yPH0jvrEWucLD3BANjr2iOfsSXQXiC5mcaxJfwLfWGMwGJKNA7PYwdIVqxEZImZz4t31ckC1jhrknXqeYcNYAZCLdPLi1OyQDKNKf0AkE8Ex+Ayau6zRMUyGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758470866; c=relaxed/simple;
	bh=SOxfcuAg/wHY4zUhpi4EhLnADzgpkX8Jpg/fLpNoMp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDkl18GisnUZDoZbJJICAES8hqg7vHVWmgFhG5ve9Sn5tFBbeuQK2XaYkibORH2QqgIgvzTn+q9N0HidPeub9g029DpvgaFwdAyX+YDYwe6HyI54hM3B+SzLTyDBP3qyeGOELvY5KIRHUzrdhlC2NNxgtTY7Rh8NCeHuKUT5xUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=guX3vtQ1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0D213169;
	Sun, 21 Sep 2025 18:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758470773;
	bh=SOxfcuAg/wHY4zUhpi4EhLnADzgpkX8Jpg/fLpNoMp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guX3vtQ1J6g5ihr5dodogs1eocaF6XVcFMrHKbETIm77ZVJ4vxZmz0NpdkPI5dPm0
	 cUxdWnS6ZUV3qibeB2k+tpUYHZeUi5ofnrlM/fyCEwrkR0POjH2DiqY2RGv9ifDbbr
	 +u0TxG79fuLkHvu2k3X3vcw0vCj8/3tackr5WAmg=
Date: Sun, 21 Sep 2025 19:07:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: "G.N. Zhou" <guoniu.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/5] media: imx91: Add ISI support
Message-ID: <20250921160704.GA29453@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Sep 19, 2025 at 12:11:38PM -0400, Frank Li wrote:
> On Fri, Sep 19, 2025 at 02:40:01AM +0000, G.N. Zhou wrote:
> > Hi,
> >
> > Could you help to please review the patches which I have submitted
> > some time back to linux media community and move forward driver part
> > if possible.
> > 
> > Your feedback will be very appreciated. Thanks.
> >
> > Best Regards
> > G.N Zhou
> >
> 
> Laurent Pinchart:
> 
> 	Could you please consider pickup these patches? Consider these
> related simple changes, is my Reviewed-by enough?

I've completed a set of other reviews and will get to this patch series
in the upcoming week.

> > >
> > > Add ISI support for i.MX91 chip.
> > >
> > > The bellow patch refine code, no functions changed.
> > >    media: nxp: imx8-isi: Simplify code by using helper macro
> > >    media: nxp: imx8-isi: Reorder the platform data
> > >
> > > The bindings and driver patch for i.MX91 ISI.
> > >    media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > >    media: nxp: imx8-isi: Add ISI support for i.MX91
> > >
> > > Add parallel camera input for i.MX93 ISI.
> > >    media: nxp: imx8-isi: Add parallel camera input support
> > >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Update commit log in patch 5 to better describe why introduce it.
> > > - Include two header files in patch 2 since kernel test robot report build
> > >   issue when arch is riscv and compiler is clang-22.
> > >   #include <linux/bitfield.h>
> > >   #include <linux/bits.h>
> > > - Link to v1: https://lore.kernel.org/all/20250827-isi_imx93-v1-0-
> > > 83e6b4b50c4d@nxp.com
> > >
> > > ---
> > > Alice Yuan (2):
> > >       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > >       media: nxp: imx8-isi: Add parallel camera input support
> > >
> > > Guoniu Zhou (3):
> > >       media: nxp: imx8-isi: Simplify code by using helper macro
> > >       media: nxp: imx8-isi: Reorder the platform data
> > >       media: nxp: imx8-isi: Add ISI support for i.MX91
> > >
> > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--------
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18 ++++++--
> > >  4 files changed, 59 insertions(+), 23 deletions(-)
> > > ---
> > > base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
> > > change-id: 20250826-isi_imx93-4a59288b33e4

-- 
Regards,

Laurent Pinchart

