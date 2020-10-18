Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A814291757
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgJRMbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgJRMbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:31:11 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F84C061755;
        Sun, 18 Oct 2020 05:31:11 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d3so9993792wma.4;
        Sun, 18 Oct 2020 05:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JdAFcslDo5NBoukTtZP1XPw16pWns4rfyATVn69AdPI=;
        b=dtIDaRbqZ6qu2Z4L66pRGYXQkgGTIuSVGW8e9GUL/2kTB0yOBHpJuutiJ3TWP6jCPV
         1gu5hF67+ytkq91F75rDs10S/14+KcEedVzrbO3Zz3NvCzG+PE5fZJVLj+7VdBMaSLh0
         kdv0tDCs0cLd8VVtYV+lGyBkEEai7M3fSkWdFBK1r/JXq5AmbmhZcCM050szDwgyW2Np
         mg4HwrIZ0swiZX7g/+VxdRKkPl/vStb2D/KkmpIAH1lajpT7eWyNqkEnRCnUQcGfzo1t
         plOmdxHYU+8KOmkaR/2NeW179XS51FTP5ZIXC90VBlDGupLTGSJ08RERHVYfDgELPUmP
         wTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JdAFcslDo5NBoukTtZP1XPw16pWns4rfyATVn69AdPI=;
        b=U2NfqiXv0P2GzO6Px1b1g8jm/j2mzjDSKnCielL9OATh/MGLEwrlOVV1JThgzCzjS+
         jCvruKSjER/0AkrGc2mCEhf5d9VSas4MIgyKW1744akSvtxRgNgTh2k0gpCQ5Ngc4Al6
         ubqwk6FsbQdERyN5h/OOa+Zai3UQiYxAxGc8Zpm2MBvNWc/EewtFG4rLxy4lWc4+Tjqj
         EtpGT8+joXbGhlvEFG9rRfidV+dXnxB5AlLtjlPdZmGW4W5kkqjJiZy/YxO4/fXcpEUx
         mIlhTh2Mpy8DMb2nDHkX7bowPrAaCDc+mC72mW8LZLG+4L2MNskAR05qS25s0ye2+zXE
         1apg==
X-Gm-Message-State: AOAM532m95kg3j1IjZ/jdSg7WNuzgh5OiojpgTZeSX/wQ4k0sUiusSXU
        /1VIRk9hf2dj/PvhimbKSPy0TkqJLuezMx2h
X-Google-Smtp-Source: ABdhPJyFVslvLCVFoSr1zKRYFV4HDP2wSOT/IY8zgu9/a3a2Cyv7YiFcn/wVLLq0tR1gcGfzo1y0sQ==
X-Received: by 2002:a7b:c08c:: with SMTP id r12mr12163985wmh.184.1603024268946;
        Sun, 18 Oct 2020 05:31:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id q2sm13308568wrw.40.2020.10.18.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:31:08 -0700 (PDT)
From:   kholk11@gmail.com
To:     mchehab@kernel.org
Cc:     robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 0/2] Add support for the Sony Exmor-RS IMX300 camera sensor
Date:   Sun, 18 Oct 2020 14:31:04 +0200
Message-Id: <20201018123106.14917-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series adds support for the IMX300 camera sensor, (one of the)
first Exmor-RS Stacked CMOS sensor(s), with support for both of the
supported aspect ratios (4:3 and 16:9).
This driver came out from reverse engineering of so called "userspace
drivers" from Sony Xperia smartphones.

I tried to document all of my findings and giving a sense to the registers
as much as possible, but that was only partially possible and resembles
some names from the IMX219 public datasheet, even though the addresses are
basically completely different.

This camera sensor driver was tested with all the resolutions declared in
it on two phones: Sony Xperia XA2 and XA2 Ultra, on a SDM630 SoC (camss
patches for this SoC will come in a later series) and is working great.

AngeloGioacchino Del Regno (2):
  media: i2c: Add driver for the Sony Exmor-RS IMX300 camera sensor
  media: dt-bindings: media: i2c: Add IMX300 CMOS sensor binding

 .../devicetree/bindings/media/i2c/imx300.yaml |  115 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx300.c                    | 3087 +++++++++++++++++
 5 files changed, 3224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx300.yaml
 create mode 100644 drivers/media/i2c/imx300.c

-- 
2.28.0

