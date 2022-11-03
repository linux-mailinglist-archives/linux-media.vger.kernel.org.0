Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A6C617910
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 09:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiKCIuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 04:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbiKCItx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 04:49:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE52465E9
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667465391; x=1699001391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CYZ3ra9cimQ1Zefgr41JiZ9J4AHA20j9rox6qTwfWC0=;
  b=Puo1iuARluA5VeDxBeAYgF1FkhY8uTH3qUXz17LvvM43gmZqpzilH1dQ
   hvBdysG9gyQAVnc49eH76QDZmherMmQCMCBI6kqabG89XF06u8fMSbNi/
   WmWtkY8MYVQWc8piPUiHKdzckD+zJspYnLJyZM/kI3DAyAahNt1EevpBp
   wzr5Bz+yioA2sFrGBuX9pdJqnk9/p7UxGEaspj+FPbw1XKq+S8C9afXXw
   26ICXJOYEbnb3AQrMW5O+UJnQd1ZFJudiTzUZBXDWCMqVi+i5TyWicjOZ
   Bf6NrRqDbcnvMelYvBlZGousHtk/mI7bNGp7yKAFc1eWDnnJnwU4BZZD/
   w==;
X-IronPort-AV: E=Sophos;i="5.95,235,1661810400"; 
   d="scan'208";a="27128722"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Nov 2022 09:49:49 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 03 Nov 2022 09:49:49 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 03 Nov 2022 09:49:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667465389; x=1699001389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CYZ3ra9cimQ1Zefgr41JiZ9J4AHA20j9rox6qTwfWC0=;
  b=qKb9ZL+dVfYWFrxm/ieee9gCRWFLpU0eKz9pbwNbZVLmjp7gnGM8dtbT
   zX7rfOaCiumiRdSwNgWB62iFYnT8ha4lMwTbSK1YkWJ7l05/j+pdna7Yd
   fp+giYd7DsgdH1j0RO52iTZmWcWQdLIbqvqMvz2AdgHi+84FRqStwiXYF
   +MzkVnEq7BBg17UFTX4IptLh+nExAcmDiPbhaaQq7U3ySZbhRMkX6yg82
   FfKSqCfmAQiv1VG+tSGpPwfV0IZVUY9q06xURwVtbiazZrXf/koFbb9f0
   vjkJjN0KhHb2PYiPA8gs5Ta6KyfnfzQWsCDJLlRxtU6f/ESj/jMbZ7Qz9
   w==;
X-IronPort-AV: E=Sophos;i="5.95,235,1661810400"; 
   d="scan'208";a="27128721"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Nov 2022 09:49:49 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 58542280056;
        Thu,  3 Nov 2022 09:49:49 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
Date:   Thu, 03 Nov 2022 09:49:48 +0100
Message-ID: <1925191.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <166733502982.3428399.14712580044445404450@Monstersaurus>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com> <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com> <166733502982.3428399.14712580044445404450@Monstersaurus>
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

Hi Kieran,

Am Dienstag, 1. November 2022, 21:37:09 CET schrieb Kieran Bingham:
> Hi Alex,
> 
> Quoting Dave Stevenson (2022-11-01 18:20:47)
> 
> > Hi Alexander
> > 
> > On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> > 
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi Dave,
> > > 
> > > thanks for the fast reply.
> > > 
> > > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > > Hi Alexander
> > > > 
> > > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> 
> <snip>
> 
> > > > > Using this series I was able to do some camera playback on LVDS
> > > > > display on
> > > > > imx8mm based platform (TQMa8MxML). My command was 'gst-launch-1.0
> > > > > v4l2src
> > > > > device=/dev/video0 ! video/x-
> > > > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 !
> > > > > videoconvert
> > > > > ! waylandsink'
> > > > > But due to SW colorspace conversion this is awfully slow.
> > > > > Using a testsink I get about 72FPS on 1280x720 for GREY. Is this to
> > > > > be
> > > > > expected?
> > > > > I used 'gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-
> > > > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 !
> > > > > fpsdisplaysink video-sink="testsink" text-overlay=false silent=false
> > > > > sync=false -v' for that.
> > > > 
> > > > AFAIK v4l2src doesn't map from a caps framerate=30/1 to the relevant
> > > > V4L2_CID_VBLANK and V4L2_CID_HBLANK controls used by raw sensors for
> > > > frame rate control (see docs at [1]). The sensor will therefore stream
> > > > at whatever rate the controls get left at.
> > > 
> > > Yes I noticed the framerate caps has no effect. But I lack some kind of
> > > reference system to decide what should work and what not.
> > 
> > As per the docs link, raw sensors will be using the HBLANK and VBLANK
> > controls, not VIDIOC_S_PARM.
> > I don't know whether the GStreamer folks wish to add support to
> > v4l2src to set those - libcamerasrc is going to be the more normal
> > user of these sensors, but that generally means needing an ISP of some
> > form. With just v4l2src you've got no AE / AGC control loops, so it is
> > only of use in controlled lighting conditions.
> > 
> > I don't know the full details of the imx8 range, but believe the
> > libcamera folk were working with one of the imx8 platforms.
> 
> We have the i.MX8MP working with the ISP available on that variant. I
> think we can also anticipate some support for other i.MX8 ranges with a
> GPU based 'ISP' in the (nearish) future, but I don't know what the
> timescales will be yet.

You are referring to (mainly) Paul Elder's patches to rkisp1, right? I noticed 
them, but didn't get a chance for testing.

I noticed that using 'glupload ! glcolorconvert ! glcolorscale ! 
glcolorconvert ! gldownload' in a gstreamer Pipeline for converting Y8/GREY to 
RGBA doesn't work, because mesa rejects creating appropriate EGL buffers due 
to lack of some hardware features.

Best regards,
Alexander



