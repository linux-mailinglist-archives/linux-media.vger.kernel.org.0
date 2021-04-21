Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8254B366427
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 05:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbhDUDtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 23:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbhDUDtq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 23:49:46 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C444CC06174A;
        Tue, 20 Apr 2021 20:49:12 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q10so28468478pgj.2;
        Tue, 20 Apr 2021 20:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BHpUFAqHZX4mO5ukpyVl9eTql2LntThdLp21IqHADRI=;
        b=udWcJJ9RhNpgAHpGjwBpvjs5D6Emcld4QGLZieFmYfz5VyKrIrwT4g+8awx1iwg3aD
         CPYJ6Zk35bmX5EWxVa13i5lb8fCpM/Qf3/Y75kiNM9W0WcGBOoqrE/mlvOzzLJeh0KVH
         ISF+wGtz2xB0BBeTCxHOh1pCX0wVVEp6eKnNQAlOEho0ZZq5zr4F4aNdf4jCGo50qKr5
         peEf7m7hUy69GSO7EqODIA2PxCfFy1LW6asiBYCAyc+E2+pqHckEIjor44fQ/Frv134D
         AJQ9TIF2oFI9p5ItkDbCwbedjnzFg+lIPOr3QKym0WzZk4/cTm1U3pJQsHEY1/8bsJXp
         etWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BHpUFAqHZX4mO5ukpyVl9eTql2LntThdLp21IqHADRI=;
        b=ZnTGA8AVdT7QpZaEPc3iinQ8jaIeejLeBZcmDYW6s0ndzTEfpj4uG09A2ZTuDrLYKm
         KxdY7LrJz6BpV+xzlZIi6DEpbogRp/vPkTD5U5pOoHmth+6MS5OnmA35pgkBm+/c11gB
         sAnordsM+1eFshNBqhQa2uvoWpQ6fITG+aM76EpTkWZSDlt11b8gPo110IRojqqrb7P5
         DIKpyz7bS0lGtzkhwuxJexCvjAkyk9Tke4HYUxujOymMoGO/+07oOmDiv8TBzmYYaxVv
         r4jvB5VoE98OaRGIJoOU0QwGxmGSRGzzdfI/5RpjPglTsigT0V1sLqMvsudR+n3cWRf4
         5Lcw==
X-Gm-Message-State: AOAM532npU/8Pde7uVdTQBDEPWvvNDIlyw0FBE1JoK6nEqtF2c0mOjG6
        xEnH57OBUcf/T8aIZ9905NYFhXY86F2vIA==
X-Google-Smtp-Source: ABdhPJziyR0I+2KWNVyuQ1HMXAlR5bR6NXwdRoqXKxpprpEFnydd6ls7EHd+kuqKVnygB0Bqq3RCmA==
X-Received: by 2002:a17:90a:ca8e:: with SMTP id y14mr8614864pjt.6.1618976952233;
        Tue, 20 Apr 2021 20:49:12 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id s43sm382555pfw.164.2021.04.20.20.49.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 20:49:11 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 0/4] arm: imx: Add i.mx6q DaSheng COM-9XX SBC board support
Date:   Wed, 21 Apr 2021 11:48:54 +0800
Message-Id: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patchset aims to add kernel support on DaSheng COM-8XX SBC board
optimize ov2659 driver to handle xvclk on/off at proper stage to save power

changes based on linux master branch, since commit id:
89698becf06d341a700913c3d89ce2a914af69a2

The DaSheng Com-9xx is and ARM based signle board computer (SBC)
featuring:
- i.MX6Q
- 2GiB LPDDR3 DRAM
- 8GiB eMMC 5.0 FLASH
- 4MiB SPI Flash
- USB 2.0 Host/Device
- Multiple multi-protocol RS232/RS485 Serial ports
- microSD socket
- 5V DC power input
- HDMI1.4a,1080p@60
- RGMIIx1 Gigabit Ethernet
- CSI0x1, connect with ov2659

---
v4:
all changes are on '[PATCH v3 3/4] arm: dts: imx: Add i.mx6q DaSheng COM-9XX
SBC board support'
- change 'green' to 'led-0', fix dtbs_check warrning
- change 'pmic: pfuze100@8' to 'pfuze100: pmic@8', fix dtbs_check warrning
- use GPIO_ACTIVE_HIGH instead of 0, from Fabio's suggestion, thanks
- change 'flash: m25p80@0' to 'm25p80: flash@0'
- move 'MX6QDL_PAD_GPIO_0__CCM_CLKO1' to pinctrl_ov2659{}
- move 'MX6QDL_PAD_NANDF_D0__GPIO2_IO00, MX6QDL_PAD_NANDF_D1__GPIO2_IO01'
  to pinctrl_usdhc2_gpioio{}
- remove unused hoggrp
- use wdog2, instead of wdog1 for external reset
- v3 link:
https://lore.kernel.org/lkml/1618459535-8141-1-git-send-email-dillon.minfei@gmail.com/

v3:
- optimize commit message for patch v3 ov2659 part
- move 'imx6q-ds.dtb' after 'imx6q-dms-ba16.dtb' to follow the alphabetical
  order(arch/arm/boot/dts/Makefile)
- move 'ds,imx6q-sbc' after 'dmo,imx6q-edmqmx6' to follow the alphabetical
  order. (Documentation/devicetree/bindings/arm/fsl.yaml)
- move v2 patch 4 to v3 patch 1
- add 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>'
  for [PATCH v3 1/4]

- v2 link:
https://lore.kernel.org/lkml/1618383117-17179-1-git-send-email-dillon.minfei@gmail.com/

v2:
- add "[PATCH v2 4/4] dt-bindings: add dasheng vendor prefix" to fix
  checkpatch.pl warning.

dillon min (4):
  dt-bindings: add dasheng vendor prefix
  dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC
  arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC board support
  media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to
    set xvclk on/off

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/imx6q-ds.dts                     |  17 +
 arch/arm/boot/dts/imx6qdl-ds.dtsi                  | 460 +++++++++++++++++++++
 drivers/media/i2c/ov2659.c                         |  24 +-
 6 files changed, 499 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi

-- 
2.7.4

