Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7987E45DE3D
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 17:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356393AbhKYQGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 11:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbhKYQEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 11:04:54 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7853C061373;
        Thu, 25 Nov 2021 07:51:44 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 8E87C1B000E5;
        Thu, 25 Nov 2021 17:51:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1637855499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JAR0UlzluqB3nNg/fEkLtNVYPX7wYWic4D2UtuewLeo=;
        b=JgEdhjcr/SFrRMev/fjO7tKD2RpawJIczwNVg1gVwuq/ZP1YwJBIkNdTx6JKzzf8kTrjF0
        a6gK4lm+cEbV0KsCkHGjirJFSgG8Js4nHWEL4eM9ml9Lbpo9jKi95kNeUwjRVdEbOleW4E
        Imu0ieMUyugUrxYWHO+PI1y/+2lRScTIdzplZrJ5Jklob1bE2zBuwhOnN2A2qWxRSby/e9
        Wjfjq9NLPwf7NnfsqmsF4a06gQSUb+FFQO9o8NZz4igN10ha0aF9fUpp5hUvI2a3ROQePi
        OJhXc0JTVUFCYBNOnZs2rKhgIxnBnHpYDPB/nJgLLqj0VJdMfLPXLjm93is9uQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1BC9E634C90;
        Thu, 25 Nov 2021 17:51:39 +0200 (EET)
Date:   Thu, 25 Nov 2021 17:51:39 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Ford <aford173@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        cstevens@beaconembedded.com
Subject: Re: LP-11 Timeout on RZ/G2 with ov5640
Message-ID: <YZ+xC8Dfjmy0Fiku@valkosipuli.retiisi.eu>
References: <CAHCN7xLncsxHcTirn+U1d_x08x=F+txhiJ+LF9GAi5rWnJMUCQ@mail.gmail.com>
 <YZ64wsMUVz37YlBF@pendragon.ideasonboard.com>
 <YZ85/TT9AmJh1G/w@valkosipuli.retiisi.eu>
 <20211125154225.doqtnzgv4t73usph@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125154225.doqtnzgv4t73usph@uno.localdomain>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1637855499; a=rsa-sha256;
        cv=none;
        b=s4/5I7S62i930kF3ro3qS3WV+vP4EM0UOjFcI5NRKVfJzAYgysKYZB0Ji0fhQtROrt9NgZ
        jpJBhxIrGKaR/q/Bi8MNpL/uSUGr5B7czQ1ua+LvJr1hOHuKle+l+ktKnlbSK2sQy7ltQE
        fTTQEsaS+xSA0UDfodoMNZMDTs3McODQv24q6bcQ/TohQzdOUPskSptgJ1UPGj8cuvV08u
        sHo5fSiSzmZPHnSQXXI0GlNNNxXb4pG+af214q8EhL1nriue1dez/pCYXIoC/9wqnrf+3t
        Fh6273Wr9e0Ly6ppXfHGdpnzcJDlkkey71A+WmhGfQM9+5B1HF6xtcvkyXaIpg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1637855499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JAR0UlzluqB3nNg/fEkLtNVYPX7wYWic4D2UtuewLeo=;
        b=D41NeStoNJxJGqpnHTrww2iX/zlaUW28vUInPMZvZCGPFEjMYMUcCWQ6XOKxNtV+D+4lZJ
        fe/UdqqloT6RYkPtzAYhUIG4NQfmx/nhYO4Zp/HdYYVwrAWtTG6VWOM/3lZx5XMY6XJ20s
        RWjO7IvZGKRTaZZDGJ7rHj4EC6iYFXBB2U8+PhymnFJREe4cVqLuXNawQb4dJSg4PWrhWo
        qkxZmDKsXgmZFxWCuZbVWXMS6QFVLvVWdPhzSO65JQYul+M2HNzHDvQxt2riz6ES+VPOqZ
        lVLJupEuDQBi4g6ehlWYSdJiG40z1GFraZlLS0z/2g1aSm/HdkK58ZOqFUeXdA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 25, 2021 at 04:42:25PM +0100, Jacopo Mondi wrote:
> Hello
> G
> On Thu, Nov 25, 2021 at 09:23:41AM +0200, Sakari Ailus wrote:
> > Hi Laurent,
> >
> > On Thu, Nov 25, 2021 at 12:12:18AM +0200, Laurent Pinchart wrote:
> > > Hi Adam,
> > >
> > > (CC'ing Sakari)
> > >
> > > On Wed, Nov 24, 2021 at 03:16:57PM -0600, Adam Ford wrote:
> > > > I am trying to use an OV5640 camera sensor that I've used on both an
> > > > i.MX6Q and an i.MX8M Mini (with good success) on an RZ/G2[MNH] board
> > > > connected to the 2-lane CSI interface.
> > > >
> > > > I can get the media-ctl to show the routings, and sometimes I can get
> > > > streaming.  Often, I get a timeout:
> > > >
> > > >      rcar-csi2 fea80000.csi2: Timeout waiting for LP-11 state
> > > >
> > > > Looking at the various mailing list e-mails for the LP-11, it's
> > > > unclear to me if the timeout is caused by the sensor not doing
> > > > something correctly or the CSI2 misbehaving.
> > >
> > > Before transitioning to the high speed (HS) mode, the D-PHY transmitter
> > > must drive the lane in the LP-11 state. This is the idle state of the
> > > lane when powered up and when not in the ultra low-power state (ULPS).
> > > The transition to HS mode on the receiver side involves observing the
> > > LP-11 state. Many D-PHY RX require configuring the PHY when the lane is
> > > in LP-11 state, and only then starting the sensor to transition to HS.
> > > This requires powering up the D-PHY TX and going to idle mode, which
> > > most sensors support. As we're deprecating the .s_power() subdev
> > > operation, however, we have no way to power up the sensor without
> > > starting it before the D-PHY RX gets configured.
> >
> > That's not true anymore. Please see:
> >
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/tx-rx.html#lp-11-and-lp-111-modes>
> >
> > Not all sensors can do this without tricks though.
> >
> > >
> > > In some cases, the D-PHY RX can handle the power up sequence
> > > automatically. They can be fully configured (from a software point of
> > > view) while the lane is in the power down state LP-00, and they then
> > > handle the transition to the stop state LP-11 and to the HS mode
> > > automatically. This isn't true for all receivers, some need software
> > > configuration after the data lane reaches the LP-11 state and before it
> > > transitions to HS mode. According to the documentation, the R-Car CSI-2
> > > receiver requires software intervention between LP-11 and HS mode at
> > > least on V3M and E3. There's also a software configuration step on H3,
> > > M3N, V3H and V3U, but there's a chance that one could possibly be
> > > bypassed.
> > >
> > > > I was hoping someone might have some suggestions of things I can try.
> > >
> > > I would first try to power up the sensor at probe time and keep it power
> > > forever, to see if it solves your issue. If it does, then introducing a
> > > CSI-2-specific subdev operation to power up the sensor (or officially
> > > de-deprecating .s_power() for this use case) could be an option to fix
> > > the issue properly.
> 
> What about .pre_streamon video op ?
> Should it fit here ?

That's its first use case but there can be others.

-- 
Sakari Ailus
