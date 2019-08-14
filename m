Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F948CC64
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 09:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfHNHQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 03:16:59 -0400
Received: from retiisi.org.uk ([95.216.213.190]:33934 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726383AbfHNHQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 03:16:59 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 2A9A7634C88;
        Wed, 14 Aug 2019 10:16:46 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxnWX-0000sY-GV; Wed, 14 Aug 2019 10:16:45 +0300
Date:   Wed, 14 Aug 2019 10:16:45 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org, mchehab@kernel.org
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
Message-ID: <20190814071645.GH2527@valkosipuli.retiisi.org.uk>
References: <20190627222912.25485-1-festevam@gmail.com>
 <1561963729.3753.5.camel@pengutronix.de>
 <8b859fd7758c3f95b45b5b70909be0d2ae2e4f34.camel@collabora.com>
 <20190807120626.GE822@valkosipuli.retiisi.org.uk>
 <73d82df753e0579bd122dfaf9fa12ba8cad95d88.camel@collabora.com>
 <20190808082605.GA917@valkosipuli.retiisi.org.uk>
 <1565254405.3656.1.camel@pengutronix.de>
 <e4b84958-28c7-1141-e34f-e1e3ad5b35db@gmail.com>
 <20190813082852.GE835@valkosipuli.retiisi.org.uk>
 <c4ced1cc-4f0c-b4e1-c1e7-b85de85e439d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4ced1cc-4f0c-b4e1-c1e7-b85de85e439d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Tue, Aug 13, 2019 at 04:27:06PM -0700, Steve Longerbeam wrote:
> Hi Sakari,
> 
> On 8/13/19 1:28 AM, Sakari Ailus wrote:
> > Hi Steve,
> > 
> > On Thu, Aug 08, 2019 at 11:02:29AM -0700, Steve Longerbeam wrote:
> > > 
> > > On 8/8/19 1:53 AM, Philipp Zabel wrote:
> > > > Hi Sakari,
> > > > 
> > > > On Thu, 2019-08-08 at 11:26 +0300, Sakari Ailus wrote:
> > > > [...]
> > > > > > > Have you checked how it works if you simply leave out this test?
> > > > Whether this works or not depends on the sensor used, and for some
> > > > sensor/drivers may depend on timing (or random factors influencing it).
> > > > See below.
> > > > 
> > > > [...]
> > > > > Some devices can be commanded to enter LP-11 state but some will just
> > > > > briefly visit that state. The LP-11 state is mandatory but software should
> > > > > not be involved in detecting it if at all possible.
> > > > This is a good point. Devices that can be set to LP-11 state
> > > > immediately, but that don't stay there long enough (either because they
> > > > wait for less than the required by spec 100µs, or because system load
> > > > causes this check to be executed too late) may end up working reliably
> > > > even though the warning fires.
> > > > > So if the hardware does not require further initialisation to be done in
> > > > > LP-11 state, you should remove the check.
> > > > > 
> > > > > > We had to fix at least OV5645 and OV5640 recently because of this,
> > > > > > and I can imagine more drivers will have the same issue.
> > > > > This is actually an issue in the IMX driver (or hardware), not in the
> > > > > sensor driver. It may be that sometimes it's easier to work around it in
> > > > > the sensor driver.
> > > > > 
> > > > > So, I'd like to know whether the check itself is a driver bug, or something
> > > > > that the hardware requires. The fact that you're sending this patch
> > > > > suggests the former.
> > > > This is something that the hardware requires, according to the reference
> > > > manual. See the comment in drivers/staging/media/imx/imx6-mipi-csi2.c,
> > > > especially step 5.:
> > > > 
> > > > /*
> > > >    * The required sequence of MIPI CSI-2 startup as specified in the i.MX6
> > > >    * reference manual is as follows:
> > > >    *
> > > >    * 1. Deassert presetn signal (global reset).
> > > >    *        It's not clear what this "global reset" signal is (maybe APB
> > > >    *        global reset), but in any case this step would be probably
> > > >    *        be carried out during driver load in csi2_probe().
> > > >    *
> > > >    * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
> > > >    *        This must be carried out by the MIPI sensor's s_power(ON) subdev
> > > >    *        op.
> > > >    *
> > > >    * 3. D-PHY initialization.
> > > >    * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,
> > > >    *    deassert PHY_RSTZ, deassert CSI2_RESETN).
> > > >    * 5. Read the PHY status register (PHY_STATE) to confirm that all data and
> > > >    *    clock lanes of the D-PHY are in LP-11 state.
> > > >    * 6. Configure the MIPI Camera Sensor to start transmitting a clock on the
> > > >    *    D-PHY clock lane.
> > > >    * 7. CSI2 Controller programming - Read the PHY status register (PHY_STATE)
> > > >    *    to confirm that the D-PHY is receiving a clock on the D-PHY clock lane.
> > > >    */
> > > > 
> > > > I read this as the hardware needing to see the LP-11 -> HS transition
> > > > after the DPHY reset has been released, and before the CSI2 RX
> > > > controller is programmed.
> > > I think that's a fair assumption, and there's another paragraph at the end
> > > of that comment above that adds more evidence to that:
> > > 
> > > ...
> > > * All steps 3 through 7 are carried out by csi2_s_stream(ON) here. Step
> > > * 6 is accomplished by calling the source subdev's s_stream(ON) between
> > > * steps 5 and 7.
> > > */
> > > 
> > > 
> > > So the driver is expecting that the LP-11 state persists until step 6, at
> > > which the LP-11 -> HS transition occurs when streaming is started at the
> > > transmitter.
> > > 
> > > But if the transmitter only stays in LP-11 state for the minimum 100 usec
> > > after it is powered on, and then _automatically_ transitions to HS, it's
> > > quite possible the LP-11 -> HS transition will happen long before the DPHY
> > > is taken out of reset. That's because the transmitter's s_power(ON) is
> > > called when the capture device is opened (via v4l2_pipeline_pm_use()), but
> > > the steps above are carried out when streaming starts, so userland would
> > > have to issue VIDIOC_STREAMON well within the 100 usec expires after
> > > open()'ing the device, for the receiver hardware to see the transition.
> > After powering on the sensor it sensor should stay in (software) standby
> > mode until streaming is started. It should still have its lanes in LP-11
> > mode if the sensor supports it (as documented) until the sensor switches to
> > the streaming mode.
> 
> Yes that's my understanding too.
> 
> > 
> > > Perhaps that would be an argument for moving steps 1 - 5 into the driver's
> > > s_power(ON) call, which would first call s_power(ON) to the transmitter and
> > > then immediately go through steps 1 - 5. Steps 6,7 would then remain in
> > > s_stream(ON).
> > Not all sensor drivers power on the sensor before starting streaming.
> > 
> > Perhaps we could add a prepare_streaming() callback (in absence of a better
> > proposal) to address that? We'd also need a corresponding
> > unprepare_streaming() callback as well --- to power off the sensor. I think
> > this only should be done if the sensor can be switched to LP-11 explicitly;
> > many simply don't support that.
> 
> So you are saying a sensor can power on and place its lanes in LP-11 in this
> new prepare_streaming() callback, the reason being, this can be called
> closer in time, and just before, the receiver DPHY is brought out of reset,
> in order for the receiver DPHY to be able to detect a possible early
> transition to HS mode?
> 
> While I don't have any objection to adding a prepare_streaming() callback
> (it could be useful for other reasons), I don't see why the sensor could not
> simply make use of existing s_power to power on and place the lanes in
> LP-11. That is what it's intended for anyway.

The vast majority of new drivers no longer have s_power callbacks --- they
use runtime PM instead.

> 
> There's really no drawback to the patch I posted that moves receiver DPHY
> init and reset-release to s_power time in the receiver driver. If given a
> choice, an isolated fix to the imx mipi csi-2 receiver driver should be
> preferable to implementing a new callback.
> 
> But perhaps one advantage to the prepare_streaming() callback idea, is that
> there is more of a guarantee of minimum time between the
> sensor-power-on-and-enter-LP-11 event and receiver-DPHY-reset-release event,
> since s_power is normally called from v4l2_pipeline_pm_use() which could add
> extra overhead between the time s_power is called at the transmitter and at
> the receiver (but not much - the transmitter is connected directly to
> receiver in the graph).

-- 
Regards,

Sakari Ailus
