Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F3C4653F8
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 18:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351882AbhLARf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 12:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhLARf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 12:35:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1ED6C061574
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 09:32:37 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1msTT8-0003eP-JR; Wed, 01 Dec 2021 18:32:34 +0100
Message-ID: <7216bc863d89faa9fdc5cd8d44c319f7a6d88159.camel@pengutronix.de>
Subject: Re: [RFC V2 0/2] arm64: imx8mm: Enable Hantro VPUs
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
        hverkuil@xs4all.nl, nicolas@ndufresne.ca, aford@beaconembedded.com,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Date:   Wed, 01 Dec 2021 18:32:28 +0100
In-Reply-To: <CAJ+vNU1jENmWAR_5E98Vgb53ctxjxSWJewPW0YC4Yp4DuYTn3g@mail.gmail.com>
References: <20211201013329.15875-1-aford173@gmail.com>
         <CAJ+vNU1jENmWAR_5E98Vgb53ctxjxSWJewPW0YC4Yp4DuYTn3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

Am Mittwoch, dem 01.12.2021 um 09:23 -0800 schrieb Tim Harvey:
> On Tue, Nov 30, 2021 at 5:33 PM Adam Ford <aford173@gmail.com> wrote:
> > 
> > The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> > to be related to the video decoders used on the i.MX8MQ, but because of
> > how the Mini handles the power domains, the VPU driver does not need to
> > handle all the functions, nor does it support the post-processor,
> > so a new compatible flag is required.
> > 
> > With the suggestion from Hans Verkuil, I was able to get the G2 splat to go away
> > with changes to FORCE_MAX_ZONEORDER, but I found I could also set cma=512M, however
> > it's unclear to me if that's an acceptable alternative.
> > 
> > At the suggestion of Ezequiel Garcia and Nicolas Dufresne I have some
> > results from Fluster. However, the G2 VPU appears to fail most tests.
> > 
> > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > Ran 90/135 tests successfully               in 76.431 secs
> > 
> >  ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > Ran 55/61 tests successfully               in 21.454 secs
> > 
> > ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> > Ran 0/303 tests successfully               in 20.016 secs
> > 
> > Each day seems to show more and more G2 submissions, and gstreamer seems to be
> > still working on the VP9, so I am not sure if I should drop G2 as well.
> > 
> > 
> > Adam Ford (2):
> >   media: hantro: Add support for i.MX8M Mini
> >   arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
> > 
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi   | 41 +++++++++++++++
> >  drivers/staging/media/hantro/hantro_drv.c   |  2 +
> >  drivers/staging/media/hantro/hantro_hw.h    |  2 +
> >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 57 +++++++++++++++++++++
> >  4 files changed, 102 insertions(+)
> > 
> 
> Adam,
> 
> That's for the patches!
> 
> I tested just this series on top of v5.16-rc3 on an
> imx8mm-venice-gw73xx-0x and found that if I loop fluster I can end up
> getting a hang within 10 to 15 mins or so when imx8m_blk_ctrl_power_on
> is called for VPUMIX pd :
> while [ 1 ]; do uptime; ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0; done
> ...
> [  618.838436] imx-pgc imx-pgc-domain.6: failed to command PGC
> [  618.844407] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> 
> I added prints in imx_pgc_power_{up,down} and
> imx8m_blk_ctrl_power_{on,off} to get some more context
> ...
> Ran 55/61 tests successfully               in 8.685 secs
>  17:16:34 up 17 min,  0 users,  load average: 3.97, 2.11, 0.93
> ********************************************************************************
> ********************
> Running test suite VP8-TEST-VECTORS with decoder GStreamer-VP8-V4L2SL-Gst1.0
> Using 4 parallel job(s)
> ********************************************************************************
> ********************
> 
> [TEST SUITE      ] (DECODER                    ) TEST VECTOR               ... R
> ESULT
> ----------------------------------------------------------------------
> [ 1023.114806] imx8m_blk_ctrl_power_on vpublk-g1
> [ 1023.119669] imx_pgc_power_up vpumix
> [ 1023.124307] imx-pgc imx-pgc-domain.6: failed to command PGC
> [ 1023.130006] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> 
> While this wouldn't be an issue with this series it does indicate we
> still have something racy in blk-ctrl. Can you reproduce this (and if
> not what kernel are you based on)? Perhaps you or Lucas have some
> ideas?
> 
Did you have "[PATCH] soc: imx: gpcv2: Synchronously suspend MIX
domains" applied when running those tests? It has only recently been
picked up by Shawn and may have an influence on the bus domain
behavior.

Regards,
Lucas

