Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C648381B43
	for <lists+linux-media@lfdr.de>; Sat, 15 May 2021 23:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbhEOVz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 17:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235126AbhEOVz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 17:55:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6CEC061573
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 14:54:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4193B436;
        Sat, 15 May 2021 23:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621115678;
        bh=d+BGRv79F14Q+a/4IAGzJUEzoMAIUZll0N/DOhLbfk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U92+gvgAAkQ1YfbUvn2IwrQ6qMof5+rhI1WsKZzcMq2L6+OY6z9zjiLTI+vAVjJz0
         nUTnpwwxnpQ0UYi7MUAYwsiA6rJ0WzL1IkKYPHKyHJhWthEMdrz+WOreg/+bk5QR8o
         ZBMcdVRZAvqziFhJb69R/A2tagQbIuwuL3y3V4Dc=
Date:   Sun, 16 May 2021 00:54:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-imx@nxp.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 01/23] media: imx: imx7_mipi_csis: Fix logging of only
 error event counters
Message-ID: <YKBDFFsVtinvLdq+@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-2-laurent.pinchart@ideasonboard.com>
 <3b17ae30-b275-781a-1991-0412cc42b769@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b17ae30-b275-781a-1991-0412cc42b769@kontron.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Mon, Apr 26, 2021 at 01:01:50PM +0200, Frieder Schrempf wrote:
> On 13.04.21 04:29, Laurent Pinchart wrote:
> > The mipi_csis_events array ends with 6 non-error events, not 4. Update
> > mipi_csis_log_counters() accordingly. While at it, log event counters in
> > forward order, as there's no reason to log them backward.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> As there is currently no user of mipi_csis_log_counters() with 
> non_errors set to false, maybe we should just remove this path?
> 
> If you think we should keep it, I'm fine with that, too:

I'd rather keep it, and add a patch that logs non-error counters only
when debugging is enabled. It can get too verbose otherwise.

> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> > ---
> >   drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> > index 025fdc488bd6..25d0f89b2e53 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -666,13 +666,15 @@ static void mipi_csis_clear_counters(struct csi_state *state)
> >   
> >   static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
> >   {
> > -	int i = non_errors ? MIPI_CSIS_NUM_EVENTS : MIPI_CSIS_NUM_EVENTS - 4;
> > +	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> > +				: MIPI_CSIS_NUM_EVENTS - 6;
> >   	struct device *dev = &state->pdev->dev;
> >   	unsigned long flags;
> > +	unsigned int i;
> >   
> >   	spin_lock_irqsave(&state->slock, flags);
> >   
> > -	for (i--; i >= 0; i--) {
> > +	for (i = 0; i < num_events; ++i) {
> >   		if (state->events[i].counter > 0 || state->debug)
> >   			dev_info(dev, "%s events: %d\n", state->events[i].name,
> >   				 state->events[i].counter);
> > 

-- 
Regards,

Laurent Pinchart
