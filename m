Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA3B542604
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 08:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382463AbiFHBEY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 21:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580912AbiFGXma (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 19:42:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73826243ED8;
        Tue,  7 Jun 2022 14:56:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B51E8895;
        Tue,  7 Jun 2022 23:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654638994;
        bh=8e+jILCgnnwJuUe2upSQaQdhfc29+TaDklo1e37/sec=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vUJXYVRYLI8ncfB8pKxzsyNZBVz3xEVOVJ/qZLb8mbJ+NY62zPSSXeNLbBP5ew1B0
         hQMWPJ+IXc1wkNV581cy1zo2PPVRhIi2VRiKbkwf15q616PSUZgyjVbYC/ZLwU4x4M
         pR4ZOORv+qZ4KqT+KG6TZ6o9sFrr7CxSkoboemsU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 0/2] Add imx577 compatible to imx412
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        daniele.alessandrelli@intel.com, devicetree@vger.kernel.org,
        jacopo@jmondi.org, linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.j.murphy@intel.com, sakari.ailus@iki.fi
Date:   Tue, 07 Jun 2022 22:56:32 +0100
Message-ID: <165463899225.186364.3363631428060807036@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Bryan O'Donoghue (2022-06-07 14:40:55)
> Right now the imx412 and imx577 are code and pin compatible however, they
> are distinct pieces of silicon.
>=20
> Document imx577 as a compatible enum and add the compat string to imx412.=
c.
> This allows us to differentiate these chips in DTS and potentially to app=
ly
> any future imx412 or imx577 specific changes appropriately.

While I think this is probably fine to get things working, there seems to
be quite a few extra features in the IMX577 [0] compared with the IMX412 [1=
].=20

[0] https://www.sony-semicon.co.jp/products/common/pdf/IMX412-AACK_Flyer03.=
pdf
[1] https://www.sony-semicon.co.jp/products/common/pdf/IMX577-AACK_Flyer.pdf

I certainly agree though that it's better to declare the camera
correctly in the DT - so it's better to add this support than 'fake' the
DT to say it's an IMX412 on the platform.


wdiff  /tmp/imx412 /tmp/imx577=20

[-IMX412-AACK-] {+IMX577-AACK+}
Diagonal 7.857 mm (Type 1/2.3) 12.3 Mega-Pixel CMOS Image Sensor with Square
Pixel for Color Cameras
Description

[-IMX412-AACK-]{+The IMX577-AACK+} is a diagonal 7.857 mm (Type 1/2.3)
12.3 Mega-pixel CMOS active pixel type stacked image sensor with a
square pixel array.

{+It adopts Sony=E2=80=99s Stacked CMOS Image Sensor technology to achieve =
high
speed image capturing by column parallel A/D converter circuits and high
sensitivity and low noise image (comparing with conventional CMOS image
sensor) through the backside illuminated imaging pixel structure.+}

R, G, and B pigment primary color mosaic filter is employed. It equips
an electronic shutter with variable integration time. It operates with
three power supply voltages: analog [-2.75-] {+2.8+} V, digital 1.05 V
and 1.8 V for input/output interface and achieves low power consumption.

[-(Applications: Surveillance cameras)-]

{+In addition, this product is designed for use in consumer use
camcorder. When using this for another application, Sony Semiconductor
Solutions Corporation does not guarantee the quality and reliability of
product. Therefore, don't use this for applications other than consumer
use camcorder.  In addition, individual specification change cannot be
supported because this is a standard product.  Consult your Sony
Semiconductor Solutions Corporation sales representative if you have any
questions.+}


Features
=E2=97=86 Back-illuminated and stacked CMOS image sensor
=E2=97=86 Digital Overlap High Dynamic Range (DOL-HDR) mode with raw data [=
-output-] {+output.+}
=E2=97=86 High signal to noise ratio [-(SNR)-] {+(SNR).+}
=E2=97=86 Full resolution @60 frame/s (Normal), 4K2K @60 frame/s (Normal), =
1080p @240 frame/s
Full resolution @40 frame/s (12 bit Normal), Full resolution @30 frame/s (D=
OL-HDR, 2 frame)
=E2=97=86 Output video format of [-RAW12/10-] {+RAW12/10/8, COMP8.+}
=E2=97=86 [-Low-] Power [-Streaming-] {+Save+} Mode with MIPI ULPS operation
=E2=97=86 Pixel binning readout and V sub-sampling [-function-] {+function.=
+}
=E2=97=86 Independent flipping and [-mirroring-] {+mirroring.+}
=E2=97=86 Input clock frequency [-6, 12, 18, 24 or-] {+6 to+} 27 MHz
=E2=97=86 CSI-2 serial data output (MIPI 2lane/4lane, Max. 2.1 Gbps/lane, D=
-PHY spec. ver. 1.2 compliant)
=E2=97=86 2-wire serial [-communication-] {+communication.+}
=E2=97=86 Two PLLs for independent clock generation for pixel control and d=
ata output [-interface-] {+interface.+}
=E2=97=86 Defect Pixel Correction (DPC)
=E2=97=86 {+Ambient Light Sensor (ALS)
=E2=97=86+} Fast mode [-transition-] {+transition.+} (on the fly)
=E2=97=86 Dual sensor synchronization operation (Multi camera compatible)
=E2=97=86 7 k bit of OTP ROM for [-users-] {+users.
=E2=97=86 Built-in temperature sensor+}
=E2=97=86 10-bit/12-bit A/D conversion on chip
=E2=97=86 Horizontal Low Power [-analog-] {+Analog+} Cropping
{+=E2=97=86 Window Scanning mode+}
=E2=97=86 92-pin high-precision ceramic package


So picking out the diffs from that:

IMX412
 - Designed for Surveillance cameras
 - Defined input clocks of 6, 12, 18, 24 or 27MHz

IMX577
 + Designed for Camcorder use cases
 + May have an extra RAW8, COMP8 output format.
 + Less definition on input clock '6 to 27MHz' (may be the same)
 + Has an Ambiant light sensor
 + Has Built in temperature sensor
 + Window scanning mode

The extra RAW modes, ALS and temperature sensor may be key
differentiators in the future to be aware of. Perhaps they can be
handled by the compatible string though.

If only we had better/more open drivers/documentation for these
components I bet they could be factored out for better support.

--
Kieran



>=20
> Bryan O'Donoghue (2):
>   media: dt-bindings: imx412: Add imx577 compatible string
>   media: i2c: imx412: Add imx577 compatible string
>=20
>  Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 5 ++++-
>  drivers/media/i2c/imx412.c                                   | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.36.1
>
