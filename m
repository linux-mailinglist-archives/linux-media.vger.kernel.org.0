Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A5D495BEB
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 09:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349730AbiAUI2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 03:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349535AbiAUI2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 03:28:46 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D05EC061574
        for <linux-media@vger.kernel.org>; Fri, 21 Jan 2022 00:28:46 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 35F4C240002;
        Fri, 21 Jan 2022 08:28:42 +0000 (UTC)
Date:   Fri, 21 Jan 2022 09:29:46 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: media: imx7-mipi-csis: Two small fixes
Message-ID: <20220121082946.iucsh2czf6ltmg75@uno.localdomain>
References: <20220119112024.11339-1-jacopo@jmondi.org>
 <CH9SE3SLDYEU.2M560Q0RQ0L3C@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH9SE3SLDYEU.2M560Q0RQ0L3C@arch-thunder>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui

On Wed, Jan 19, 2022 at 04:21:15PM +0000, Rui Miguel Silva wrote:
> Hey Jacopo,
> both patches LGTM.
>
> I only have one nit with them...
>
> On Wed Jan 19, 2022 at 11:20 AM WET, Jacopo Mondi wrote:
>
> > Two small fixes for the imx7-mipi-csis driver.
> >
> > The second patch is required to correctly capture in packed YUV422 formats
> >
> > Thanks
> >    j
> >
> > Jacopo Mondi (2):
> >   staging: media: imx: imx7-mipi-csic: Resume on debug
> >   staging: media: imx: imx7-mipi-csic: Set PIXEL_MODE for YUV422
>                                       ^
>                    here should be s (imx7-mipi-csis) on both patches

Oh ups, I honestly thought at the time the IP core was called csic...

>
> Maybe Laurent could fix the typo on the pull, other than that:

I owe an update to add an error check to 1/2 once Laurent (or someone
with an i.MX8MM) tests 2/2, so I can fix the subject in v2.

>
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Thanks
   j

>
> Cheers,
>    Rui
>
> >
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > --
> > 2.34.1
>
>
>
