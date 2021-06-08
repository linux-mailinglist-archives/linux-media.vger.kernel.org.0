Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0938F39EF3C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 09:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhFHHLa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 8 Jun 2021 03:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHHL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 03:11:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E84DC061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 00:09:37 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqVre-0005SQ-TZ; Tue, 08 Jun 2021 09:09:30 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqVrd-0000Ll-BN; Tue, 08 Jun 2021 09:09:29 +0200
Message-ID: <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Date:   Tue, 08 Jun 2021 09:09:29 +0200
In-Reply-To: <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
         <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
         <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
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

On Tue, 2021-06-08 at 00:13 -0300, Fabio Estevam wrote:
> On Mon, May 17, 2021 at 8:48 PM Fabio Estevam <festevam@gmail.com> wrote:
> 
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Pipeline is PREROLLED ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
> > driver bug, expect capture failures.
> > [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
> > [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
> > [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
> > [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> > to allocate required memory.
> > Additional debug info:
> > ../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Buffer pool activation failed
> > Execution ended after 0:00:01.072478334
> > Setting pipeline to NULL ...
> > Freeing pipeline ...
> > 
> > Not sure why I am getting LP-11 and clock lane timeouts though.
> 
> I saw this post:
> https://ez.analog.com/linux-software-drivers/f/q-a/535279/adv7282-m-dts-how-to-connect-adv-to-ipu1_csi0
> 
> and Frieder's patch:
> https://git.kontron-electronics.de/linux/linux/-/commit/0d90331a44d0f718b7327a94fc72612ddcb4ac0f.patch
> 
> I applied Frieder's patch, but still getting the same errors below
> upon launching Gstreamer.:
> 
>  New clock: GstSystemClock
>  [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
>  driver bug, expect capture failures.
>  [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
>  [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
>  [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
>  [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
> 
> Does anyone know what needs to be done to avoid the LP-11 timeout error?

The i.MX6 CSI-2 RX needs to see the LP-11 low power state on the lanes
during streamon (before it calls the ADV7280-M s_stream(1)). That's
where the LP-11 timeout error occurs.

According to the ADV7280(-M) datasheet, "after the ADV7280-M is
programmed, the clock lanes exit low power mode and remain in high speed
mode until the part is reset or powered down."
So it appears the ADV7280-M has to be freshly powered on in s_power(1)
for this to work. Is the ADV7280-M powerdown GPIO connected properly on
your board? Moving the CSI-2 configuration from s_power to s_stream was
exactly the right thing to do in my mind.

Just as a test, if you remove the CSI-2 register writes from either
s_power and s_stream from the adv7180 driver completely, do you still
run into the LP-11 timeout? If the CSI-2 TX never leaves the low power
state, I would expect seeing the clock lane timeout instead 

regards
Philipp
