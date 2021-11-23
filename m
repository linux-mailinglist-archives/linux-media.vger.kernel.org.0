Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3415C459F7A
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 10:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbhKWJul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 04:50:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59886 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbhKWJuk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 04:50:40 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0797BA1B;
        Tue, 23 Nov 2021 10:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637660851;
        bh=6vADgbssraBLDOIKrkf2AvmyACKPaDSUjAS9OI3rwS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tdu54CA0m5zh7iSTvLL1iDk438RVN2zDGwnKwD0rXHizm4DX4KrttwZts3F5zLPIS
         JqEiHWI2P1NnRU5RvoJ58La8ZDOHC4p82/qNF+D2hAWl6vvtByinARTDjaB2i+O18+
         +nYco/ONNigFh1Q8bCZUvQWJwnzTKSb9QLBJ2V/Y=
Date:   Tue, 23 Nov 2021 11:47:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Adam Ford <aford173@gmail.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: (EXT) Re: [PATCH V2 4/5] arm64: dts: imx8mm-beacon: Enable
 OV5640 Camera
Message-ID: <YZy4nFgkIyNXpIo3@pendragon.ideasonboard.com>
References: <20211106155427.753197-1-aford173@gmail.com>
 <20211106155427.753197-4-aford173@gmail.com>
 <YZrTyVJR8VN6dQAf@pendragon.ideasonboard.com>
 <CAHCN7xK=SNgiC2kRzX4gftjkZX4Ms8PVbL69n7+eR-EAe68xag@mail.gmail.com>
 <YZwyhWPJVlC0JmpK@pendragon.ideasonboard.com>
 <0c3b4cdd075919ca5cc27c56e792f510e3b76cd7.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c3b4cdd075919ca5cc27c56e792f510e3b76cd7.camel@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Tue, Nov 23, 2021 at 08:38:47AM +0100, Alexander Stein wrote:
> Am Dienstag, dem 23.11.2021 um 02:15 +0200 schrieb Laurent Pinchart:
> > On Sun, Nov 21, 2021 at 09:07:26PM -0600, Adam Ford wrote:
> > > On Sun, Nov 21, 2021 at 5:18 PM Laurent Pinchart wrote:
> > > > On Sat, Nov 06, 2021 at 10:54:26AM -0500, Adam Ford wrote:
> > > > > The baseboard has support for a TDNext 5640 Camera which
> > > > > uses an OV5640 connected to a 2-lane CSI2 interface.
> > > > > 
> > > > > With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
> > > > > pipeline can be configured with the following:
> > > > > 
> > > > >     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
> > > > > 
> > > > > The camera and various nodes in the pipeline can be configured for UYVY:
> > > > >     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
> > > > >     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
> > > > > 
> > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > 
> > > > As the ov5640 is on an add-on module, would a DT overlay be better ?
> > > 
> > > At least for the Beacon / LogicPD boards, I would prefer to avoid the
> > > overlays.  We have an i.M6Q and an OMAP3 board with cameras enabled in
> > > our development kit device trees.  If the cameras are not connected,
> > > they just display a message that the cameras are not communicating and
> > > move on.  I'm OK with that.
> > 
> > You know the board better than I do, so I won't push against this, but I
> > still think it may not lead to the best user experience, especially if a
> > user wanted to connect a different sensor to the development board.
> 
> I see the advantages of overlays compared to "stacked" .dts files. But
> is there any general supported interface how to actually apply an overlay?
> Documentation/devicetree/overlay-notes.rst
> states of_overlay_fdt_apply() but there is only exactly one user in-
> kernel (rcar-du). Is it expected that the bootloader like u-boot shall
> apply the .dtbo files?

I believe the boot loader is expected to apply overlays nowadays, yes.
That's my personal workflow.

-- 
Regards,

Laurent Pinchart
