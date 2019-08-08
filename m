Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 491DA85D69
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731588AbfHHIxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 04:53:32 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54737 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfHHIxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 04:53:32 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hveAq-00051C-4f; Thu, 08 Aug 2019 10:53:28 +0200
Message-ID: <1565254405.3656.1.camel@pengutronix.de>
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl,
        slongerbeam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org
Date:   Thu, 08 Aug 2019 10:53:25 +0200
In-Reply-To: <20190808082605.GA917@valkosipuli.retiisi.org.uk>
References: <20190627222912.25485-1-festevam@gmail.com>
         <1561963729.3753.5.camel@pengutronix.de>
         <8b859fd7758c3f95b45b5b70909be0d2ae2e4f34.camel@collabora.com>
         <20190807120626.GE822@valkosipuli.retiisi.org.uk>
         <73d82df753e0579bd122dfaf9fa12ba8cad95d88.camel@collabora.com>
         <20190808082605.GA917@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, 2019-08-08 at 11:26 +0300, Sakari Ailus wrote:
[...]
> > > Have you checked how it works if you simply leave out this test?

Whether this works or not depends on the sensor used, and for some
sensor/drivers may depend on timing (or random factors influencing it).
See below.

[...]
> Some devices can be commanded to enter LP-11 state but some will just
> briefly visit that state. The LP-11 state is mandatory but software should
> not be involved in detecting it if at all possible.

This is a good point. Devices that can be set to LP-11 state
immediately, but that don't stay there long enough (either because they
wait for less than the required by spec 100µs, or because system load
causes this check to be executed too late) may end up working reliably
even though the warning fires.

> So if the hardware does not require further initialisation to be done in
> LP-11 state, you should remove the check.
> 
> > We had to fix at least OV5645 and OV5640 recently because of this,
> > and I can imagine more drivers will have the same issue.
> 
> This is actually an issue in the IMX driver (or hardware), not in the
> sensor driver. It may be that sometimes it's easier to work around it in
> the sensor driver.
> 
> So, I'd like to know whether the check itself is a driver bug, or something
> that the hardware requires. The fact that you're sending this patch
> suggests the former.

This is something that the hardware requires, according to the reference
manual. See the comment in drivers/staging/media/imx/imx6-mipi-csi2.c,
especially step 5.:

/*
 * The required sequence of MIPI CSI-2 startup as specified in the i.MX6
 * reference manual is as follows:
 *
 * 1. Deassert presetn signal (global reset).
 *        It's not clear what this "global reset" signal is (maybe APB
 *        global reset), but in any case this step would be probably
 *        be carried out during driver load in csi2_probe().
 *
 * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
 *        This must be carried out by the MIPI sensor's s_power(ON) subdev
 *        op.
 *
 * 3. D-PHY initialization.
 * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,
 *    deassert PHY_RSTZ, deassert CSI2_RESETN).
 * 5. Read the PHY status register (PHY_STATE) to confirm that all data and
 *    clock lanes of the D-PHY are in LP-11 state.
 * 6. Configure the MIPI Camera Sensor to start transmitting a clock on the
 *    D-PHY clock lane.
 * 7. CSI2 Controller programming - Read the PHY status register (PHY_STATE)
 *    to confirm that the D-PHY is receiving a clock on the D-PHY clock lane.
 */

I read this as the hardware needing to see the LP-11 -> HS transition
after the DPHY reset has been released, and before the CSI2 RX
controller is programmed.

If not all lanes are in LP-11 state at step 5., we can't guarantee that
the DPHY has already seen this transition nor that it will see it in
time before we start enabling the CSI2 RX.
Since this can lead to anything from sporadic to 100% startup failure,
depending on timing or whether the sensor is configured correctly to
produce this transition at all, I'd like this warning to stay.
It has been helpful before when developing sensor drivers.

regards
Philipp
