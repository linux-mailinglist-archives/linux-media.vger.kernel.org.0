Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF6145D561
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 08:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhKYH3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 02:29:06 -0500
Received: from meesny.iki.fi ([195.140.195.201]:42302 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232999AbhKYH1F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 02:27:05 -0500
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 7ACB7205B6;
        Thu, 25 Nov 2021 09:23:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1637825022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cnvRpk6O4w07uZuhJYvUYK/lvxfVjIbaHyrDoozb7gA=;
        b=G20sUbyj/801s5aH7+OcM4K04JNVSRWOaw7rKtwIEr4493sAHeNWdcD4zSRDmgw+TGBLAd
        aWZWPl2Ncl/xEg/349IbIG/tfM/WgmsZtVhcxpK57bnkjrhFl8dxYlDqktclnFaz0lcWAL
        Pz5wkkzLBeC/qBxwF/Nom9EnmnaTpGk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0659A634C90;
        Thu, 25 Nov 2021 09:23:41 +0200 (EET)
Date:   Thu, 25 Nov 2021 09:23:41 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Adam Ford <aford173@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        cstevens@beaconembedded.com
Subject: Re: LP-11 Timeout on RZ/G2 with ov5640
Message-ID: <YZ85/TT9AmJh1G/w@valkosipuli.retiisi.eu>
References: <CAHCN7xLncsxHcTirn+U1d_x08x=F+txhiJ+LF9GAi5rWnJMUCQ@mail.gmail.com>
 <YZ64wsMUVz37YlBF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZ64wsMUVz37YlBF@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1637825022; a=rsa-sha256; cv=none;
        b=LVcrlAx9ekFwWysN/Q0im35kgJno47VHcF9eYGhqUUWXMcWPqf5IxjutYEy4JAOXS2uD2D
        SnuVXIUoSGBRkEfTKF18V6q5Axf+cnQ3l8Xs33U5Dmn0RdoMlwdZ8AOxgXRtpN9J5akn9W
        TqPGQ3vEqVU37Lz5VGUEGq9f6e4aOzg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1637825022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cnvRpk6O4w07uZuhJYvUYK/lvxfVjIbaHyrDoozb7gA=;
        b=izA4Y4llWyFOJ+tzBzbZPIXRaJmYAVnS6xIOuveY3QfXGpwQEaOHYtHx6NH+efq0QaY8kY
        bQgXhfOQ3geYwi8nRt6fhf0EoP/61GKto080hkzST/Bu0wHtUD3UJdKwfMuJ1CvR2VvrJI
        U8YqubGccGQY73niAIhtqzykafttAfk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Nov 25, 2021 at 12:12:18AM +0200, Laurent Pinchart wrote:
> Hi Adam,
> 
> (CC'ing Sakari)
> 
> On Wed, Nov 24, 2021 at 03:16:57PM -0600, Adam Ford wrote:
> > I am trying to use an OV5640 camera sensor that I've used on both an
> > i.MX6Q and an i.MX8M Mini (with good success) on an RZ/G2[MNH] board
> > connected to the 2-lane CSI interface.
> > 
> > I can get the media-ctl to show the routings, and sometimes I can get
> > streaming.  Often, I get a timeout:
> > 
> >      rcar-csi2 fea80000.csi2: Timeout waiting for LP-11 state
> > 
> > Looking at the various mailing list e-mails for the LP-11, it's
> > unclear to me if the timeout is caused by the sensor not doing
> > something correctly or the CSI2 misbehaving.
> 
> Before transitioning to the high speed (HS) mode, the D-PHY transmitter
> must drive the lane in the LP-11 state. This is the idle state of the
> lane when powered up and when not in the ultra low-power state (ULPS).
> The transition to HS mode on the receiver side involves observing the
> LP-11 state. Many D-PHY RX require configuring the PHY when the lane is
> in LP-11 state, and only then starting the sensor to transition to HS.
> This requires powering up the D-PHY TX and going to idle mode, which
> most sensors support. As we're deprecating the .s_power() subdev
> operation, however, we have no way to power up the sensor without
> starting it before the D-PHY RX gets configured.

That's not true anymore. Please see:

<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/tx-rx.html#lp-11-and-lp-111-modes>

Not all sensors can do this without tricks though.

> 
> In some cases, the D-PHY RX can handle the power up sequence
> automatically. They can be fully configured (from a software point of
> view) while the lane is in the power down state LP-00, and they then
> handle the transition to the stop state LP-11 and to the HS mode
> automatically. This isn't true for all receivers, some need software
> configuration after the data lane reaches the LP-11 state and before it
> transitions to HS mode. According to the documentation, the R-Car CSI-2
> receiver requires software intervention between LP-11 and HS mode at
> least on V3M and E3. There's also a software configuration step on H3,
> M3N, V3H and V3U, but there's a chance that one could possibly be
> bypassed.
> 
> > I was hoping someone might have some suggestions of things I can try.
> 
> I would first try to power up the sensor at probe time and keep it power
> forever, to see if it solves your issue. If it does, then introducing a
> CSI-2-specific subdev operation to power up the sensor (or officially
> de-deprecating .s_power() for this use case) could be an option to fix
> the issue properly.

-- 
Kind regards,

Sakari Ailus
