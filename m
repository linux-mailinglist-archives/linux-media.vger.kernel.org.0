Return-Path: <linux-media+bounces-42857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD2B8E8E9
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 00:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C503B691D
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 22:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474F326E6E2;
	Sun, 21 Sep 2025 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LRxgE/yz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335AC19F464;
	Sun, 21 Sep 2025 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758493879; cv=none; b=Ut1sGr/J34yh1FU5m5zgkj3Re7j0spFT1J5eRRq0pKIedCEER4mHfv/NkAvBoCGMVKd2kGWtjR6h6tKm+nfyt9WN+KC47Q8n0FcPH3bMUi9sSUcn3ILxMjLtETyddSxTTwvxv2yVSQ0GZ/f5l7Q7eHuEKlyxHIqugISyT+wvB9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758493879; c=relaxed/simple;
	bh=Fv4UsA9MkASayxLFf2BzUM2Q41JcLsrAVhGMdS029aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGi9n/5oqMhkhXNmaZA5gIO5YGXQ5bZgvA1q6WE8Iv3rbRBIoe73UekzPuz6+Pyru/VRyN7L5HooVJsDkodimWvxDQrK/nna2zN90jQp28S8agb6V70PGZnNkOWEii5cFauiDcPXrtyfHpN5m1Udx45TsjyU64wkDKU7hpA2Gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LRxgE/yz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2A13F10C4;
	Mon, 22 Sep 2025 00:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758493793;
	bh=Fv4UsA9MkASayxLFf2BzUM2Q41JcLsrAVhGMdS029aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRxgE/yzzKy+tegRTdD1tm0SvZJgiQsG7fnpyEUqkQH8mO+uzHDqhPLl4pWjG5+RW
	 5FSnNJoc+Atqas0jh6T12AEGoiIvvY0fwvtactdch/GLjXbJI3OkI8ffThWHhR+WGa
	 JaputUJRpWEY0wsGKwJa62Q98KqrJqwyoSId8os0=
Date: Mon, 22 Sep 2025 01:30:43 +0300
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
Message-ID: <20250921223043.GF10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>
 <20250921160704.GA29453@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250921160704.GA29453@pendragon.ideasonboard.com>

On Sun, Sep 21, 2025 at 07:07:06PM +0300, Laurent Pinchart wrote:
> On Fri, Sep 19, 2025 at 12:11:38PM -0400, Frank Li wrote:
> > On Fri, Sep 19, 2025 at 02:40:01AM +0000, G.N. Zhou wrote:
> > > Hi,
> > >
> > > Could you help to please review the patches which I have submitted
> > > some time back to linux media community and move forward driver part
> > > if possible.
> > > 
> > > Your feedback will be very appreciated. Thanks.
> > >
> > > Best Regards
> > > G.N Zhou
> > 
> > Laurent Pinchart:
> > 
> > 	Could you please consider pickup these patches? Consider these
> > related simple changes, is my Reviewed-by enough?
> 
> I've completed a set of other reviews and will get to this patch series
> in the upcoming week.

There's just an open question on 2/5. It's about the commit message, so
it shouldn't be a big deal. Once I get a reply to that, I can apply the
series with the small proposed changes, there's no need to submit a v3,
unless you prefer doing so.

> > > >
> > > > Add ISI support for i.MX91 chip.
> > > >
> > > > The bellow patch refine code, no functions changed.
> > > >    media: nxp: imx8-isi: Simplify code by using helper macro
> > > >    media: nxp: imx8-isi: Reorder the platform data
> > > >
> > > > The bindings and driver patch for i.MX91 ISI.
> > > >    media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > > >    media: nxp: imx8-isi: Add ISI support for i.MX91
> > > >
> > > > Add parallel camera input for i.MX93 ISI.
> > > >    media: nxp: imx8-isi: Add parallel camera input support
> > > >
> > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > > ---
> > > > Changes in v2:
> > > > - Update commit log in patch 5 to better describe why introduce it.
> > > > - Include two header files in patch 2 since kernel test robot report build
> > > >   issue when arch is riscv and compiler is clang-22.
> > > >   #include <linux/bitfield.h>
> > > >   #include <linux/bits.h>
> > > > - Link to v1: https://lore.kernel.org/all/20250827-isi_imx93-v1-0-
> > > > 83e6b4b50c4d@nxp.com
> > > >
> > > > ---
> > > > Alice Yuan (2):
> > > >       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > > >       media: nxp: imx8-isi: Add parallel camera input support
> > > >
> > > > Guoniu Zhou (3):
> > > >       media: nxp: imx8-isi: Simplify code by using helper macro
> > > >       media: nxp: imx8-isi: Reorder the platform data
> > > >       media: nxp: imx8-isi: Add ISI support for i.MX91
> > > >
> > > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--------
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18 ++++++--
> > > >  4 files changed, 59 insertions(+), 23 deletions(-)
> > > > ---
> > > > base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
> > > > change-id: 20250826-isi_imx93-4a59288b33e4

-- 
Regards,

Laurent Pinchart

