Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4AA522ABF
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 06:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbiEKEQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 00:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbiEKEQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 00:16:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A097D2CDE5
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 21:16:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1C17824;
        Wed, 11 May 2022 06:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652242590;
        bh=qTzgAsXVwdfyLbCBPOSywNqljxuM4ol/gkTeaMRJp98=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=rmjdJAhCcU4DhvLocId+tz/8tLheNh4wFc4TZrhPDbLmzrX/yWA9OlJh7Oenw6sUV
         Lc764HP0JSa9mfd2l45ECVnUZjLMB4VqlZbBXz8b6+9M3cmYzB2I8jQhPwjFMZ7824
         KTYu76665TuJjw8UIvtGO9J6V5yeQm2t+2oDuT7M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4048baf9-2a4a-8f8e-5457-16bf06868597@beam.ltd.uk>
References: <908eb507-677c-359e-154b-da3a7147af0d@beam.ltd.uk> <165219680369.2416244.9210617082672091187@Monstersaurus> <4048baf9-2a4a-8f8e-5457-16bf06868597@beam.ltd.uk>
Subject: Re: Video4Linux: Call an I2C subdev function to start a stream after a CSI2 driver has been started
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Terry Barnaby <terry1@beam.ltd.uk>, linux-media@vger.kernel.org
Date:   Wed, 11 May 2022 05:16:28 +0100
Message-ID: <165224258874.1217485.3967333726403014856@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Terry,

Quoting Terry Barnaby (2022-05-10 17:01:28)
> On 10/05/2022 16:33, Kieran Bingham wrote:
> > Hi Terry,
> >
> > Quoting Terry Barnaby (2022-05-10 14:35:38)
> >> Hi,
> >>
> >> We are working on a system that uses a NXP IMX8MP SOC with a TP2855
> >> analogue video front end chip that can capture 1920x1080p25 or PAL
> >> 720x576i25 analogue video streams which is generally working using
> >> gstreamer as the higher level software driving this.
> >>
> >> We have an intermittent video stream start up problem which we believe
> >> is down to:
> >>
> >> 1. The TP2855 is initialised first and its subdev *_s_stream() call is
> >> called to start the video input.
> >>
> >> 2. The NXP CSI2 video input hardware is then started:
> >> imx8-mipi-csi2-sam.c: mipi_csis_s_stream().
> > I don't think I can see this file in the latest linux sources. Are you
> > working on an out of tree BSP driver supported by a vendor?
> >
> > If so - you might be able to contact them directly for support, but if
> > we don't have the source code it can be hard to support your issue.
> >
> > --
> > Regards
> >
> > Kieran
>=20
> Sorry, top posted in previous email (all different groups methods). I=20
> have repeated my response here.
>=20
> Hi Kiera,
>=20
> Thanks for you response. Yes its from the NXP Yocto distribution with=20
> kernel at: git://source.codeaurora.org/external/imx/linux-imx.git
>=20
> But I wasn't after specific information/help with this platform, I was=20
> really trying to find out if there is a mechanism within the=20
> mainline/standard Video4Linux kernel API's such that a video front end=20
> subdev can get some function called once the video pipeline has been=20
> setup ie. All hardware modules configured and ready to run a video stream.
>=20
> For example there is the s_stream() function pointer in=20
> v4l2_subdev_video_ops, but that function is called before the later (in=20
> pipeline) CSI2 module is started and I need a function to be called=20
> after all of the pipelines hardware has been initialised to get around=20
> this hardware feature/issue.

There's quite a distinction between 'ready to run a stream' ... and
'running a stream', and your description below references actions that
occur in out of tree drivers, so it's not possible to get a clear
picture here of what is really happening without extending support to an
out of tree vendor driver.

The v4l2_async_notifier framework allows hooks that know when the
pipeline is 'ready to run a stream' if I understand your statements
correctly, but the mention of s_stream() makes me wonder if you're
trying to do something /after/ you have started the stream.

--
Kieran



>=20
> Terry
>=20
> >
> >
> >> 3. The TP2855 enables the CSI2 clock after its *_s_stream() call,
> >> probably in hardware after its PLL's have locked, by sending a CSI2
> >> start sequence on the CSI2 clock pair. This clock is then a continuous
> >> clock ie. it does not go into low power mode during horizontal/vertical
> >> blanking.
> >>
> >> 4. The NXP CSI2 video input hardware, based on some Samsung IP, does n=
ot
> >> see the CSI2 clock unless it sees the CSI2 start sequence and depending
> >> on timings it may not see this at video pipeline startup and we get not
> >> video stream from the CSI2 hardware.
> >>
> >> I was hoping the subdev *_s_stream() call would be after all of the
> >> hardware's pipeline was setup so I could instigate a CSI2 clock restart
> >> in the TP2855 driver, but unfortunately this is called before the CSI2
> >> hardware is setup.
> >>
> >> I can add a one shot timer to do this in the TP2855 subdev *_s_stream()
> >> call, but obviously this is not ideal. Is there anyway to get a subdev
> >> function called in the video4linux API automatically once all of the
> >> video streams hardware is setup ?
> >>
> >> Any ideas/recommendations ?
> >>
> >> Terry
> >>
> >>
>
