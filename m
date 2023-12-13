Return-Path: <linux-media+bounces-2310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 704D3810D9B
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 10:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2526828199B
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B16920B33;
	Wed, 13 Dec 2023 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="q+W/VhtA"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B7383
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 01:46:25 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SqrGQ6bd3z49Q3H
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 11:46:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1702460783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D5bfLnW/aVZ29OlyzNc8sQBG5npAssHrXl4p3H0VzUc=;
	b=q+W/VhtAncSK3Oz9pO1Oo09Tx4WROTJkU5ZoqSC1pogn8+XdYHxx+3fhLQVT4VoEhL6o9k
	EQwIDianxJ6uRdo4GUlMRHbcyUx7odBTJ/OCJCnVG928H9KGq35XZPO+ms14Z7VCnc1aMr
	O0jmaVR2JsX5uO9y/wVP84v/J94vJICWwt24AiQta8xOKBTdPHqZ8suc1k3sV/mowMSAFH
	6I8SAZIhuxDPAzE/46tjV0X73c7mvB8gId4aRDmU5Fp8QR8VzsRiZcwgd5nacX5Qo38TNa
	cBpqisvWCRBYo6SMLoPblgQ9XNnYQVYRTq98kF/q3iwK0uD6kYxNYH4snoaJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1702460783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D5bfLnW/aVZ29OlyzNc8sQBG5npAssHrXl4p3H0VzUc=;
	b=RDWdC3A+b5E7tZu62CZutlAwrSaFRse46a+Qi4we7w7hh8CGBmbsD713ps4bIP1jqquTRu
	sn9oXKdsRxMSBVpdjmIup4ZZbPHmrX3BXR/gIwRYWcp8BCe+/569k+fPEqFHzyajKz9sCe
	arIA+ygN04FnHPHUNH0Trta+JGN8dhrL4hc3LlF84DizFV5bKP71vSP1FojdmZfMfBnis8
	rImLaYp9lYvO/YnHzUB3dchRARTizW5/gYw9AVu5DZpDgmmNm6AzM/QvmNYwEKeoLftMEx
	WRKXhPJVx9bEjtWZIECsc5DpdeSWCs8dX0na5DVtx7daO4TTxz1Ra+UMt9XZPA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1702460783; a=rsa-sha256;
	cv=none;
	b=Kpi3QXvaVOhkZLJPIHQu+38jZrEC3VO6oijWTHlhUynpsUk2fVPXMWJfD5fZ/2HzjQsQcq
	Bk7TW82dUuUgUepqgnkKbUwlxzTrzhU0l/g8lCGvt5nZIiBgLyTLpdXrdNs0zybtPNNUTw
	JxQEcIegZt66zabVEzME327ub1tvg8n/u2auCxvos9VQYiavIyc3d1jO+8yaoVl6sImddu
	J1GtsRkkevL7N9OTIa3z+WQM2PsSM24nOcT30i1yUGZvKCjxJ3hlnE9TxKUQ4g9bvBxOKV
	yGglYAdhgAzPqV50wAlVvqqM/bX1AzdmszEDw/bXZ+PiBb3aoIFpavRKSyqF2Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9B7D7634C93
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 11:46:21 +0200 (EET)
Date: Wed, 13 Dec 2023 09:46:21 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL V2 FOR 6.8] Some fixes and new drivers, too
Message-ID: <ZXl9bRMnsyLXjIAF@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

Here's a nice set of some fixes as well as new drivers that some of which,
in turn, depend on the fixes. In particular, there are a few sensors
(imx290 in particular) that have little endian registers, either just some
or all, and this was missed in V4L2 CCI conversion earlier on. Another
driver also needs these CCI_*LE() macros later in the set.

There are new drivers for Galaxycore gc0308 sensor as well as Avnet Alvium
camera modules.

Miscellaneous fixes exist for imx335, imx214, ov2740 as well as the IPU
bridge.

Documentation improvements for camera sensors are included, too.

Please pull.

since v2:

- Fixes to ov64a40 driver Sob lines and Alvium driver checkpatch.pl issues,
  bugs.


The following changes since commit c2a8653c197d67f8ad563f5417f2e9bcaad913f3:

  media: venus: core: Set up secure memory ranges for SC7280 (2023-12-12 08:54:54 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-7.3-signed

for you to fetch changes up to 07f5eb99de84ed183d5f7bf63edb64d55a0720db:

  media: i2c: Add driver for OmniVision OV64A40 (2023-12-13 11:24:51 +0200)

----------------------------------------------------------------
V4L2 patches for 6.8

----------------------------------------------------------------
Alexander Stein (2):
      media: v4l2-cci: Add support for little-endian encoded registers
      media: i2c: imx290: Properly encode registers as little-endian

André Apitzsch (4):
      media: i2c: imx214: Explain some magic numbers
      media: i2c: imx214: Move controls init to separate function
      media: i2c: imx214: Read orientation and rotation from system firmware
      media: i2c: imx214: Add sensor's pixel matrix size

Hans de Goede (9):
      media: ov2740: Add support for reset GPIO
      media: ov2740: Add support for external clock
      media: ov2740: Move fwnode_graph_get_next_endpoint() call up
      media: ov2740: Improve ov2740_check_hwcfg() error reporting
      media: ov2740: Fix hts value
      media: ov2740: Check hwcfg after allocating the ov2740 struct
      media: ov2740: Add support for 180 MHz link frequency
      media: ov2740: Add a sleep after resetting the sensor
      media: ipu-bridge: Change ov2740 link-frequency to 180 MHz

Jacopo Mondi (2):
      media: dt-bindings: Add OmniVision OV64A40
      media: i2c: Add driver for OmniVision OV64A40

Kieran Bingham (6):
      media: dt-bindings: media: imx335: Add supply bindings
      media: i2c: imx335: Fix logging line endings
      media: i2c: imx335: Improve configuration error reporting
      media: i2c: imx335: Enable regulator supplies
      media: i2c: imx335: Implement get selection API
      media: i2c: imx335: Fix hblank min/max values

Krzysztof Kozlowski (1):
      media: dt-bindings: ov8856: decouple lanes and link frequency from driver

Laurent Pinchart (1):
      media: atmel-isi: Fix crash due to missing subdev in state

Sakari Ailus (3):
      media: v4l: Safely to call v4l2_subdev_cleanup on an uninitialised subdev
      media: Documentation: BT.601 is not a bus
      media: Documentation: LP-11 and LP-111 are states, not modes

Sebastian Reichel (3):
      media: dt-bindings: gc0308: add binding
      media: MAINTAINERS: Add GalaxyCore in camera sensor section
      media: i2c: gc0308: new driver

Tommaso Merciai (3):
      dt-bindings: vendor-prefixes: Add prefix alliedvision
      media: dt-bindings: alvium: add document YAML binding
      media: i2c: Add support for alvium camera

Umang Jain (1):
      media: i2c: imx335: Support 2592x1940 10-bit mode

Vincent Knecht (3):
      media: i2c: ak7375: Prepare for supporting another chip
      media: dt-bindings: ak7375: Add ak7345 support
      media: i2c: ak7375: Add support for ak7345

 .../media/i2c/alliedvision,alvium-csi2.yaml        |   81 +
 .../bindings/media/i2c/asahi-kasei,ak7375.yaml     |    4 +-
 .../bindings/media/i2c/galaxycore,gc0308.yaml      |  108 +
 .../devicetree/bindings/media/i2c/ov8856.yaml      |   24 +-
 .../bindings/media/i2c/ovti,ov64a40.yaml           |  103 +
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   13 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/driver-api/media/camera-sensor.rst   |    4 +-
 Documentation/driver-api/media/tx-rx.rst           |   25 +-
 MAINTAINERS                                        |   25 +
 drivers/media/i2c/Kconfig                          |   30 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/ak7375.c                         |  132 +-
 drivers/media/i2c/alvium-csi2.c                    | 2547 ++++++++++++++
 drivers/media/i2c/alvium-csi2.h                    |  475 +++
 drivers/media/i2c/gc0308.c                         | 1451 ++++++++
 drivers/media/i2c/imx214.c                         |  175 +-
 drivers/media/i2c/imx290.c                         |   42 +-
 drivers/media/i2c/imx335.c                         |  211 +-
 drivers/media/i2c/ov2740.c                         |  384 +-
 drivers/media/i2c/ov64a40.c                        | 3690 ++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c               |    2 +-
 drivers/media/platform/atmel/atmel-isi.c           |    1 +
 drivers/media/v4l2-core/v4l2-cci.c                 |   44 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |    3 +-
 include/media/v4l2-cci.h                           |    5 +
 26 files changed, 9338 insertions(+), 246 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
 create mode 100644 drivers/media/i2c/alvium-csi2.c
 create mode 100644 drivers/media/i2c/alvium-csi2.h
 create mode 100644 drivers/media/i2c/gc0308.c
 create mode 100644 drivers/media/i2c/ov64a40.c

-- 
Sakari Ailus

