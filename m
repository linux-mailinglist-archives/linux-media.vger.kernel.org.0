Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4876B45DDC8
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356033AbhKYPqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 10:46:48 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:60087 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356112AbhKYPos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:44:48 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id ED19C10000A;
        Thu, 25 Nov 2021 15:41:33 +0000 (UTC)
Date:   Thu, 25 Nov 2021 16:42:25 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Ford <aford173@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        cstevens@beaconembedded.com
Subject: Re: LP-11 Timeout on RZ/G2 with ov5640
Message-ID: <20211125154225.doqtnzgv4t73usph@uno.localdomain>
References: <CAHCN7xLncsxHcTirn+U1d_x08x=F+txhiJ+LF9GAi5rWnJMUCQ@mail.gmail.com>
 <YZ64wsMUVz37YlBF@pendragon.ideasonboard.com>
 <YZ85/TT9AmJh1G/w@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YZ85/TT9AmJh1G/w@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello
G
On Thu, Nov 25, 2021 at 09:23:41AM +0200, Sakari Ailus wrote:
> Hi Laurent,
>
> On Thu, Nov 25, 2021 at 12:12:18AM +0200, Laurent Pinchart wrote:
> > Hi Adam,
> >
> > (CC'ing Sakari)
> >
> > On Wed, Nov 24, 2021 at 03:16:57PM -0600, Adam Ford wrote:
> > > I am trying to use an OV5640 camera sensor that I've used on both an
> > > i.MX6Q and an i.MX8M Mini (with good success) on an RZ/G2[MNH] board
> > > connected to the 2-lane CSI interface.
> > >
> > > I can get the media-ctl to show the routings, and sometimes I can get
> > > streaming.  Often, I get a timeout:
> > >
> > >      rcar-csi2 fea80000.csi2: Timeout waiting for LP-11 state
> > >
> > > Looking at the various mailing list e-mails for the LP-11, it's
> > > unclear to me if the timeout is caused by the sensor not doing
> > > something correctly or the CSI2 misbehaving.
> >
> > Before transitioning to the high speed (HS) mode, the D-PHY transmitter
> > must drive the lane in the LP-11 state. This is the idle state of the
> > lane when powered up and when not in the ultra low-power state (ULPS).
> > The transition to HS mode on the receiver side involves observing the
> > LP-11 state. Many D-PHY RX require configuring the PHY when the lane is
> > in LP-11 state, and only then starting the sensor to transition to HS.
> > This requires powering up the D-PHY TX and going to idle mode, which
> > most sensors support. As we're deprecating the .s_power() subdev
> > operation, however, we have no way to power up the sensor without
> > starting it before the D-PHY RX gets configured.
>
> That's not true anymore. Please see:
>
> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/tx-rx.html#lp-11-and-lp-111-modes>
>
> Not all sensors can do this without tricks though.
>
> >
> > In some cases, the D-PHY RX can handle the power up sequence
> > automatically. They can be fully configured (from a software point of
> > view) while the lane is in the power down state LP-00, and they then
> > handle the transition to the stop state LP-11 and to the HS mode
> > automatically. This isn't true for all receivers, some need software
> > configuration after the data lane reaches the LP-11 state and before it
> > transitions to HS mode. According to the documentation, the R-Car CSI-2
> > receiver requires software intervention between LP-11 and HS mode at
> > least on V3M and E3. There's also a software configuration step on H3,
> > M3N, V3H and V3U, but there's a chance that one could possibly be
> > bypassed.
> >
> > > I was hoping someone might have some suggestions of things I can try.
> >
> > I would first try to power up the sensor at probe time and keep it power
> > forever, to see if it solves your issue. If it does, then introducing a
> > CSI-2-specific subdev operation to power up the sensor (or officially
> > de-deprecating .s_power() for this use case) could be an option to fix
> > the issue properly.

What about .pre_streamon video op ?
Should it fit here ?


>
> --
> Kind regards,
>
> Sakari Ailus
