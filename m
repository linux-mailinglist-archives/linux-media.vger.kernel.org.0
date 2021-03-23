Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56BA345AC0
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 10:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCWJYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 05:24:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:47594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229949AbhCWJYZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 05:24:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D735619B8;
        Tue, 23 Mar 2021 09:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616491465;
        bh=b8nyE6EXK9y6CBQPOEc6v6OS4DLL3wR0SYJ59ifs+oc=;
        h=Date:From:To:Cc:Subject:From;
        b=B434dypRKKOft4Z2JRtKZV86aFXLrqho5XIdnoa5IS9kyLMZa+rtGbz4Z9pT/eAVB
         uJMcANgZzrAw1VSi07oUsR2sqWJaN2JKeNdRB/QeDGLgsyn7m5N4S1FIKlzPQfCuuD
         Bl7LZPo15qkh7RKAWwGKSto/kG4Kk6OJY460pP62+j8n77bUQa41suyoyNOnKSatIM
         jUOTM7hZee8EAdEhvFOvK/GZeyu1w03eum0vq1Pn3Kd6AteESc7N7VkvuYpGjcU2CD
         wKy9dDjhuCBHla4dI6RMRGPda2vNkgwlQW5pWjmOH/HUfN8vtsTRrdHl4LnLqi03ZD
         dP2wxjIq+SGOg==
Date:   Tue, 23 Mar 2021 10:24:19 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     LMML <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hansverk@cisco.com>, Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Silvester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Status of the patches under review at LMML (740 patches)
Message-ID: <20210323102419.412e6866@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is the summary of the patches that are currently under review at
Linux Media Mailing List <linux-media@vger.kernel.org>.
Each patch is represented by its submission date, the subject (up to 70
chars) and the patchwork link (if submitted via email).

P.S.: This email is c/c to the developers where some action is expected.
      If you were copied, please review the patches, acking/nacking or
      submitting an update.

Number of pending patches per reviewer:
  259  patches delegated to Nobody                                         =
                        Since: Aug,13 2020
  156  patches delegated to Hans Verkuil <hansverk@cisco.com>              =
                        Since: Oct, 8 2018
  136  patches delegated to Laurent Pinchart <laurent.pinchart@ideasonboard=
.com>                   Since: Aug,30 2013
  85   patches delegated to Stanimir Varbanov <stanimir.varbanov@linaro.org=
>                       Since: Feb,18 2020
  71   patches delegated to Sakari Ailus <sakari.ailus@iki.fi>             =
                        Since: Apr,16 2016
  21   patches delegated to Sean Young <sean@mess.org>                     =
                        Since: Jan,15 2018
  11   patches delegated to Mauro Carvalho Chehab <mchehab@kernel.org>     =
                        Since: Jan,14 2015
  1    patches delegated to Silvester Nawrocki <sylvester.nawrocki@gmail.co=
m>                      Since: Mar,23 2021


  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D New patches =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Aug,13 2020, from Lukas Middendorf <kernel@tuxforce.de>:
	media: si2168: request caching of firmware to make it available on res
	http://patchwork.linuxtv.org/patch/66188=20
=09
  Aug,13 2020, from Lukas Middendorf <kernel@tuxforce.de>:
	media: si2168: also cache Si2168 B40 fallback firmware               =20
	http://patchwork.linuxtv.org/patch/66189=20
=09
  Sep,16 2020, from Marius Liebeton <amki@amki.eu>:
	[WIP] Fixing dvbv5-scan unicable support                             =20
	http://patchwork.linuxtv.org/patch/67045=20
=09
  Oct, 7 2020, from Arnd Bergmann <arnd@arndb.de>:
	media: atomisp: stop compiling compat_ioctl32 code                   =20
	http://patchwork.linuxtv.org/patch/67865=20
=09
  Oct, 9 2020, from Bogdan Togorean <bogdan.togorean@analog.com>:
	media: i2c: Add driver for the Analog Devices ADDI9036 ToF front-end =20
	http://patchwork.linuxtv.org/patch/67927=20
=09
  Oct, 9 2020, from Bogdan Togorean <bogdan.togorean@analog.com>:
	media: dt-bindings: media: i2c: Add bindings for ADDI9036            =20
	http://patchwork.linuxtv.org/patch/67928=20
=09
  Oct,31 2020, from Andrew Benham <andrew.benham@adsb.co.uk>:
	dvb-apps: Add option for UK channel numbering in ZAP format          =20
	http://patchwork.linuxtv.org/patch/68478=20
=09
  Nov,27 2020, from AngeloGioacchino Del Regno <kholk11@gmail.com>:
	media: dt-bindings: media: i2c: Add IMX300 CMOS sensor binding       =20
	http://patchwork.linuxtv.org/patch/69467=20
=09
  Nov,27 2020, from AngeloGioacchino Del Regno <kholk11@gmail.com>:
	media: i2c: Add driver for the Sony Exmor-RS IMX300 camera sensor    =20
	http://patchwork.linuxtv.org/patch/69469=20
=09
  Nov,22 2020, from jboero <boeroboy@gmail.com>:
	USBCore NULL interface deref fix                                     =20
	http://patchwork.linuxtv.org/patch/69532=20
=09
  Dec, 4 2020, from Zhen Lei <thunder.leizhen@huawei.com>:
	media: dt-bindings: add the required property 'additionalProperties' =20
	http://patchwork.linuxtv.org/patch/69757=20
=09
  Dec,14 2020, from Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>:
	media: atomisp: Remove defines                                       =20
	http://patchwork.linuxtv.org/patch/70016=20
=09
  Dec,14 2020, from Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>:
	media: atomisp: Fix LOGICAL_CONTINUATIONS                            =20
	http://patchwork.linuxtv.org/patch/70023=20
=09
  Dec,17 2020, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: Add support for the V3U VSPD                            =20
	http://patchwork.linuxtv.org/patch/70109=20
=09
  Dec,17 2020, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	[RFC]: media: vsp1: Add support for the V3U VSPX                     =20
	http://patchwork.linuxtv.org/patch/70110=20
=09
  Dec,28 2020, from Hans Petter Selasky <hps@selasky.org>:
	Bad IOCTLs - time to fix them?                                       =20
	http://patchwork.linuxtv.org/patch/70287=20
=09
  Jan, 6 2021, from Jernej Skrabec <jernej.skrabec@siol.net>:
	dt-bindings: media: Add Allwinner R40 deinterlace compatible         =20
	http://patchwork.linuxtv.org/patch/70523=20
=09
  Jan, 6 2021, from Jernej Skrabec <jernej.skrabec@siol.net>:
	ARM: dts: sun8i: r40: Add deinterlace node                           =20
	http://patchwork.linuxtv.org/patch/70524=20
=09
  Jan, 6 2021, from Jernej Skrabec <jernej.skrabec@siol.net>:
	arm64: dts: allwinner: h5: Add deinterlace node                      =20
	http://patchwork.linuxtv.org/patch/70525=20
=09
  Jan,14 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: drm: Split vsp1_du_setup_lif()                          =20
	http://patchwork.linuxtv.org/patch/70756=20
=09
  Jan,14 2021, from Laurent Pinchart <laurent.pinchart+renesas@ideasonboard=
.com>:
	media: vsp1: drm: Don't configure hardware when the pipeline is disabl
	http://patchwork.linuxtv.org/patch/70757=20
=09
  Jan,14 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Convert to the new VSP atomic API                      =20
	http://patchwork.linuxtv.org/patch/70758=20
=09
  Jan,14 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Provide for_each_group helper                          =20
	http://patchwork.linuxtv.org/patch/70760=20
=09
  Jan,14 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Create a group state object                            =20
	http://patchwork.linuxtv.org/patch/70761=20
=09
  Jan,14 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Handle CRTC standby from commit tail handler           =20
	http://patchwork.linuxtv.org/patch/70762=20
=09
  Jan,14 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Handle CRTC configuration from commit tail handler     =20
	http://patchwork.linuxtv.org/patch/70763=20
=09
  Jan,14 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Perform group setup from the atomic tail handler       =20
	http://patchwork.linuxtv.org/patch/70764=20
=09
  Jan,14 2021, from Laurent Pinchart <laurent.pinchart+renesas@ideasonboard=
.com>:
	drm: rcar-du: Centralise routing configuration in commit tail handler=20
	http://patchwork.linuxtv.org/patch/70765=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	docs: phy: Add a part about PHY mode and submode                     =20
	http://patchwork.linuxtv.org/patch/70830=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	media: sun6i-csi: Only configure the interface data width for parallel
	http://patchwork.linuxtv.org/patch/70831=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	dt-bindings: media: Add A31 MIPI CSI-2 bindings documentation        =20
	http://patchwork.linuxtv.org/patch/70832=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	media: sun6i-csi: Add support for MIPI CSI-2 bridge input            =20
	http://patchwork.linuxtv.org/patch/70833=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	media: sunxi: Add support for the A31 MIPI CSI-2 controller          =20
	http://patchwork.linuxtv.org/patch/70834=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	MAINTAINERS: Add entry for the Allwinner A31 MIPI CSI-2 bridge       =20
	http://patchwork.linuxtv.org/patch/70835=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support               =20
	http://patchwork.linuxtv.org/patch/70836=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	media: sunxi: Add support for the A83T MIPI CSI-2 controller         =20
	http://patchwork.linuxtv.org/patch/70837=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node                =20
	http://patchwork.linuxtv.org/patch/70838=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	MAINTAINERS: Add entry for the Allwinner A83T MIPI CSI-2 bridge      =20
	http://patchwork.linuxtv.org/patch/70839=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	dt-bindings: media: Add A83T MIPI CSI-2 bindings documentation       =20
	http://patchwork.linuxtv.org/patch/70840=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port         =20
	http://patchwork.linuxtv.org/patch/70841=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	media: sun6i-csi: Use common V4L2 format info for storage bpp        =20
	http://patchwork.linuxtv.org/patch/70842=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	media: sun6i-csi: Stop using the deprecated fwnode endpoint parser   =20
	http://patchwork.linuxtv.org/patch/70843=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI CS
	http://patchwork.linuxtv.org/patch/70844=20
=09
  Jan,15 2021, from Paul Kocialkowski <paul.kocialkowski@bootlin.com>:
	phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes      =20
	http://patchwork.linuxtv.org/patch/70846=20
=09
  Jan,23 2021, from Simon Arlott <v4l@octiron.net>:
	dvbv5-zap: Record all the channel video/audio/other PIDs             =20
	http://patchwork.linuxtv.org/patch/71045=20
=09
  Jan,23 2021, from Simon Arlott <v4l@octiron.net>:
	libdvbv5: Read all "other" PIDs for channels                         =20
	http://patchwork.linuxtv.org/patch/71046=20
=09
  Jan,30 2021, from Sebastian Fricke <sebastian.fricke@posteo.net>:
	media: i2c: OV13850 image sensor support                             =20
	http://patchwork.linuxtv.org/patch/71206=20
=09
  Feb, 5 2021, from Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.=
com>:
	media: intel-ipu3: Specify CCM values precision                      =20
	http://patchwork.linuxtv.org/patch/71341=20
=09
  Feb,10 2021, from Stefan Seyfried <seife+dev@b1-systems.com>:
	dvb-scan: fix DVB-S/S2 type reporting                                =20
	http://patchwork.linuxtv.org/patch/71406=20
=09
  Feb,11 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	ACPI: Add a convenience function to tell a device is in D0 state     =20
	http://patchwork.linuxtv.org/patch/71414=20
=09
  Feb,11 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	ACPI: scan: Obtain device's desired enumeration power state          =20
	http://patchwork.linuxtv.org/patch/71416=20
=09
  Feb,11 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	Documentation: ACPI: Document _DSE object usage for enum power state =20
	http://patchwork.linuxtv.org/patch/71417=20
=09
  Feb,11 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	i2c: Allow an ACPI driver to manage the device's power state during pr
	http://patchwork.linuxtv.org/patch/71418=20
=09
  Feb,11 2021, from Rajmohan Mani <rajmohan.mani@intel.com>:
	media: i2c: imx319: Support device probe in non-zero ACPI D state    =20
	http://patchwork.linuxtv.org/patch/71419=20
=09
  Feb,11 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	at24: Support probing while in non-zero ACPI D state                 =20
	http://patchwork.linuxtv.org/patch/71420=20
=09
  Feb,11 2021, from Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
	x86/platform/intel-mid: Get rid of intel_scu_ipc_legacy.h            =20
	http://patchwork.linuxtv.org/patch/71435=20
=09
  Feb,15 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	ipu3-cio2: Fix pixel-rate derived link frequency                     =20
	http://patchwork.linuxtv.org/patch/71530=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Embedded 'serializer' field                     =20
	http://patchwork.linuxtv.org/patch/71549=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Report camera module name                       =20
	http://patchwork.linuxtv.org/patch/71550=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Enable noise immunity                           =20
	http://patchwork.linuxtv.org/patch/71551=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Check return values                             =20
	http://patchwork.linuxtv.org/patch/71552=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Replace goto with a loop                        =20
	http://patchwork.linuxtv.org/patch/71553=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Re-work ov10635 reset                           =20
	http://patchwork.linuxtv.org/patch/71554=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Adjust parameters indent                        =20
	http://patchwork.linuxtv.org/patch/71555=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm2x: Fix wake up delay                               =20
	http://patchwork.linuxtv.org/patch/71556=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm21: Re-work OV10640 initialization                  =20
	http://patchwork.linuxtv.org/patch/71557=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Define high channel amplitude                   =20
	http://patchwork.linuxtv.org/patch/71558=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm2x: Implement .init() subdev op                     =20
	http://patchwork.linuxtv.org/patch/71559=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Cache channel amplitude                         =20
	http://patchwork.linuxtv.org/patch/71560=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Rename reverse_channel_mv                       =20
	http://patchwork.linuxtv.org/patch/71561=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Rework comments in .bound()                     =20
	http://patchwork.linuxtv.org/patch/71562=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: gmsl: Use 339Kbps I2C bit-rate                           =20
	http://patchwork.linuxtv.org/patch/71563=20
=09
  Feb,16 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Initialize remotes when bound                   =20
	http://patchwork.linuxtv.org/patch/71564=20
=09
  Feb,19 2021, from Jiri Slaby <jslaby@suse.cz>:
	media: atomisp: do not free kmalloc memory by vfree                  =20
	http://patchwork.linuxtv.org/patch/71648=20
=09
  Feb,20 2021, from karthik alapati <mail@karthek.com>:
	staging: media/atomisp: don't compile unused code                    =20
	http://patchwork.linuxtv.org/patch/71650=20
=09
  Feb,21 2021, from Nikolay Kyx <knv418@gmail.com>:
	staging: media: ipu3: code style fix - avoid multiple line dereference
	http://patchwork.linuxtv.org/patch/71651=20
=09
  Feb,21 2021, from Nikolay Kyx <knv418@gmail.com>:
	staging: media: ipu3: code style fix - missing a blank line after decl
	http://patchwork.linuxtv.org/patch/71652=20
=09
  Feb,21 2021, from Nikolay Kyx <knv418@gmail.com>:
	staging: media: ipu3: code style fix - avoid multiple line dereference
	http://patchwork.linuxtv.org/patch/71653=20
=09
  Feb,21 2021, from karthik alapati <mail@karthek.com>:
	staging: media/atomisp: don't compile unused code                    =20
	http://patchwork.linuxtv.org/patch/71654=20
=09
  Feb,21 2021, from Nikolay Kyx <knv418@gmail.com>:
	staging: media: omap4iss: code style - avoid macro argument precedence
	http://patchwork.linuxtv.org/patch/71655=20
=09
  Feb,23 2021, from Jiapeng Chong <jiapeng.chong@linux.alibaba.com>:
	drm/ttm/ttm_bo: make ttm_bo_glob_use_count static                    =20
	http://patchwork.linuxtv.org/patch/71721=20
=09
  Feb,25 2021, from Enric Balletbo i Serra <enric.balletbo@collabora.com>:
	media: hantro: Auto generate the AXI ID to avoid conflicts           =20
	http://patchwork.linuxtv.org/patch/71743=20
=09
  Feb,25 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: add a subsystem profile documentation                         =20
	http://patchwork.linuxtv.org/patch/71744=20
=09
  Feb,25 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: add a subsystem profile documentation                         =20
	http://patchwork.linuxtv.org/patch/71745=20
=09
  Feb,26 2021, from Arnd Bergmann <arnd@arndb.de>:
	staging: atomisp: reduce kernel stack usage                          =20
	http://patchwork.linuxtv.org/patch/71773=20
=09
  Feb,27 2021, from Laurent Pinchart <laurent.pinchart+renesas@ideasonboard=
.com>:
	list: Add list_is_null() to check if a list_head has been initialized=20
	http://patchwork.linuxtv.org/patch/71775=20
=09
  Feb,27 2021, from Pavel Skripkin <paskripkin@gmail.com>:
	drivers/media/usb/gspca/stv06xx: fix memory leak                     =20
	http://patchwork.linuxtv.org/patch/71778=20
=09
  Mar, 1 2021, from Christoph Hellwig <hch@lst.de>:
	dma-mapping: add a dma_mmap_pages helper                             =20
	http://patchwork.linuxtv.org/patch/71780=20
=09
  Mar, 1 2021, from Christoph Hellwig <hch@lst.de>:
	dma-iommu: refactor iommu_dma_alloc_remap                            =20
	http://patchwork.linuxtv.org/patch/71781=20
=09
  Mar, 1 2021, from Christoph Hellwig <hch@lst.de>:
	dma-mapping: refactor dma_{alloc,free}_pages                         =20
	http://patchwork.linuxtv.org/patch/71782=20
=09
  Mar, 1 2021, from Christoph Hellwig <hch@lst.de>:
	dma-mapping: add a dma_alloc_noncontiguous API                       =20
	http://patchwork.linuxtv.org/patch/71783=20
=09
  Mar, 1 2021, from Christoph Hellwig <hch@lst.de>:
	dma-iommu: implement ->alloc_noncontiguous                           =20
	http://patchwork.linuxtv.org/patch/71784=20
=09
  Mar, 1 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: add a subsystem profile documentation                         =20
	http://patchwork.linuxtv.org/patch/71786=20
=09
  Mar, 1 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: add a subsystem profile documentation                         =20
	http://patchwork.linuxtv.org/patch/71787=20
=09
  Mar, 1 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	dt-bindings: media: IMX8MQ VPU: document reset usage                 =20
	http://patchwork.linuxtv.org/patch/71795=20
=09
  Mar, 1 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	dt-bindings: reset: IMX8MQ VPU reset                                 =20
	http://patchwork.linuxtv.org/patch/71796=20
=09
  Mar, 1 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	reset: Add reset driver for IMX8MQ VPU block                         =20
	http://patchwork.linuxtv.org/patch/71797=20
=09
  Mar, 1 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: Use reset driver                                      =20
	http://patchwork.linuxtv.org/patch/71798=20
=09
  Mar, 1 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	arm64: dts: imx8mq: Use reset driver for VPU hardware block          =20
	http://patchwork.linuxtv.org/patch/71799=20
=09
  Mar, 1 2021, from Wren Turkal <wt@penguintechs.org>:
	Make V4L2_MEM2MEM_DEV manually selectable.                           =20
	http://patchwork.linuxtv.org/patch/71808=20
=09
  Mar, 3 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	docs: conf.py: adjust the LaTeX document output                      =20
	http://patchwork.linuxtv.org/patch/71876=20
=09
  Mar, 3 2021, from Andrey Konovalov <andrey.konovalov@linaro.org>:
	[RFC PATCH 3/4] media: st-mipid02: use v4l2_get_link_freq() instead of
	http://patchwork.linuxtv.org/patch/71884=20
=09
  Mar, 3 2021, from Andrey Konovalov <andrey.konovalov@linaro.org>:
	[RFC PATCH 2/4] media: ti-vpe: cal: use v4l2_get_link_freq() for DPHY=20
	http://patchwork.linuxtv.org/patch/71885=20
=09
  Mar, 3 2021, from Andrey Konovalov <andrey.konovalov@linaro.org>:
	[RFC PATCH 1/4] media: rcar-vin: use v4l2_get_link_freq() to calculate
	http://patchwork.linuxtv.org/patch/71887=20
=09
  Mar, 3 2021, from Andrey Konovalov <andrey.konovalov@linaro.org>:
	[RFC PATCH 4/4] staging: media: omap4iss: use v4l2_get_link_freq() to=20
	http://patchwork.linuxtv.org/patch/71889=20
=09
  Mar, 4 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: add a subsystem profile documentation                         =20
	http://patchwork.linuxtv.org/patch/71930=20
=09
  Mar, 4 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: add a subsystem profile documentation                         =20
	http://patchwork.linuxtv.org/patch/71931=20
=09
  Mar, 6 2021, from Zhang Yunkai <zhang.yunkai@zte.com.cn>:
	media:atomisp: remove duplicate include in sh_css                    =20
	http://patchwork.linuxtv.org/patch/71971=20
=09
  Mar,10 2021, from "Gustavo A. R. Silva" <gustavoars@kernel.org>:
	[next] media: siano: Fix multiple out-of-bounds warnings in smscore_lo
	http://patchwork.linuxtv.org/patch/72049=20
=09
  Mar,11 2021, from Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>:
	media: i2c: imx219: Move out locking/unlocking of vflip and hflip cont
	http://patchwork.linuxtv.org/patch/72054=20
=09
  Mar,11 2021, from Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>:
	media: i2c: imx219: Balance runtime PM use-count                     =20
	http://patchwork.linuxtv.org/patch/72056=20
=09
  Mar,11 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: v4l2-ctrl: add controls for long term reference.              =20
	http://patchwork.linuxtv.org/patch/72074=20
=09
  Mar,11 2021, from Rob Herring <robh@kernel.org>:
	dt-bindings: media: Convert video-mux to DT schema                   =20
	http://patchwork.linuxtv.org/patch/72150=20
=09
  Mar,12 2021, from Daniel Scally <djrscally@gmail.com>:
	media: i2c: Add support for ov5693 sensor                            =20
	http://patchwork.linuxtv.org/patch/72164=20
=09
  Mar,12 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	v4l: async: Wrap long lines, remove '(' at the end of lines          =20
	http://patchwork.linuxtv.org/patch/72175=20
=09
  Mar,12 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	v4l: fwnode: Rename v4l2_async_register_subdev_sensor_common         =20
	http://patchwork.linuxtv.org/patch/72176=20
=09
  Mar,12 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	v4l: fwnode: Rename and make static V4L2 async notifier helper       =20
	http://patchwork.linuxtv.org/patch/72178=20
=09
  Mar,12 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	v4l: async, fwnode: Improve module organisation                      =20
	http://patchwork.linuxtv.org/patch/72179=20
=09
  Mar,13 2021, from Vincent Fortier <th0ma7@gmail.com>:
	media_build: CROSS_COMPILE variable environment and disable rmmod.pl =20
	http://patchwork.linuxtv.org/patch/72232=20
=09
  Mar,13 2021, from Vincent Fortier <th0ma7@gmail.com>:
	media_build: Allow cross-environment strip command                   =20
	http://patchwork.linuxtv.org/patch/72233=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	opp: Add devres wrapper for dev_pm_opp_set_clkname                   =20
	http://patchwork.linuxtv.org/patch/72236=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	opp: Add devres wrapper for dev_pm_opp_set_regulators                =20
	http://patchwork.linuxtv.org/patch/72237=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	opp: Add devres wrapper for dev_pm_opp_set_supported_hw              =20
	http://patchwork.linuxtv.org/patch/72238=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	opp: Add devres wrapper for dev_pm_opp_of_add_table                  =20
	http://patchwork.linuxtv.org/patch/72239=20
=09
  Mar,14 2021, from Dmitry Osipenko <digetx@gmail.com>:
	opp: Change return type of devm_pm_opp_register_set_opp_helper()     =20
	http://patchwork.linuxtv.org/patch/72240=20
=09
  Mar,14 2021, from Dmitry Osipenko <digetx@gmail.com>:
	opp: Change return type of devm_pm_opp_attach_genpd()                =20
	http://patchwork.linuxtv.org/patch/72241=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	serial: qcom_geni_serial: Convert to use resource-managed OPP API    =20
	http://patchwork.linuxtv.org/patch/72242=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	spi: spi-geni-qcom: Convert to use resource-managed OPP API          =20
	http://patchwork.linuxtv.org/patch/72243=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	spi: spi-qcom-qspi: Convert to use resource-managed OPP API          =20
	http://patchwork.linuxtv.org/patch/72244=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	drm/msm: Convert to use resource-managed OPP API                     =20
	http://patchwork.linuxtv.org/patch/72245=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	drm/lima: Convert to use resource-managed OPP API                    =20
	http://patchwork.linuxtv.org/patch/72246=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	memory: samsung: exynos5422-dmc: Convert to use resource-managed OPP A
	http://patchwork.linuxtv.org/patch/72248=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	drm/panfrost: Convert to use resource-managed OPP API                =20
	http://patchwork.linuxtv.org/patch/72249=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	mmc: sdhci-msm: Convert to use resource-managed OPP API              =20
	http://patchwork.linuxtv.org/patch/72250=20
=09
  Mar,15 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: staging/intel-ipu3: Fix memory leak in imu_fmt                =20
	http://patchwork.linuxtv.org/patch/72252=20
=09
  Mar,15 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: staging/intel-ipu3: Fix set_fmt error handling                =20
	http://patchwork.linuxtv.org/patch/72253=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdamc21: Fix warning on u8 cast                          =20
	http://patchwork.linuxtv.org/patch/72255=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Embedded 'serializer' field                     =20
	http://patchwork.linuxtv.org/patch/72256=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Replace goto with a loop                        =20
	http://patchwork.linuxtv.org/patch/72257=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Report camera module name                       =20
	http://patchwork.linuxtv.org/patch/72258=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Check return values                             =20
	http://patchwork.linuxtv.org/patch/72259=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9271: Check max9271_write() return                    =20
	http://patchwork.linuxtv.org/patch/72260=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Re-work ov10635 reset                           =20
	http://patchwork.linuxtv.org/patch/72261=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9271: Introduce wake_up() function                    =20
	http://patchwork.linuxtv.org/patch/72262=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Adjust parameters indent                        =20
	http://patchwork.linuxtv.org/patch/72263=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm21: Fix OV10640 powerdown                           =20
	http://patchwork.linuxtv.org/patch/72264=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Enable noise immunity                           =20
	http://patchwork.linuxtv.org/patch/72265=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm21: Give more time to OV490 to boot                 =20
	http://patchwork.linuxtv.org/patch/72266=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Rename reverse_channel_mv                       =20
	http://patchwork.linuxtv.org/patch/72267=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Define high channel amplitude                   =20
	http://patchwork.linuxtv.org/patch/72268=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Cache channel amplitude                         =20
	http://patchwork.linuxtv.org/patch/72269=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: v4l2-subdev: De-deprecate init() subdev op                    =20
	http://patchwork.linuxtv.org/patch/72270=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: gmsl: Reimplement initialization sequence                     =20
	http://patchwork.linuxtv.org/patch/72271=20
=09
  Mar,15 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Rework comments in .bound()                     =20
	http://patchwork.linuxtv.org/patch/72272=20
=09
  Mar,16 2021, from Krzysztof Ha=C5=82asa <khalasa@piap.pl>:
	RFC: dt-binding: media: document ON Semi AR0521 sensor bindings      =20
	http://patchwork.linuxtv.org/patch/72316=20
=09
  Mar,16 2021, from Krzysztof Ha=C5=82asa <khalasa@piap.pl>:
	RFC: MEDIA: Driver for ON Semi AR0521 camera sensor                  =20
	http://patchwork.linuxtv.org/patch/72317=20
=09
  Mar,16 2021, from Daniel Vetter <daniel.vetter@ffwll.ch>:
	mm: Add unsafe_follow_pfn                                            =20
	http://patchwork.linuxtv.org/patch/72319=20
=09
  Mar,16 2021, from Daniel Vetter <daniel.vetter@ffwll.ch>:
	media/videobuf1|2: Mark follow_pfn usage as unsafe                   =20
	http://patchwork.linuxtv.org/patch/72320=20
=09
  Mar,16 2021, from Daniel Vetter <daniel.vetter@ffwll.ch>:
	mm: unexport follow_pfn                                              =20
	http://patchwork.linuxtv.org/patch/72321=20
=09
  Mar,16 2021, from Rob Herring <robh@kernel.org>:
	dt-bindings: media: video-interfaces: Use documented bindings in examp
	http://patchwork.linuxtv.org/patch/72362=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner =20
	http://patchwork.linuxtv.org/patch/72365=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner =20
	http://patchwork.linuxtv.org/patch/72366=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding =20
	http://patchwork.linuxtv.org/patch/72367=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support              =20
	http://patchwork.linuxtv.org/patch/72368=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link bindi
	http://patchwork.linuxtv.org/patch/72369=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	drm/bridge: imx: Add i.MX8qm/qxp display pixel link support          =20
	http://patchwork.linuxtv.org/patch/72370=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module=20
	http://patchwork.linuxtv.org/patch/72371=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding =20
	http://patchwork.linuxtv.org/patch/72372=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	drm/bridge: imx: Add i.MX8qxp pixel link to DPI support              =20
	http://patchwork.linuxtv.org/patch/72373=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	drm/bridge: imx: Add LDB driver helper support                       =20
	http://patchwork.linuxtv.org/patch/72374=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge bind
	http://patchwork.linuxtv.org/patch/72375=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	drm/bridge: imx: Add LDB support for i.MX8qxp                        =20
	http://patchwork.linuxtv.org/patch/72376=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	drm/bridge: imx: Add LDB support for i.MX8qm                         =20
	http://patchwork.linuxtv.org/patch/72377=20
=09
  Mar,17 2021, from Liu Ying <victor.liu@nxp.com>:
	MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs     =20
	http://patchwork.linuxtv.org/patch/72378=20
=09
  Mar,17 2021, from Ariel D'Alessandro <ariel.dalessandro@collabora.com>:
	[v4l-utils v4 1/5] Move README to markdown syntax                    =20
	http://patchwork.linuxtv.org/patch/72401=20
=09
  Mar,17 2021, from Ariel D'Alessandro <ariel.dalessandro@collabora.com>:
	[v4l-utils v4 2/5] Add support for meson building                    =20
	http://patchwork.linuxtv.org/patch/72403=20
=09
  Mar,17 2021, from Ariel D'Alessandro <ariel.dalessandro@collabora.com>:
	[v4l-utils v4 3/5] Copy Doxygen configuration file to doc/           =20
	http://patchwork.linuxtv.org/patch/72404=20
=09
  Mar,17 2021, from Ariel D'Alessandro <ariel.dalessandro@collabora.com>:
	[v4l-utils v4 4/5] meson: Add support for doxygen documentation      =20
	http://patchwork.linuxtv.org/patch/72405=20
=09
  Mar,17 2021, from Ariel D'Alessandro <ariel.dalessandro@collabora.com>:
	[v4l-utils v4 5/5] Makefile.am: Distribute meson related files       =20
	http://patchwork.linuxtv.org/patch/72406=20
=09
  Mar,17 2021, from Leonardo Brondani Schenkel <leonardo@schenkel.net>:
	Add extra keys for rc6-mce                                           =20
	http://patchwork.linuxtv.org/patch/72421=20
=09
  Mar,18 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: atomisp: Fix typo "accesible"                                 =20
	http://patchwork.linuxtv.org/patch/72443=20
=09
  Mar,19 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: imx: imx7_mipi_csis: Runtime suspend in .s_stream() error path=20
	http://patchwork.linuxtv.org/patch/72462=20
=09
  Mar,19 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: imx: imx7_mipi_csis: Don't take state->lock in .link_setup()  =20
	http://patchwork.linuxtv.org/patch/72463=20
=09
  Mar,19 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: imx: imx7_mipi_csis: Ensure pads are connected                =20
	http://patchwork.linuxtv.org/patch/72464=20
=09
  Mar,19 2021, from Sergey Senozhatsky <senozhatsky@chromium.org>:
	media: v4l UAPI: add ROI selection targets                           =20
	http://patchwork.linuxtv.org/patch/72468=20
=09
  Mar,19 2021, from Sergey Senozhatsky <senozhatsky@chromium.org>:
	media: v4l UAPI: document ROI selection targets                      =20
	http://patchwork.linuxtv.org/patch/72469=20
=09
  Mar,19 2021, from Sergey Senozhatsky <senozhatsky@chromium.org>:
	media: v4l UAPI: document ROI auto-controls flags                    =20
	http://patchwork.linuxtv.org/patch/72470=20
=09
  Mar,19 2021, from Sergey Senozhatsky <senozhatsky@chromium.org>:
	media: v4l UAPI: add ROI auto-controls flags                         =20
	http://patchwork.linuxtv.org/patch/72471=20
=09
  Mar,19 2021, from Sergey Senozhatsky <senozhatsky@chromium.org>:
	media: uvcvideo: add UVC 1.5 ROI control                             =20
	http://patchwork.linuxtv.org/patch/72472=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Rename reverse_channel_mv                       =20
	http://patchwork.linuxtv.org/patch/72478=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Adjust parameters indent                        =20
	http://patchwork.linuxtv.org/patch/72479=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Cache channel amplitude                         =20
	http://patchwork.linuxtv.org/patch/72480=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Define high channel amplitude                   =20
	http://patchwork.linuxtv.org/patch/72481=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9271: Introduce wake_up() function                    =20
	http://patchwork.linuxtv.org/patch/72482=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9271: Check max9271_write() return                    =20
	http://patchwork.linuxtv.org/patch/72483=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdamc21: Fix warning on u8 cast                          =20
	http://patchwork.linuxtv.org/patch/72484=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm21: Add dealy after OV490 reset                     =20
	http://patchwork.linuxtv.org/patch/72485=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm21: Fix OV10640 powerup                             =20
	http://patchwork.linuxtv.org/patch/72486=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm21: Power up OV10640 before OV490                   =20
	http://patchwork.linuxtv.org/patch/72487=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: v4l2-subdev: De-deprecate init() subdev op                    =20
	http://patchwork.linuxtv.org/patch/72488=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: gmsl: Reimplement initialization sequence                     =20
	http://patchwork.linuxtv.org/patch/72489=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Rework comments in .bound()                     =20
	http://patchwork.linuxtv.org/patch/72490=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Enable noise immunity                           =20
	http://patchwork.linuxtv.org/patch/72491=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Embed 'serializer' field                        =20
	http://patchwork.linuxtv.org/patch/72492=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Report camera module name                       =20
	http://patchwork.linuxtv.org/patch/72493=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Replace goto with a loop                        =20
	http://patchwork.linuxtv.org/patch/72494=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Re-work ov10635 reset                           =20
	http://patchwork.linuxtv.org/patch/72495=20
=09
  Mar,19 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdacm20: Check return values                             =20
	http://patchwork.linuxtv.org/patch/72496=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL             =20
	http://patchwork.linuxtv.org/patch/72498=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: v4l2-ioctl: S_CTRL output the right value                     =20
	http://patchwork.linuxtv.org/patch/72500=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: v4l2-ioctl: Fix check_ext_ctrls                               =20
	http://patchwork.linuxtv.org/patch/72501=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: docs: Document the behaviour of uvcdriver                     =20
	http://patchwork.linuxtv.org/patch/72513=20
=09
  Mar,19 2021, from Martina Krasteva <martinax.krasteva@intel.com>:
	dt-bindings: media: Add bindings for Keem Bay Camera                 =20
	http://patchwork.linuxtv.org/patch/72519=20
=09
  Mar,19 2021, from Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>:
	media: Keem Bay Camera: Keem Bay camera driver                       =20
	http://patchwork.linuxtv.org/patch/72520=20
=09
  Mar,19 2021, from Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>:
	media: Keem Bay Camera: Add VPU camera interface                     =20
	http://patchwork.linuxtv.org/patch/72521=20
=09
  Mar,19 2021, from Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>:
	uapi: Keem Bay ISP Parameters data types                             =20
	http://patchwork.linuxtv.org/patch/72522=20
=09
  Mar,19 2021, from Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>:
	media: Keem Bay Camera: Add ISP sub-device                           =20
	http://patchwork.linuxtv.org/patch/72523=20
=09
  Mar,19 2021, from Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>:
	media: v4l: Add Keem Bay Camera meta buffer formats                  =20
	http://patchwork.linuxtv.org/patch/72524=20
=09
  Mar,19 2021, from Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>:
	media: Keem Bay Camera: Add metadata video node                      =20
	http://patchwork.linuxtv.org/patch/72525=20
=09
  Mar,19 2021, from Martina Krasteva <martinax.krasteva@intel.com>:
	media: Keem Bay Camera: Add capture video node                       =20
	http://patchwork.linuxtv.org/patch/72526=20
=09
  Mar,19 2021, from Martina Krasteva <martinax.krasteva@intel.com>:
	media: Keem Bay Camera: Add pipeline support                         =20
	http://patchwork.linuxtv.org/patch/72527=20
=09
  Mar,19 2021, from Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>:
	media: admin-guide: Add documentation for Keem Bay Camera            =20
	http://patchwork.linuxtv.org/patch/72528=20
=09
  Mar,21 2021, from Fabian W=C3=BCthrich <me@fabwu.ch>:
	ipu3-cio2: Parse sensor orientation and rotation                     =20
	http://patchwork.linuxtv.org/patch/72534=20
=09
  Mar,22 2021, from Bhaskar Chowdhury <unixbhaskar@gmail.com>:
	media: Fix a typo                                                    =20
	http://patchwork.linuxtv.org/patch/72535=20
=09
  Mar,22 2021, from Arnd Bergmann <arnd@arndb.de>:
	media: dvb-usb: avoid -Wempty-body warnings                          =20
	http://patchwork.linuxtv.org/patch/72536=20
=09
  Mar,22 2021, from Arnd Bergmann <arnd@arndb.de>:
	media: flexcop: avoid -Wempty-body warning                           =20
	http://patchwork.linuxtv.org/patch/72537=20
=09
  Mar,22 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	v4l: async: Wrap long lines, remove '(' at the end of lines          =20
	http://patchwork.linuxtv.org/patch/72538=20
=09
  Mar,22 2021, from Philipp Zabel <p.zabel@pengutronix.de>:
	media: video-mux: Skip dangling endpoints                            =20
	http://patchwork.linuxtv.org/patch/72542=20
=09
  Mar,22 2021, from Edgar Thier <info@edgarthier.net>:
	v4l: Add 12-bit raw bayer linear packed formats                      =20
	http://patchwork.linuxtv.org/patch/72546=20
=09
  Mar,22 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	atomisp: remove a now unused var                                     =20
	http://patchwork.linuxtv.org/patch/72549=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: drm: Split vsp1_du_setup_lif()                          =20
	http://patchwork.linuxtv.org/patch/72551=20
=09
  Mar,22 2021, from Laurent Pinchart <laurent.pinchart+renesas@ideasonboard=
.com>:
	media: vsp1: drm: Don't configure hardware when the pipeline is disabl
	http://patchwork.linuxtv.org/patch/72552=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Handle CRTC standby from commit tail handler           =20
	http://patchwork.linuxtv.org/patch/72553=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: drm: Remove vsp1_du_setup_lif()                         =20
	http://patchwork.linuxtv.org/patch/72554=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Convert to the new VSP atomic API                      =20
	http://patchwork.linuxtv.org/patch/72555=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Handle CRTC configuration from commit tail handler     =20
	http://patchwork.linuxtv.org/patch/72556=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Provide for_each_group helper                          =20
	http://patchwork.linuxtv.org/patch/72557=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Create a group state object                            =20
	http://patchwork.linuxtv.org/patch/72558=20
=09
  Mar,22 2021, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Perform group setup from the atomic tail handler       =20
	http://patchwork.linuxtv.org/patch/72559=20
=09
  Mar,22 2021, from Laurent Pinchart <laurent.pinchart+renesas@ideasonboard=
.com>:
	drm: rcar-du: Centralise routing configuration in commit tail handler=20
	http://patchwork.linuxtv.org/patch/72560=20
=09
  Mar,22 2021, from Arnd Bergmann <arnd@arndb.de>:
	media: dvb-usb-remote: fix dvb_usb_nec_rc_key_to_event type mismatch =20
	http://patchwork.linuxtv.org/patch/72561=20
=09
  Mar,22 2021, from Anil Kumar Mamidala <anil.mamidala@xilinx.com>:
	media: dt-bindings: media: i2c: Add bindings for AP1302              =20
	http://patchwork.linuxtv.org/patch/72562=20
=09
  Mar,22 2021, from Anil Kumar Mamidala <anil.mamidala@xilinx.com>:
	media: i2c: Add ON Semiconductor AP1302 ISP driver                   =20
	http://patchwork.linuxtv.org/patch/72563=20
=09
  Mar,23 2021, from Wan Jiabing <wanjiabing@vivo.com>:
	media: test-drivers: Remove duplicate include of string.h            =20
	http://patchwork.linuxtv.org/patch/72564=20
=09
  Mar,23 2021, from Jiapeng Chong <jiapeng.chong@linux.alibaba.com>:
	media: staging: media: Remove redundant NULL check                   =20
	http://patchwork.linuxtv.org/patch/72565=20
=09
  Mar,23 2021, from Jiapeng Chong <jiapeng.chong@linux.alibaba.com>:
	drm/etnaviv: Remove redundant NULL check                             =20
	http://patchwork.linuxtv.org/patch/72566=20
=09
  Mar,23 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: camera-sensor.rst: fix c:function build warning               =20
	http://patchwork.linuxtv.org/patch/72567=20
=09
  Mar,23 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	ccs-data.h: fix kernel-doc typo                                      =20
	http://patchwork.linuxtv.org/patch/72568=20
=09
  Mar,23 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd                   =20
	http://patchwork.linuxtv.org/patch/72569=20
=09
  Mar,23 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	s3c-camif/camif-core.h: fix kernel-doc warnings                      =20
	http://patchwork.linuxtv.org/patch/72571=20
=09
  Mar,23 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	s5p-jpeg/jpeg-core.h: fix kernel-doc warnings                        =20
	http://patchwork.linuxtv.org/patch/72572=20
=09
  Mar,23 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	staging: ipu3-imgu: No need for kernel-doc comments in driver struct =20
	http://patchwork.linuxtv.org/patch/72574=20
=09
  Mar,23 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	exynos4-is: fix kernel-doc warnings                                  =20
	http://patchwork.linuxtv.org/patch/72575=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D Patches under review =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Feb, 9 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	v4l: Add new Colorimetry Class                                       =20
	http://patchwork.linuxtv.org/patch/71386=20
=09
  Feb, 9 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	docs: Document colorimetry class                                     =20
	http://patchwork.linuxtv.org/patch/71387=20
=09
  Feb, 9 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	v4l: Add HDR10 static metadata controls                              =20
	http://patchwork.linuxtv.org/patch/71388=20
=09
  Feb, 9 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	docs: Document CLL and Mastering display colorimetry controls        =20
	http://patchwork.linuxtv.org/patch/71389=20
=09
  Mar, 2 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	media: v4l2-ctrls: Add intra-refresh period control                  =20
	http://patchwork.linuxtv.org/patch/71822=20
=09
  Mar, 2 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	v4l2-ctrl: Add decoder conceal color control                         =20
	http://patchwork.linuxtv.org/patch/71827=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  =3D delegated to Hans Verkuil <hansverk@cisco.com> =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

  Oct, 8 2018, from Hans Verkuil <hverkuil@xs4all.nl>:
	omapdrm/dss/hdmi4_cec.c: simplify clear_tx/rx_fifo functions         =20
	http://patchwork.linuxtv.org/patch/52453=20
=09
  Jul,25 2019, from Hans Verkuil <hverkuil@xs4all.nl>:
	uvc: don't set description in ENUM_FMT                               =20
	http://patchwork.linuxtv.org/patch/57746=20
=09
  Aug,15 2019, from Maxime Jourdan <mjourdan@baylibre.com>:
	media: s5p_mfc_dec: set flags for OUTPUT coded formats               =20
	http://patchwork.linuxtv.org/patch/58197=20
=09
  Aug,23 2019, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	drm/bridge/adv7511: enable CEC connector info                        =20
	http://patchwork.linuxtv.org/patch/58389=20
=09
  Aug,27 2019, from Matthew Michilot <matthew.michilot@gmail.com>:
	media: i2c: adv7180: fix adv7280 BT.656-4 compatibility              =20
	http://patchwork.linuxtv.org/patch/58463=20
=09
  Sep,17 2019, from Robin van der Gracht <robin@protonic.nl>:
	media: i2c: tvp5150: Fix horizontal crop stop boundry                =20
	http://patchwork.linuxtv.org/patch/58790=20
=09
  Oct,17 2019, from Dariusz Marcinkiewicz <darekm@google.com>:
	drm: tda998x: set the connector info                                 =20
	http://patchwork.linuxtv.org/patch/59519=20
=09
  Nov,26 2019, from Dafna Hirschfeld <dafna.hirschfeld@collabora.com>:
	media: vimc: Add device index to the bus_info                        =20
	http://patchwork.linuxtv.org/patch/60393=20
=09
  Nov,26 2019, from Dafna Hirschfeld <dafna.hirschfeld@collabora.com>:
	media: vimc: use configfs instead of having hardcoded configuration  =20
	http://patchwork.linuxtv.org/patch/60394=20
=09
  Nov,26 2019, from Dafna Hirschfeld <dafna.hirschfeld@collabora.com>:
	media: vimc: Add the implementation for the configfs api             =20
	http://patchwork.linuxtv.org/patch/60395=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil@xs4all.nl>:
	media: v4l2: add VB2_DMABUF to all drivers                           =20
	http://patchwork.linuxtv.org/patch/61782=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 3/9] m2m-deinterlace: drop VB2_USERPTR                    =20
	http://patchwork.linuxtv.org/patch/61784=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 2/9] solo6x10: drop VB2_USERPTR                           =20
	http://patchwork.linuxtv.org/patch/61785=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 4/9] mcam-core: drop VB2_USERPTR                          =20
	http://patchwork.linuxtv.org/patch/61786=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 1/9] mtk-vcodec: drop VB2_USERPTR                         =20
	http://patchwork.linuxtv.org/patch/61787=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 8/9] exynos/s3c/s5p: drop VB2_USERPTR                     =20
	http://patchwork.linuxtv.org/patch/61788=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 9/9] omap3isp/rcar_fdp1/vsp1/xilinx: drop VB2_USERPTR     =20
	http://patchwork.linuxtv.org/patch/61789=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 6/9] mx2_emmaprp: drop VB2_USERPTR                        =20
	http://patchwork.linuxtv.org/patch/61790=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 5/9] sh_veu: drop VB2_USERPTR                             =20
	http://patchwork.linuxtv.org/patch/61791=20
=09
  Feb,21 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	[RFC PATCH 7/9] davinci: drop VB2_USERPTR                            =20
	http://patchwork.linuxtv.org/patch/61792=20
=09
  May, 2 2020, from Andriy Gelman <andriy.gelman@gmail.com>:
	media: s5p-mfc: set V4L2_BUF_FLAG_LAST flag on final buffer          =20
	http://patchwork.linuxtv.org/patch/63518=20
=09
  May,14 2020, from Ha=C5=82asa):
	MEDIA: Add support for RAW14 and RAW16 to IPUv3 CSI                  =20
	http://patchwork.linuxtv.org/patch/63820=20
=09
  Jul, 1 2020, from Benjamin Gaignard <benjamin.gaignard@st.com>:
	media: stm32-dcmi: Set minimum cpufreq requirement                   =20
	http://patchwork.linuxtv.org/patch/65053=20
=09
  Jul, 1 2020, from Benjamin Gaignard <benjamin.gaignard@st.com>:
	ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x       =20
	http://patchwork.linuxtv.org/patch/65054=20
=09
  Jul, 1 2020, from Benjamin Gaignard <benjamin.gaignard@st.com>:
	dt-bindings: media: stm32-dcmi: Add DCMI min frequency property      =20
	http://patchwork.linuxtv.org/patch/65055=20
=09
  Jul, 7 2020, from Hans Verkuil <hverkuil@xs4all.nl>:
	[RFC PATCH] v4l2-dev: split video_register_device into v4l2_vdev_init=20
	http://patchwork.linuxtv.org/patch/65318=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	v4l2-ctrls.c: add v4l2_ctrl_request_add_handler                      =20
	http://patchwork.linuxtv.org/patch/66361=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	vivid: add ro_requests module option                                 =20
	http://patchwork.linuxtv.org/patch/66362=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	vivid: call v4l2_ctrl_request_add_handler()                          =20
	http://patchwork.linuxtv.org/patch/66363=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	videobuf2-core: add vb2_request_buffer_first()                       =20
	http://patchwork.linuxtv.org/patch/66364=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	vivid: add read-only int32 control                                   =20
	http://patchwork.linuxtv.org/patch/66365=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	videodev2.h: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS                   =20
	http://patchwork.linuxtv.org/patch/66366=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/mc: keep track of outstanding requests                         =20
	http://patchwork.linuxtv.org/patch/66368=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	v4l2-mem2mem.c: add v4l2_m2m_request_validate()                      =20
	http://patchwork.linuxtv.org/patch/66369=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	vim2m: use v4l2_m2m_request_validate()                               =20
	http://patchwork.linuxtv.org/patch/66370=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	vicodec: add support for read-only requests                          =20
	http://patchwork.linuxtv.org/patch/66371=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media: document read-only requests                                   =20
	http://patchwork.linuxtv.org/patch/66372=20
=09
  Aug,18 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	vim2m: support read-only requests on the capture queue               =20
	http://patchwork.linuxtv.org/patch/66373=20
=09
  Sep,18 2020, from Marek Szyprowski <m.szyprowski@samsung.com>:
	media: platform: exynos4-is: add support for generic IOMMU-DMA glue co
	http://patchwork.linuxtv.org/patch/67105=20
=09
  Sep,18 2020, from Marek Szyprowski <m.szyprowski@samsung.com>:
	media: platform: s5p-mfc: properly assign device to both vb2 queues  =20
	http://patchwork.linuxtv.org/patch/67107=20
=09
  Sep,18 2020, from Marek Szyprowski <m.szyprowski@samsung.com>:
	media: platform: s5p-mfc: add support for generic DMA-IOMMU glue code=20
	http://patchwork.linuxtv.org/patch/67108=20
=09
  Sep,29 2020, from Sowjanya Komatineni <skomatineni@nvidia.com>:
	media: tegra-video: Allow building driver with COMPILE_TEST          =20
	http://patchwork.linuxtv.org/patch/67485=20
=09
  Sep,29 2020, from Sowjanya Komatineni <skomatineni@nvidia.com>:
	gpu: host1x: Allow COMPILE_TEST to build host1x driver on all platform
	http://patchwork.linuxtv.org/patch/67486=20
=09
  Oct,21 2020, from Fabrizio Castro <fabrizio.castro.jz@renesas.com>:
	MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver              =20
	http://patchwork.linuxtv.org/patch/68221=20
=09
  Oct,21 2020, from Fabrizio Castro <fabrizio.castro.jz@renesas.com>:
	media: dt-bindings: media: renesas,drif: Add r8a77990 support        =20
	http://patchwork.linuxtv.org/patch/68222=20
=09
  Oct,21 2020, from Fabrizio Castro <fabrizio.castro.jz@renesas.com>:
	media: dt-bindings: media: renesas,drif: Add r8a77965 support        =20
	http://patchwork.linuxtv.org/patch/68223=20
=09
  Oct,21 2020, from Fabrizio Castro <fabrizio.castro.jz@renesas.com>:
	arm64: dts: r8a77965: Add DRIF support                               =20
	http://patchwork.linuxtv.org/patch/68224=20
=09
  Oct,21 2020, from Fabrizio Castro <fabrizio.castro.jz@renesas.com>:
	media: dt-bindings: media: renesas,drif: Convert to json-schema      =20
	http://patchwork.linuxtv.org/patch/68225=20
=09
  Nov, 6 2020, from Maxime Ripard <maxime@cerno.tech>:
	soc: sunxi: Deal with the MBUS DMA offsets in a central place        =20
	http://patchwork.linuxtv.org/patch/68685=20
=09
  Nov, 6 2020, from Maxime Ripard <maxime@cerno.tech>:
	drm/sun4i: backend: Fix probe failure with multiple backends         =20
	http://patchwork.linuxtv.org/patch/68691=20
=09
  Nov,10 2020, from Naushir Patuck <naush@raspberrypi.com>:
	media: uapi: Add MEDIA_BUS_FMT_CUSTOM_SENSOR_DATA                    =20
	http://patchwork.linuxtv.org/patch/68799=20
=09
  Nov,10 2020, from Dave Stevenson <dave.stevenson@raspberrypi.com>:
	dt-bindings: media: Document BCM283x CSI2/CCP2 receiver              =20
	http://patchwork.linuxtv.org/patch/68800=20
=09
  Nov,10 2020, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	ARM: dts: bcm2711: Add Unicam DT nodes                               =20
	http://patchwork.linuxtv.org/patch/68801=20
=09
  Nov,10 2020, from Jacopo Mondi <jacopo@jmondi.org>:
	media: bcm2835-unicam: Add TODO file                                 =20
	http://patchwork.linuxtv.org/patch/68802=20
=09
  Nov,10 2020, from Naushir Patuck <naush@raspberrypi.com>:
	media: bcm2835-unicam: Driver for CCP2/CSI2 camera interface         =20
	http://patchwork.linuxtv.org/patch/68803=20
=09
  Nov,30 2020, from Ezequiel Garcia <ezequiel@collabora.com>:
	media: uapi: mpeg2: Cleanup flags                                    =20
	http://patchwork.linuxtv.org/patch/69555=20
=09
  Nov,30 2020, from Ezequiel Garcia <ezequiel@collabora.com>:
	media: uapi: mpeg2: Remove unused slice size and offset              =20
	http://patchwork.linuxtv.org/patch/69556=20
=09
  Dec,14 2020, from Zev Weiss <zev@bewilderbeest.net>:
	aspeed-video: add error message for unhandled interrupts             =20
	http://patchwork.linuxtv.org/patch/70039=20
=09
  Dec,14 2020, from Zev Weiss <zev@bewilderbeest.net>:
	aspeed-video: clear spurious interrupt bits unconditionally          =20
	http://patchwork.linuxtv.org/patch/70040=20
=09
  Dec,14 2020, from Zev Weiss <zev@bewilderbeest.net>:
	aspeed-video: add COMP_READY to VE_SPURIOUS_IRQS                     =20
	http://patchwork.linuxtv.org/patch/70041=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 05/11] media: videobuf2: Expose helpers for Ext qbuf/dqb
	http://patchwork.linuxtv.org/patch/70776=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 06/11] media: vivid: use vb2_ioctls_ext_{d}qbuf hooks  =20
	http://patchwork.linuxtv.org/patch/70777=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 07/11] media: vimc: use vb2_ioctls_ext_{d}qbuf hooks   =20
	http://patchwork.linuxtv.org/patch/70778=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 09/11] media: vivid: Convert to v4l2_ext_pix_format    =20
	http://patchwork.linuxtv.org/patch/70779=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 08/11] media: mediabus: Add helpers to convert a ext_pix
	http://patchwork.linuxtv.org/patch/70780=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 10/11] media: vimc: Convert to v4l2_ext_pix_format     =20
	http://patchwork.linuxtv.org/patch/70781=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 11/11] media: docs: add documentation for the Extended A
	http://patchwork.linuxtv.org/patch/70782=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 04/11] media: videobuf2-v4l2: reorganize flags handling=20
	http://patchwork.linuxtv.org/patch/70783=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 03/11] media: v4l2: Add extended buffer (de)queue operat
	http://patchwork.linuxtv.org/patch/70784=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 02/11] media: v4l2: Extend pixel formats to unify single
	http://patchwork.linuxtv.org/patch/70785=20
=09
  Jan,14 2021, from Helen Koike <helen.koike@collabora.com>:
	[RFC PATCH v6 01/11] media: v4l2-common: add normalized pixelformat fi
	http://patchwork.linuxtv.org/patch/70786=20
=09
  Feb, 1 2021, from Philippe De Muyter <phdm@macqel.be>:
	media: add V4L2_BUF_FLAG_TIMESTAMP_UTC and V4L2_BUF_FLAG_TIMESTAMP_TAI
	http://patchwork.linuxtv.org/patch/71218=20
=09
  Feb, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media-device: add media_device_devt function                         =20
	http://patchwork.linuxtv.org/patch/71249=20
=09
  Feb, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	v4l2-dev: add /sys media_dev attr for V4L2 devices                   =20
	http://patchwork.linuxtv.org/patch/71250=20
=09
  Feb, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	dvbdev: add /sys media_dev attr for DVB devices                      =20
	http://patchwork.linuxtv.org/patch/71251=20
=09
  Feb,15 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	dt-bindings: media: nxp,imx7-mipi-csi2: Drop the reset-names property=20
	http://patchwork.linuxtv.org/patch/71510=20
=09
  Feb,15 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	dt-bindings: media: nxp,imx7-mipi-csi2: Drop fsl,csis-hs-settle proper
	http://patchwork.linuxtv.org/patch/71511=20
=09
  Feb,15 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	dt-bindings: media: nxp,imx7-mipi-csi2: Indent example with 4 spaces =20
	http://patchwork.linuxtv.org/patch/71512=20
=09
  Feb,15 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	dt-bindings: media: nxp,imx7-mipi-csi2: Expand descriptions          =20
	http://patchwork.linuxtv.org/patch/71514=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: mtk-vcodec: venc: remove redundant code                       =20
	http://patchwork.linuxtv.org/patch/71755=20
=09
  Feb,26 2021, from Yunfei Dong <yunfei.dong@mediatek.com>:
	media: mtk-vcodec: vdec: move stateful ops into their own file       =20
	http://patchwork.linuxtv.org/patch/71757=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: mtk-vcodec: vdec: handle firmware version field               =20
	http://patchwork.linuxtv.org/patch/71758=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: mtk-vcodec: support version 2 of decoder firmware ABI         =20
	http://patchwork.linuxtv.org/patch/71759=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: add Mediatek's MM21 format                                    =20
	http://patchwork.linuxtv.org/patch/71760=20
=09
  Feb,26 2021, from Yunfei Dong <yunfei.dong@mediatek.com>:
	media: mtk-vcodec: vdec: support stateless API                       =20
	http://patchwork.linuxtv.org/patch/71761=20
=09
  Feb,26 2021, from Yunfei Dong <yunfei.dong@mediatek.com>:
	media: mtk-vcodec: vdec: support stateless H.264 decoding            =20
	http://patchwork.linuxtv.org/patch/71762=20
=09
  Feb,26 2021, from Yunfei Dong <yunfei.dong@mediatek.com>:
	media: mtk-vcodec: vdec: add media device if using stateless api     =20
	http://patchwork.linuxtv.org/patch/71763=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	dt-bindings: media: document mediatek,mt8183-vcodec-dec              =20
	http://patchwork.linuxtv.org/patch/71764=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD     =20
	http://patchwork.linuxtv.org/patch/71765=20
=09
  Feb,26 2021, from Yunfei Dong <yunfei.dong@mediatek.com>:
	media: mtk-vcodec: enable MT8183 decoder                             =20
	http://patchwork.linuxtv.org/patch/71766=20
=09
  Feb,26 2021, from Hirokazu Honda <hiroh@chromium.org>:
	media: mtk-vcodec: vdec: Support H264 profile control                =20
	http://patchwork.linuxtv.org/patch/71767=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits  =20
	http://patchwork.linuxtv.org/patch/71768=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: mtk-vcodec: make flush buffer reusable by encoder             =20
	http://patchwork.linuxtv.org/patch/71769=20
=09
  Feb,26 2021, from Alexandre Courbot <acourbot@chromium.org>:
	media: mtk-vcodec: venc: support START and STOP commands             =20
	http://patchwork.linuxtv.org/patch/71770=20
=09
  Feb,26 2021, from Hsin-Yi Wang <hsinyi@chromium.org>:
	media: mtk-vcodec: venc: make sure buffer exists in list before removi
	http://patchwork.linuxtv.org/patch/71771=20
=09
  Mar, 2 2021, from Sergey Senozhatsky <senozhatsky@chromium.org>:
	v4l-compliance: re-introduce NON_COHERENT and cache hints tests      =20
	http://patchwork.linuxtv.org/patch/71818=20
=09
  Mar, 2 2021, from Paul Cercueil <paul@crapouillou.net>:
	dt-bindings: media: Document RDA5807 FM radio bindings               =20
	http://patchwork.linuxtv.org/patch/71832=20
=09
  Mar, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	drm/omapdrm/dss/hdmi5: add CEC support                               =20
	http://patchwork.linuxtv.org/patch/71833=20
=09
  Mar, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling               =20
	http://patchwork.linuxtv.org/patch/71834=20
=09
  Mar, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	drm/omapdrm/dss/hdmi4: switch to the connector bridge ops            =20
	http://patchwork.linuxtv.org/patch/71835=20
=09
  Mar, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	drm: drm_bridge: add connector_attach/detach bridge ops              =20
	http://patchwork.linuxtv.org/patch/71836=20
=09
  Mar, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock            =20
	http://patchwork.linuxtv.org/patch/71837=20
=09
  Mar, 2 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	dra7.dtsi/omap5.dtsi: add cec clock                                  =20
	http://patchwork.linuxtv.org/patch/71838=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	media: hantro: use G1_REG_INTERRUPT directly for the mpeg2           =20
	http://patchwork.linuxtv.org/patch/72093=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	media: hantro: imx: remove unused include                            =20
	http://patchwork.linuxtv.org/patch/72094=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	media: hantro: imx: remove duplicate dec_base init                   =20
	http://patchwork.linuxtv.org/patch/72095=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	media: dt-bindings: Document SAMA5D4 VDEC bindings                   =20
	http://patchwork.linuxtv.org/patch/72096=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	media: hantro: introduce hantro_g1.c for common API                  =20
	http://patchwork.linuxtv.org/patch/72097=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	media: hantro: add initial SAMA5D4 support                           =20
	http://patchwork.linuxtv.org/patch/72098=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	ARM: dts: sama5d4: enable Hantro G1 VDEC                             =20
	http://patchwork.linuxtv.org/patch/72099=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	ARM: configs: at91: sama5: update with savedefconfig                 =20
	http://patchwork.linuxtv.org/patch/72100=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	ARM: configs: at91: sama5: enable the Hantro G1 engine               =20
	http://patchwork.linuxtv.org/patch/72101=20
=09
  Mar,11 2021, from Emil Velikov <emil.velikov@collabora.com>:
	media: hantro: imx: reuse MB_DIM define                              =20
	http://patchwork.linuxtv.org/patch/72102=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	[v3,PATCH 1/3] dt-bindings: media: mtk-vcodec: Separating mtk vcodec e
	http://patchwork.linuxtv.org/patch/72151=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	[v3,PATCH 3/3] media: mtk-vcodec: Separating mtk encoder driver      =20
	http://patchwork.linuxtv.org/patch/72152=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	[v3,PATCH 2/3] arm64: dts: mt8173: Separating mtk-vcodec-enc device no
	http://patchwork.linuxtv.org/patch/72153=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	dt-bindings: media: mtk-vcodec: Add dma-ranges property              =20
	http://patchwork.linuxtv.org/patch/72155=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC          =20
	http://patchwork.linuxtv.org/patch/72156=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	media: mtk-vcodec: Support 4GB~8GB range iova space for venc         =20
	http://patchwork.linuxtv.org/patch/72157=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	media: mtk-vcodec: Add MT8192 H264 venc driver                       =20
	http://patchwork.linuxtv.org/patch/72158=20
=09
  Mar,12 2021, from Irui Wang <irui.wang@mediatek.com>:
	media: mtk-vcodec: Support H264 4K encoding on MT8192                =20
	http://patchwork.linuxtv.org/patch/72159=20
=09
  Mar,12 2021, from Niklas S=C3=B6derlund   <niklas.soderlund+renesas@ragna=
tech.se>:
	dt-bindings: media: renesas,vin: Add r8a77961 support                =20
	http://patchwork.linuxtv.org/patch/72181=20
=09
  Mar,12 2021, from Niklas S=C3=B6derlund   <niklas.soderlund+renesas@ragna=
tech.se>:
	dt-bindings: media: renesas,csi2: Add r8a77961 support               =20
	http://patchwork.linuxtv.org/patch/72182=20
=09
  Mar,12 2021, from Niklas S=C3=B6derlund   <niklas.soderlund+renesas@ragna=
tech.se>:
	media: rcar-vin: Enable support for r8a77961                         =20
	http://patchwork.linuxtv.org/patch/72183=20
=09
  Mar,12 2021, from Niklas S=C3=B6derlund   <niklas.soderlund+renesas@ragna=
tech.se>:
	media: rcar-csi2: Enable support for r8a77961                        =20
	http://patchwork.linuxtv.org/patch/72184=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/common: rename MPEG to CODEC                                   =20
	http://patchwork.linuxtv.org/patch/72216=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/pci: rename MPEG to CODEC                                      =20
	http://patchwork.linuxtv.org/patch/72219=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/i2c: rename MPEG to CODEC                                      =20
	http://patchwork.linuxtv.org/patch/72220=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	v4l2-controls.h: rename _MPEG_ to _CODEC_                            =20
	http://patchwork.linuxtv.org/patch/72221=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	Documentation/*/media: rename MPEG to CODEC                          =20
	http://patchwork.linuxtv.org/patch/72222=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/usb: rename MPEG to CODEC                                      =20
	http://patchwork.linuxtv.org/patch/72223=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/platform: rename MPEG to CODEC                                 =20
	http://patchwork.linuxtv.org/patch/72224=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	staging/media: rename MPEG to CODEC                                  =20
	http://patchwork.linuxtv.org/patch/72225=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/test-drivers: rename MPEG to CODEC                             =20
	http://patchwork.linuxtv.org/patch/72226=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	videodev2.h: rename MPEG to CODEC                                    =20
	http://patchwork.linuxtv.org/patch/72227=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	staging/vc04_services: rename MPEG to CODEC                          =20
	http://patchwork.linuxtv.org/patch/72228=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	media/v4l2-core: rename MPEG to CODEC                                =20
	http://patchwork.linuxtv.org/patch/72229=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	v4l2-controls.h: place all MPEG aliases under #ifndef __KERNEL__     =20
	http://patchwork.linuxtv.org/patch/72230=20
=09
  Mar,13 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	include/media: rename MPEG to CODEC                                  =20
	http://patchwork.linuxtv.org/patch/72231=20
=09
  Mar,14 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	ext-ctrls-codec.rst: update note at start of codec section           =20
	http://patchwork.linuxtv.org/patch/72234=20
=09
  Mar,17 2021, from Ricardo Ribalda <ricardo.ribalda@gmail.com>:
	v4l2-compliance: Let uvcvideo return -EACCES                         =20
	http://patchwork.linuxtv.org/patch/72381=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	dt-bindings: mfd: Add 'nxp,imx8mq-vpu-ctrl' to syscon list           =20
	http://patchwork.linuxtv.org/patch/72423=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	dt-bindings: media: nxp,imx8mq-vpu: Update the bindings for G2 support
	http://patchwork.linuxtv.org/patch/72425=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hevc: Add fields and flags for hevc PPS                       =20
	http://patchwork.linuxtv.org/patch/72426=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: change hantro_codec_ops run prototype to return errors=20
	http://patchwork.linuxtv.org/patch/72427=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hevc: Add decode params control                               =20
	http://patchwork.linuxtv.org/patch/72428=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: Use syscon instead of 'ctrl' register                 =20
	http://patchwork.linuxtv.org/patch/72429=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: Only use postproc when post processed formats are defin
	http://patchwork.linuxtv.org/patch/72430=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: Define HEVC codec profiles and supported features     =20
	http://patchwork.linuxtv.org/patch/72431=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control                =20
	http://patchwork.linuxtv.org/patch/72432=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: uapi: Add a control for HANTRO driver                         =20
	http://patchwork.linuxtv.org/patch/72433=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: Introduce G2/HEVC decoder                             =20
	http://patchwork.linuxtv.org/patch/72434=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	media: hantro: IMX8M: add variant for G2/HEVC codec                  =20
	http://patchwork.linuxtv.org/patch/72435=20
=09
  Mar,18 2021, from Benjamin Gaignard <benjamin.gaignard@collabora.com>:
	arm64: dts: imx8mq: Add node to G2 hardware                          =20
	http://patchwork.linuxtv.org/patch/72436=20
=09
  Mar,18 2021, from Arnd Bergmann <arnd@arndb.de>:
	media: v4l2-core: ignore native time32 ioctls on 64-bit              =20
	http://patchwork.linuxtv.org/patch/72440=20
=09
  Mar,18 2021, from Arnd Bergmann <arnd@arndb.de>:
	media: v4l2-core: explicitly clear ioctl input data                  =20
	http://patchwork.linuxtv.org/patch/72441=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D delegated to Laurent Pinchart <laurent.pinchart@ideasonboard.com> =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Aug,30 2013, from Pawel Osciak <posciak@chromium.org>:
	uvcvideo: Add support for UVC 1.5 VP8 simulcast.                     =20
	http://patchwork.linuxtv.org/patch/19986=20
=09
  Mar,10 2015, from Tim Nordell <tim.nordell@logicpd.com>:
	omap3isp: Disable CCDC's VD0 and VD1 interrupts when stream is not ena
	http://patchwork.linuxtv.org/patch/28685=20
=09
  Mar,10 2015, from Tim Nordell <tim.nordell@logicpd.com>:
	omap3isp: Add a delayed buffers for frame mode                       =20
	http://patchwork.linuxtv.org/patch/28686=20
=09
  Jun,29 2016, from Jose Abreu <Jose.Abreu@synopsys.com>:
	media: platform/xilinx: Set VTC VSYNC/VBLANK values                  =20
	http://patchwork.linuxtv.org/patch/34874=20
=09
  Nov,23 2016, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	v4l: uvcvideo: Remove format descriptions                            =20
	http://patchwork.linuxtv.org/patch/38303=20
=09
  Jan,30 2017, from Fabian Frederick <fabf@skynet.be>:
	omap3isp: use atomic_dec_not_zero()                                  =20
	http://patchwork.linuxtv.org/patch/39120=20
=09
  Feb, 3 2017, from Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>:
	media: uvcvideo: Add support for changing UVC_URBS/UVC_MAX_PACKETS fro
	http://patchwork.linuxtv.org/patch/39201=20
=09
  Feb, 7 2017, from Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>:
	uvcvideo: prepare to support compound controls                       =20
	http://patchwork.linuxtv.org/patch/39252=20
=09
  Feb, 7 2017, from Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>:
	uvcvideo: support compound controls                                  =20
	http://patchwork.linuxtv.org/patch/39255=20
=09
  Feb,14 2017, from Sakari Ailus <sakari.ailus@iki.fi>:
	[RFC 08/13] smiapp-pll: Take existing divisor into account in minimum=20
	http://patchwork.linuxtv.org/patch/39402=20
=09
  Feb,14 2017, from Pavel Machek <pavel@ucw.cz>:
	[RFC 13/13] adp1653: add subdevs                                     =20
	http://patchwork.linuxtv.org/patch/39404=20
=09
  Feb,14 2017, from Pavel Machek <pavel@ucw.cz>:
	[RFC 10/13] omap3isp: fix capture                                    =20
	http://patchwork.linuxtv.org/patch/39406=20
=09
  Feb,14 2017, from Pavel Machek <pavel@ucw.cz>:
	[RFC 05/13] omap3isp: Add subdevices support                         =20
	http://patchwork.linuxtv.org/patch/39411=20
=09
  Feb,14 2017, from Pavel Machek <pavel@ucw.cz>:
	[RFC 04/13] omap3isp: add support for CSI1 bus                       =20
	http://patchwork.linuxtv.org/patch/39412=20
=09
  Feb,18 2017, from Pavel Machek <pavel@ucw.cz>:
	Re: [RFC 04/13] omap3isp: add support for CSI1 bus                   =20
	http://patchwork.linuxtv.org/patch/39494=20
=09
  Jun, 4 2017, from Alexandre Macabies <web+oss@zopieux.com>:
	uvcvideo: Hardcoded CTRL_QUERY GET_LEN for a lying device            =20
	http://patchwork.linuxtv.org/patch/41638=20
=09
  Jun, 7 2017, from Arvind Yadav <arvind.yadav.cs@gmail.com>:
	Staging: media: davinci_vpfe Fix resource leaks in error paths.      =20
	http://patchwork.linuxtv.org/patch/41674=20
=09
  Jun,16 2017, from Gustavo Padovan <gustavo.padovan@collabora.com>:
	[media] uvc: enable subscriptions to other events                    =20
	http://patchwork.linuxtv.org/patch/41934=20
=09
  Jun,26 2017, from "H. Nikolaus Schaller" <hns@goldelico.com>:
	media: omap3isp: handle NULL return of omap3isp_video_format_info() in
	http://patchwork.linuxtv.org/patch/42132=20
=09
  Sep,15 2017, from Hans Yang <hansy@nvidia.com>:
	[media] uvcvideo: zero seq number when disabling stream              =20
	http://patchwork.linuxtv.org/patch/44135=20
=09
  Oct, 3 2017, from Arvind Yadav <arvind.yadav.cs@gmail.com>:
	staging: media: davinci_vpfe: pr_err() strings should end with newline
	http://patchwork.linuxtv.org/patch/44710=20
=09
  Nov, 3 2017, from Markus Elfring <elfring@users.sourceforge.net>:
	staging/media/davinci_vpfe: Use common error handling code in vpfe_att
	http://patchwork.linuxtv.org/patch/45307=20
=09
  Dec, 1 2017, from Alexandre Macabies <web+oss@zopieux.com>:
	media: uvcvideo: Add quirk to support light switch on Dino-Lite camera
	http://patchwork.linuxtv.org/patch/45721=20
=09
  Jan, 6 2018, from Akinobu Mita <akinobu.mita@gmail.com>:
	media: xilinx-video: support pipeline power management               =20
	http://patchwork.linuxtv.org/patch/46343=20
=09
  Jan,11 2018, from Dan Williams <dan.j.williams@intel.com>:
	[media] uvcvideo: prevent bounds-check bypass via speculative executio
	http://patchwork.linuxtv.org/patch/46433=20
=09
  Mar,21 2018, from Ji-Hun Kim <ji_hun.kim@samsung.com>:
	staging: media: davinci_vpfe: add kfree() on goto err statement      =20
	http://patchwork.linuxtv.org/patch/48039=20
=09
  Mar,21 2018, from Ji-Hun Kim <ji_hun.kim@samsung.com>:
	staging: media: davinci_vpfe: add error handling on kmalloc failure  =20
	http://patchwork.linuxtv.org/patch/48040=20
=09
  May, 2 2018, from Colin Ian King <colin.king@canonical.com>:
	[media-next][V2] media: davinci_vpfe: fix memory leaks of params     =20
	http://patchwork.linuxtv.org/patch/49156=20
=09
  May, 2 2018, from Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xili=
nx.com>:
	v4l: xilinx: dma: Update video format descriptor                     =20
	http://patchwork.linuxtv.org/patch/49168=20
=09
  May, 2 2018, from Rohit Athavale <rathaval@xilinx.com>:
	xilinx: v4l: dma: Update driver to allow for probe defer             =20
	http://patchwork.linuxtv.org/patch/49169=20
=09
  May, 2 2018, from Vishal Sagar <vishal.sagar@xilinx.com>:
	xilinx: v4l: dma: Terminate DMA when media pipeline fail to start    =20
	http://patchwork.linuxtv.org/patch/49170=20
=09
  May, 2 2018, from Jeffrey Mouroux <jmouroux@xilinx.com>:
	uapi: media: New fourcc code and rst for 10 bit format               =20
	http://patchwork.linuxtv.org/patch/49171=20
=09
  May, 2 2018, from Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xili=
nx.com>:
	v4l: xilinx: dma: Add multi-planar support                           =20
	http://patchwork.linuxtv.org/patch/49172=20
=09
  May, 2 2018, from Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xili=
nx.com>:
	v4l: xilinx: dma: Add support for 10 bit formats                     =20
	http://patchwork.linuxtv.org/patch/49173=20
=09
  May, 2 2018, from Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>:
	v4l: xilinx: dma: Remove colorspace check in xvip_dma_verify_format  =20
	http://patchwork.linuxtv.org/patch/49174=20
=09
  May, 2 2018, from Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xili=
nx.com>:
	media-bus: uapi: Add YCrCb 420 media bus format and rst              =20
	http://patchwork.linuxtv.org/patch/49175=20
=09
  Jun,27 2018, from Keiichi Watanabe <keiichiw@chromium.org>:
	[RFC PATCH v1] media: uvcvideo: Cache URB header data before processin
	http://patchwork.linuxtv.org/patch/50572=20
=09
  Sep, 5 2018, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: adv748x: Allow probe with a single output endpoint            =20
	http://patchwork.linuxtv.org/patch/51876=20
=09
  Sep, 5 2018, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: adv748x: Support probing a single output                 =20
	http://patchwork.linuxtv.org/patch/51877=20
=09
  Sep, 5 2018, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: adv748x: Handle TX[A|B] power management                 =20
	http://patchwork.linuxtv.org/patch/51878=20
=09
  Sep, 5 2018, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: adv748x: Conditionally enable only CSI-2 outputs         =20
	http://patchwork.linuxtv.org/patch/51879=20
=09
  Sep, 5 2018, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: adv748x: Register only enabled inputs                    =20
	http://patchwork.linuxtv.org/patch/51880=20
=09
  Sep, 5 2018, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: adv748x: Register all input subdevices                   =20
	http://patchwork.linuxtv.org/patch/51881=20
=09
  Oct, 4 2018, from Wenwen Wang <wang6495@umn.edu>:
	media: davinci_vpfe: fix a NULL pointer dereference bug              =20
	http://patchwork.linuxtv.org/patch/52349=20
=09
  Nov, 3 2018, from Irenge Jules Bashizi <jbi.octave@gmail.com>:
	staging:media:Add SPDX-License-Identifier                            =20
	http://patchwork.linuxtv.org/patch/52735=20
=09
  Nov,20 2018, from Nicholas Mc Guire <hofrat@osadl.org>:
	media: davinci_vpfe: bail out if kmalloc failed                      =20
	http://patchwork.linuxtv.org/patch/53050=20
=09
  Nov,22 2018, from Sakari Ailus <sakari.ailus@iki.fi>:
	[yavta PATCH 1/1] Zero dev in main()                                 =20
	http://patchwork.linuxtv.org/patch/53104=20
=09
  Dec,17 2018, from Alistair Strachan <astrachan@google.com>:
	media: uvcvideo: Fix 'type' check leading to overflow                =20
	http://patchwork.linuxtv.org/patch/53560=20
=09
  Jan,10 2019, from Andreas Kemnade <andreas@kemnade.info>:
	media: omap3isp: Fix high idle current                               =20
	http://patchwork.linuxtv.org/patch/53831=20
=09
  Jan,10 2019, from Edgar Thier <info@edgarthier.net>:
	[Patch v2] uvcvideo: Add simple packed bayer 12-bit formats          =20
	http://patchwork.linuxtv.org/patch/53832=20
=09
  Mar, 4 2019, from Hugues Fruchet <hugues.fruchet@st.com>:
	media: uvcvideo: Read support                                        =20
	http://patchwork.linuxtv.org/patch/54815=20
=09
  Mar,17 2019, from Sergey Dorodnicov <sergey.dorodnicov@intel.com>:
	media: Add missing "Auto" option to the power line frequency control =20
	http://patchwork.linuxtv.org/patch/55087=20
=09
  Apr,28 2019, from Torleiv Sundre <torleiv@huddly.com>:
	media: uvcvido: Include streaming interface number in debugfs dir name
	http://patchwork.linuxtv.org/patch/55917=20
=09
  May,13 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: Define partition algorithm helper                       =20
	http://patchwork.linuxtv.org/patch/56138=20
=09
  May,13 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: Document partition algorithm in code header             =20
	http://patchwork.linuxtv.org/patch/56139=20
=09
  May,13 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: Split out pre-filter calculation                        =20
	http://patchwork.linuxtv.org/patch/56140=20
=09
  May,13 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: Provide partition overlap algorithm                     =20
	http://patchwork.linuxtv.org/patch/56141=20
=09
  May,17 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Convert to the new VSP atomic API                      =20
	http://patchwork.linuxtv.org/patch/56199=20
=09
  May,17 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: drm: Split vsp1_du_setup_lif()                          =20
	http://patchwork.linuxtv.org/patch/56200=20
=09
  Jun,18 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	media: vsp1: drm: Split vsp1_du_setup_lif()                          =20
	http://patchwork.linuxtv.org/patch/56979=20
=09
  Jun,18 2019, from Laurent Pinchart <laurent.pinchart+renesas@ideasonboard=
.com>:
	media: vsp1: drm: Don't configure hardware when the pipeline is disabl
	http://patchwork.linuxtv.org/patch/56980=20
=09
  Jun,18 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Convert to the new VSP atomic API                      =20
	http://patchwork.linuxtv.org/patch/56981=20
=09
  Jun,18 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Handle CRTC standby from commit tail handler           =20
	http://patchwork.linuxtv.org/patch/56983=20
=09
  Jun,18 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Provide for_each_group helper                          =20
	http://patchwork.linuxtv.org/patch/56984=20
=09
  Jun,18 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Handle CRTC configuration from commit tail handler     =20
	http://patchwork.linuxtv.org/patch/56985=20
=09
  Jun,18 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Perform group setup from the atomic tail handler       =20
	http://patchwork.linuxtv.org/patch/56986=20
=09
  Jun,18 2019, from Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>:
	drm: rcar-du: Create a group state object                            =20
	http://patchwork.linuxtv.org/patch/56987=20
=09
  Jun,18 2019, from Laurent Pinchart <laurent.pinchart+renesas@ideasonboard=
.com>:
	drm: rcar-du: Centralise routing configuration in commit tail handler=20
	http://patchwork.linuxtv.org/patch/56988=20
=09
  Jul, 8 2019, from Edgar Thier <info@edgarthier.net>:
	v4l: Add 12-bit raw bayer linear packed formats                      =20
	http://patchwork.linuxtv.org/patch/57461=20
=09
  Jul, 8 2019, from Edgar Thier <info@edgarthier.net>:
	uvc: Add 12-bit raw bayer linear packed formats                      =20
	http://patchwork.linuxtv.org/patch/57462=20
=09
  Aug, 2 2019, from Shik Chen <shik@chromium.org>:
	media: uvcvideo: Use streaming DMA APIs to transfer buffers          =20
	http://patchwork.linuxtv.org/patch/57867=20
=09
  Dec,10 2019, from Chuhong Yuan <hslester96@gmail.com>:
	media: omap3isp: add checks for devm_regulator_get                   =20
	http://patchwork.linuxtv.org/patch/60585=20
=09
  Dec,18 2019, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: uvc: Don't recompute frame size unnecessarily                 =20
	http://patchwork.linuxtv.org/patch/60872=20
=09
  Dec,19 2019, from Chuhong Yuan <hslester96@gmail.com>:
	media: omap3isp: fix the incorrect check in omap3isp_csiphy_acquire  =20
	http://patchwork.linuxtv.org/patch/60884=20
=09
  Jan,12 2020, from Naveen Naidu <naveennaidu479@gmail.com>:
	uvcvideo: On load display message                                    =20
	http://patchwork.linuxtv.org/patch/61137=20
=09
  Apr, 1 2020, from Julian Meyer <julianmeyer2000@gmail.com>:
	media: uvcvideo: read bulk URBs after maxPayloadSize                 =20
	http://patchwork.linuxtv.org/patch/62754=20
=09
  Apr,19 2020, from Julian Meyer <julianmeyer2000@gmail.com>:
	media: uvcvideo: read bulk URBs after maxPayloadSize                 =20
	http://patchwork.linuxtv.org/patch/63233=20
=09
  Apr,20 2020, from Julian Meyer <julianmeyer2000@gmail.com>:
	media: uvcvideo: read bulk URBs after maxPayloadSize                 =20
	http://patchwork.linuxtv.org/patch/63245=20
=09
  May,11 2020, from Xiongfeng Wang <wangxiongfeng2@huawei.com>:
	media: uvcvideo: add a missing newline when printing parameter 'clock'
	http://patchwork.linuxtv.org/patch/63732=20
=09
  Jun,22 2020, from Dan Carpenter <dan.carpenter@oracle.com>:
	media: uvc: Fix list_for_each() checking                             =20
	http://patchwork.linuxtv.org/patch/64799=20
=09
  Jun,26 2020, from Dan Carpenter <dan.carpenter@oracle.com>:
	media: uvcvideo: Fix loop exit condition in uvc_xu_ctrl_query()      =20
	http://patchwork.linuxtv.org/patch/64932=20
=09
  Aug, 7 2020, from "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>:
	media: usb: uvc_ctrl.c: add temp variable for list iteration         =20
	http://patchwork.linuxtv.org/patch/66112=20
=09
  Aug, 7 2020, from "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>:
	media: uvc: uvc_v4l2.c: add temp variable for list iteration         =20
	http://patchwork.linuxtv.org/patch/66113=20
=09
  Aug,21 2020, from Andrew Murray <amurray@thegoodpenguin.co.uk>:
	media: uvcvideo: Add bandwidth_cap module param                      =20
	http://patchwork.linuxtv.org/patch/66507=20
=09
  Aug,22 2020, from Adam Goode <agoode@google.com>:
	media: uvcvideo: Convey full ycbcr colorspace information to v4l2    =20
	http://patchwork.linuxtv.org/patch/66511=20
=09
  Aug,30 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Lock video streams and queues while unregistering   =20
	http://patchwork.linuxtv.org/patch/66654=20
=09
  Aug,30 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Release stream queue when unregistering video device=20
	http://patchwork.linuxtv.org/patch/66655=20
=09
  Aug,30 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Protect uvc queue file operations against disconnect=20
	http://patchwork.linuxtv.org/patch/66656=20
=09
  Aug,30 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Cancel async worker earlier                         =20
	http://patchwork.linuxtv.org/patch/66657=20
=09
  Aug,30 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: In uvc_v4l2_open, check if video device is registered
	http://patchwork.linuxtv.org/patch/66658=20
=09
  Sep, 8 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Protect uvc queue file operations against disconnect=20
	http://patchwork.linuxtv.org/patch/66847=20
=09
  Sep, 8 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Abort uvc_v4l2_open if video device is unregistered =20
	http://patchwork.linuxtv.org/patch/66848=20
=09
  Sep, 8 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Release stream queue when unregistering video device=20
	http://patchwork.linuxtv.org/patch/66849=20
=09
  Sep, 8 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Lock video streams and queues while unregistering   =20
	http://patchwork.linuxtv.org/patch/66850=20
=09
  Sep, 8 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Cancel async worker earlier                         =20
	http://patchwork.linuxtv.org/patch/66851=20
=09
  Sep,16 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Abort uvc_v4l2_open if video device is unregistered =20
	http://patchwork.linuxtv.org/patch/67051=20
=09
  Sep,16 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Release stream queue when unregistering video device=20
	http://patchwork.linuxtv.org/patch/67052=20
=09
  Sep,16 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Protect uvc queue file operations against disconnect=20
	http://patchwork.linuxtv.org/patch/67053=20
=09
  Sep,16 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Lock video streams and queues while unregistering   =20
	http://patchwork.linuxtv.org/patch/67054=20
=09
  Sep,16 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Cancel async worker earlier                         =20
	http://patchwork.linuxtv.org/patch/67055=20
=09
  Nov,12 2020, from Guenter Roeck <linux@roeck-us.net>:
	media: uvcvideo: Handle errors from calls to usb_string              =20
	http://patchwork.linuxtv.org/patch/68868=20
=09
  Dec,23 2020, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM           =20
	http://patchwork.linuxtv.org/patch/70252=20
=09
  Jan,28 2021, from Colin Ian King <colin.king@canonical.com>:
	[next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails      =20
	http://patchwork.linuxtv.org/patch/71174=20
=09
  Jan,28 2021, from Colin Ian King <colin.king@canonical.com>:
	[V2][next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails  =20
	http://patchwork.linuxtv.org/patch/71175=20
=09
  Feb, 1 2021, from Mauro Carvalho Chehab <mchehab+huawei@kernel.org>:
	media: uvc: limit max bandwidth for HDMI capture                     =20
	http://patchwork.linuxtv.org/patch/71225=20
=09
  Feb, 8 2021, from Sergey Senozhatsky <senozhatsky@chromium.org>:
	media: uvcvideo: add UVC 1.5 ROI control                             =20
	http://patchwork.linuxtv.org/patch/71367=20
=09
  Feb,10 2021, from Colin Ian King <colin.king@canonical.com>:
	[next] media: uvcvideo: remove duplicated dma_dev assignment         =20
	http://patchwork.linuxtv.org/patch/71408=20
=09
  Feb,10 2021, from Colin Ian King <colin.king@canonical.com>:
	[next][V2] media: uvcvideo: remove duplicated dma_dev assignments    =20
	http://patchwork.linuxtv.org/patch/71410=20
=09
  Feb,10 2021, from "Gustavo A. R. Silva" <gustavoars@kernel.org>:
	[next] media: uvcvideo: Remove duplicate assignment to pointer dma_dev
	http://patchwork.linuxtv.org/patch/71411=20
=09
  Feb,10 2021, from "Gustavo A. R. Silva" <gustavoars@kernel.org>:
	[next] media: uvcvideo: Remove duplicate assignments to pointer dma_de
	http://patchwork.linuxtv.org/patch/71412=20
=09
  Feb,21 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: uvcvideo: Fix XU id print in forward scan                     =20
	http://patchwork.linuxtv.org/patch/71656=20
=09
  Mar, 1 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Use dma_alloc_noncontiguos API                      =20
	http://patchwork.linuxtv.org/patch/71785=20
=09
  Mar, 8 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: uvcvideo: Support devices that report an OT as an entity source
	http://patchwork.linuxtv.org/patch/71980=20
=09
  Mar,13 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Use dma_alloc_noncontiguous API                     =20
	http://patchwork.linuxtv.org/patch/72214=20
=09
  Mar,19 2021, from Dan Carpenter <dan.carpenter@oracle.com>:
	media: uvcvideo: fix GFP_ flags in uvc_submit_urb()                  =20
	http://patchwork.linuxtv.org/patch/72476=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Remove s_ctrl and g_ctrl                            =20
	http://patchwork.linuxtv.org/patch/72502=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL            =20
	http://patchwork.linuxtv.org/patch/72503=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Use dev->name for querycap()                        =20
	http://patchwork.linuxtv.org/patch/72504=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS           =20
	http://patchwork.linuxtv.org/patch/72505=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Return -EIO for control errors                      =20
	http://patchwork.linuxtv.org/patch/72506=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Set capability in s_param                           =20
	http://patchwork.linuxtv.org/patch/72507=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE          =20
	http://patchwork.linuxtv.org/patch/72508=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: refactor __uvc_ctrl_add_mapping                     =20
	http://patchwork.linuxtv.org/patch/72509=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Set unique vdev name based in type                  =20
	http://patchwork.linuxtv.org/patch/72510=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Use control names from framework                    =20
	http://patchwork.linuxtv.org/patch/72511=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Check controls flags before accessing them          =20
	http://patchwork.linuxtv.org/patch/72512=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Set error_idx during ctrl_commit errors             =20
	http://patchwork.linuxtv.org/patch/72514=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Downgrade control error messages                    =20
	http://patchwork.linuxtv.org/patch/72515=20
=09
  Mar,19 2021, from Ricardo Ribalda <ribalda@chromium.org>:
	media: uvcvideo: Return -EACCES to inactive controls                 =20
	http://patchwork.linuxtv.org/patch/72516=20
=09
  Mar,19 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	uvc: use vb2 ioctl and fop helpers                                   =20
	http://patchwork.linuxtv.org/patch/72517=20
=09
  Mar,22 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE                 =20
	http://patchwork.linuxtv.org/patch/72539=20
=09
  Mar,22 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	uvcvideo: improve error handling in uvc_query_ctrl()                 =20
	http://patchwork.linuxtv.org/patch/72540=20
=09
  Mar,22 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	uvcvideo: don't spam the log in uvc_ctrl_restore_values()            =20
	http://patchwork.linuxtv.org/patch/72541=20
=09
  Mar,22 2021, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	uvc: don't set description in ENUM_FMT                               =20
	http://patchwork.linuxtv.org/patch/72547=20
=09
  Mar,22 2021, from Edgar Thier <info@edgarthier.net>:
	uvc: Add 12-bit raw bayer linear packed formats                      =20
	http://patchwork.linuxtv.org/patch/72548=20
=09
  Mar,23 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	omap3isp.h: fix kernel-doc warnings                                  =20
	http://patchwork.linuxtv.org/patch/72570=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D delegated to Mauro Carvalho Chehab <mchehab@kernel.org> =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Jan,14 2015, from "bk0121.shin" <bk0121.shin@samsung.com>:
	[media] dvb-core: Fix frontend thread serialization                  =20
	http://patchwork.linuxtv.org/patch/27914=20
=09
  Mar,25 2015, from Jaedon Shin <jaedon.shin@gmail.com>:
	media: dmxdev: fix possible race condition                           =20
	http://patchwork.linuxtv.org/patch/28968=20
=09
  Mar,16 2017, from Mauro Carvalho Chehab <mchehab@s-opensource.com> (by wa=
y of Mauro 	Carvalho Chehab <mchehab@s-opensource.com>):
	dwc2: Don't assume URB transfer_buffer are dword-aligned             =20
	http://patchwork.linuxtv.org/patch/40093=20
=09
  Apr, 5 2017, from Mauro Carvalho Chehab <mchehab@s-opensource.com>:
	usb: document that URB transfer_buffer should be aligned             =20
	http://patchwork.linuxtv.org/patch/40628=20
=09
  Aug, 8 2018, from Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
	media: uniphier: add platform driver module of HSC                   =20
	http://patchwork.linuxtv.org/patch/51463=20
=09
  Aug, 8 2018, from Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
	media: uniphier: add LD11/LD20 HSC support                           =20
	http://patchwork.linuxtv.org/patch/51464=20
=09
  Aug, 8 2018, from Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
	media: uniphier: add DMA common file of HSC                          =20
	http://patchwork.linuxtv.org/patch/51465=20
=09
  Aug, 8 2018, from Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
	media: uniphier: add ucode load common file of HSC                   =20
	http://patchwork.linuxtv.org/patch/51466=20
=09
  Aug, 8 2018, from Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
	media: uniphier: add TS common file of HSC                           =20
	http://patchwork.linuxtv.org/patch/51467=20
=09
  Aug, 8 2018, from Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
	media: uniphier: add CSS common file of HSC                          =20
	http://patchwork.linuxtv.org/patch/51468=20
=09
  Aug, 8 2018, from Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
	media: uniphier: add DT bindings documentation for UniPhier HSC      =20
	http://patchwork.linuxtv.org/patch/51469=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
  =3D delegated to Sakari Ailus <sakari.ailus@iki.fi> =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

  Apr,16 2016, from Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>:
	[media] smiapp: provide g_skip_top_lines method in sensor ops        =20
	http://patchwork.linuxtv.org/patch/33904=20
=09
  Oct,12 2016, from Jacek Anaszewski <j.anaszewski@samsung.com>:
	mediactl: libv4l2subdev: add support for comparing mbus formats      =20
	http://patchwork.linuxtv.org/patch/37446=20
=09
  Oct,12 2016, from Jacek Anaszewski <j.anaszewski@samsung.com>:
	mediactl: Add support for v4l2-ctrl-binding config                   =20
	http://patchwork.linuxtv.org/patch/37453=20
=09
  Oct,12 2016, from Jacek Anaszewski <j.anaszewski@samsung.com>:
	mediactl: Add media_entity_get_backlinks()                           =20
	http://patchwork.linuxtv.org/patch/37454=20
=09
  Oct,12 2016, from Jacek Anaszewski <j.anaszewski@samsung.com>:
	mediactl: Add media_device creation helpers                          =20
	http://patchwork.linuxtv.org/patch/37455=20
=09
  Oct,13 2016, from Jacek Anaszewski <j.anaszewski@samsung.com>:
	Add a libv4l plugin for Exynos4 camera                               =20
	http://patchwork.linuxtv.org/patch/37496=20
=09
  Nov, 8 2016, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: entity: Add media_entity_has_route() function                 =20
	http://patchwork.linuxtv.org/patch/37950=20
=09
  May, 8 2017, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	[RFC v4 18/18] v4l: Use non-consistent DMA mappings for hardware that=20
	http://patchwork.linuxtv.org/patch/41218=20
=09
  May,31 2017, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	vb2: Move cache synchronisation from buffer done to dqbuf handler    =20
	http://patchwork.linuxtv.org/patch/41564=20
=09
  Nov,12 2017, from Pavel Machek <pavel@ucw.cz>:
	[rfc] libv4l2: better auto-gain                                      =20
	http://patchwork.linuxtv.org/patch/45425=20
=09
  Mar,16 2018, from Pavel Machek <pavel@ucw.cz>:
	[RFC, libv4l]: Make libv4l2 usable on devices with complex pipeline  =20
	http://patchwork.linuxtv.org/patch/47982=20
=09
  Jul,16 2018, from Pavel Machek <pavel@ucw.cz>:
	media: i2c: lm3560: use conservative defaults                        =20
	http://patchwork.linuxtv.org/patch/50995=20
=09
  Aug,23 2018, from Edgar Thier <info@edgarthier.net>:
	v4l: Add simple packed Bayer raw12 pixel formats                     =20
	http://patchwork.linuxtv.org/patch/51664=20
=09
  Aug,23 2018, from Helmut Grohne <helmut.grohne@intenta.de>:
	media: aptina-pll: allow approximating the requested pix_clock       =20
	http://patchwork.linuxtv.org/patch/51672=20
=09
  Sep,27 2018, from Hugues Fruchet <hugues.fruchet@st.com>:
	media: v4l2-core: add pixel clock max frequency parallel port property
	http://patchwork.linuxtv.org/patch/52251=20
=09
  Sep,27 2018, from Hugues Fruchet <hugues.fruchet@st.com>:
	media: ov5640: move parallel port pixel clock divider out of registers
	http://patchwork.linuxtv.org/patch/52252=20
=09
  Sep,27 2018, from Hugues Fruchet <hugues.fruchet@st.com>:
	media: dt-bindings: media: Document pclk-max-frequency property      =20
	http://patchwork.linuxtv.org/patch/52253=20
=09
  Sep,27 2018, from Hugues Fruchet <hugues.fruchet@st.com>:
	media: ov5640: reduce rate according to maximum pixel clock frequency=20
	http://patchwork.linuxtv.org/patch/52254=20
=09
  Apr, 4 2019, from Marco Felsch <m.felsch@pengutronix.de>:
	media: ov2680: get rid of extra ifdefs                               =20
	http://patchwork.linuxtv.org/patch/55439=20
=09
  Apr, 4 2019, from Marco Felsch <m.felsch@pengutronix.de>:
	media: ov2659: get rid of extra ifdefs                               =20
	http://patchwork.linuxtv.org/patch/55440=20
=09
  Apr, 4 2019, from Marco Felsch <m.felsch@pengutronix.de>:
	media: ov7740: get rid of extra ifdefs                               =20
	http://patchwork.linuxtv.org/patch/55442=20
=09
  Apr, 4 2019, from Marco Felsch <m.felsch@pengutronix.de>:
	media: ov5695: get rid of extra ifdefs                               =20
	http://patchwork.linuxtv.org/patch/55443=20
=09
  Apr, 4 2019, from Marco Felsch <m.felsch@pengutronix.de>:
	media: ov7670: get rid of extra ifdefs                               =20
	http://patchwork.linuxtv.org/patch/55444=20
=09
  Apr, 9 2019, from Chen-Yu Tsai <wens@csie.org>:
	[DO NOT MERGE] ARM: dts: sun8i: a83t: bananapi-m3: Enable BPI OV5640 c
	http://patchwork.linuxtv.org/patch/55544=20
=09
  Apr, 9 2019, from Chen-Yu Tsai <wens@csie.org>:
	ARM: dts: sun8i: a83t: Add device node for CSI (Camera Sensor Interfac
	http://patchwork.linuxtv.org/patch/55545=20
=09
  May,20 2019, from Marek Vasut <marex@denx.de>:
	media: dt-bindings: Add Intersil ISL7998x DT bindings                =20
	http://patchwork.linuxtv.org/patch/56220=20
=09
  May,20 2019, from Marek Vasut <marex@denx.de>:
	media: i2c: isl7998x: Add driver for Intersil ISL7998x               =20
	http://patchwork.linuxtv.org/patch/56221=20
=09
  Aug,17 2019, from Jacopo Mondi <jacopo@jmondi.org>:
	media: i2c: ov5670: Report native size and crop bounds               =20
	http://patchwork.linuxtv.org/patch/58254=20
=09
  Aug,17 2019, from Jacopo Mondi <jacopo@jmondi.org>:
	media: i2c: ov13858: Report native size and crop bounds              =20
	http://patchwork.linuxtv.org/patch/58255=20
=09
  Mar, 9 2020, from Pavel Machek <pavel@ucw.cz>:
	et8ek8: Support for EXPOSURE_ABSOLUTE                                =20
	http://patchwork.linuxtv.org/patch/61975=20
=09
  Mar,31 2020, from Bingbu Cao <bingbu.cao@intel.com>:
	media: ipu3.rst: add yuv-downscaling into pipeline diagram           =20
	http://patchwork.linuxtv.org/patch/62735=20
=09
  Apr,30 2020, from Arnd Bergmann <arnd@arndb.de>:
	media: s5k5baf: avoid gcc-10 zero-length-bounds warning              =20
	http://patchwork.linuxtv.org/patch/63471=20
=09
  May, 4 2020, from Janusz Krzysztofik <jmkrzyszt@gmail.com>:
	media: ov6650: Fix set format try processing path                    =20
	http://patchwork.linuxtv.org/patch/63522=20
=09
  May, 4 2020, from Janusz Krzysztofik <jmkrzyszt@gmail.com>:
	media: ov6650: Add try support to selection API operations           =20
	http://patchwork.linuxtv.org/patch/63523=20
=09
  May, 4 2020, from Janusz Krzysztofik <jmkrzyszt@gmail.com>:
	media: ov6650: Fix crop rectangle affected by set format             =20
	http://patchwork.linuxtv.org/patch/63524=20
=09
  May, 4 2020, from Janusz Krzysztofik <jmkrzyszt@gmail.com>:
	media: ov6650: Fix clock not released on subdev unregister           =20
	http://patchwork.linuxtv.org/patch/63525=20
=09
  May, 4 2020, from Janusz Krzysztofik <jmkrzyszt@gmail.com>:
	media: ov6650: Fix missing frame interval enumeration support        =20
	http://patchwork.linuxtv.org/patch/63526=20
=09
  May, 4 2020, from Janusz Krzysztofik <jmkrzyszt@gmail.com>:
	media: ov6650: Fix missing frame interval enumeration support        =20
	http://patchwork.linuxtv.org/patch/63568=20
=09
  May,19 2020, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	Documentation: media: Refer to mbus format documentation from CSI-2 do
	http://patchwork.linuxtv.org/patch/63921=20
=09
  Jul,15 2020, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	dt-bindings: media: i2c: Add bindings for IMI RDACM2x                =20
	http://patchwork.linuxtv.org/patch/65502=20
=09
  Aug,10 2020, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	dt-bindings: media: ov5647: Convert to json-schema                   =20
	http://patchwork.linuxtv.org/patch/66154=20
=09
  Aug,18 2020, from Sebastian Gross <sebastian.gross@emlix.com>:
	media: i2c: ov5640: Add strobe                                       =20
	http://patchwork.linuxtv.org/patch/66346=20
=09
  Aug,31 2020, from Bingbu Cao <bingbu.cao@intel.com>:
	media: ov5675: fix typos in comments                                 =20
	http://patchwork.linuxtv.org/patch/66661=20
=09
  Sep, 8 2020, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	v4l2-fwnode: Document changes usage patterns of v4l2_fwnode_endpoint_p
	http://patchwork.linuxtv.org/patch/66828=20
=09
  Sep,10 2020, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	dt-bindings: media: ov772x: Convert to json-schema                   =20
	http://patchwork.linuxtv.org/patch/66878=20
=09
  Sep,10 2020, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	dt-bindings: media: imx214: Convert to json-schema                   =20
	http://patchwork.linuxtv.org/patch/66880=20
=09
  Sep,10 2020, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	dt-bindings: media: mt9v111: Convert to json-schema                  =20
	http://patchwork.linuxtv.org/patch/66883=20
=09
  Sep,16 2020, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: max9286: Fix async subdev size                           =20
	http://patchwork.linuxtv.org/patch/67028=20
=09
  Sep,21 2020, from Krzysztof Kozlowski <krzk@kernel.org>:
	media: i2c: imx214: simplify getting state container                 =20
	http://patchwork.linuxtv.org/patch/67196=20
=09
  Oct, 5 2020, from Krzysztof Kozlowski <krzk@kernel.org>:
	media: i2c: imx258: add HDR control                                  =20
	http://patchwork.linuxtv.org/patch/67720=20
=09
  Oct, 7 2020, from Arnd Bergmann <arnd@arndb.de>:
	media: atomisp: remove compat_ioctl32 code                           =20
	http://patchwork.linuxtv.org/patch/67871=20
=09
  Nov,16 2020, from Rob Herring <robh@kernel.org>:
	dt-bindings: media: Use OF graph schema                              =20
	http://patchwork.linuxtv.org/patch/69005=20
=09
  Nov,27 2020, from Tom Rix <trix@redhat.com>:
	[media] s5k5baf: remove trailing semicolon in macro definition       =20
	http://patchwork.linuxtv.org/patch/69444=20
=09
  Dec, 7 2020, from Hans Verkuil <hverkuil-cisco@xs4all.nl>:
	imx274: remove composition support, add V4L2_SEL_TGT_CROP_DEFAULT    =20
	http://patchwork.linuxtv.org/patch/69838=20
=09
  Dec,11 2020, from Jacopo Mondi <jacopo@jmondi.org>:
	media: i2c: ov13858: Add .get_selection support                      =20
	http://patchwork.linuxtv.org/patch/69961=20
=09
  Dec,11 2020, from Jacopo Mondi <jacopo@jmondi.org>:
	media: i2c: ov5670: Add .get_selection support                       =20
	http://patchwork.linuxtv.org/patch/69962=20
=09
  Jan, 5 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	ccs: Fix sub-device function                                         =20
	http://patchwork.linuxtv.org/patch/70422=20
=09
  Jan,14 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	dt-bindings: media: max9286: Document 'maxim,reverse-channel-microvolt
	http://patchwork.linuxtv.org/patch/70768=20
=09
  Feb, 3 2021, from Yang Li <yang.lee@linux.alibaba.com>:
	media: i2c: remove unneeded semicolon                                =20
	http://patchwork.linuxtv.org/patch/71276=20
=09
  Feb, 3 2021, from Martina Krasteva <martinax.krasteva@intel.com>:
	dt-bindings: media: Add bindings for imx334                          =20
	http://patchwork.linuxtv.org/patch/71289=20
=09
  Feb, 8 2021, from Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
	media: staging: ipu3: uapi: Add "WITH Linux-syscall-note" license    =20
	http://patchwork.linuxtv.org/patch/71363=20
=09
  Feb, 8 2021, from Jacopo Mondi <jacopo+renesas@jmondi.org>:
	media: i2c: rdamc21: Fix warning on u8 cast                          =20
	http://patchwork.linuxtv.org/patch/71372=20
=09
  Feb,11 2021, from Sakari Ailus <sakari.ailus@linux.intel.com>:
	ov5670: Support probe whilst the device is in ACPI D state other than=20
	http://patchwork.linuxtv.org/patch/71415=20
=09
  Feb,24 2021, from Daniel Lezcano <daniel.lezcano@linaro.org>:
	i2c/drivers/ov02q10: Use HZ macros                                   =20
	http://patchwork.linuxtv.org/patch/71725=20
=09
  Feb,26 2021, from Colin Ian King <colin.king@canonical.com>:
	media: i2c: adp1653: fix error handling from a call to adp1653_get_fau
	http://patchwork.linuxtv.org/patch/71777=20
=09
  Mar, 4 2021, from Jia-Ju Bai <baijiaju1990@gmail.com>:
	media: i2c: imx274: fix error return code of imx274_s_frame_interval()
	http://patchwork.linuxtv.org/patch/71956=20
=09
  Mar, 9 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	i2c/ccs: fix kernel-doc header issues                                =20
	http://patchwork.linuxtv.org/patch/71997=20
=09
  Mar,10 2021, from Yang Li <yang.lee@linux.alibaba.com>:
	media: i2c: remove unneeded variable 'ret'                           =20
	http://patchwork.linuxtv.org/patch/72007=20
=09
  Mar,10 2021, from Shawn Tu <shawnx.tu@intel.com>:
	ov8856: Add support for 2 data lanes & flip control                  =20
	http://patchwork.linuxtv.org/patch/72009=20
=09
  Mar,12 2021, from Niklas S=C3=B6derlund   <niklas.soderlund+renesas@ragna=
tech.se>:
	media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()  =20
	http://patchwork.linuxtv.org/patch/72185=20
=09
  Mar,12 2021, from Niklas S=C3=B6derlund   <niklas.soderlund+renesas@ragna=
tech.se>:
	media: rcar-vin: Remove explicit device availability check           =20
	http://patchwork.linuxtv.org/patch/72186=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D delegated to Sean Young <sean@mess.org> =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Jan,15 2018, from Sean Young <sean@mess.org>:
	auxdisplay: charlcd: add escape sequence for brightness on NEC =C2=B5PD163
	http://patchwork.linuxtv.org/patch/46472=20
=09
  Jan,15 2018, from Sean Young <sean@mess.org>:
	auxdisplay: charlcd: add flush function                              =20
	http://patchwork.linuxtv.org/patch/46473=20
=09
  Jan,15 2018, from Sean Young <sean@mess.org>:
	media: rc: add keymap for Dign Remote                                =20
	http://patchwork.linuxtv.org/patch/46474=20
=09
  Jan,15 2018, from Sean Young <sean@mess.org>:
	media: rc: new driver for Sasem Remote Controller VFD/IR             =20
	http://patchwork.linuxtv.org/patch/46475=20
=09
  Jul,13 2018, from Sean Young <sean@mess.org>:
	media: dt-bindings: bind nokia, n900-ir to generic pwm-ir-tx driver  =20
	http://patchwork.linuxtv.org/patch/50987=20
=09
  Jul,13 2018, from Sean Young <sean@mess.org>:
	media: rc: remove ir-rx51 in favour of generic pwm-ir-tx             =20
	http://patchwork.linuxtv.org/patch/50988=20
=09
  Nov, 3 2018, from Derek Kelly <user.vdr@gmail.com>:
	Input: Add missing event codes for common IR remote buttons          =20
	http://patchwork.linuxtv.org/patch/52736=20
=09
  Aug,22 2019, from Anton Vasilyev <vasilyev@ispras.ru>:
	media: dw2102: Fix use after free                                    =20
	http://patchwork.linuxtv.org/patch/58364=20
=09
  May, 2 2020, from Daniel Gielen <gielendaniel@gmail.com>:
	DVBSKY S952v1 (M88TS2020 tuner, M88DS3103 demod): Set clk_out_div to 1
	http://patchwork.linuxtv.org/patch/63519=20
=09
  Jun,11 2020, from Marc Gonzalez <marc.w.gonzalez@free.fr>:
	[RFC PATCH][DO NOT COMMIT] media: dvb_frontend: Support concurrent DVB
	http://patchwork.linuxtv.org/patch/64434=20
=09
  Sep,22 2020, from Sean Young <sean@mess.org>:
	media: gpio-ir-tx: re-introduce sleeping for periods of > 50us       =20
	http://patchwork.linuxtv.org/patch/67262=20
=09
  Dec, 7 2020, from Anant Thazhemadam <anant.thazhemadam@gmail.com>:
	media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()
	http://patchwork.linuxtv.org/patch/69835=20
=09
  Jan,20 2021, from Arnd Bergmann <arnd@arndb.de>:
	media: rc: remove tango ir driver                                    =20
	http://patchwork.linuxtv.org/patch/70961=20
=09
  Jan,20 2021, from Arnd Bergmann <arnd@arndb.de>:
	media: rc: remove zte zx ir driver                                   =20
	http://patchwork.linuxtv.org/patch/70963=20
=09
  Jan,25 2021, from Andre Przywara <andre.przywara@arm.com>:
	dt-bindings: media: IR: Add H616 IR compatible string                =20
	http://patchwork.linuxtv.org/patch/71067=20
=09
  Jan,26 2021, from Bastien Nocera <hadess@hadess.net>:
	media: rc: add keymap for Dell RC 260 remote                         =20
	http://patchwork.linuxtv.org/patch/71092=20
=09
  Jan,27 2021, from Andre Przywara <andre.przywara@arm.com>:
	dt-bindings: media: IR: Add H616 IR compatible string                =20
	http://patchwork.linuxtv.org/patch/71149=20
=09
  Jan,28 2021, from Simon Liddicott <simon@liddicott.com>:
	dtv-scan-tables: latest UK changes                                   =20
	http://patchwork.linuxtv.org/patch/71194=20
=09
  Mar, 4 2021, from Ulrich =C3=96lmann <u.oelmann@pengutronix.de>:
	keytable: restrict installation of 50-rc_keymap.conf                 =20
	http://patchwork.linuxtv.org/patch/71932=20
=09
  Mar, 4 2021, from Ulrich =C3=96lmann <u.oelmann@pengutronix.de>:
	configure.ac: autodetect availability of systemd                     =20
	http://patchwork.linuxtv.org/patch/71933=20
=09
  Mar,17 2021, from Nikolaos Beredimas <beredim@gmail.com>:
	Revisiting ITE8708 on ASUS PN50 uses a 16 byte io region             =20
	http://patchwork.linuxtv.org/patch/72382=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D delegated to Silvester Nawrocki <sylvester.nawrocki@gmail.com> =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Mar,23 2021, from Hans Verkuil <hverkuil@xs4all.nl>:
	exynos-gsc/gsc-core.h: fix kernel-doc warnings                       =20
	http://patchwork.linuxtv.org/patch/72573=20
=09
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D delegated to Stanimir Varbanov <stanimir.varbanov@linaro.org> =3D
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Feb,18 2020, from Malathi Gottam <>:
	media: venus: add support for selection rectangles                   =20
	http://patchwork.linuxtv.org/patch/61714=20
=09
  Mar, 5 2020, from Jeffrey Kardatzke <jkardatzke@google.com>:
	media: venus: fix use after free for registeredbufs                  =20
	http://patchwork.linuxtv.org/patch/61960=20
=09
  Mar, 6 2020, from Mansur Alisha Shaik <mansur@codeaurora.org>:
	venus: avoid extra locking in driver                                 =20
	http://patchwork.linuxtv.org/patch/61961=20
=09
  Apr, 2 2020, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: Add platform specific capabilities                     =20
	http://patchwork.linuxtv.org/patch/62755=20
=09
  Jun, 9 2020, from Dikshita Agarwal <dikshita@codeaurora.org>:
	venus: move buffer calculation to driver                             =20
	http://patchwork.linuxtv.org/patch/64386=20
=09
  Jul,14 2020, from Dikshita Agarwal <dikshita@codeaurora.org>:
	venus: move platform specific data to platform file                  =20
	http://patchwork.linuxtv.org/patch/65450=20
=09
  Sep,12 2020, from Rikard Falkeborn <rikard.falkeborn@gmail.com>:
	media: venus: helpers: Fix ALIGN() of non power of two               =20
	http://patchwork.linuxtv.org/patch/66908=20
=09
  Sep,21 2020, from Liu Shixin <liushixin2@huawei.com>:
	media: venus: simplify the return expression of venus_sys_set_* functi
	http://patchwork.linuxtv.org/patch/67122=20
=09
  Sep,21 2020, from Qinglang Miao <miaoqinglang@huawei.com>:
	media: venus: simplify the return expression of session_process_buf()=20
	http://patchwork.linuxtv.org/patch/67190=20
=09
  Sep,24 2020, from Dikshita Agarwal <dikshita@codeaurora.org>:
	venus: venc: update output format based on capture format.           =20
	http://patchwork.linuxtv.org/patch/67330=20
=09
  Sep,26 2020, from AngeloGioacchino Del Regno <kholk11@gmail.com>:
	media: venus: pm_helper: Commonize v3/v4 pmdomains and clocks manageme
	http://patchwork.linuxtv.org/patch/67414=20
=09
  Sep,26 2020, from AngeloGioacchino Del Regno <kholk11@gmail.com>:
	media: venus: core: Add sdm660 DT compatible and resource struct     =20
	http://patchwork.linuxtv.org/patch/67415=20
=09
  Sep,26 2020, from AngeloGioacchino Del Regno <kholk11@gmail.com>:
	media: dt-bindings: media: venus: Add sdm660 DT schema               =20
	http://patchwork.linuxtv.org/patch/67416=20
=09
  Oct,19 2020, from Dikshita Agarwal <dikshita@codeaurora.org>:
	venus: venc: add handling for VIDIOC_ENCODER_CMD                     =20
	http://patchwork.linuxtv.org/patch/68117=20
=09
  Nov,10 2020, from Fritz Koenig <frkoenig@chromium.org>:
	venus: guard load_scale                                              =20
	http://patchwork.linuxtv.org/patch/68786=20
=09
  Nov,29 2020, from Fritz Koenig <frkoenig@chromium.org>:
	venus: venc: Add VIDIOC_TRY_ENCODER_CMD support                      =20
	http://patchwork.linuxtv.org/patch/69504=20
=09
  Dec,17 2020, from Christophe JAILLET <christophe.jaillet@wanadoo.fr>:
	media: venus: core: Fix a resource leak in error handling paths of the
	http://patchwork.linuxtv.org/patch/70106=20
=09
  Jan, 1 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	media: venus: fix error check in core_get_v4()                       =20
	http://patchwork.linuxtv.org/patch/70347=20
=09
  Jan, 1 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	media: venus: convert to use devm_pm_opp_* API                       =20
	http://patchwork.linuxtv.org/patch/70349=20
=09
  Jan,13 2021, from Fritz Koenig <frkoenig@chromium.org>:
	venus: Check for valid device instance                               =20
	http://patchwork.linuxtv.org/patch/70697=20
=09
  Jan,15 2021, from AngeloGioacchino Del Regno         <angelogioacchino.de=
lregno@somainline.org>:
	media: venus: core: Add sdm660 DT compatible and resource struct     =20
	http://patchwork.linuxtv.org/patch/70826=20
=09
  Feb, 9 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: venc: Add support for CLL and Mastering display controls      =20
	http://patchwork.linuxtv.org/patch/71390=20
=09
  Feb,10 2021, from "Gustavo A. R. Silva" <gustavoars@kernel.org>:
	[next] media: venus: hfi_cmds.h: Replace one-element array with flexib
	http://patchwork.linuxtv.org/patch/71413=20
=09
  Feb,10 2021, from "Gustavo A. R. Silva" <gustavoars@kernel.org>:
	[next] media: venus: hfi_msgs.h: Replace one-element arrays with flexi
	http://patchwork.linuxtv.org/patch/71422=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: Update v6 buffer descriptors                           =20
	http://patchwork.linuxtv.org/patch/71684=20
=09
  Feb,22 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	media: venus: core,pm: Add handling for resets                       =20
	http://patchwork.linuxtv.org/patch/71685=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: add sm8250 DT compatible and resource data       =20
	http://patchwork.linuxtv.org/patch/71686=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: core,pm: Vote for min clk freq during venus boot       =20
	http://patchwork.linuxtv.org/patch/71687=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add io base variables for each block             =20
	http://patchwork.linuxtv.org/patch/71688=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: hfi,pm,firmware: Convert to block relative addressing  =20
	http://patchwork.linuxtv.org/patch/71689=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Define block offsets for V6 hardware              =20
	http://patchwork.linuxtv.org/patch/71690=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Define additional 6xx registers                   =20
	http://patchwork.linuxtv.org/patch/71691=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add differentiator IS_V6(core)                   =20
	http://patchwork.linuxtv.org/patch/71692=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add an io base for AON regs                      =20
	http://patchwork.linuxtv.org/patch/71693=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Add a 6xx boot logic                              =20
	http://patchwork.linuxtv.org/patch/71694=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Add 6xx interrupt support                         =20
	http://patchwork.linuxtv.org/patch/71695=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx              =20
	http://patchwork.linuxtv.org/patch/71696=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: pm: Hook 6xx pm ops into 4xx pm ops                    =20
	http://patchwork.linuxtv.org/patch/71697=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Add 6xx AXI halt logic                            =20
	http://patchwork.linuxtv.org/patch/71698=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: pm: Toggle 6xx wrapper power in vcodec_control         =20
	http://patchwork.linuxtv.org/patch/71699=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx   =20
	http://patchwork.linuxtv.org/patch/71700=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add an io base for TZ wrapper regs               =20
	http://patchwork.linuxtv.org/patch/71701=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: helpers: Add internal buffer list for v6               =20
	http://patchwork.linuxtv.org/patch/71702=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locatio
	http://patchwork.linuxtv.org/patch/71703=20
=09
  Feb,22 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Hook to V6 base registers when appropriate       =20
	http://patchwork.linuxtv.org/patch/71704=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: helpers, hfi, vdec: Set actual plane constraints to FW =20
	http://patchwork.linuxtv.org/patch/71705=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Increase plat_buf_v6 o/p buffer count.            =20
	http://patchwork.linuxtv.org/patch/71706=20
=09
  Feb,22 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	media: venus: vdec: Fix decoder cmd STOP issue                       =20
	http://patchwork.linuxtv.org/patch/71707=20
=09
  Feb,22 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: helper: Decide work mode                               =20
	http://patchwork.linuxtv.org/patch/71708=20
=09
  Feb,25 2021, from Jiapeng Chong <jiapeng.chong@linux.alibaba.com>:
	media: venus: helpers: remove unnecessary conversion to bool         =20
	http://patchwork.linuxtv.org/patch/71733=20
=09
  Mar, 2 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: venc: Add support for intra-refresh period                    =20
	http://patchwork.linuxtv.org/patch/71823=20
=09
  Mar, 2 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: vdec: Add support for conceal control                         =20
	http://patchwork.linuxtv.org/patch/71829=20
=09
  Mar, 8 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: hfi_parser: Check for instance after hfi platform get         =20
	http://patchwork.linuxtv.org/patch/71982=20
=09
  Mar, 8 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: hfi_parser: Don't initialize parser on v1                     =20
	http://patchwork.linuxtv.org/patch/71983=20
=09
  Mar, 8 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: pm_helpers: Set opp clock name for v1                         =20
	http://patchwork.linuxtv.org/patch/71984=20
=09
  Mar, 8 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: venc_ctrls: Change default header mode                        =20
	http://patchwork.linuxtv.org/patch/71985=20
=09
  Mar, 8 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	venus: hfi_cmds: Support plane-actual-info property from v1          =20
	http://patchwork.linuxtv.org/patch/71986=20
=09
  Mar,11 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	venus: venc: Add support for Long Term Reference (LTR) controls      =20
	http://patchwork.linuxtv.org/patch/72073=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: add sm8250 DT compatible and resource data       =20
	http://patchwork.linuxtv.org/patch/72188=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: Update v6 buffer descriptors                           =20
	http://patchwork.linuxtv.org/patch/72189=20
=09
  Mar,12 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	media: venus: core,pm: Add handling for resets                       =20
	http://patchwork.linuxtv.org/patch/72190=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: hfi,pm,firmware: Convert to block relative addressing  =20
	http://patchwork.linuxtv.org/patch/72191=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add io base variables for each block             =20
	http://patchwork.linuxtv.org/patch/72192=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Define block offsets for V6 hardware              =20
	http://patchwork.linuxtv.org/patch/72193=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add differentiator IS_V6(core)                   =20
	http://patchwork.linuxtv.org/patch/72194=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Define additional 6xx registers                   =20
	http://patchwork.linuxtv.org/patch/72195=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add an io base for TZ wrapper regs               =20
	http://patchwork.linuxtv.org/patch/72196=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Add an io base for AON regs                      =20
	http://patchwork.linuxtv.org/patch/72197=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Add a 6xx boot logic                              =20
	http://patchwork.linuxtv.org/patch/72198=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: core: Hook to V6 base registers when appropriate       =20
	http://patchwork.linuxtv.org/patch/72199=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx              =20
	http://patchwork.linuxtv.org/patch/72200=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locatio
	http://patchwork.linuxtv.org/patch/72201=20
=09
  Mar,12 2021, from Bryan O'Donoghue <bryan.odonoghue@linaro.org>:
	media: venus: pm: Hook 6xx pm ops into 4xx pm ops                    =20
	http://patchwork.linuxtv.org/patch/72202=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Add 6xx interrupt support                         =20
	http://patchwork.linuxtv.org/patch/72203=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Add 6xx AXI halt logic                            =20
	http://patchwork.linuxtv.org/patch/72204=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: core,pm: Vote for min clk freq during venus boot       =20
	http://patchwork.linuxtv.org/patch/72205=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx   =20
	http://patchwork.linuxtv.org/patch/72206=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: pm: Toggle 6xx wrapper power in vcodec_control         =20
	http://patchwork.linuxtv.org/patch/72207=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: hfi: Increase plat_buf_v6 o/p buffer count.            =20
	http://patchwork.linuxtv.org/patch/72208=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: helpers, hfi, vdec: Set actual plane constraints to FW =20
	http://patchwork.linuxtv.org/patch/72209=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: helpers: Add internal buffer list for v6               =20
	http://patchwork.linuxtv.org/patch/72210=20
=09
  Mar,12 2021, from Stanimir Varbanov <stanimir.varbanov@linaro.org>:
	media: venus: vdec: Fix decoder cmd STOP issue                       =20
	http://patchwork.linuxtv.org/patch/72211=20
=09
  Mar,12 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: helper: Decide work mode                               =20
	http://patchwork.linuxtv.org/patch/72212=20
=09
  Mar,14 2021, from Yangtao Li <tiny.windzz@gmail.com>:
	media: venus: Convert to use resource-managed OPP API                =20
	http://patchwork.linuxtv.org/patch/72247=20
=09
  Mar,17 2021, from Dikshita Agarwal <dikshita@codeaurora.org>:
	media: venus: Fix internal buffer size calculations for v6.          =20
	http://patchwork.linuxtv.org/patch/72379=20
=09


Cheers,
Mauro

---

If you discover any patch submitted via email that weren't caught by
kernel.patchwork.org, this means that the patch got mangled by your emailer.
The more likely cause is that the emailer converted tabs into spaces or bro=
ke
long lines.

If you're using Thunderbird, the solution is to install Asalted Patches
extension, available at:
	https://hg.mozilla.org/users/clarkbw_gnome.org/asalted-patches/
Other emailers will need you to disable the wrapping long lines feature.
