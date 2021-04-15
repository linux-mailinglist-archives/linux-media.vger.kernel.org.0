Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14303600BF
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 06:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhDOEGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 00:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbhDOEGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 00:06:05 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCB2C061574;
        Wed, 14 Apr 2021 21:05:43 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id 20so7364202pll.7;
        Wed, 14 Apr 2021 21:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7hn6pwepeOfDXVqHpFY4pE6jHJJVUKXv4sqmopspuGE=;
        b=C+MBCWdIXsT0ikgLkPB4KumKTetm7tNmaiM1Q9wco2rJzZnlIpsAjIGXrVr7SDorqs
         CS1rA/YfcAjT8IR9bFTyC58c99Ii1Z5iY5NdFKRaOXxyEp/ZVdI9OgFsqNMeHtHJG3L4
         wT7tjtufWnODWfByk+kza1f5MMTszS9QNwquA3DmVankaWnaoKJeitiufYk/9tFF+VCU
         zxTJdNciXdS8pfNt1rtfxi/R6FEDD1LYvvpCNIGdWHak36FkOd/5YImCzIN781hVYIAt
         omfOWu3x6Gt2M27Nnj/zwXxg4oou2ac2zM6njvMANhhYa4gVWF4SUvlz4PR/DwoW0LSC
         uvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7hn6pwepeOfDXVqHpFY4pE6jHJJVUKXv4sqmopspuGE=;
        b=tp2aUqvFgn5cM+ZdNhH63ELbGU1JsmEPJNazL3OKXQ//u7n0ekExBnpIFjv31V8KwL
         W12mV2OwoBICPMkeRzMo1sLVe+F85zEGDwhLUQIyYA0+Cn97np/r2wNFwwbObFQneZjD
         72NBjju6bq8sFojVoIQf9fcz/tRuouubrGw6p0GF0YL4q5IFvB5/N/DjSLxpO3t8BMpT
         xQQuExx+UHubaAc+3zGQsx7CgQts5QCk3U0K6iB3pqArIkit0uaoLd9eccrFGbD4W72W
         Gv4o+g4RprmxlcxgjsJu5ZHGzBT8w/IKxahJWPkSjsNeQUQxVV4gyMtH4Q/hgn7bUPVn
         wgcg==
X-Gm-Message-State: AOAM53281zmqpTiZv/bfvBB5FzAnbN+HU7OMOgbr5NOFxrdXQNHD8v9a
        MvJ6iQn28kFsM1k/0vhXVVw=
X-Google-Smtp-Source: ABdhPJwTTqQfzqN67e4rl81lyIh0sdCkKP4WVQQN1XDRdaBAKvuLjCO0DR2wxEHyd8HBplGosIh34A==
X-Received: by 2002:a17:90a:7a8b:: with SMTP id q11mr1623864pjf.215.1618459542598;
        Wed, 14 Apr 2021 21:05:42 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id i17sm714406pfd.84.2021.04.14.21.05.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Apr 2021 21:05:42 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        shawnguo@kernel.org, krzk@kernel.org, linux@rempel-privat.de,
        s.riedmueller@phytec.de, matthias.schiffer@ew.tq-group.com,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v3 0/4] arm: imx: Add i.mx6q DaSheng COM-9XX SBC board support
Date:   Thu, 15 Apr 2021 12:05:31 +0800
Message-Id: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patchset aims to add kernel support on DaSheng COM-8XX SBC board
optimize ov2659 driver to handle xvclk on/off at proper stage to save power

changes based on master branch, since commit id:
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
v3:
- optimize commit message for patch v3 ov2659 part
- move 'imx6q-ds.dtb' after 'imx6q-dms-ba16.dtb' to follow the alphabetical order
  (arch/arm/boot/dts/Makefile)
- move 'ds,imx6q-sbc' after 'dmo,imx6q-edmqmx6' to follow the alphabetical
  order. (Documentation/devicetree/bindings/arm/fsl.yaml)
- move v2 patch 4 to v3 patch 1
- add 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>'
  for [PATCH v3 1/4]

- v2 link:
https://lore.kernel.org/linux-arm-kernel/1618383117-17179-1-git-send-email-dillon.minfei@gmail.com/T/#md2dc86ac665ed7f10cffe4909825b97608805d3f

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
 arch/arm/boot/dts/imx6qdl-ds.dtsi                  | 465 +++++++++++++++++++++
 drivers/media/i2c/ov2659.c                         |  24 +-
 6 files changed, 504 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi

-- 
2.7.4

