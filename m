Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079BB560DA1
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 01:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbiF2Xho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 19:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbiF2Xhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 19:37:43 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDA3F26
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 16:37:42 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 9A54C2006F
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:37:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1656545859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=P1/cOmvgwcHahrDbVAvpZ8P/GdbOgYbj10U2E/H5HKY=;
        b=FaGzUiHEGCSEvpjh+DPHOCuryViSYg0xfOx8aub22Plqxqu3XdjnQfyyv+8XxjiAtxoht3
        STASs2nI2RLXMscDwhuU7ITzsoj8aOFUXhB0LlNrEdaiPPuEoi7V8ATmajSM4B7l4h23D0
        ZaAQfeoZoTzYV88QycHuqZG3clOVDqw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 28C79634C91
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:37:39 +0300 (EEST)
Date:   Thu, 30 Jun 2022 02:37:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.20] Ar0521 driver, ov5640 driver improvements
Message-ID: <YrziQwGBS9CWAcpQ@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1656545859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=P1/cOmvgwcHahrDbVAvpZ8P/GdbOgYbj10U2E/H5HKY=;
        b=VjMHsQZUe1AdoEl+OBtLHgRfbcHK+AIuTeRilA8nV5JVnGSdEloOpC6oqmbrZ1hniA9VvO
        sAuw1ZSVVdzcfhSF8pnL7VcqHpE7DhKng9Ry6/KHk95e8Akjg/AvDPBoFUY9wa1er3oAIe
        tIwQiDRDO8s9rAnqwRShDJPG9g/YjQ0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1656545859; a=rsa-sha256; cv=none;
        b=dbfwDtry+THdaJEM2EWDQFyf1AigwL78fT1kjeS45FG7RLqVb8x/Ez+rWvbIl/FiZSm4RY
        X32748Ts4ETqy3npc8F6cQSsHNryh4V30+ofRoeKK/GCs+H/DXVW/1KOF1Tb1QZ8dSOZoE
        yfZjEzq4hDrUDQERfcfo2Ikk4ivdFbk=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set contains a few patches long overdue, namely a driver for the
ar0521 sensor driver and Jacopo's big, big set of ov5640 driver
improvements. A few miscellaneous related fixes are included (e.g.
st-mipid02 patches due to CSI-2 mbus format consolidation).

Please pull.


The following changes since commit 945a9a8e448b65bec055d37eba58f711b39f66f0:

  media: pvrusb2: fix memory leak in pvr_probe (2022-06-20 10:30:37 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.20-1-signed

for you to fetch changes up to 41b0717924f57949434524875d9dba45a7f3707b:

  On Semi AR0521 sensor driver (2022-06-29 09:46:26 +0300)

----------------------------------------------------------------
V4L2 patches for 5.20

----------------------------------------------------------------
Alain Volmat (1):
      media: st-mipid02: add support for YVYU and VYUY formats

Hugues Fruchet (4):
      media: st-mipid02: add support of pixel clock polarity
      media: st-mipid02: expose 1X16 serial pixel format
      media: stm32-dcmi: add support of 1X16 serial pixel formats variant
      media: ov5640: Adjust vblank with s_frame_interval

Jacopo Mondi (27):
      media: ov5640: Add pixel rate to modes
      media: ov5604: Re-arrange modes definition
      media: ov5640: Add ov5640_is_csi2() function
      media: ov5640: Associate bpp with formats
      media: ov5640: Add LINK_FREQ control
      media: ov5640: Update pixel_rate and link_freq
      media: ov5640: Rework CSI-2 clock tree
      media: ov5640: Rework timings programming
      media: ov5640: Fix 720x480 in RGB888 mode
      media: ov5640: Split DVP and CSI-2 timings
      media: ov5640: Provide timings accessor
      media: ov5640: Re-sort per-mode register tables
      media: ov5640: Remove duplicated mode settings
      media: ov5640: Remove ov5640_mode_init_data
      media: ov5640: Add HBLANK control
      media: ov5640: Add VBLANK control
      media: ov5640: Remove frame rate check from find_mode()
      media: ov5640: Change CSI-2 timings to comply with FPS
      media: ov5640: Implement init_cfg
      media: ov5640: Implement get_selection
      media: ov5640: Register device properties
      media: ov5640: Add RGB565_1X16 format
      media: ov5640: Add BGR888 format
      media: ov5640: Restrict sizes to mbus code
      media: ov5640: Adjust format to bpp in s_fmt
      media: ov5640: Split DVP and CSI-2 formats
      media: ov5640: Move format mux config in format

Krzysztof Hałasa (2):
      dt-bindings: Add bindings for On Semi AR0521 camera sensor
      On Semi AR0521 sensor driver

Sakari Ailus (1):
      ov7251: Fix multiple problems in s_stream callback

 .../devicetree/bindings/media/i2c/onnn,ar0521.yaml |  112 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ar0521.c                         | 1061 +++++++++++++
 drivers/media/i2c/ov5640.c                         | 1650 ++++++++++++++------
 drivers/media/i2c/ov7251.c                         |    5 +-
 drivers/media/i2c/st-mipid02.c                     |   30 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   18 +-
 9 files changed, 2424 insertions(+), 473 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
 create mode 100644 drivers/media/i2c/ar0521.c

-- 
Kind regards,

Sakari Ailus
