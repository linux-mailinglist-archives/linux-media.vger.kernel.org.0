Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142952FA4C0
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 16:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405920AbhARPak convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 Jan 2021 10:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405908AbhARPaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 10:30:35 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07B8C061573
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 07:29:54 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l1WTY-0007VF-Sm; Mon, 18 Jan 2021 16:29:52 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l1WTY-00038F-7Q; Mon, 18 Jan 2021 16:29:52 +0100
Message-ID: <180eccb13a035e6245da319b285c6cd622fb30ec.camel@pengutronix.de>
Subject: Re: Coda: imx53 plays video with incorrect colors
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 18 Jan 2021 16:29:52 +0100
In-Reply-To: <CAOMZO5CyDtEW4Uo3u9ANRro5fV4DBx3WLKDc_ok8HB41mNKF5w@mail.gmail.com>
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
         <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
         <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
         <CAOMZO5DBRGqn5DTsMG3RRHdN1HMo7CtP6HYw3PajK3A6Y6iCoQ@mail.gmail.com>
         <CAKQmDh-KgO4TameRQs_D3_rdW8n0oY-ZLmbsQzWQPOkUJdiObw@mail.gmail.com>
         <CAOMZO5DCzodXDVygMfnhJi=DF3W64NZJQxLBT6LoOJ_V6NJ9Hg@mail.gmail.com>
         <4366a936909a3f33788719f00441e81b1f3576f7.camel@pengutronix.de>
         <CAOMZO5CyDtEW4Uo3u9ANRro5fV4DBx3WLKDc_ok8HB41mNKF5w@mail.gmail.com>
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

On Mon, 2021-01-18 at 10:28 -0300, Fabio Estevam wrote:
> Hi Philipp,
> 
> Thanks for your reply.
> 
> On Mon, Jan 18, 2021 at 9:40 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > The driver could be modified to switch the DP->DI0/DC->DI1 mapping
> > around to DP->DI1/DC->DI0 when required. As a simple test, you can
> > switch statically with:
> 
> It does change the colors but still does not play the video with the
> correct colors. Looks like it plays in black-and-white now.

Please try forcing decoder output to NV12 instead of I420.

> > Or, as a workaround, add a v4l2convert element and use the IC to convert
> > to BGRx between decoder and kmssink.
> 
> Yes, I have tried to do this, but it says that v4l2convert does not
> support bt601 colorimetry, and then a segfault occurs:
> 
> # gst-launch-1.0 filesrc location=/media/clip.mp4 ! qtdemux !
> h264parse ! v4l2h264dec ! v4l2convert ! video/x-raw,format=BGRx !
> kmssink
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> ERROR: from element /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
> Device '/dev/video4' does not support bt601 colorimetry
> Additional debug info:
> ../sys/v4l2/gstv4l2object.c(4032): gst_v4l2_object_set_format_full ():
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
> Device wants 2:4:5:4 colorimetry
> ERROR: pipeline doesn't want to preroll.
> Setting pipeline to NULL ...
> Caught SIGSEGV
> exec gdb failed: No such file or directory
> Spinning.  Please run 'gdb gst-launch-1.0 217' to continue debugging,
> Ctrl-C to quit, or Ctrl-\ to dump core.
> 
> Is the Gstreamer pipeline above correct?

Yes. Please try if the following patch makes it work:

----------8<----------
From c45afcaf6fbef56a86dce19200c06df78718db60 Mon Sep 17 00:00:00 2001
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 18 Jan 2021 15:54:43 +0100
Subject: [PATCH] v4l2object: handle GST_VIDEO_TRANSFER_BT601

V4L2 makes no difference between the BT.601 and BT.709 transfer
functions [1], but GStreamer does since 1.18 [2].

Adapt gst_v4l2_object_get_colorspace() and
gst_v4l2_object_set_format_full().

[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-details.html#colorspace-smpte-170m-v4l2-colorspace-smpte170m
[2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/724
---
 sys/v4l2/gstv4l2object.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
index ea4363e17303..b13216d75836 100644
--- a/sys/v4l2/gstv4l2object.c
+++ b/sys/v4l2/gstv4l2object.c
@@ -2334,7 +2334,7 @@ gst_v4l2_object_get_colorspace (struct v4l2_format *fmt,
     case V4L2_COLORSPACE_SMPTE170M:
       cinfo->range = GST_VIDEO_COLOR_RANGE_16_235;
       cinfo->matrix = GST_VIDEO_COLOR_MATRIX_BT601;
-      cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
+      cinfo->transfer = GST_VIDEO_TRANSFER_BT601;
       cinfo->primaries = GST_VIDEO_COLOR_PRIMARIES_SMPTE170M;
       break;
     case V4L2_COLORSPACE_REC709:
@@ -2463,6 +2463,8 @@ gst_v4l2_object_get_colorspace (struct v4l2_format *fmt,
     case V4L2_XFER_FUNC_709:
       if (colorspace == V4L2_COLORSPACE_BT2020 && fmt->fmt.pix.height >= 2160)
         cinfo->transfer = GST_VIDEO_TRANSFER_BT2020_12;
+      else if (colorspace == V4L2_COLORSPACE_SMPTE170M)
+        cinfo->transfer = GST_VIDEO_TRANSFER_BT601;
       else
         cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
       break;
@@ -3855,6 +3857,7 @@ gst_v4l2_object_set_format_full (GstV4l2Object * v4l2object, GstCaps * caps,
     case GST_VIDEO_TRANSFER_GAMMA10:
       transfer = V4L2_XFER_FUNC_NONE;
       break;
+    case GST_VIDEO_TRANSFER_BT601:
     case GST_VIDEO_TRANSFER_BT2020_12:
     case GST_VIDEO_TRANSFER_BT709:
       transfer = V4L2_XFER_FUNC_709;
-- 
2.20.1
---------->8----------

This may not be the correct solution. GStreamer could keep choosing
BT709 as told by V4L2, and use the new
gst_video_color_transfer_is_equivalent() function to test for
equivalence instead.

regards
Philipp
