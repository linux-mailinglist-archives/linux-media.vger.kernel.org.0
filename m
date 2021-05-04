Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6548337254F
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 07:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhEDFK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 01:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhEDFK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 01:10:58 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810CAC061574;
        Mon,  3 May 2021 22:10:03 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id p4so6271748pfo.3;
        Mon, 03 May 2021 22:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nN558CuJoYAqyxjGw9iC6a952PyhhCiEntUbao0fqtw=;
        b=f5nlQJk/X8xswjtgGBa/nPro4ITYg0HtrtYa0SMIxXiv9PlLFBSJubJAiVtCAvWgGy
         3yaEIqm2fy1mh+a7WWtD8NAaBp4jVCQj6TWU2n5NFeDHfG7Vya8FCSYLFox7hjEUDHHF
         hjQIW4cAZwegc7phXf63L5avbwzL6hzQUxpQ1wFaJFPpaeVi5+pluFefMH143Mz20X2N
         daQ1AfT+3TCTgW8gdRY7GA4etwxxwd1qIFqzBfZdXOeXPojduCQYxgp1yLVCkGyskJYb
         T8HYQTNLaa49rVxpphTJBThzgbgNCx7txZtyBHrF2hPMWPV/ULK2b2W6BjxR64nqUckG
         T20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nN558CuJoYAqyxjGw9iC6a952PyhhCiEntUbao0fqtw=;
        b=GGvzcG7CI5wWpl8XKUlPtuxjM6QPquZnZRXp11XltTjvCn9y0khPPCJ+leMwouvLPf
         wKch+KIiB8bN8R0RUiT6u7su6ioyZZD2ZmcS2nlWlAvUuk44TdvZNx/wlDNSArVcJ6Y/
         2OQWz2RloTxVZNojpaTNXH1J3VW/8sp4vjyGVmWsbvH0yj+MjjYnecfSDrNO3tLAnwva
         9kcJydPogBM7L0nAH8Y/cF1WvT1BhDAMmn2QB4Bv4skBuGEz8wHLx5GabvtLZSNkyDm7
         1qn6h4upp1tMXDk7Y9u93QYrJUSKfB2SiQ4bHtQdaEh3/iHHsFwtTx7/xspvo9pxkkAv
         viSA==
X-Gm-Message-State: AOAM532wkb8jXdmkmKhQSSYlObLsD0Lg1tcwlCqzb6gl4NxdN/R+DkVT
        Lu0Tv43tcxuj1OoQDiK8VTY6Sv6I1ZqwVw==
X-Google-Smtp-Source: ABdhPJxIvgqU5Bhm45ywaPKkil788kyQIAKjvpt/dwodzS/XN83o5sfMYL3mkmVQiCLj9uyKVLZ4gA==
X-Received: by 2002:a63:ce41:: with SMTP id r1mr21676946pgi.222.1620105003061;
        Mon, 03 May 2021 22:10:03 -0700 (PDT)
Received: from localhost.localdomain ([63.143.61.57])
        by smtp.gmail.com with ESMTPSA id 3sm10457815pff.132.2021.05.03.22.09.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 22:10:02 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     festevam@gmail.com, shawnguo@kernel.org, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, mchehab+huawei@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, krzk@kernel.org,
        robh+dt@kernel.org, linux@rempel-privat.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 0/4] arm: imx: Add i.mx6q DaSheng COM-9XX SBC board support
Date:   Tue,  4 May 2021 13:09:49 +0800
Message-Id: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

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

v5:
- change my git author name from lower case to higher case.thanks prabhakar
- add 'Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>' for [PATCH v4 4/4]
- v4 link:
  https://lore.kernel.org/lkml/1618976938-20834-1-git-send-email-dillon.minfei@gmail.com/

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


Dillon Min (4):
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
1.9.1

