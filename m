Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4468B4D4DAC
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 16:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbiCJPzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 10:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbiCJPza (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 10:55:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43891162BE
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 07:54:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CFD2491;
        Thu, 10 Mar 2022 16:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646927668;
        bh=Ec/xJ7ap2XvSpJEinBHHsGkF/Oc4dM2yWIfRyzTSNx8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YmamGNWxySPAW/TLPJ3/xQS6CCn/OGs/ZXWJu6H/KbBDmytbvS9FEzNYh6CXwRdwb
         VroghPYaQPx6h7RUXryTlVZ8sWyIZ3PZVYaxiaOW25req7NfFRercgd79Rz153DAJa
         JQIy1TWeaNTreAdXn8qjQldkkd6kdCz7r+JqR+Hc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntCPuF-LTmT9LZtMZ1e4V=wnRdP-PBcRbiJ5ZYvr3bNG7Q@mail.gmail.com>
References: <20220310133255.1946530-1-benjamin.mugnier@foss.st.com> <20220310133255.1946530-3-benjamin.mugnier@foss.st.com> <164692035967.11309.10108246176914754429@Monstersaurus> <CAPY8ntCPuF-LTmT9LZtMZ1e4V=wnRdP-PBcRbiJ5ZYvr3bNG7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VGXY61 camera sensor
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 10 Mar 2022 15:54:25 +0000
Message-ID: <164692766583.11309.9319105722541527169@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Quoting Dave Stevenson (2022-03-10 15:21:28)
> Hi Benjamin and Kieran
>=20
> On Thu, 10 Mar 2022 at 13:52, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> >
> > Hi Benjamin,
> >
> > Thank you for the patch -
> >
> > Quoting Benjamin Mugnier (2022-03-10 13:32:55)
> > > The VGXY61 has a quad lanes CSI-2 output port running at 800mbps per
> > > lane, and supports RAW8, RAW10, RAW12, RAW14 and RAW16 formats.
> > > The driver handles both sensor types:
> > > - VG5661 and VG6661: 1.6 Mpx (1464 x 1104) 75fps.
> > > - VG5761 and VG6761: 2.3 Mpx (1944 x 1204) 60 fps.
> > > The driver supports:
> > > - HDR linearize mode, HDR substraction mode, and no HDR
> > > - GPIOs LEDs strobing
> > > - Digital binning and analog subsampling
> > > - Horizontal and vertical flip
> > > - Manual exposure
> > > - Analog and digital gains
> > > - Test patterns
> >
> > I haven't reviewed the driver directly yet, but I have a script which
> > looks for key requirements for libcamera.
> > (https://git.linuxtv.org/libcamera.git/tree/Documentation/sensor_driver=
_requirements.rst)
> >
> >
> > Media Controller Support:
> >  - V4L2_SUBDEV_FL_HAS_DEVNODE      : found
> >  - MEDIA_ENT_F_CAM_SENSOR          : found
> >
> > Mandatory Controls:
> >  - V4L2_CID_EXPOSURE               : found
> >  - V4L2_CID_HBLANK                 : --------
> >  - V4L2_CID_VBLANK                 : --------
> >  - V4L2_CID_PIXEL_RATE             : found
> >
> > Selection Controls (will become mandatory):
> >  - V4L2_SEL_TGT_CROP_DEFAULT       : --------
> >  - V4L2_SEL_TGT_CROP               : --------
> >  - V4L2_SEL_TGT_CROP_BOUNDS        : --------
> >  - .get_selection                  : --------
> >
> > Optional Controls:
> >  - V4L2_CID_TEST_PATTERN           : found
> >  - V4L2_CID_GAIN                   : --------
> >  - V4L2_CID_ANALOGUE_GAIN          : found
> >  - V4L2_CID_CAMERA_SENSOR_ROTATION : --------
> >  - V4L2_CID_CAMERA_ORIENTATION     : --------
> >
> >
> > The key missing pieces are HBLANK/VBLANK and the .get_selection API. Is
> > it easy/feasible to add these?
>=20
> It's documented that HBLANK/VBLANK are the correct parameters to use
> for raw image sensors [1].
>=20
> It looks like register DEVICE_FRAME_LENGTH is mode->height +
> V4L2_CID_VBLANK, and DEVICE_LINE_LENGTH is mode->width +
> V4L2_CID_HBLANK (appears to be treated as read only)
> Most other sensors will adjust the max value of V4L2_CID_EXPOSURE
> based on the frame length.
>=20
> [1] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor=
.html#frame-interval-configuration

Aha, Thanks - I hadn't realised it was 'formally' required by the
kernel, so I was trying to be more gentle. I'll be more assertive on
those now ;-) and I've added the reference to my review script.

--
Kieran
