Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C50521EEB
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346014AbiEJPik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345906AbiEJPhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:37:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E6C8FD70
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:33:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1589B60;
        Tue, 10 May 2022 17:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652196805;
        bh=b87RPzBWytaScMIZuoFpmI3sX0hE2afq98waikeQSTA=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=MYkDcGdtDeZuR1Ww1NL871bFSTfA5YTMLmXEXG9102eA1b4GSuq+MVbpgEa5oP8w/
         p8qOCe0WQQXHKeYj5M038J+0wdjKsTTtwESsghB3WOAuqjFyPmxJCJ7XVMWTKL/2Vi
         wr0Wz+qYvX+qH/Qw06hF5HqfiIBetorDS7768MFo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <908eb507-677c-359e-154b-da3a7147af0d@beam.ltd.uk>
References: <908eb507-677c-359e-154b-da3a7147af0d@beam.ltd.uk>
Subject: Re: Video4Linux: Call an I2C subdev function to start a stream after a CSI2 driver has been started
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Terry Barnaby <terry1@beam.ltd.uk>, linux-media@vger.kernel.org
Date:   Tue, 10 May 2022 16:33:23 +0100
Message-ID: <165219680369.2416244.9210617082672091187@Monstersaurus>
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

Quoting Terry Barnaby (2022-05-10 14:35:38)
> Hi,
>=20
> We are working on a system that uses a NXP IMX8MP SOC with a TP2855=20
> analogue video front end chip that can capture 1920x1080p25 or PAL=20
> 720x576i25 analogue video streams which is generally working using=20
> gstreamer as the higher level software driving this.
>=20
> We have an intermittent video stream start up problem which we believe=20
> is down to:
>=20
> 1. The TP2855 is initialised first and its subdev *_s_stream() call is=20
> called to start the video input.
>=20
> 2. The NXP CSI2 video input hardware is then started:=20
> imx8-mipi-csi2-sam.c: mipi_csis_s_stream().

I don't think I can see this file in the latest linux sources. Are you
working on an out of tree BSP driver supported by a vendor?

If so - you might be able to contact them directly for support, but if
we don't have the source code it can be hard to support your issue.

--
Regards

Kieran


>=20
> 3. The TP2855 enables the CSI2 clock after its *_s_stream() call,=20
> probably in hardware after its PLL's have locked, by sending a CSI2=20
> start sequence on the CSI2 clock pair. This clock is then a continuous=20
> clock ie. it does not go into low power mode during horizontal/vertical=20
> blanking.
>=20
> 4. The NXP CSI2 video input hardware, based on some Samsung IP, does not =

> see the CSI2 clock unless it sees the CSI2 start sequence and depending=20
> on timings it may not see this at video pipeline startup and we get not=20
> video stream from the CSI2 hardware.
>=20
> I was hoping the subdev *_s_stream() call would be after all of the=20
> hardware's pipeline was setup so I could instigate a CSI2 clock restart=20
> in the TP2855 driver, but unfortunately this is called before the CSI2=20
> hardware is setup.
>=20
> I can add a one shot timer to do this in the TP2855 subdev *_s_stream()=20
> call, but obviously this is not ideal. Is there anyway to get a subdev=20
> function called in the video4linux API automatically once all of the=20
> video streams hardware is setup ?
>=20
> Any ideas/recommendations ?
>=20
> Terry
>=20
>
