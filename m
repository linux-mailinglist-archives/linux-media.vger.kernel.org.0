Return-Path: <linux-media+bounces-2206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 367CF80E5B1
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 09:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D82281E17
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D0C1863A;
	Tue, 12 Dec 2023 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZkbnLF2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62B2D5
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 00:19:55 -0800 (PST)
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SqBP50ynKz49Q0K;
	Tue, 12 Dec 2023 10:19:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1702369193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YessbeUjbZpl+ueOtn7A5an19Zl+WkL1Fz3MWqQQ4Us=;
	b=ZkbnLF2QlV+4TU57jsMi7almcOhXD7WryDSqM5eAwqeNU/9yiwYA7DxrYL1FmskphDzDYG
	Qy8NWCYYln8e4jBcBrWpk6tIqvXqLf1TFzqznXze9+qPWdQoyEf1a5E/ZZAu+mGIjgHaYC
	stcmP+5pxNReYyemPMIqL487yuFp5TEwZf2Hy1tO+pZYjcM8fXKs3AKCrb7ZGx01eBL5PI
	imR8rx++EcdQmqkm/tjL7SQibjxva69rSKSO45HrI0YG8aiMCsVLp1KitJiIdx2m6ZlVLH
	1uvyBfCaTsYFLZjrQMVXwufiHumXMXQDXgQHUAuFVuFMWEusjVMZGXTa2xIMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1702369193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YessbeUjbZpl+ueOtn7A5an19Zl+WkL1Fz3MWqQQ4Us=;
	b=KE/DV2gXrF69LWcEDR+wMLdI37QJYrg4MJNfYU5DsgkQOYxX7CaEYERLyWa6H1EyL3s6A1
	ov7BRacKIbYzsLw+FNI6m2uVE/ZKT2vIaKOY54SpbBue+7QkAppy/JeFhmJpFx896+EPOL
	E/gsbzowCHRsp08OWdIchwT75EiInDKv/JlnIabY95jIxtR132H6wWFEHr+YaVp6ar6d5a
	CzZqnR3/K/XLE7/ELgK693kOHG31YiJmFccSQ/CDnZPZDwMeXwLsMKs40yHbzg2Y/+0joO
	W0FHOk5b8IwVRsxb/JiAM8qijApo/f6IcQoMtmiep+/yxo9WQ+0eRfXVgzxGjw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1702369193; a=rsa-sha256;
	cv=none;
	b=dgEXrvZzyZsDRQ96ZpfobRu2ZGZD/+6q53fAFBe8MhH7rLOjlfhzIlYAUMPrhlZn2n/NYY
	MkezDPaf8NbVU/Pl71VGPRKfpmWSmGcdlwOErJxnbupL3ocf7yU14ClTQysraivHFGAZ9Y
	RAfZukU+u5KfCJI7wdWVhDCUXFOrGi3mfQzWrhUIGJJuYc5zABaUhkSUWAHDcNegmQ0P03
	F2UIfCS9j798mfiqZbDH8DRYfXlD5JTF62v2XovZIhTNijyXHWJh7YRpdWEht7c8XYlDX4
	Ar4MS3XdohJznu2Njo4h07sQ9A0iz8OkfEcfZltWsXrSQE44t66rqfuc2es+lQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C2882634C93;
	Tue, 12 Dec 2023 10:19:51 +0200 (EET)
Date: Tue, 12 Dec 2023 08:19:51 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
Subject: Re: [GIT PULL FOR 6.8] Some fixes and new drivers, too
Message-ID: <ZXgXpxM6b2bXplzZ@valkosipuli.retiisi.eu>
References: <ZXgW25b9tV_YE7Mq@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXgW25b9tV_YE7Mq@valkosipuli.retiisi.eu>

Cc Hans.

On Tue, Dec 12, 2023 at 08:16:28AM +0000, Sakari Ailus wrote:
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
> -- 
> Sakari Ailus

-- 
Sakari Ailus

