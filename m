Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB2949B19C
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 11:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350869AbiAYKYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 05:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347030AbiAYKWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 05:22:02 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E5AC06177C
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 02:21:55 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6343CFF807;
        Tue, 25 Jan 2022 10:21:53 +0000 (UTC)
Date:   Tue, 25 Jan 2022 11:22:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: imx: imx7-mipi-csic: Resume on debug
Message-ID: <20220125102257.7kziixej2c5k7fss@uno.localdomain>
References: <20220119112024.11339-1-jacopo@jmondi.org>
 <20220119112024.11339-2-jacopo@jmondi.org>
 <YegfMf2UNxU8IjwZ@pendragon.ideasonboard.com>
 <Ye9sAv5lAMUydPbK@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ye9sAv5lAMUydPbK@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Jan 25, 2022 at 05:18:26AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Wed, Jan 19, 2022 at 04:24:51PM +0200, Laurent Pinchart wrote:
> > On Wed, Jan 19, 2022 at 12:20:23PM +0100, Jacopo Mondi wrote:
> > > The mipi_csis_dump_regs() function reads and printout the interface
> > > registers for debugging purposes.
> > >
> > > Trying to access the registers without proper powering up the interface
> > > causes the chip to hang.
> > >
> > > Fix that by increasing the pm runtime usage count which, if necessary,
> > > resumes the interface.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> > > index 2b73fa55c938..cb54bb7491d9 100644
> > > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > > @@ -780,11 +780,15 @@ static int mipi_csis_dump_regs(struct csi_state *state)
> > >
> > >  	dev_info(state->dev, "--- REGISTERS ---\n");
> > >
> > > +	pm_runtime_resume_and_get(state->dev);
> >
> > Should this have an error check ? With that,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I just noticed that the call to mipi_csis_dump_regs() in
> mipi_csis_log_status() is conditioned by state->state & ST_POWERED. An
> alternative would thus be to add the same condition to
> mipi_csis_dump_regs_show() (or to move it to mipi_csis_dump_regs()), as
> dumping the register when then hardware is turned off is quite
> pointeless. Up to you.
>

Tbh, I would drop this custom sysfs attribute completely.
It should serve the purpose to easily dump the reg value, but it is
either accessed at the right time (ie during the streaming session)
otherwise all you get is POR default values (or a hang, without this
patch)

> > > +
> > >  	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> > >  		cfg = mipi_csis_read(state, registers[i].offset);
> > >  		dev_info(state->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
> > >  	}
> > >
> > > +	pm_runtime_put(state->dev);
> > > +
> > >  	return 0;
> > >  }
> > >
>
> --
> Regards,
>
> Laurent Pinchart
