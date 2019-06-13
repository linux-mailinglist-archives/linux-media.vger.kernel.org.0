Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD2A43D53
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfFMPlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:41:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41768 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731893AbfFMJvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 05:51:06 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so20022968wrm.8
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2019 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N6Z2dr5bGR1kZw1yfM5fScRi9BMJhzIO4sHAC3hw4oA=;
        b=DNY05LimyHtGQJrqNgqECLcrBxTAvCjomeobHqiJahS3lSERObMQmA0qLcgV07O8P2
         f0Jl1sRsHbxwoOAxKn6wQN1rKcbwvvpzQv8uE+mpEDMRCS916FZCF2IpZnIggGSF09DF
         qzZmNXMMwttzhYs4SiTPyw+FmW7H9rYeXHwokDYUIHlgMdZaganu+tQ8SJC930BWr0NP
         y3uUFxtk7cmtNcEa1gTXVX2JnwfipvtoIx+VondFT/pZh8v0AD8STqk3dSs99mOa4+K8
         y/0EtUnkKom0WTOYdPGcJ93hadC4w0U1HPPhIAQ28sFTEjQhXmLK1BWwIysHIA4NzZ4X
         N9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N6Z2dr5bGR1kZw1yfM5fScRi9BMJhzIO4sHAC3hw4oA=;
        b=rLED1Gk12SHnfSHKlotrmsnQIQ0T9/9+LhigDHYWB3g+UGUEblJ4kQMGHIrOzPgwSX
         p3tg3paTicNZLQ69QU/C+Cr5jR5N5mD4mqRcf4dEhxTd1Ke9dgTYs3rfrArZJ++4APzd
         nM9QApgfDoE4WR7iaboW26Xj75eQQRArtAuKlhzogStM7aMn0xHGnzfhw9yTrAH5UVew
         rFERFN6QuWGMaXuAuwYL0ti2vW/Wnda58widbMZYTzm5Cx/DdVGPJyF56/bxaOMrQklo
         sT7WaOGt3pPwJ+KOmJS0f9mjMJ+efH4DDorRoRJFYINx14X/k7htohhXjJaIuwlJGW1y
         pnRA==
X-Gm-Message-State: APjAAAVUjFGBCWvOUEjWtw02PPN4WYOQrH0xCvmg4vbTkwPerHwpR2d8
        rZTa8HuyIeWK5gQ7CCQjNokrHhHfKAk=
X-Google-Smtp-Source: APXvYqwJcbREN4JuE0cKuxBqCDv3nlxOH4+rl1IqL1ZE03A6gU9jaFDWpHFTWjmb+6wz8mg2//Zm2g==
X-Received: by 2002:adf:d4c1:: with SMTP id w1mr13078217wrk.229.1560419464808;
        Thu, 13 Jun 2019 02:51:04 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id y9sm4732681wma.1.2019.06.13.02.51.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 02:51:04 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH] media: MAINTAINERS: fix linux-media mailing list for meson drivers
Date:   Thu, 13 Jun 2019 11:51:02 +0200
Message-Id: <20190613095102.7363-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both MESON AO CEC and MESON VIDEO DECODER point to the wrong linux-media
mailing list. Update it to linux-media@vger.kernel.org.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad2bf808b02c..58923e29244c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10219,7 +10219,7 @@ F:	drivers/watchdog/menz69_wdt.c
 
 MESON AO CEC DRIVER FOR AMLOGIC SOCS
 M:	Neil Armstrong <narmstrong@baylibre.com>
-L:	linux-media@lists.freedesktop.org
+L:	linux-media@vger.kernel.org
 L:	linux-amlogic@lists.infradead.org
 W:	http://linux-meson.com/
 S:	Supported
@@ -10237,7 +10237,7 @@ F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 
 MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS
 M:	Maxime Jourdan <mjourdan@baylibre.com>
-L:	linux-media@lists.freedesktop.org
+L:	linux-media@vger.kernel.org
 L:	linux-amlogic@lists.infradead.org
 S:	Supported
 F:	drivers/staging/media/meson/vdec/
-- 
2.21.0

