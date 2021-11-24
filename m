Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C315845CFE3
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 23:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244852AbhKXWPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 17:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244618AbhKXWPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 17:15:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AEBC061574;
        Wed, 24 Nov 2021 14:12:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42984340;
        Wed, 24 Nov 2021 23:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637791962;
        bh=PfP/xuAr48OfrS0rYl8j4rP8WU/91eEfUs+4yvpJpUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jkgYZ1uJyJZ/h6Vk/Hx04c7+Gi5BlUOQxVH+E0/zVtZqoSMgnnP7s0pB37QA8bv/y
         iaP387HpVrM2KxKd0P8AWrFbTAs4M6ZTHfEU3iqjl4W/rROwwgenpozg/Y2AKxHMyM
         Iez2wv/XZKGfTQSioSZTc47ECs2iEp2htWcLf1LE=
Date:   Thu, 25 Nov 2021 00:12:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        cstevens@beaconembedded.com, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: LP-11 Timeout on RZ/G2 with ov5640
Message-ID: <YZ64wsMUVz37YlBF@pendragon.ideasonboard.com>
References: <CAHCN7xLncsxHcTirn+U1d_x08x=F+txhiJ+LF9GAi5rWnJMUCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLncsxHcTirn+U1d_x08x=F+txhiJ+LF9GAi5rWnJMUCQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

(CC'ing Sakari)

On Wed, Nov 24, 2021 at 03:16:57PM -0600, Adam Ford wrote:
> I am trying to use an OV5640 camera sensor that I've used on both an
> i.MX6Q and an i.MX8M Mini (with good success) on an RZ/G2[MNH] board
> connected to the 2-lane CSI interface.
> 
> I can get the media-ctl to show the routings, and sometimes I can get
> streaming.  Often, I get a timeout:
> 
>      rcar-csi2 fea80000.csi2: Timeout waiting for LP-11 state
> 
> Looking at the various mailing list e-mails for the LP-11, it's
> unclear to me if the timeout is caused by the sensor not doing
> something correctly or the CSI2 misbehaving.

Before transitioning to the high speed (HS) mode, the D-PHY transmitter
must drive the lane in the LP-11 state. This is the idle state of the
lane when powered up and when not in the ultra low-power state (ULPS).
The transition to HS mode on the receiver side involves observing the
LP-11 state. Many D-PHY RX require configuring the PHY when the lane is
in LP-11 state, and only then starting the sensor to transition to HS.
This requires powering up the D-PHY TX and going to idle mode, which
most sensors support. As we're deprecating the .s_power() subdev
operation, however, we have no way to power up the sensor without
starting it before the D-PHY RX gets configured.

In some cases, the D-PHY RX can handle the power up sequence
automatically. They can be fully configured (from a software point of
view) while the lane is in the power down state LP-00, and they then
handle the transition to the stop state LP-11 and to the HS mode
automatically. This isn't true for all receivers, some need software
configuration after the data lane reaches the LP-11 state and before it
transitions to HS mode. According to the documentation, the R-Car CSI-2
receiver requires software intervention between LP-11 and HS mode at
least on V3M and E3. There's also a software configuration step on H3,
M3N, V3H and V3U, but there's a chance that one could possibly be
bypassed.

> I was hoping someone might have some suggestions of things I can try.

I would first try to power up the sensor at probe time and keep it power
forever, to see if it solves your issue. If it does, then introducing a
CSI-2-specific subdev operation to power up the sensor (or officially
de-deprecating .s_power() for this use case) could be an option to fix
the issue properly.

-- 
Regards,

Laurent Pinchart
