Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D0D25F43C
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 09:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgIGHpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 03:45:19 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44363 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgIGHpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 03:45:13 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E04B1C0014;
        Mon,  7 Sep 2020 07:45:06 +0000 (UTC)
Date:   Mon, 7 Sep 2020 09:48:54 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200907074854.uxq4a76k5amjfopi@uno.localdomain>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-4-git-send-email-skomatineni@nvidia.com>
 <20200903144713.fyhmhs2bfcz5br6d@uno.localdomain>
 <094073f1-ef58-a2fd-bed4-7fa3b99dd120@nvidia.com>
 <20200904085552.5xddn2kecoktuesg@uno.localdomain>
 <5ebe8d22-86fb-7bf2-ab19-e729caf8d88f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ebe8d22-86fb-7bf2-ab19-e729caf8d88f@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Fri, Sep 04, 2020 at 10:04:10AM -0700, Sowjanya Komatineni wrote:
>
> On 9/4/20 1:55 AM, Jacopo Mondi wrote:
> > > > usleep_range() allows you to provide an interval in which your timeout
> > > > can be coalesced with others. Giving a [1usec, 2usec] range kind of
> > > > defeat the purpose. And most than everything, does sleeping for 2usec
> > > > serve any real purpose ?
> > > Following delay recommendation from DS for power on sequence.
> > >
> > 2 useconds ? Seems very short:)
> >
> As per IMX274 datasheet for power on sequence, 100ns is the min wait time
> after the last power supply of 1v8/1v2/2v8 is ON before releasing RESET
> high.

ook.. well, it's actually reasonable, it's just the time for the
regulators to ramp up, I initially thought it was the time for the
chip to exit reset.

Let me be a bit more picky and ask if you have considered busy waiting
on such a small sleep interval by using udelay. Again, as this happens
at chip power on only, the impact on the system of mis-using
usleep_range() is negligible, but according to documentation:

	SLEEPING FOR "A FEW" USECS ( < ~10us? ):
		* Use udelay

		- Why not usleep?
			On slower systems, (embedded, OR perhaps a speed-
			stepped PC!) the overhead of setting up the hrtimers
			for usleep *may* not be worth it. Such an evaluation
			will obviously depend on your specific situation, but
			it is something to be aware of.

Up to you, really!

Thanks
  j
