Return-Path: <linux-media+bounces-2215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7D80E714
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 10:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871261C2135F
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 09:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806FA5812B;
	Tue, 12 Dec 2023 09:09:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D622338
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 09:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81C1C433C8;
	Tue, 12 Dec 2023 09:09:33 +0000 (UTC)
Message-ID: <03b41071-e477-44c0-83f8-c90ce545c6de@xs4all.nl>
Date: Tue, 12 Dec 2023 10:09:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.8] Some fixes and new drivers, too
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
References: <ZXgW25b9tV_YE7Mq@valkosipuli.retiisi.eu>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <ZXgW25b9tV_YE7Mq@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/12/2023 09:16, Sakari Ailus wrote:
> Hi Hans, Mauro,
> 
> Here's a nice set of some fixes as well as new drivers that some of which,
> in turn, depend on the fixes. In particular, there are a few sensors
> (imx290 in particular) that have little endian registers, either just some
> or all, and this was missed in V4L2 CCI conversion earlier on. Another
> driver also needs these CCI_*LE() macros later in the set.
> 
> There are new drivers for Galaxycore gc0308, Omnivision ov64a30 camera
> sensor as well as Avnet Alvium camera modules.
> 
> Miscellaneous fixes exist for imx335, imx214, imx415, ov2740 as well as the
> IPU bridge.
> 
> Documentation improvements for camera sensors are included, too.
> 
> Please pull.

Running the build script gives me 3 sparse warnings:

drivers/media/i2c/imx415.c:402:30: warning: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a
warning) here
drivers/media/i2c/imx415.c:417:30: warning: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a
warning) here
drivers/media/i2c/imx415.c:432:30: warning: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a
warning) here

(2376000000 should be 2376000000ULL)

and one smatch warning:

drivers/media/i2c/alvium-csi2.c:2429 alvium_probe() warn: passing zero to 'dev_err_probe'

checkpatch.pl --strict also complains about a few things:

0001-media-atmel-isi-Fix-crash-due-to-missing-subdev-in-s.patch:

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")'
#8:
As a result of converting to the stream-aware state functions, commit

0009-media-i2c-Add-support-for-alvium-camera.patch

A bunch of:

CHECK: Assignment operator '=' should be on the previous line
#1120: FILE: drivers/media/i2c/alvium-csi2.c:1027:
+       alvium->is_mipi_fmt_avail[ALVIUM_BIT_YUV420_8_LEG]
+                                 = avail_fmt->yuv420_8_leg;

and:

CHECK: Unnecessary parentheses around '!alvium_csi2_fmts[fmt].is_raw'
#1174: FILE: drivers/media/i2c/alvium-csi2.c:1081:
+               if ((!alvium_csi2_fmts[fmt].is_raw) ||
+                   (alvium->is_bay_avail[alvium_csi2_fmts[fmt].bay_av_bit]))

CHECK: Unnecessary parentheses around '!alvium_csi2_fmts[fmt].is_raw'
#1191: FILE: drivers/media/i2c/alvium-csi2.c:1098:
+               if ((!alvium_csi2_fmts[fmt].is_raw) ||
+                   (alvium->is_bay_avail[alvium_csi2_fmts[fmt].bay_av_bit])) {

WARNING: Improper SPDX comment style for 'drivers/media/i2c/alvium-csi2.h', please use '/*' instead
#2630: FILE: drivers/media/i2c/alvium-csi2.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#2630: FILE: drivers/media/i2c/alvium-csi2.h:1:
+// SPDX-License-Identifier: GPL-2.0

0037-media-dt-bindings-Add-OmniVision-OV64A40.patch:

WARNING: Co-developed-by and Signed-off-by: name/email do not match
#11:
Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

0038-media-i2c-Add-driver-for-OmniVision-OV64A40.patch:

WARNING: Co-developed-by and Signed-off-by: name/email do not match
#11:
Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

0039-media-i2c-imx415-Convert-to-new-CCI-register-access-.patch:

CHECK: Alignment should match open parenthesis
#461: FILE: drivers/media/i2c/imx415.c:462:
+               cci_write(sensor->regmap, IMX415_BLKLEVEL,
+                                  IMX415_BLKLEVEL_DEFAULT, &ret);

Regards,

	Hans

> 
> 
> The following changes since commit efa28efd9cba015f8c3d88123527c3c3cfcd13d0:
> 
>   media: rkisp1: resizer: Stop manual allocation of v4l2_subdev_state (2023-12-09 07:47:10 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.8-7.1-signed
> 
> for you to fetch changes up to f1986ff84b37d2c7d5fa3bfbac84cc29fdf8248f:
> 
>   media: i2c: imx415: Add more supported modes (2023-12-12 09:14:53 +0200)
> 
> ----------------------------------------------------------------
> V4L2 patches for 6.8
> 
> ----------------------------------------------------------------
> Alexander Stein (5):
>       media: v4l2-cci: Add support for little-endian encoded registers
>       media: i2c: imx290: Properly encode registers as little-endian
>       media: i2c: imx415: Convert to new CCI register access helpers
>       media: i2c: imx415: Add more clock configurations
>       media: i2c: imx415: Add more supported modes
> 
> André Apitzsch (4):
>       media: i2c: imx214: Explain some magic numbers
>       media: i2c: imx214: Move controls init to separate function
>       media: i2c: imx214: Read orientation and rotation from system firmware
>       media: i2c: imx214: Add sensor's pixel matrix size
> 
> Hans de Goede (9):
>       media: ov2740: Add support for reset GPIO
>       media: ov2740: Add support for external clock
>       media: ov2740: Move fwnode_graph_get_next_endpoint() call up
>       media: ov2740: Improve ov2740_check_hwcfg() error reporting
>       media: ov2740: Fix hts value
>       media: ov2740: Check hwcfg after allocating the ov2740 struct
>       media: ov2740: Add support for 180 MHz link frequency
>       media: ov2740: Add a sleep after resetting the sensor
>       media: ipu-bridge: Change ov2740 link-frequency to 180 MHz
> 
> Jacopo Mondi (2):
>       media: dt-bindings: Add OmniVision OV64A40
>       media: i2c: Add driver for OmniVision OV64A40
> 
> Kieran Bingham (6):
>       media: dt-bindings: media: imx335: Add supply bindings
>       media: i2c: imx335: Fix logging line endings
>       media: i2c: imx335: Improve configuration error reporting
>       media: i2c: imx335: Enable regulator supplies
>       media: i2c: imx335: Implement get selection API
>       media: i2c: imx335: Fix hblank min/max values
> 
> Krzysztof Kozlowski (1):
>       media: dt-bindings: ov8856: decouple lanes and link frequency from driver
> 
> Laurent Pinchart (1):
>       media: atmel-isi: Fix crash due to missing subdev in state
> 
> Sakari Ailus (3):
>       media: v4l: Safely to call v4l2_subdev_cleanup on an uninitialised subdev
>       media: Documentation: BT.601 is not a bus
>       media: Documentation: LP-11 and LP-111 are states, not modes
> 
> Sebastian Reichel (3):
>       media: dt-bindings: gc0308: add binding
>       media: MAINTAINERS: Add GalaxyCore in camera sensor section
>       media: i2c: gc0308: new driver
> 
> Tommaso Merciai (3):
>       dt-bindings: vendor-prefixes: Add prefix alliedvision
>       media: dt-bindings: alvium: add document YAML binding
>       media: i2c: Add support for alvium camera
> 
> Umang Jain (1):
>       media: i2c: imx335: Support 2592x1940 10-bit mode
> 
> Vincent Knecht (3):
>       media: i2c: ak7375: Prepare for supporting another chip
>       media: dt-bindings: ak7375: Add ak7345 support
>       media: i2c: ak7375: Add support for ak7345
> 
>  .../media/i2c/alliedvision,alvium-csi2.yaml        |   81 +
>  .../bindings/media/i2c/asahi-kasei,ak7375.yaml     |    4 +-
>  .../bindings/media/i2c/galaxycore,gc0308.yaml      |  108 +
>  .../devicetree/bindings/media/i2c/ov8856.yaml      |   24 +-
>  .../bindings/media/i2c/ovti,ov64a40.yaml           |  103 +
>  .../devicetree/bindings/media/i2c/sony,imx335.yaml |   13 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  Documentation/driver-api/media/camera-sensor.rst   |    4 +-
>  Documentation/driver-api/media/tx-rx.rst           |   25 +-
>  MAINTAINERS                                        |   25 +
>  drivers/media/i2c/Kconfig                          |   33 +
>  drivers/media/i2c/Makefile                         |    3 +
>  drivers/media/i2c/ak7375.c                         |  132 +-
>  drivers/media/i2c/alvium-csi2.c                    | 2530 ++++++++++++++
>  drivers/media/i2c/alvium-csi2.h                    |  475 +++
>  drivers/media/i2c/gc0308.c                         | 1451 ++++++++
>  drivers/media/i2c/imx214.c                         |  175 +-
>  drivers/media/i2c/imx290.c                         |   42 +-
>  drivers/media/i2c/imx335.c                         |  211 +-
>  drivers/media/i2c/imx415.c                         | 1013 ++++--
>  drivers/media/i2c/ov2740.c                         |  384 +-
>  drivers/media/i2c/ov64a40.c                        | 3690 ++++++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c               |    2 +-
>  drivers/media/platform/atmel/atmel-isi.c           |    1 +
>  drivers/media/v4l2-core/v4l2-cci.c                 |   44 +-
>  drivers/media/v4l2-core/v4l2-subdev.c              |    3 +-
>  include/media/v4l2-cci.h                           |    5 +
>  27 files changed, 10101 insertions(+), 482 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
>  create mode 100644 drivers/media/i2c/alvium-csi2.c
>  create mode 100644 drivers/media/i2c/alvium-csi2.h
>  create mode 100644 drivers/media/i2c/gc0308.c
>  create mode 100644 drivers/media/i2c/ov64a40.c
> 


