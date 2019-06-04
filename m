Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9436F34D71
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbfFDQaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:08 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53343 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfFDQaI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id d17so732226wmb.3;
        Tue, 04 Jun 2019 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=54TIXqXvsDNltB2y1UR+6mRVKP/XVI4s+wemNTylSEI=;
        b=eAeCHlIeQmyEBytc8R7znUKKSXeP6uAgH6bsKtTUo6/LR/LaWzFOo4o+kjmL2TTsXF
         WRIL7PlmUuz7oi+O48P8do6MJFKG2YSiWOhQwL8XDZIWYw1r5KK0jFOgJBzPSyBaSGCY
         KplZ5nTEUEj2PiuFR0LqmnSb0dlGOsCbj1NPi6M2eHfALDABG1RX8VfpA3QGV/mBu8MX
         5+57ngT6OULxfwDsJMHN42siVFlvyOyck7HvANM/0W2SaRylp3lTwLIyuooEFHkI+l8D
         HZ4duZAvjpjhT5gDtrj8K8i5FMUXeIF44tLP2SaLsX3EWxTXMJqlj4Ztw/fqzWsBVFEl
         CYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=54TIXqXvsDNltB2y1UR+6mRVKP/XVI4s+wemNTylSEI=;
        b=PSbT5qW6NCCXbtSXu2zCWL9meFTt0gRxEWbD0G3A1K8helEV17csi4adkcWA0ykbcU
         OMAa6wy+0XgtH38hFWQLc2q3vjb91I2w938QNOQ+yydQvObyo/KVixHuglRjyYDTCnIZ
         nfHf6XzUj6fCyA0YdzEj8hjtbSrfJlAqQhUrT+BaphWAxbH5cxuXbbgm4p8qcRclaVqt
         3kG7DNfnHCwzGsBgEtxfUd7OsrKBDk32UnPpj1AchzWQmu3dbYhVMLFVORe8JyCpmp5C
         c4Ynmp2C7yejaDZtfkJSk1gBF/Nka1EEdOzufKA5PW9ObsRXkBZCrvePzrferVi13Nqr
         A+Vw==
X-Gm-Message-State: APjAAAV5OvqNj26xENGKcIJra4z2Lzj5GWZ1V9pkUxuMXHiwUbpiaT7W
        /15QEwXLurm1uJMoosAIP9A=
X-Google-Smtp-Source: APXvYqwiwhiDPZmf0yBeaqw/xNa68/cr0Q9ihEI2dgTEsPXakPgC/zw8DdYNnQIwnbK1H7dNDgAE9g==
X-Received: by 2002:a05:600c:218d:: with SMTP id e13mr18972396wme.101.1559665805401;
        Tue, 04 Jun 2019 09:30:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:04 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 00/13] Allwinner A64/H6 IR support
Date:   Tue,  4 Jun 2019 18:29:46 +0200
Message-Id: <20190604162959.29199-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

A64 IR support series[1] pointed out that an A31 bindings should be
introduced.

This series introduce the A31 compatible bindings, then switch it on
the already existing board.

Finally introduce A64 and H6 support.

I have reenable the other H6 boards IR support as Ondrej solve the issue.

Regards,
Clément

[1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
[2] https://lkml.org/lkml/2019/5/27/321
[3] https://patchwork.kernel.org/patch/10975563/

Changes since v3:
 - Reenable IR for other H6 boards
 - Add RXSTA bits definition
 - Add Sean Young's "Acked-by" tags

Changes since v2:
 - Disable IR for other H6 boards
 - Split DTS patch for H3/H5
 - Introduce IR quirks

Changes since v1:
 - Document reset lines as required since A31
 - Explain the memory mapping difference in commit log
 - Fix misspelling "Allwiner" to "Allwinner"
Clément Péron (11):
  dt-bindings: media: sunxi-ir: Add A31 compatible
  media: rc: Introduce sunxi_ir_quirks
  media: rc: sunxi: Add A31 compatible
  media: rc: sunxi: Add RXSTA bits definition
  ARM: dts: sunxi: Prefer A31 bindings for IR
  ARM: dts: sunxi: Prefer A31 bindings for IR
  dt-bindings: media: sunxi-ir: Add A64 compatible
  dt-bindings: media: sunxi-ir: Add H6 compatible
  arm64: dts: allwinner: h6: Add IR receiver node
  arm64: dts: allwinner: h6: Enable IR on H6 boards
  arm64: defconfig: Enable IR SUNXI option

Igors Makejevs (1):
  arm64: dts: allwinner: a64: Add IR node

Jernej Skrabec (1):
  arm64: dts: allwinner: a64: Enable IR on Orange Pi Win

 .../devicetree/bindings/media/sunxi-ir.txt    | 11 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 +
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 ++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/media/rc/sunxi-cir.c                  | 88 ++++++++++++++-----
 13 files changed, 135 insertions(+), 26 deletions(-)

-- 
2.20.1

