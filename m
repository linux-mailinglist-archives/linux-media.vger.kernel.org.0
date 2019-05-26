Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1E02AC77
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbfEZWZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:46 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38654 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfEZWZp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:45 -0400
Received: by mail-wm1-f68.google.com with SMTP id t5so13955018wmh.3;
        Sun, 26 May 2019 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ramFDJ3R+AtjRxaNB0t90s4XaqyMkSnufLHrPP/uUT8=;
        b=u8wTFbctX+VkQPsaKwnQiOa7Q/qWSO0/49O6yzkVmMH1Fsqsbre6TXAGzcmIH8sNwn
         VApqqWSpQUwA3AV4NvahQdf9OdXEmrBJb6t4AE0tAQ3vXVlZ12Am6VoaIz2+mzCHV65I
         4kuA/LBgY0HiY8YFHgv7IrOjy6fBzJpiHUa7FoqMdhL6CQ/KSZx4YreQAEBoVoME8IJA
         OLjq+NYluGqo4zVlXLPgeaewpoVDy9Yybfvwrh8hmIjU7CtDX4ML5RDCYqQUfyQrLnec
         U+iaDqMuC16auKaqzMHk2LTppxOimXqCEIatfWbIB1hMv+erLHrBuVYnUEXM6StmpH3U
         q07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ramFDJ3R+AtjRxaNB0t90s4XaqyMkSnufLHrPP/uUT8=;
        b=VGCG0ycu8eMXimQKFfRMklUEz41+XxDM0DgQkZWqb+nEYdKRZAllgwcyibTQv9Awrh
         Ggmv2rrNlZcbRtZ0NtJyqBPCOlrMD3OYYiprcRk5QJW9BxToEL358NF+owGjXMcHCma5
         m/3KrzGhPOSILwdB/ZErv1sVe2Xnq0hTAcpDkHcnDJwI0qxYj3db+i/ZBII9bfvhM0XX
         AXAndVxqoFs8KXPJX17aPOsYcZ6A/+ntUaK8vB6IN4d3CQgIFIsdriOdpOE1M18ip3eZ
         CcC9DViKmGA0QCpoz6kgu1t7/sYW0Aza/mVllZsYQkyiIF6O5y6W0dvYslWdn/JfeN8b
         QvRg==
X-Gm-Message-State: APjAAAWaO90CwBHuaAkOTOuxkNGOGi8Ge9tPY1LgSU/k2nTnFQnwO7YH
        nlaM6xYevgmvIU64t5rgLzc=
X-Google-Smtp-Source: APXvYqyzDtTcZ0+M8W2DNUeGoD1ely2DBDSjR+tF+T9XGtoxcsHT6c+tUu5WqGbSeT5IhmzohWEHZg==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr8029506wmi.167.1558909543004;
        Sun, 26 May 2019 15:25:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:42 -0700 (PDT)
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
Subject: [PATCH v2 00/10] Allwinner A64/H6 IR support
Date:   Mon, 27 May 2019 00:25:26 +0200
Message-Id: <20190526222536.10917-1-peron.clem@gmail.com>
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

Regards,
Clément

[1] https://lore.kernel.org/patchwork/patch/1031390/#1221464

Changes since v1:
 - Document reset lines as required since A31
 - Explain the memory mapping difference in commit log
 - Fix misspelling "Allwiner" to "Allwinner"

Clément Péron (8):
  dt-bindings: media: sunxi-ir: add A31 compatible
  media: rc: sunxi: Add A31 compatible
  ARM: dts: sunxi: prefer A31 instead of A13 for ir
  dt-bindings: media: sunxi-ir: Add A64 compatible
  dt-bindings: media: sunxi-ir: Add H6 compatible
  arm64: dts: allwinner: h6: Add IR receiver node
  arm64: dts: allwinner: h6: Enable IR on H6 boards
  arm64: defconfig: enable IR SUNXI option

Igors Makejevs (1):
  arm64: dts: allwinner: a64: Add IR node

Jernej Skrabec (1):
  arm64: dts: allwinner: a64: Enable IR on Orange Pi Win

 .../devicetree/bindings/media/sunxi-ir.txt    | 11 +++++++++--
 arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++++
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 ++++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/media/rc/sunxi-cir.c                  |  1 +
 13 files changed, 68 insertions(+), 6 deletions(-)

-- 
2.20.1

