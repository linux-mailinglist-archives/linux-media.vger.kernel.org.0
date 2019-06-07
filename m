Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D08339976
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbfFGXLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39052 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbfFGXLL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so971040wrt.6;
        Fri, 07 Jun 2019 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wfPe7o+pKiEiYzQKf2K8qPkbS6b/+iHkf3dAJkOwkg=;
        b=VCDey2umgxvrMenWODCRhKJQDjsDcGl5TS+Y8nJqfGhrR0/n3Cn57kOrv+VICYltiY
         JqARgHm+jRVjCPDFp4qKRWf8IEaYe4V/zCAmK8gB0VuBxPUzpHuMOfBDJlqHWbh0yfC2
         tbc3BYRHjk/824UWEFpk6LK2unGwpHVNdHcNYPKICPzWEN++MToCGo/WP3DI61Is1PYH
         vQWAWIfA+PkVZbXb+Kmn6DBRzreiHiGiiPIics+eBTI6MqMjTjx6PTPs3mnUX52fQfHD
         EeJqHgORMKLQqckjpnBxqaSqqhFrYfZL8YCMWA4wHhoNLvVNAuDb+J9ke/39i5wrwT/R
         K3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wfPe7o+pKiEiYzQKf2K8qPkbS6b/+iHkf3dAJkOwkg=;
        b=bo7znaDd7MGXj70s3GWSpR7bqkrVWed6Xnghk3c5RXcLsDFcp7GEuK/HB/5DgympZQ
         1NGDIW8pxkCHx8ZGV5p+Vpt0kEtC6vmWPm4YYME/CM4a3jAVYBEHknLCplpaQfhu4Mnf
         qt3kMqZWjZ25x7GGdm4QcIIefrLpng5UuNtmu+7FXN1IWch1VkS87ny5Txyhzhw6H07n
         hCkE4iEWCQisU4FR1PCJVGlxtwVWc3atGaEOQxaX7blNUfDnQ3JMOkXAyO9b/Wk6BCyW
         YNzKmEBh02llo+dTW0honmDyi6DRasfE0G0JWGzuttd48wvCqjyBMOjQ+rXBSdRq/CT2
         2a5A==
X-Gm-Message-State: APjAAAV8RQPOW/32K0G6ifHMo3rWkNGiVFmmZR1Btn0dh/Jd3CGF2g1o
        Imq8b8+w5y8UHrJKr/Hrknw=
X-Google-Smtp-Source: APXvYqw+PzKucyesHZ0bjq4qJTJx4ikEmxjo++sha0U0BPwPHx54569NJJVYz2yXIpfxd0xB0L/+DQ==
X-Received: by 2002:adf:e30d:: with SMTP id b13mr17448803wrj.246.1559949069031;
        Fri, 07 Jun 2019 16:11:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:08 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 00/13] Allwinner A64/H6 IR support
Date:   Sat,  8 Jun 2019 01:10:47 +0200
Message-Id: <20190607231100.5894-1-peron.clem@gmail.com>
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

Changes since v4:
 - Reuse defines for RXSTA bits definition

Changes since v3:
 - Reenable IR for other H6 boards
 - Add RXSTA bits definition
 - Add Sean Young's "Acked-by" tags

Changes since v2:
 - Disable IR for other H6 boards
 - Split DTS patch for H3/H5
 - Introduce IR quirks

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

