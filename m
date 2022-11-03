Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7445B617B27
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 11:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbiKCK51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 06:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiKCK5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 06:57:24 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C66210FC5
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 03:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667473042; x=1699009042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vqhCgwRmLPC76DB1XddAGfmP+VVOIZxlgMudBqiO4pw=;
  b=MYR6p7PZ7i5zbSAJw5wICrydv10eA42PuFG9e7uqzeNArcRql2bnH+6M
   UvihX/mL12c6Y1fXwKrYrk9dXKlZnp/cmy0GJNZNffHOZl06hUcU0K40D
   Zw8h3oAWXlyINnZGfmuG2p5ItNlh+Ua7fbKVhJfTDgZ+LWpofg+krxl+O
   vMAfnkKecgkH2D0sckEWcwZnCVCNemP4PSYjIM+KrXT6dntk6uQw8M1EH
   CV9Pe0ENP6AqbS+4/ZKqTI5HCIOKM5B3alfw25+T3kjM3vmNveIQKC59I
   u/POM6MlNdQ/jAQ9SY2rgzaPpafgYlLZTnb8jjTtbukCT+2eaC776CHkr
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,235,1661810400"; 
   d="scan'208";a="27134117"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Nov 2022 11:57:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 03 Nov 2022 11:57:20 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 03 Nov 2022 11:57:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667473040; x=1699009040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vqhCgwRmLPC76DB1XddAGfmP+VVOIZxlgMudBqiO4pw=;
  b=OPHG9zDI3n3stSuUr1J8aEUUQQblNlc3Y6J9/c6P7FkqanLBMSNuHlm/
   B1XvtljxGqN2fFVdHpGEl2ZkKLALGUxM0t7xoj3xT7mjYqfrzuDp/f8vi
   VCHDtZTrXUFczv4troWNg+FssLWjg+kNWNXwyqpakAgsLCuIIFX+LfQ2e
   kAK3wO6AkDU0hShUdtSe7ntLZKJoXqyCISDZzabLM8Cb2EyKdQOhbnQhk
   WNu3Wll2fL+nGj4PYeM8pwBAupvDyKrC2TvF1AOpItdO8f91ufPP/807x
   av7f/689OdqiwUwDSMuaAmqcyOfVcPE6Wf0g/eiUSAGP6x8W3PwGFcsXZ
   A==;
X-IronPort-AV: E=Sophos;i="5.95,235,1661810400"; 
   d="scan'208";a="27134116"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Nov 2022 11:57:20 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3D20E280056;
        Thu,  3 Nov 2022 11:57:20 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
Date:   Thu, 03 Nov 2022 11:57:18 +0100
Message-ID: <45253275.fMDQidcC6G@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <166746922961.3962897.16011022389812228597@Monstersaurus>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com> <1925191.VLH7GnMWUR@steina-w> <166746922961.3962897.16011022389812228597@Monstersaurus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 3. November 2022, 10:53:49 CET schrieb Kieran Bingham:
> Quoting Alexander Stein (2022-11-03 08:49:48)
> 
> > Hi Kieran,
> > 
> > Am Dienstag, 1. November 2022, 21:37:09 CET schrieb Kieran Bingham:
> > > Hi Alex,
> > > 
> > > Quoting Dave Stevenson (2022-11-01 18:20:47)
> > > 
> > > > Hi Alexander
> > > > 
> > > > On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> > > > 
> > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > Hi Dave,
> > > > > 
> > > > > thanks for the fast reply.
> > > > > 
> > > > > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > > > > Hi Alexander
> > > > > > 
> > > > > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> > > 
> > > <snip>
> > > 
> > > > > > > Using this series I was able to do some camera playback on LVDS
> > > > > > > display on
> > > > > > > imx8mm based platform (TQMa8MxML). My command was
> > > > > > > 'gst-launch-1.0
> > > > > > > v4l2src
> > > > > > > device=/dev/video0 ! video/x-
> > > > > > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 !
> > > > > > > videoconvert
> > > > > > > ! waylandsink'
> > > > > > > But due to SW colorspace conversion this is awfully slow.
> > > > > > > Using a testsink I get about 72FPS on 1280x720 for GREY. Is this
> > > > > > > to
> > > > > > > be
> > > > > > > expected?
> > > > > > > I used 'gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-
> > > > > > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 !
> > > > > > > fpsdisplaysink video-sink="testsink" text-overlay=false
> > > > > > > silent=false
> > > > > > > sync=false -v' for that.
> > > > > > 
> > > > > > AFAIK v4l2src doesn't map from a caps framerate=30/1 to the
> > > > > > relevant
> > > > > > V4L2_CID_VBLANK and V4L2_CID_HBLANK controls used by raw sensors
> > > > > > for
> > > > > > frame rate control (see docs at [1]). The sensor will therefore
> > > > > > stream
> > > > > > at whatever rate the controls get left at.
> > > > > 
> > > > > Yes I noticed the framerate caps has no effect. But I lack some kind
> > > > > of
> > > > > reference system to decide what should work and what not.
> > > > 
> > > > As per the docs link, raw sensors will be using the HBLANK and VBLANK
> > > > controls, not VIDIOC_S_PARM.
> > > > I don't know whether the GStreamer folks wish to add support to
> > > > v4l2src to set those - libcamerasrc is going to be the more normal
> > > > user of these sensors, but that generally means needing an ISP of some
> > > > form. With just v4l2src you've got no AE / AGC control loops, so it is
> > > > only of use in controlled lighting conditions.
> > > > 
> > > > I don't know the full details of the imx8 range, but believe the
> > > > libcamera folk were working with one of the imx8 platforms.
> > > 
> > > We have the i.MX8MP working with the ISP available on that variant. I
> > > think we can also anticipate some support for other i.MX8 ranges with a
> > > GPU based 'ISP' in the (nearish) future, but I don't know what the
> > > timescales will be yet.
> > 
> > You are referring to (mainly) Paul Elder's patches to rkisp1, right? I
> > noticed them, but didn't get a chance for testing.
> 
> Yes, that's right - but you can only test those on an i.MX8MP not an
> i.MX8MM as I understand it.

Yes, i.MX8MM does not have an ISP. Let's see if I get the chance to try on 
i.MX8MP.

> > I noticed that using 'glupload ! glcolorconvert ! glcolorscale !
> > glcolorconvert ! gldownload' in a gstreamer Pipeline for converting
> > Y8/GREY to RGBA doesn't work, because mesa rejects creating appropriate
> > EGL buffers due to lack of some hardware features.
> 
> I haven't looked into the gstreamer EGL side of things I'm afraid.

No worries, I noticed that GPU on i.MX8MM, BTW the only one in i.MX8M series, 
does not support OpenGLES3 which might be the cause I'm stuck here. But I do 
not want to dig in that rabbit hole even further :)

Best regards
Alexander


