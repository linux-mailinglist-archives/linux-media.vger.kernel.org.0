Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1201F63A8B0
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 13:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiK1MqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 07:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiK1Mph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 07:45:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58D464EF
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 04:45:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46501501;
        Mon, 28 Nov 2022 13:45:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669639534;
        bh=OW3GfralmVGzVyG5fxsztIl89M0au1qu8wX5R7EFPNE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ubk/FtUf18c9QGERIlGDCryYdF5HKvkib60J05LgE+CBmNLlz71bfZMHHXuaYxm83
         rST9tSpD1Ksh7pdXEJVE0jVkq9TzkXZXGDCFv1rDTvAgtm6eS/NbQD4jOnTe2WKvve
         xHexkHZsTsQ6Sgbg2dMwBW36iYxhGmPy17zesLsg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221125153120.541298-1-petko.manolov@konsulko.com>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
Subject: Re: [PATCH v1 0/5] Adds media driver for Sony IMX492 sensor
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Petko Manolov <petko.manolov@konsulko.com>
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
Date:   Mon, 28 Nov 2022 12:45:32 +0000
Message-ID: <166963953216.1079859.6469563044691422088@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

What device/ISP are you testing this sensor on?

Quoting Petko Manolov (2022-11-25 15:31:15)
> This patch adds dt-bindings documentation, driver source, etc for Sony im=
x492
> image sensor.
>=20
> imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
> monochrome square pixel array and approximately 47.08 M effective pixels.=
 12-bit
> digital output makes it possible to output the signals with high definiti=
on for
> moving pictures. It is programmable through I2C interface. The I2C client
> address can be either 0x10 or 0x1a depending on SLASEL pin. Image data is=
 sent
> through MIPI CSI-2.
>=20
> Petko Manolov (5):
>   DT bindings for imx492
>   media: i2c: imx492: driver's header
>   media: i2c: imx492: driver's source
>   media: i2c: add imx492 config entry
>   media: i2c: add imx492 entry for make

Could you squash patches 2, 3, 4, and 5 into a single patch please?

Also - I think you'll need an entry in MAINTAINERS.

I can't see any reference to the selection controls:
 - V4L2_SEL_TGT_CROP_DEFAULT
 - V4L2_SEL_TGT_CROP
 - V4L2_SEL_TGT_CROP_BOUNDS

Do you have the datasheet or sufficient information to be able to
implement these controls?

--
Kieran

>  .../bindings/media/i2c/sony,imx492.yaml       |  101 ++
>  drivers/media/i2c/Kconfig                     |   14 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/imx492.c                    | 1092 +++++++++++++++++
>  drivers/media/i2c/imx492.h                    |  555 +++++++++
>  5 files changed, 1763 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx4=
92.yaml
>  create mode 100644 drivers/media/i2c/imx492.c
>  create mode 100644 drivers/media/i2c/imx492.h
>=20
> --=20
> 2.30.2
>
