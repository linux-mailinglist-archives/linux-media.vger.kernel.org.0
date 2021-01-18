Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163B92FA021
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 13:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391575AbhARMlm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 Jan 2021 07:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404154AbhARMlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 07:41:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9257AC061573
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 04:40:25 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l1TpX-0002QI-Pz; Mon, 18 Jan 2021 13:40:23 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l1TpX-0003Cl-0z; Mon, 18 Jan 2021 13:40:23 +0100
Message-ID: <4366a936909a3f33788719f00441e81b1f3576f7.camel@pengutronix.de>
Subject: Re: Coda: imx53 plays video with incorrect colors
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 18 Jan 2021 13:40:22 +0100
In-Reply-To: <CAOMZO5DCzodXDVygMfnhJi=DF3W64NZJQxLBT6LoOJ_V6NJ9Hg@mail.gmail.com>
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
         <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
         <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
         <CAOMZO5DBRGqn5DTsMG3RRHdN1HMo7CtP6HYw3PajK3A6Y6iCoQ@mail.gmail.com>
         <CAKQmDh-KgO4TameRQs_D3_rdW8n0oY-ZLmbsQzWQPOkUJdiObw@mail.gmail.com>
         <CAOMZO5DCzodXDVygMfnhJi=DF3W64NZJQxLBT6LoOJ_V6NJ9Hg@mail.gmail.com>
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

On Mon, 2021-01-18 at 07:57 -0300, Fabio Estevam wrote:
> Hi Philipp,
> 
> On Sun, Jan 17, 2021 at 10:18 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> 
> > At first sight there is nothing wrong from GStreamer happening. It
> > picks i420, pass it to KMS and it comes out wrong, first suspect
> > would be the display driver. Understand that yuv formats are often
> > unused and untested as most display server / compositer uses rgb
> > type of formats converting with GPU.

This is both a bug and a missing feature in the imx-drm driver. The
driver doesn't support color space conversion on the VGA output and
doesn't report that correctly.

> On i.MX53 I see this 'wrong color' behavior when playing videos into
> TVE as well as parallel display.
>
> Are you able to playback video successfully on i.MX53? If so, could
> you please share your Gstreamer pipeline?

I can reproduce this with

  gst-launch-1.0 videotestsrc ! video/x-raw,format=I420 ! kmssink

and the same for NV12 or YUY2. We are missing color space conversion on
the VGA output.

The IPU only supports color space conversion on one output via the DP.
This path is hard-coded to DI0 in the driver. The direct DC path to DI1,
which TVE/VGA is connected to, does not support CSC.

The driver could be modified to switch the DP->DI0/DC->DI1 mapping
around to DP->DI1/DC->DI0 when required. As a simple test, you can
switch statically with:

----------8<----------
diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index d166ee262ce4..f7c86ef0bed7 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1118,18 +1118,18 @@ static struct ipu_platform_reg client_reg[] = {
 	}, {
 		.pdata = {
 			.di = 0,
-			.dc = 5,
-			.dp = IPU_DP_FLOW_SYNC_BG,
-			.dma[0] = IPUV3_CHANNEL_MEM_BG_SYNC,
+			.dc = 1,
+			.dp = -EINVAL,
+			.dma[0] = IPUV3_CHANNEL_MEM_DC_SYNC,
 			.dma[1] = IPUV3_CHANNEL_MEM_FG_SYNC,
 		},
 		.name = "imx-ipuv3-crtc",
 	}, {
 		.pdata = {
 			.di = 1,
-			.dc = 1,
-			.dp = -EINVAL,
-			.dma[0] = IPUV3_CHANNEL_MEM_DC_SYNC,
+			.dc = 5,
+			.dp = IPU_DP_FLOW_SYNC_BG,
+			.dma[0] = IPUV3_CHANNEL_MEM_BG_SYNC,
 			.dma[1] = -EINVAL,
 		},
 		.name = "imx-ipuv3-crtc",
diff --git a/drivers/gpu/ipu-v3/ipu-dc.c b/drivers/gpu/ipu-v3/ipu-dc.c
index 34b4075a6a8e..0a7f48e4aa37 100644
--- a/drivers/gpu/ipu-v3/ipu-dc.c
+++ b/drivers/gpu/ipu-v3/ipu-dc.c
@@ -364,9 +364,9 @@ int ipu_dc_init(struct ipu_soc *ipu, struct device *dev,
 
 	writel(DC_WR_CH_CONF_WORD_SIZE_24 | DC_WR_CH_CONF_DISP_ID_PARALLEL(1) |
 			DC_WR_CH_CONF_PROG_DI_ID,
-			priv->channels[1].base + DC_WR_CH_CONF);
-	writel(DC_WR_CH_CONF_WORD_SIZE_24 | DC_WR_CH_CONF_DISP_ID_PARALLEL(0),
 			priv->channels[5].base + DC_WR_CH_CONF);
+	writel(DC_WR_CH_CONF_WORD_SIZE_24 | DC_WR_CH_CONF_DISP_ID_PARALLEL(0),
+			priv->channels[1].base + DC_WR_CH_CONF);
 
 	writel(DC_GEN_SYNC_1_6_SYNC | DC_GEN_SYNC_PRIORITY_1,
 		priv->dc_reg + DC_GEN);
---------->8----------

That should enable CSC (and overlay plane) on DI1, and lose it on DI0.

Or, as a workaround, add a v4l2convert element and use the IC to convert
to BGRx between decoder and kmssink.

regards
Philipp
