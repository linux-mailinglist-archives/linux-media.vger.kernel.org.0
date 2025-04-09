Return-Path: <linux-media+bounces-29733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD0CA82320
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 13:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 546FE444E1C
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 11:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB652505A7;
	Wed,  9 Apr 2025 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pbCEdVHW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A095813C9A3;
	Wed,  9 Apr 2025 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196954; cv=none; b=txvPpdIZ50mX/RrLyg9xwGnzN8BTLrE6ZV0pBhWDxri5SWQtk4qNuFe6MYh9IZkATs2FTndoiBNB4to8zBp4L1xv66775DxpCeKIVxWgnXhyu8GyUWOR0Cu8gDfwyKXgKGbF2IrroL+WceGOpUsOvDJsYu7h5Beyp2GSbapNVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196954; c=relaxed/simple;
	bh=7wbQ3lchSkZZ5tdZaoI/xJxofwaC7PcGBCfb35Zk+lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFasJy3WEs4aZjuXv5IP3Uryf2XkwhwbFit2IzfEN6+60OusStEZtit5PgkftUYYTzCIplAcz1nRfMK6whidfR2OzYIYCxJcY6JMY22N3vK7xtOsnJkZt/LJ6eGoM7jyhAW9/HZ8bcS0loFOqCVzDC3DWIR3NFJAe5gfLxQf9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pbCEdVHW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24F6182E;
	Wed,  9 Apr 2025 13:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744196827;
	bh=7wbQ3lchSkZZ5tdZaoI/xJxofwaC7PcGBCfb35Zk+lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbCEdVHW6aisqhSEnhUiViEGdyriqLYMvO7kiGWa/b3L7Yo5PltG4ukIQABSOsNxU
	 a2RLxOhefl+JFnfCKCBU+yOHY39W60dnKWA7COKjMO4PhKBpoPkz5pniZvRSexppS2
	 iTLjYtpnki94c8yGo2RK5omsakrSzPy/FhSG7B80=
Date: Wed, 9 Apr 2025 14:08:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
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
Message-ID: <20250409110840.GG31475@pendragon.ideasonboard.com>
References: <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
 <20250402092618.GH4845@pendragon.ideasonboard.com>
 <TY3PR01MB11346DF814762C667FF97074286AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsCEhmhNSbMMiuN6b2rJCoSekf+-e6EHr5wE5C000ZxQ@mail.gmail.com>
 <20250409012914.GD31475@pendragon.ideasonboard.com>
 <TY3PR01MB11346A5CBFD05A51E351DCE6586B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB11346A5CBFD05A51E351DCE6586B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hi Biju,

On Wed, Apr 09, 2025 at 07:25:43AM +0000, Biju Das wrote:
> On 09 April 2025 02:29, Laurent Pinchart wrote:
> > On Mon, Apr 07, 2025 at 04:55:33PM +0000, Lad, Prabhakar wrote:
> > > On Wed, Apr 2, 2025 at 10:39 AM Biju Das wrote:
> > > > On 02 April 2025 10:26, Laurent Pinchart wrote:
> > > > > On Wed, Apr 02, 2025 at 08:25:06AM +0000, Lad, Prabhakar wrote:
> > > > > > On Wed, Apr 2, 2025 at 9:20 AM Biju Das wrote:
> > > > > > > On 02 April 2025 08:35, Lad, Prabhakar wrote:
> > > > > > > > On Wed, Apr 2, 2025 at 7:31 AM Biju Das wrote:
> > > > > > > > > > On 28 March 2025 17:30, Tommaso Merciai wrote:
> > > > > > > > > > From: Lad Prabhakar
> > > > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > >
> > > > > > > > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs,
> > > > > > > > > > which have a CRU-IP that is mostly identical to RZ/G2L
> > > > > > > > > > but with different register offsets and additional
> > > > > > > > > > registers. Introduce a flexible register mapping
> > > > > > > > > > mechanism to handle these variations.
> > > > > > > > > >
> > > > > > > > > > Define the `rzg2l_cru_info` structure to store register
> > > > > > > > > > mappings and pass it as part of the OF match data.
> > > > > > > > > > Update the read/write functions to check out-of-bound
> > > > > > > > > > accesses and use indexed register offsets from
> > > > > > > > > > `rzg2l_cru_info`, ensuring compatibility across different SoC variants.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Lad Prabhakar
> > > > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > > Signed-off-by: Tommaso Merciai
> > > > > > > > > > <tommaso.merciai.xr@bp.renesas.com>
> > > > > > > > > > ---
> > > > > > > > > > Changes since v2:
> > > > > > > > > >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
> > > > > > > > > >    accesses as suggested by LPinchart.
> > > > > > > > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> > > > > > > > > >  - Update commit body
> > > > > > > > > >
> > > > > > > > > > Changes since v4:
> > > > > > > > > >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> > > > > > > > > >    as __always_inline
> > > > > > > > > >
> > > > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> > > > > > > > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> > > > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58
> > > > > > > > > > ++++++++++++++--
> > > > > > > > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git
> > > > > > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > > > index eed9d2bd08414..abc2a979833aa 100644
> > > > > > > > > > ---
> > > > > > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cor
> > > > > > > > > > +++ e.c
> > > > > > > > > > @@ -22,6 +22,7 @@
> > > > > > > > > >  #include <media/v4l2-mc.h>
> > > > > > > > > >
> > > > > > > > > >  #include "rzg2l-cru.h"
> > > > > > > > > > +#include "rzg2l-cru-regs.h"
> > > > > > > > > >
> > > > > > > > > >  static inline struct rzg2l_cru_dev
> > > > > > > > > > *notifier_to_cru(struct v4l2_async_notifier *n)  { @@
> > > > > > > > > > -269,6 +270,9 @@ static int rzg2l_cru_probe(struct
> > > > > > > > > > platform_device *pdev)
> > > > > > > > > >
> > > > > > > > > >       cru->dev = dev;
> > > > > > > > > >       cru->info = of_device_get_match_data(dev);
> > > > > > > > > > +     if (!cru->info)
> > > > > > > > > > +             return dev_err_probe(dev, -EINVAL,
> > > > > > > > > > +                                  "Failed to get OF
> > > > > > > > > > + match data\n");
> > > > > > > > > >
> > > > > > > > > >       irq = platform_get_irq(pdev, 0);
> > > > > > > > > >       if (irq < 0)
> > > > > > > > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > > > > > > > >       rzg2l_cru_dma_unregister(cru);  }
> > > > > > > > > >
> > > > > > > > > > +static const u16 rzg2l_cru_regs[] = {
> > > > > > > > > > +     [CRUnCTRL] = 0x0,
> > > > > > > > > > +     [CRUnIE] = 0x4,
> > > > > > > > > > +     [CRUnINTS] = 0x8,
> > > > > > > > > > +     [CRUnRST] = 0xc,
> > > > > > > > > > +     [AMnMB1ADDRL] = 0x100,
> > > > > > > > > > +     [AMnMB1ADDRH] = 0x104,
> > > > > > > > > > +     [AMnMB2ADDRL] = 0x108,
> > > > > > > > > > +     [AMnMB2ADDRH] = 0x10c,
> > > > > > > > > > +     [AMnMB3ADDRL] = 0x110,
> > > > > > > > > > +     [AMnMB3ADDRH] = 0x114,
> > > > > > > > > > +     [AMnMB4ADDRL] = 0x118,
> > > > > > > > > > +     [AMnMB4ADDRH] = 0x11c,
> > > > > > > > > > +     [AMnMB5ADDRL] = 0x120,
> > > > > > > > > > +     [AMnMB5ADDRH] = 0x124,
> > > > > > > > > > +     [AMnMB6ADDRL] = 0x128,
> > > > > > > > > > +     [AMnMB6ADDRH] = 0x12c,
> > > > > > > > > > +     [AMnMB7ADDRL] = 0x130,
> > > > > > > > > > +     [AMnMB7ADDRH] = 0x134,
> > > > > > > > > > +     [AMnMB8ADDRL] = 0x138,
> > > > > > > > > > +     [AMnMB8ADDRH] = 0x13c,
> > > > > > > > > > +     [AMnMBVALID] = 0x148,
> > > > > > > > > > +     [AMnMBS] = 0x14c,
> > > > > > > > > > +     [AMnAXIATTR] = 0x158,
> > > > > > > > > > +     [AMnFIFOPNTR] = 0x168,
> > > > > > > > > > +     [AMnAXISTP] = 0x174,
> > > > > > > > > > +     [AMnAXISTPACK] = 0x178,
> > > > > > > > > > +     [ICnEN] = 0x200,
> > > > > > > > > > +     [ICnMC] = 0x208,
> > > > > > > > > > +     [ICnMS] = 0x254,
> > > > > > > > > > +     [ICnDMR] = 0x26c,
> > > > > > > > > > +};
> > > > > > > > >
> > > > > > > > > Do we need enum, can't we use struct instead with all these entries instead?
> > > > > > > > >
> > > > > > > > What benefit do you foresee when using struct? With the
> > > > > > > > current approach being used a minimal diff is generated when
> > > > > > > > switched to struct there will be lots of changes.
> > > > > > >
> > > > > > > The mapping is convinient when you want to iterate throught it.
> > > > > > > Here, if you just want to access the offset value from its
> > > > > > > name, a structure looks more appropriate.
> > > > > >
> > > > > > Thanks, as this patch has been reviewed by Laurent a couple of
> > > > > > times we will change this to struct If he insists.
> > > > >
> > > > > How would a struct look like ? I'm not sure what is being proposed.
> > > >
> > > > It will be
> > > >
> > > > struct rzg2l_cru_regs {
> > > >         u16 cru_n_ctrl;
> > > >         u16 cru_n_ie;
> > > >         u16 cru_n_ints;
> > > >         u16 cru_n_rst;
> > > > };
> > > >
> > > > static const struct rzg2l_cru_regs rzg2l_cru_regs = {
> > > >         .cru_n_ctrl = 0x0,
> > > >         .cru_n_ie = 0x4,
> > > >         .cru_n_ints = 0x8,
> > > >         .cru_n_rst = 0xc,
> > > > };
> > > >
> > > > You can access it using info->regs->cru_n_ctrl instead of
> > > > info->regs[CRUnCTRL] This is proposal.
> > >
> > > Are you OK with the above proposal?
> > 
> > I may be missing something, but I don't see why this would be a significantly better option. It seems
> > it would make the callers more complex, and decrease readability.
> 
> Basically,
> I guess sruct  will allow us to avoid (WARN_ON(offset >= RZG2L_CRU_MAX_REG) and
>    BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG); checks as there is no array, so there is no
>    buffer overrun condition and also we can drop enum aswell.

That's right fpr the BUILD_BUG_ON(), but I don't think that would be an
improvement. The BUILD_BUG_ON() catches at compile time the issues that
are comparable to mistyping a struct field name, so incorrect code
patterns will result in compile-time errors in both cases. The WARN_ON()
is there for cases where the offset needs to be dynamically computed,
and if we wanted to have similar safeguards with a struct, we would also
need a runtime check.

Using a struct would also prevent (I think) implementing additional
safeguards. Not registers exist on all platforms (hence the need for
this mapping mechanism), and it would be nice to catch attempts to
access a register that does not exist. With the existing series, we
could quite easily add a check in the read and write functions to ensure
the regs array entry is not zero (except when the register is CRUnCTRL).
With a struct-based approach, the read/write functions would get the
offset but wouldn't know which register is being accessed, so the same
logic can't be implemented.

Last but not least, I think the current approach is more readable in the
callers: lines are shorter, and register names match the documentation,
including being uppercase.

> So, if using struct decreases readability and makes the code complex,
> then current patch is fine.

-- 
Regards,

Laurent Pinchart

