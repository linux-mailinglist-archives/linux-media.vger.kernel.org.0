Return-Path: <linux-media+bounces-1428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A27FF8B9
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 18:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA691C21049
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 17:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1A5584E4;
	Thu, 30 Nov 2023 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AS8Bw/Y1"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF890D40;
	Thu, 30 Nov 2023 09:46:51 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6452EC0006;
	Thu, 30 Nov 2023 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701366410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UqoHlspa06CgNPES11cqIX48bHZaq15ATXNGtexHU5c=;
	b=AS8Bw/Y12HOoIBgnJwLZyWkeubxCP+NnCLBXtIyDKLDct23HaR5FIK4b0k5Hb+L2mOPlLD
	pyQ5ChAP9Tz9eUmgmLNrYsPWFOOvogtnvbMbDgBvGCKh3Xr00O/KLYH31nTFyUr/6pzqaM
	+zFnhF3ONofodD69dnp14MMpaB7N5betVTy7iyEDy4zCX8VlShrlmg+0GktIoVMsfMqjUs
	u9v4qeFIlpubLEL3SdyswGVGbkkhZljJRQ9JWibGhr6v8p9c6PC+QXsa+2BGXnkJGT5nuG
	QsbxIp7yXN3YkarPetZ4zZRrtGNPK179q0XT2K527OzZoK+/uDfDwF0hh6wsWw==
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: [PATCH V10 0/3] media: i2c: Introduce driver for the TW9900 video decoder
Date: Thu, 30 Nov 2023 18:46:44 +0100
Message-ID: <cover.1701366233.git.mehdi.djait@bootlin.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mehdi.djait@bootlin.com

Hello everyone,

V10 of the series adding support for the Techwell TW9900 multi standard decoder.
It's a pretty simple decoder compared to the TW9910, since it doesn't have a 
built-in scaler/crop engine.

v9 => v10:
- fixed two issues pointed out by Dan Carpenter bot and Kernel bot

v8 => v9:
- added a "depends on" GPIOLIB, PM and "select" V4L2_ASYNC to Kconfig
- reworked the locking to protect the tw9900->streaming global state
- folded power_on and power_off into runtime_resume and runtime_suspend
  callbacks
- used pm_runtime_resume_and get instead pm_runtime_get_sync

v7 => v8:
- fixed the number of analog input ports: it is just one.
- added endpoints of the analog input port
- added vdd-supply to the required in the dt-binding documentation
- added back pm_runtime
- added a mutex to Serialize access to hardware and current mode configuration
- split get_fmt and set_fmt callbacks 
- removed the tw9900_cancel_autodetect()

v6 => v7:
- added powerdown-gpios and input ports to dt-bindings
- added #include <linux/bitfield.h> to fix a Warning from the kernel
  robot
- removed a dev_info and replaced a dev_err by dev_err_probe

v5[1] => v6:
- dropped .skip_top and .field in the supported_modes
- added error handling for the i2c writes/reads
- added the colorimetry information to fill_fmt
- removed pm_runtime
- added the g_input_status callback
- dropped SECAM
- dropped the non-standard PAL/NTSC variants

Any feedback is appreciated,

Mehdi Djait

media_tree, base-commit: a00b3f296eac3d43328615c3113e1a74143fc67a

[1] https://lore.kernel.org/linux-media/20210401070802.1685823-1-maxime.chevallier@bootlin.com/

Mehdi Djait (3):
  dt-bindings: vendor-prefixes: Add techwell vendor prefix
  media: dt-bindings: media: i2c: Add bindings for TW9900
  media: i2c: Introduce a driver for the Techwell TW9900 decoder

 .../bindings/media/i2c/techwell,tw9900.yaml   | 137 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/media/i2c/Kconfig                     |  15 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/tw9900.c                    | 781 ++++++++++++++++++
 6 files changed, 942 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
 create mode 100644 drivers/media/i2c/tw9900.c

-- 
2.41.0


