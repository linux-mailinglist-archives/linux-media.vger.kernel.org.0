Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C8645C855
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 16:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbhKXPOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 10:14:34 -0500
Received: from meesny.iki.fi ([195.140.195.201]:60970 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231892AbhKXPOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 10:14:34 -0500
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id CC5CD20061
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 17:11:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1637766682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=2/GXKnHajnsBrURxaOiufBzPDl42jC0kG+8OLGuUyGc=;
        b=NCakVgidhl0uKnnD8wl3K+YfC5FA5GyY3DYGeXD0R/xsKIZ8/SLCCmAyBeWxPb7Vr6MnMT
        MjYaFFxCPovuyV5cEErKmW/XDIvrQWfodtH3Am92DZnlS3QePCqznYSAE6WVM7/tpxCf/E
        2iJE6fGyf1wtqmsB6EkVghM2Wi1rnnw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 512B0634C90
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 17:11:22 +0200 (EET)
Date:   Wed, 24 Nov 2021 17:11:22 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.17] V4L2 patches
Message-ID: <YZ5WGhErn1kv4vlX@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1637766682; a=rsa-sha256; cv=none;
        b=KjpLeuGr82AVgvNGDiHbbaggTdFzCc121k7O3DRTF9QAAZZynGJAjRISujzI7UViztBuyy
        JD8Ulkg1zQFOs0x5ILD1bXJ4XFCPBQmc8AwvcII0YQw/yQdY1HDbA11NYLTRwr0g3AFOM0
        YYuJRSMi9kz6tL/k2rvjA/upRhFY/QY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1637766682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=2/GXKnHajnsBrURxaOiufBzPDl42jC0kG+8OLGuUyGc=;
        b=XIzAd7DVQvSEhECm7+iIGAkbBqd4kU9Ym5OEmq8WUeoAZRD0u/CvLUn3Gau1jaMvkgBQ34
        5ZnGsJSkg0lwDqOj6+wqa0KfyyXqaen6d024RgrjjEzFgS53KE9ULMoBllUd2dx/bo2Jdr
        avZHepGbIvMbaRjTtbGkTG5gea/HAW0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are a bunch of V4L2 patches for 5.17.

In particular, this includes support for the ov5693 sensor, ACPI support
for the ov8865 driver as well as improvements to the imx274 driver.

Please pull.


The following changes since commit 0d2517b3765aa331aee0a95f9b8072062d6bb7e5:

  media: hantro: Support NV12 on the G2 core (2021-11-22 07:53:37 +0000)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.17-1-signed

for you to fetch changes up to bd697d6a91d20cd05860f14f672bd7e8237d4541:

  dt-bindings: media: renesas,jpu: Convert to json-schema (2021-11-24 11:15:14 +0200)

----------------------------------------------------------------
V4L2 patches for 5.17

----------------------------------------------------------------
Daniel Scally (19):
      media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
      media: i2c: Add support for ov5693 sensor
      media: ipu3-cio2: Add link freq for INT33BE entry
      media: i2c: Re-order runtime pm initialisation
      media: i2c: Add ACPI support to ov8865
      media: i2c: Fix incorrect value in comment
      media: i2c: Defer probe if not endpoint found
      media: i2c: Support 19.2MHz input clock in ov8865
      media: i2c: Add .get_selection() support to ov8865
      media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
      media: i2c: Add vblank control to ov8865
      media: i2c: Add hblank control to ov8865
      media: i2c: Update HTS values in ov8865
      media: i2c: cap exposure at height + vblank in ov8865
      media: i2c: Add controls from fwnode to ov8865
      media: i2c: Switch exposure control unit to lines
      media: i2c: Use dev_err_probe() in ov8865
      media: i2c: Fix max gain in ov8865
      media: ipu3-cio2: Add INT347A to cio2-bridge

Eugen Hristev (6):
      media: i2c: imx274: fix s_frame_interval runtime resume not requested
      media: i2c: imx274: fix trivial typo expsoure/exposure
      media: i2c: imx274: fix trivial typo obainted/obtained
      media: i2c: imx274: implement enum_mbus_code
      media: i2c: imx274: simplify probe function by adding local variable dev
      media: i2c: imx274: implement fwnode parsing

Geert Uytterhoeven (1):
      dt-bindings: media: renesas,jpu: Convert to json-schema

Hans de Goede (1):
      media: i2c: ov8865: Fix lockdep error

Kieran Bingham (1):
      media: i2c: max9286: Depend on VIDEO_V4L2

 .../devicetree/bindings/media/renesas,jpu.txt      |   25 -
 .../devicetree/bindings/media/renesas,jpu.yaml     |   65 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx274.c                         |  102 +-
 drivers/media/i2c/ov5693.c                         | 1537 ++++++++++++++++++++
 drivers/media/i2c/ov8865.c                         |  466 ++++--
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |    4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   17 +-
 10 files changed, 2052 insertions(+), 184 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.yaml
 create mode 100644 drivers/media/i2c/ov5693.c

-- 
Kind regards,

Sakari Ailus
