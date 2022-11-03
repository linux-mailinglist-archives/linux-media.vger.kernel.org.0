Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5DA7617A48
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 10:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiKCJyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 05:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiKCJyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 05:54:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F04910049
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 02:53:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2465589;
        Thu,  3 Nov 2022 10:53:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667469232;
        bh=x4w4PejE2zWVD8zgoVnf4um2C3OBeTL1iG4JZ07AKCE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jxvIN679MXbAJxBm0eOvn9KRlPUdUHCyDgyjDWz2iJuQbbtoGFvwKAoKZ99saZCA5
         1ei7xZvx5Bq9qzL0oqy5VH3mt7JI7Wq20qwm99hYoaQQl4TTfl+AlWXH6lz1S95fmm
         VUKOjEqIAWFCsZi0tpvbCUtI9x9J5r8rjS2wIFNc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1925191.VLH7GnMWUR@steina-w>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com> <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com> <166733502982.3428399.14712580044445404450@Monstersaurus> <1925191.VLH7GnMWUR@steina-w>
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Date:   Thu, 03 Nov 2022 09:53:49 +0000
Message-ID: <166746922961.3962897.16011022389812228597@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Alexander Stein (2022-11-03 08:49:48)
> Hi Kieran,
>=20
> Am Dienstag, 1. November 2022, 21:37:09 CET schrieb Kieran Bingham:
> > Hi Alex,
> >=20
> > Quoting Dave Stevenson (2022-11-01 18:20:47)
> >=20
> > > Hi Alexander
> > >=20
> > > On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> > >=20
> > > <alexander.stein@ew.tq-group.com> wrote:
> > > > Hi Dave,
> > > >=20
> > > > thanks for the fast reply.
> > > >=20
> > > > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > > > Hi Alexander
> > > > >=20
> > > > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> >=20
> > <snip>
> >=20
> > > > > > Using this series I was able to do some camera playback on LVDS
> > > > > > display on
> > > > > > imx8mm based platform (TQMa8MxML). My command was 'gst-launch-1=
.0
> > > > > > v4l2src
> > > > > > device=3D/dev/video0 ! video/x-
> > > > > > raw,format=3DGRAY8,bpp=3D8,width=3D1280,height=3D720,framerate=
=3D30/1 !
> > > > > > videoconvert
> > > > > > ! waylandsink'
> > > > > > But due to SW colorspace conversion this is awfully slow.
> > > > > > Using a testsink I get about 72FPS on 1280x720 for GREY. Is thi=
s to
> > > > > > be
> > > > > > expected?
> > > > > > I used 'gst-launch-1.0 v4l2src device=3D/dev/video0 ! video/x-
> > > > > > raw,format=3DGRAY8,bpp=3D8,width=3D1280,height=3D720,framerate=
=3D30/1 !
> > > > > > fpsdisplaysink video-sink=3D"testsink" text-overlay=3Dfalse sil=
ent=3Dfalse
> > > > > > sync=3Dfalse -v' for that.
> > > > >=20
> > > > > AFAIK v4l2src doesn't map from a caps framerate=3D30/1 to the rel=
evant
> > > > > V4L2_CID_VBLANK and V4L2_CID_HBLANK controls used by raw sensors =
for
> > > > > frame rate control (see docs at [1]). The sensor will therefore s=
tream
> > > > > at whatever rate the controls get left at.
> > > >=20
> > > > Yes I noticed the framerate caps has no effect. But I lack some kin=
d of
> > > > reference system to decide what should work and what not.
> > >=20
> > > As per the docs link, raw sensors will be using the HBLANK and VBLANK
> > > controls, not VIDIOC_S_PARM.
> > > I don't know whether the GStreamer folks wish to add support to
> > > v4l2src to set those - libcamerasrc is going to be the more normal
> > > user of these sensors, but that generally means needing an ISP of some
> > > form. With just v4l2src you've got no AE / AGC control loops, so it is
> > > only of use in controlled lighting conditions.
> > >=20
> > > I don't know the full details of the imx8 range, but believe the
> > > libcamera folk were working with one of the imx8 platforms.
> >=20
> > We have the i.MX8MP working with the ISP available on that variant. I
> > think we can also anticipate some support for other i.MX8 ranges with a
> > GPU based 'ISP' in the (nearish) future, but I don't know what the
> > timescales will be yet.
>=20
> You are referring to (mainly) Paul Elder's patches to rkisp1, right? I no=
ticed=20
> them, but didn't get a chance for testing.

Yes, that's right - but you can only test those on an i.MX8MP not an
i.MX8MM as I understand it.

> I noticed that using 'glupload ! glcolorconvert ! glcolorscale !=20
> glcolorconvert ! gldownload' in a gstreamer Pipeline for converting Y8/GR=
EY to=20
> RGBA doesn't work, because mesa rejects creating appropriate EGL buffers =
due=20
> to lack of some hardware features.

I haven't looked into the gstreamer EGL side of things I'm afraid.

--
Kieran


>=20
> Best regards,
> Alexander
>=20
>=20
>
