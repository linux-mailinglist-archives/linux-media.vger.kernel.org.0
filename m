Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3583FBB6F
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 20:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238440AbhH3SJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 14:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238419AbhH3SJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 14:09:10 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C99C061575;
        Mon, 30 Aug 2021 11:08:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id f2so27450930ljn.1;
        Mon, 30 Aug 2021 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69UzMreQL07rBLiM2S/iSQWED86mjhTpne3vzrBcG+U=;
        b=tKq5Jh3L33D1rHakkGclZoHpOG2VDePsQtljLhaz6iWh4GEuOq/o/si8k5IROrfpKL
         EZi6Zfry5EkIGlqXqqCV1H4VZyfocdPPSq9LsRwuDjeMGQYwXXXyMlc0Xy0afV/xSQSu
         qafg4TLPgkPEgUw35AHZSQyaAD5D0ri3ocEabBmh1nJyfT8JFtIdESnE5RHuaNcPVEAV
         QPLnUEHtAJt/ehFU10ZQGYp55Gazg1H6J0dlliMeTTD27yGqQsQw4dlOzOsOtRkHWUAZ
         K/JQGkdVe+U+ccR+ChTfuK/q1ELXh3AuJLeAQ44j4BuMCrdRf6OmJECnlxo18ZkAULW+
         As7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69UzMreQL07rBLiM2S/iSQWED86mjhTpne3vzrBcG+U=;
        b=XC4kuoVTLnP5Lkj1iMKOuHdA8HhbeDWQ/tJbOyrNzL7CS79fTMdNJNIAUMKyrq3Qtm
         gbkXLKkPV3NKOZwaB9XjmX1lYPEBUzl2A7Jv8fNamMQB4NhgkWz6ZY94bq/VNjEf9y/J
         /99/l9YcdhTC46CjHn+JdzH0Ws7yCwmHKpwgreaAZT+oWSj9E0f18BYHlVbq4VQfjnTV
         rTTkWqe0WKPWal5qbELJd/yWBx7qX+HgigzQuwrCcmN9/SwmoyVJDI9d742PW764ZQA7
         5zLVGY+hA0Pl5dsb2QQqWSDdIHo1v+mWVT3Dj/gioRS1BbiDEi/ZcujQ30Bg55U6LONF
         puYQ==
X-Gm-Message-State: AOAM533/SWAHgG36QfJkJ+pry3pYX74rAEg0vvP8GxilEaK0/+dxc05N
        Cfr/fhGMosCSAuxUAIq1jdtiIF1HAeZYtA==
X-Google-Smtp-Source: ABdhPJz3vPiGQV++PBLINol58xbSTwl/Jajk64CWeX90YppbVh99OzM+ApQ1RuZmX4p9jNUDM2yXPQ==
X-Received: by 2002:a2e:bd0c:: with SMTP id n12mr21712030ljq.46.1630346894587;
        Mon, 30 Aug 2021 11:08:14 -0700 (PDT)
Received: from localhost (37-145-211-218.broadband.corbina.ru. [37.145.211.218])
        by smtp.gmail.com with ESMTPSA id q18sm1909229ljp.19.2021.08.30.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:08:14 -0700 (PDT)
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] phy: phy-rockchip-dphy-rx0: add support for tx1rx1 rx mode
Date:   Mon, 30 Aug 2021 21:07:49 +0300
Message-Id: <20210830180758.251390-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for RX mode of TX1RX1 D-PHY on RK3399. Code is based
on Rockchip BSP kernel branch 4.4. These patches have been tested on
FriendlyElec NanoPi M4 with OmniVision 4689-based sensor.


Mikhail Rudenko (5):
  phy: phy-rockchip-dphy-rx0: refactor for tx1rx1 addition
  phy: phy-rockchip-dphy-rx0: add support for tx1rx1 in receive mode
  phy: rename phy-rockchip-dphy-rx0 to phy-rockchip-dphy-rx
  dt-bindings: phy: phy-rockchip-dphy-rx0: add support for tx1rx1 phy
  arm64: dts: rockchip: add mipi-dphy-tx1rx1 for rk3399

 ...hy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} |  39 ++-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  15 ++
 drivers/phy/rockchip/Kconfig                  |   8 +-
 drivers/phy/rockchip/Makefile                 |   2 +-
 ...chip-dphy-rx0.c => phy-rockchip-dphy-rx.c} | 231 +++++++++++++++---
 5 files changed, 252 insertions(+), 43 deletions(-)
 rename Documentation/devicetree/bindings/phy/{rockchip-mipi-dphy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} (65%)
 rename drivers/phy/rockchip/{phy-rockchip-dphy-rx0.c => phy-rockchip-dphy-rx.c} (63%)

--
2.33.0
