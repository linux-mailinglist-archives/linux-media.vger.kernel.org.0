Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B06A251C25
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 17:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgHYPU2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 25 Aug 2020 11:20:28 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:33193 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgHYPU1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 11:20:27 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360 (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3691A240004;
        Tue, 25 Aug 2020 15:20:23 +0000 (UTC)
Date:   Tue, 25 Aug 2020 17:20:22 +0200
From:   =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 0/7] Support of MIPI CSI-2 for A83T and OV8865 camera
Message-ID: <20200825172022.3c951ab2@lhopital-XPS-13-9360>
In-Reply-To: <20200824165244.x5rnon47kmtxojg2@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
        <20200824165244.x5rnon47kmtxojg2@gilmour.lan>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Mon, 24 Aug 2020 18:52:44 +0200,
Maxime Ripard <maxime@cerno.tech> a écrit :

> Hi,
> 
> On Fri, Aug 21, 2020 at 04:59:28PM +0200, Kévin L'hôpital wrote:
> > 
> > Kévin L'hôpital (7):
> >   media: sun6i-csi: Fix the bpp for 10-bit bayer formats
> >   dt-bindings: media: i2c: Add documentation for ov8865
> >   media: i2c: Add support for the OV8865 image sensor
> >   media: sunxi: sun6i-csi: Move the sun6i_csi_dev structure to the
> >     common header
> >   media: sunxi: sun6i-csi: Add support of MIPI CSI-2 for A83T
> >   ARM: dts: sun8i: a83t: Add support for the MIPI CSI-2 in CSI node
> >   [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3: Enable OV8865
> >     camera  
> 
> You should have a cover letter here to provide some context.
> 
> There's a bunch of things that would need to be explained and / or
> argued for here, in particular:
>   - Why did you need to plumb it into sun6i-csi?
>   - You're naming the CSI part as the A83t CSI, while MIPI-CSI has
> been supported since the A31(?), is there a reason for that?
>   - This is not documented anywhere, what did you base this work on?
> 
> Also, I think that documenting the general challenges you faced (which
> were likely because of the first bullet point above) and how you
> solved them here would be great to start a discussion if needed.
> 
> Finally, iirc, Hans requires a v4l2-compliance run for any new driver,
> which isn't strictly the case for this driver, but isn't really *not*
> the case either.
> 
> Maxime

Thank you very much for the review, I will add all this context.

Kévin


-- 
Kevin L'Hopital, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
