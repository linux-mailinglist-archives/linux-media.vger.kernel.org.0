Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE197C5429
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 14:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjJKMkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 08:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjJKMkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 08:40:20 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A252F8F
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 05:40:18 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S5C690RZnzyYQ
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 15:40:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697028017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=smENPYrMt1fauM57Ml6bRn3Tpib1grH17Lxa2q3cfB8=;
        b=qdabF8z66yuzDGypkiG6wktgDd81bHF7QBRc768y1ntc8VoQfNm+7RbLebeN+fHwuEpfOS
        5YtL2Cg6hZhmbwM5vZ35GsVQWtp5xkuZtfMBtH9ZcGMGnD6Rt8eWN+NK8t93spPtpQrdbK
        sHiFgL/vYqKmOwTpDeqUam6mcGPEJ3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697028017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=smENPYrMt1fauM57Ml6bRn3Tpib1grH17Lxa2q3cfB8=;
        b=Uj3vQ7cx2saxpCMWRmpE/ZdDG2mmE1lA2NLJfEmvC3VXXRa80G2HHcTcH3IeXOJPw4YfNA
        Z7Ex8tmAMMcGgEOoOGUzA0FKu6EwhyDgKOHo5MSCJecqGbNHvZ8wBCaU73Azvf2ZwbE3pq
        o3a0KN4kfUV5mvPu1FHyiuFGmBYx5lQ=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697028017; a=rsa-sha256; cv=none;
        b=h3ceijz47EbqgpQ77N0lMfl2XV/nmhzpdo29Qu3F5l8dLbyJU1OeYGr8AgfZhPYYX1uekC
        f/+2GXP54+FFPtunN+j8+s4syBSHAeiJYHSgfFJWrqz9rBa0OXEXZFWw7vHGODmfIRomxj
        vXFJAC8kRgF658rbOXlm+0/hgF9h80Y=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 205EB634CA9
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 15:40:13 +0300 (EEST)
Date:   Wed, 11 Oct 2023 12:40:12 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.7] CSI2RX, mostly camera sensor sensor patches
Message-ID: <ZSaXrKkhP4AOH+Rh@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Mauro,

Here's another set of patches for 6.7. Included are, in particular:

- DT binding improvements by Jacopo,
- Pratyush's nand Jai's CSI2RX driver
- Fixes for recently merged CCS patches and mt9m114 driver
- Miscellaneous small stuff

Please pull.


The following changes since commit a1766a4fd83befa0b34d932d532e7ebb7fab1fa7:

  media: imon: fix access to invalid resource for the second interface (2023-10-07 10:55:48 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.7-3.1-signed

for you to fetch changes up to f4f5a574664f77796613401ccb9cc1d01a546dbd:

  media: ccs: Fix a (harmless) lockdep warning (2023-10-11 15:37:41 +0300)

----------------------------------------------------------------
V4L2 patches for 6.7

----------------------------------------------------------------
Jacopo Mondi (6):
      media: dt-bindings: hynix,hi846: Add video-interface-devices properties
      media: dt-bindings: ovti,ov02a10: Allow props from video-interface-devices
      media: dt-bindings: ovti,ov4689: Allow props from video-interface-devices
      media: dt-bindings: ovti,ov5640: Allow props from video-interface-devices
      media: dt-bindings: sony,imx214: Allow props from video-interface-devices
      media: dt-bindings: sony,imx415: Allow props from video-interface-devices

Jai Luthra (2):
      media: dt-bindings: cadence-csi2rx: Add TI compatible string
      media: ti: Add CSI2RX support for J721E

Laurent Pinchart (1):
      media: i2c: mt9m114: Fix missing error unwind in probe()

Pratyush Yadav (11):
      media: dt-bindings: Make sure items in data-lanes are unique
      media: cadence: csi2rx: Unregister v4l2 async notifier
      media: cadence: csi2rx: Cleanup media entity properly
      media: cadence: csi2rx: Add get_fmt and set_fmt pad ops
      media: cadence: csi2rx: Configure DPHY using link freq
      media: cadence: csi2rx: Soft reset the streams before starting capture
      media: cadence: csi2rx: Set the STOP bit when stopping a stream
      media: cadence: csi2rx: Fix stream data configuration
      media: cadence: csi2rx: Populate subdev devnode
      media: cadence: csi2rx: Add link validation
      media: dt-bindings: Add TI J721E CSI2RX

Ricardo B. Marliere (1):
      staging: media: ipu3: remove ftrace-like logging

Sakari Ailus (2):
      media: ccs: Rework initialising sub-device state
      media: ccs: Fix a (harmless) lockdep warning

Umang Jain (1):
      media: Documentation: ccs: Fix spelling mistake

 .../devicetree/bindings/media/cdns,csi2rx.yaml     |    1 +
 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |    7 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml           |    8 +-
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml |    6 +-
 .../devicetree/bindings/media/i2c/ovti,ov5640.yaml |    7 +-
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |    2 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml |   10 +-
 .../bindings/media/ti,j721e-csi2rx-shim.yaml       |  100 ++
 .../bindings/media/video-interfaces.yaml           |    1 +
 Documentation/driver-api/media/drivers/ccs/ccs.rst |    2 +-
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/ccs/ccs-core.c                   |   62 +-
 drivers/media/i2c/mt9m114.c                        |    4 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |  176 ++-
 drivers/media/platform/ti/Kconfig                  |   12 +
 drivers/media/platform/ti/Makefile                 |    1 +
 drivers/media/platform/ti/j721e-csi2rx/Makefile    |    2 +
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 1159 ++++++++++++++++++++
 drivers/staging/media/ipu3/ipu3.c                  |    6 -
 19 files changed, 1506 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
 create mode 100644 drivers/media/platform/ti/j721e-csi2rx/Makefile
 create mode 100644 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

-- 
Sakari Ailus
