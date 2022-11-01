Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827FF615363
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 21:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiKAUhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 16:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiKAUhP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 16:37:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA2A101DE
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 13:37:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BBEE496;
        Tue,  1 Nov 2022 21:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667335032;
        bh=MXg5mRWj8rPIwsboHC0vgv49h4Sk/WWm9Tk1+X6lpU0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mqM7OBQk0fPLlgGyTDazhTyKcSBgGh1DFpoxLLURgfJzvm6KW5CQ6yZUop/42ycr8
         KrPl+5MU/XpflLD0ViNhY7+0GTBs/rVfxrqv5Sm4SP1qxvSketxVSyk88lzV0K6+Mk
         3SYGNRkSzLJJklAR2RczcaDwf/JPCCYUFClttuXI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com> <3198230.aeNJFYEL58@steina-w> <CAPY8ntAjeyqxT0e+YPkCKm79YuvbLc4nU6qj8pGmMQ06QDp1+w@mail.gmail.com> <1742759.VLH7GnMWUR@steina-w> <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 01 Nov 2022 20:37:09 +0000
Message-ID: <166733502982.3428399.14712580044445404450@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

Quoting Dave Stevenson (2022-11-01 18:20:47)
> Hi Alexander
>=20
> On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi Dave,
> >
> > thanks for the fast reply.
> >
> > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > Hi Alexander
> > >
> > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> > >

<snip>

> > > >
> > > > Using this series I was able to do some camera playback on LVDS dis=
play on
> > > > imx8mm based platform (TQMa8MxML). My command was 'gst-launch-1.0 v=
4l2src
> > > > device=3D/dev/video0 ! video/x-
> > > > raw,format=3DGRAY8,bpp=3D8,width=3D1280,height=3D720,framerate=3D30=
/1 ! videoconvert
> > > > ! waylandsink'
> > > > But due to SW colorspace conversion this is awfully slow.
> > > > Using a testsink I get about 72FPS on 1280x720 for GREY. Is this to=
 be
> > > > expected?
> > > > I used 'gst-launch-1.0 v4l2src device=3D/dev/video0 ! video/x-
> > > > raw,format=3DGRAY8,bpp=3D8,width=3D1280,height=3D720,framerate=3D30=
/1 !
> > > > fpsdisplaysink video-sink=3D"testsink" text-overlay=3Dfalse silent=
=3Dfalse
> > > > sync=3Dfalse -v' for that.
> > > AFAIK v4l2src doesn't map from a caps framerate=3D30/1 to the relevant
> > > V4L2_CID_VBLANK and V4L2_CID_HBLANK controls used by raw sensors for
> > > frame rate control (see docs at [1]). The sensor will therefore stream
> > > at whatever rate the controls get left at.
> >
> > Yes I noticed the framerate caps has no effect. But I lack some kind of
> > reference system to decide what should work and what not.
>=20
> As per the docs link, raw sensors will be using the HBLANK and VBLANK
> controls, not VIDIOC_S_PARM.
> I don't know whether the GStreamer folks wish to add support to
> v4l2src to set those - libcamerasrc is going to be the more normal
> user of these sensors, but that generally means needing an ISP of some
> form. With just v4l2src you've got no AE / AGC control loops, so it is
> only of use in controlled lighting conditions.
>=20
> I don't know the full details of the imx8 range, but believe the
> libcamera folk were working with one of the imx8 platforms.

We have the i.MX8MP working with the ISP available on that variant. I
think we can also anticipate some support for other i.MX8 ranges with a
GPU based 'ISP' in the (nearish) future, but I don't know what the
timescales will be yet.

--
Kieran
