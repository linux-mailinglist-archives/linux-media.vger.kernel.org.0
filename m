Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1633A0DA7
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 09:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236624AbhFIHWg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 9 Jun 2021 03:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235510AbhFIHWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 03:22:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D107BC061574
        for <linux-media@vger.kernel.org>; Wed,  9 Jun 2021 00:20:41 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqsVw-0002k0-Fi; Wed, 09 Jun 2021 09:20:36 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqsVv-0001ht-7f; Wed, 09 Jun 2021 09:20:35 +0200
Message-ID: <a6322fe86be905c028ede9ee2abee278266e1b35.camel@pengutronix.de>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Date:   Wed, 09 Jun 2021 09:20:35 +0200
In-Reply-To: <CAOMZO5CxDtPa_WYEJf9dkLa8x1UthicBqB=RBJUgxKud+srsDQ@mail.gmail.com>
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
         <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
         <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
         <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
         <CAOMZO5CxDtPa_WYEJf9dkLa8x1UthicBqB=RBJUgxKud+srsDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Tue, 2021-06-08 at 23:34 -0300, Fabio Estevam wrote:
> Hi Philipp,
> 
> On Tue, Jun 8, 2021 at 4:09 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > The i.MX6 CSI-2 RX needs to see the LP-11 low power state on the lanes
> > during streamon (before it calls the ADV7280-M s_stream(1)). That's
> > where the LP-11 timeout error occurs.
> > 
> > According to the ADV7280(-M) datasheet, "after the ADV7280-M is
> > programmed, the clock lanes exit low power mode and remain in high speed
> > mode until the part is reset or powered down."
> > So it appears the ADV7280-M has to be freshly powered on in s_power(1)
> 
> What do you mean by freshly powered on?

That the ADV7280-M is in the state before "the clock lanes exit low
power mode" due to being "programmed". Basically I was hoping that after
the initial reset sequence, and after power on, before the CSI-2
registers are written, the clock lanes are in LP-11 state (and stay
there until then).
Unfortunately that doesn't appear to be the case below ...

> > for this to work. Is the ADV7280-M powerdown GPIO connected properly on
> > your board? Moving the CSI-2 configuration from s_power to s_stream was
> > exactly the right thing to do in my mind.
> > 
> > Just as a test, if you remove the CSI-2 register writes from either
> > s_power and s_stream from the adv7180 driver completely, do you still
> > run into the LP-11 timeout? If the CSI-2 TX never leaves the low power
> > state, I would expect seeing the clock lane timeout instead
> 
> If I do this test, the first time I run the pipeline I get LP-11, the
> second time I get clock lane timeout.

... at least the first time.

So now I wonder what happens between the first and second time (in
s_stream? in s_power(0)?) that does put the lanes into LP-11 from
whatever state they were in before. When you get the clock lane timeout,
is phy_state = 0x610? Does it stay there when you repeat this again?

regards
Philipp
