Return-Path: <linux-media+bounces-29709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59E4A81A84
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 03:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F313BFED2
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 01:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D36C17A2E8;
	Wed,  9 Apr 2025 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wbUxru1E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBAE6BFC0;
	Wed,  9 Apr 2025 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162183; cv=none; b=TmJAdA/9WsNg2/sAQM0d6xNhuvUrC0TZRCGU/vSC/AVsYQwoEKANISy/RxbL9yHvVHDLreyp74FGW2R+mN8lMuqucHnkpcyZL3fh0TGNbcu2ik82CY7hIhtQWY2DfcJlh+7v8ANWsYvII73P7XqcNKME2ObHfNbIso1yl2QDVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162183; c=relaxed/simple;
	bh=jqXJkpKflOLHdYCCkc79nFsoqa/SSDo+aaoBYTvRk5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM68ePbwV+V26LQqSNmvSgoJ/U79y3CLUOhlG0PnLClW8ujG3mQK5aLGgp8u2LkHRKUSl4h1/vJvl59s7jrPHdkzGOIcSKswVpHm/5wa3r85D1VeTdYBkFc2hOVlGExL6wWwXAz0AegfqgTRB/Vwm/X8r+qzWjnkyvb9Ls28+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wbUxru1E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC66C82E;
	Wed,  9 Apr 2025 03:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744162062;
	bh=jqXJkpKflOLHdYCCkc79nFsoqa/SSDo+aaoBYTvRk5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wbUxru1EE88T40IODiloHKP2PaubUSiAkNqWJhKJnCCQbociv+8fDM2gL/XEvA/zw
	 J4JWjChCJ38Gh/i0dcszgMIJWmir2KdlmejeOoI4oCncYPRKOX3Yd/k78sZqZcFhEg
	 /7KDZMSsVHwHgOLM0qlrbZNRXyitzKmqGToMfGb4=
Date: Wed, 9 Apr 2025 04:29:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <20250409012914.GD31475@pendragon.ideasonboard.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
 <20250402092618.GH4845@pendragon.ideasonboard.com>
 <TY3PR01MB11346DF814762C667FF97074286AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsCEhmhNSbMMiuN6b2rJCoSekf+-e6EHr5wE5C000ZxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tsCEhmhNSbMMiuN6b2rJCoSekf+-e6EHr5wE5C000ZxQ@mail.gmail.com>

On Mon, Apr 07, 2025 at 04:55:33PM +0000, Lad, Prabhakar wrote:
> On Wed, Apr 2, 2025 at 10:39 AM Biju Das wrote:
> > On 02 April 2025 10:26, Laurent Pinchart wrote:
> > > On Wed, Apr 02, 2025 at 08:25:06AM +0000, Lad, Prabhakar wrote:
> > > > On Wed, Apr 2, 2025 at 9:20 AM Biju Das wrote:
> > > > > On 02 April 2025 08:35, Lad, Prabhakar wrote:
> > > > > > On Wed, Apr 2, 2025 at 7:31 AM Biju Das wrote:
> > > > > > > > On 28 March 2025 17:30, Tommaso Merciai wrote:
> > > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > >
> > > > > > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which
> > > > > > > > have a CRU-IP that is mostly identical to RZ/G2L but with
> > > > > > > > different register offsets and additional registers. Introduce
> > > > > > > > a flexible register mapping mechanism to handle these
> > > > > > > > variations.
> > > > > > > >
> > > > > > > > Define the `rzg2l_cru_info` structure to store register
> > > > > > > > mappings and pass it as part of the OF match data. Update the
> > > > > > > > read/write functions to check out-of-bound accesses and use
> > > > > > > > indexed register offsets from `rzg2l_cru_info`, ensuring
> > > > > > > > compatibility across different SoC variants.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > > > > ---
> > > > > > > > Changes since v2:
> > > > > > > >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
> > > > > > > >    accesses as suggested by LPinchart.
> > > > > > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> > > > > > > >  - Update commit body
> > > > > > > >
> > > > > > > > Changes since v4:
> > > > > > > >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> > > > > > > >    as __always_inline
> > > > > > > >
> > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> > > > > > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
> > > > > > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > index eed9d2bd08414..abc2a979833aa 100644
> > > > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > @@ -22,6 +22,7 @@
> > > > > > > >  #include <media/v4l2-mc.h>
> > > > > > > >
> > > > > > > >  #include "rzg2l-cru.h"
> > > > > > > > +#include "rzg2l-cru-regs.h"
> > > > > > > >
> > > > > > > >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct
> > > > > > > > v4l2_async_notifier *n)  { @@ -269,6 +270,9 @@ static int
> > > > > > > > rzg2l_cru_probe(struct platform_device *pdev)
> > > > > > > >
> > > > > > > >       cru->dev = dev;
> > > > > > > >       cru->info = of_device_get_match_data(dev);
> > > > > > > > +     if (!cru->info)
> > > > > > > > +             return dev_err_probe(dev, -EINVAL,
> > > > > > > > +                                  "Failed to get OF match data\n");
> > > > > > > >
> > > > > > > >       irq = platform_get_irq(pdev, 0);
> > > > > > > >       if (irq < 0)
> > > > > > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > > > > > >       rzg2l_cru_dma_unregister(cru);  }
> > > > > > > >
> > > > > > > > +static const u16 rzg2l_cru_regs[] = {
> > > > > > > > +     [CRUnCTRL] = 0x0,
> > > > > > > > +     [CRUnIE] = 0x4,
> > > > > > > > +     [CRUnINTS] = 0x8,
> > > > > > > > +     [CRUnRST] = 0xc,
> > > > > > > > +     [AMnMB1ADDRL] = 0x100,
> > > > > > > > +     [AMnMB1ADDRH] = 0x104,
> > > > > > > > +     [AMnMB2ADDRL] = 0x108,
> > > > > > > > +     [AMnMB2ADDRH] = 0x10c,
> > > > > > > > +     [AMnMB3ADDRL] = 0x110,
> > > > > > > > +     [AMnMB3ADDRH] = 0x114,
> > > > > > > > +     [AMnMB4ADDRL] = 0x118,
> > > > > > > > +     [AMnMB4ADDRH] = 0x11c,
> > > > > > > > +     [AMnMB5ADDRL] = 0x120,
> > > > > > > > +     [AMnMB5ADDRH] = 0x124,
> > > > > > > > +     [AMnMB6ADDRL] = 0x128,
> > > > > > > > +     [AMnMB6ADDRH] = 0x12c,
> > > > > > > > +     [AMnMB7ADDRL] = 0x130,
> > > > > > > > +     [AMnMB7ADDRH] = 0x134,
> > > > > > > > +     [AMnMB8ADDRL] = 0x138,
> > > > > > > > +     [AMnMB8ADDRH] = 0x13c,
> > > > > > > > +     [AMnMBVALID] = 0x148,
> > > > > > > > +     [AMnMBS] = 0x14c,
> > > > > > > > +     [AMnAXIATTR] = 0x158,
> > > > > > > > +     [AMnFIFOPNTR] = 0x168,
> > > > > > > > +     [AMnAXISTP] = 0x174,
> > > > > > > > +     [AMnAXISTPACK] = 0x178,
> > > > > > > > +     [ICnEN] = 0x200,
> > > > > > > > +     [ICnMC] = 0x208,
> > > > > > > > +     [ICnMS] = 0x254,
> > > > > > > > +     [ICnDMR] = 0x26c,
> > > > > > > > +};
> > > > > > >
> > > > > > > Do we need enum, can't we use struct instead with all these entries instead?
> > > > > > >
> > > > > > What benefit do you foresee when using struct? With the current
> > > > > > approach being used a minimal diff is generated when
> > > > > > switched to struct there will be lots of changes.
> > > > >
> > > > > The mapping is convinient when you want to iterate throught it.
> > > > > Here, if you just want to access the offset value from its name, a
> > > > > structure looks more appropriate.
> > > >
> > > > Thanks, as this patch has been reviewed by Laurent a couple of times
> > > > we will change this to struct If he insists.
> > >
> > > How would a struct look like ? I'm not sure what is being proposed.
> >
> > It will be
> >
> > struct rzg2l_cru_regs {
> >         u16 cru_n_ctrl;
> >         u16 cru_n_ie;
> >         u16 cru_n_ints;
> >         u16 cru_n_rst;
> > };
> >
> > static const struct rzg2l_cru_regs rzg2l_cru_regs = {
> >         .cru_n_ctrl = 0x0,
> >         .cru_n_ie = 0x4,
> >         .cru_n_ints = 0x8,
> >         .cru_n_rst = 0xc,
> > };
> >
> > You can access it using info->regs->cru_n_ctrl instead of info->regs[CRUnCTRL]
> > This is proposal.
>
> Are you OK with the above proposal?

I may be missing something, but I don't see why this would be a
significantly better option. It seems it would make the callers more
complex, and decrease readability.

-- 
Regards,

Laurent Pinchart

