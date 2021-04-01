Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C59A3519A8
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbhDARzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237254AbhDARvL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:51:11 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312D7C0045E6;
        Thu,  1 Apr 2021 07:43:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id hq27so3239082ejc.9;
        Thu, 01 Apr 2021 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGRnRc4EiqHm7b2pUbRyZl6rzcmsmwjQh7bNofLlUuY=;
        b=MyxQ20sfTAywgbai+wk7ZvWXfSkJUVecChe18QL6TczcAgHEpUi2w36cjGqqHdmLzE
         kjJbJDLGPTvM7YwygO5A5TpZEnRB1kA9oYHVF+s+Wka8H1Y+zdGE4YK/slo2aHhEfAEX
         NR5XquLGwpYWs4DTY1hx/CC1t/f0qLdt6bXJj88olbVHwd6U6IJgW50bMDI4Ea7EZnYk
         ObhTos73br5fMsJHRd1L6PO8UBsQpqfTxEpGEw7BWpEaRY+7naoPpd4O2M1/2WodPIST
         KV84ahNPw0rSBoJ1igkLbar5Skp4m5j8sjZK9gxjRnzD7YkzSTEziFFNzOCG0s3cI9bA
         RqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGRnRc4EiqHm7b2pUbRyZl6rzcmsmwjQh7bNofLlUuY=;
        b=Fr5Seeypi5NLVIWPfQk3Z1XNGxlQTk/96/AmHiuinrwSJPoFlXITjrgj1Q8oKSN149
         +fp/sr620ObHUZ0NqMdghT9xDZNNpzSmLz7egcu5T/3nM46gLYWQ6dpUCtymBFE/Zbho
         AldEApQETH+jB7E+Dmz5Pm+T/B7bamXa/Z/hKlTCZ3pOS4Xk6yDycGcZ+wigrhQXRXfG
         J/CFLpVqObwwzCzi7w80zFFYUShQxr/LQm1OksDE4iiVCuGeE9VdA8unZZTnF8DcNkmO
         3+nmvzBBQr/J46oSoQku5fIReYNG2MhAQXB9hu2uq1IObn73PHl4+3CehYf0SMgHuc+D
         04Hg==
X-Gm-Message-State: AOAM533SnTdZgqMV9yyDQ1SB4FngdZhs1+x4Ph/HLhGpuGJM1kN2bECJ
        YY+5DS0MNb57y/xOJxIsz+XqvOLzryBpbA==
X-Google-Smtp-Source: ABdhPJxxYx3spcGpvcCzf2aWZy9En8ZfunJVJEDElWBWl5sWdu16b7F24NFDmMuQHwobVdPumTM1Xw==
X-Received: by 2002:a17:907:76ed:: with SMTP id kg13mr9022159ejc.99.1617288224942;
        Thu, 01 Apr 2021 07:43:44 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:44 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v4 0/9] Microchip SAMA5D4 VPU support et al
Date:   Thu,  1 Apr 2021 15:43:27 +0100
Message-Id: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is here is another small revision of the series adding support for
the Microchip SAMA5D4 VPU, which it based on the Hantro G1.

For more details, please see the v2 cover letter.
https://lore.kernel.org/linux-media/20210311154055.3496076-1-emil.l.velikov@gmail.com

Changes since v2:
 - Added RB (thanks Eze)
 - Added AB (thanks Nicolas)
 - Reworked Hantro driver to support modules lacking irq/clk name
   (thanks RobH and Eze)
 - Dropped defconfig patches - merged separatelly (thanks Nicolas)

Changes since v3:
 - Include the fixed dt-binding patch
 - Reinstante clk/irq names within the SAMA driver (Eze)
 - Use num_{clk,irq} in Hantro, instead of WARN_ON/NULL checks (Eze)
 - Drop Nicolas ack from a patch he never gave it to. (Eze)

Note: patches 6/9, 7/9 and 9/9 need reviews. Everything else has been
covered already.

Thanks
Emil

Emil Velikov (9):
  media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
  media: hantro: imx: reuse MB_DIM define
  media: hantro: imx: remove duplicate dec_base init
  media: hantro: imx: remove unused include
  media: hantro: introduce hantro_g1.c for common API
  media: hantro: add fallback handling for single irq/clk
  media: dt-bindings: Document SAMA5D4 VDEC bindings
  media: hantro: add initial SAMA5D4 support
  ARM: dts: sama5d4: enable Hantro G1 VDEC

 .../media/microchip,sama5d4-vdec.yaml         |  47 +++++++
 arch/arm/boot/dts/sama5d4.dtsi                |   7 ++
 drivers/staging/media/hantro/Kconfig          |  10 +-
 drivers/staging/media/hantro/Makefile         |   4 +
 drivers/staging/media/hantro/hantro_drv.c     |  40 ++++--
 drivers/staging/media/hantro/hantro_g1.c      |  39 ++++++
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   5 +-
 drivers/staging/media/hantro/hantro_hw.h      |   4 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  27 +---
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  36 +-----
 .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
 11 files changed, 268 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c

-- 
2.31.1

