Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E426313AAE
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfEDOks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:48 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44067 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOks (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:48 -0400
Received: by mail-qk1-f196.google.com with SMTP id d14so495439qkl.11;
        Sat, 04 May 2019 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T9Qs8dTZ1+gMY4BQD6SwkkWyhPjLDwG2kkm+LN85fx0=;
        b=ksTBJY1213GTBbMM3y7iooIrrJ/7TMSG/ib5hXOS/fvb4cIq54oJi6M+r3yyP0+ace
         Qn9xkpl9RtoOiCzGO1vKihP90+LKIkCHv40ZbzsvXY50+lGKqaB6b3R9OJe1j7VLuIxf
         nH+ZzUZ4O2XDl5UByDjoWa4SuYv4XBmcAGgWkl4PyR0pnib/UbSRSbnHEgTQZoWKiu+L
         fCZSKykVi+FR/fWUeq/uH9idlnkJjGuudMgP1cv5oROE/rDNS6MUFWSrqc3c+bZhE9vd
         bXfyVTFszMijFHpD7wsVeuequhIxe3tw01nSt1JgVl9jIUsSlm1T3Z80hHXK1ndu7zMN
         Oa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T9Qs8dTZ1+gMY4BQD6SwkkWyhPjLDwG2kkm+LN85fx0=;
        b=EdKU4zK9FtyBNfJ8Lj/UKpBiCPybOgLkLZnyTtoaLuN3xHh06C3yKnCQXl/bX4F2aQ
         tjL5JGNNadUbk/O8GWjQd+oUT5cYa+LZtj/w69wOgCz0A3FIc7kq40qY16P3+KlWFWM9
         HSTBQYO+JY5DYGhr0m1vJNOB2LW4z461CBZoxxEqitzNZlLcA2yb06AuLZj5wgLT+pYQ
         JfZ5IZC/cU3boS9XmUYg7gcHYFyPhIvkv2d08CWoEn7Xb9Cp08QosXHfy6LL1tkPjEm5
         rEvpJ7+lknJbQuRMRQkiEv/kMgf3pO1Lw0j/DbBWX37gyRVQ4+mGeQhB4yjVflnQrMix
         U28A==
X-Gm-Message-State: APjAAAUh662KfO1RZIPZK5oNX7vlHnWm92Y7V1LEo+dNnSQw1hN60Mxk
        yzfDCxcNb1MY8rLjPm3zSTI=
X-Google-Smtp-Source: APXvYqx4hj2r5faOcYdJTUiZ4nIztf8EvEeeyzCqxm47vGhHdpTvj3OcfKciVSHec+GS/Nzutoy7Rw==
X-Received: by 2002:a37:6005:: with SMTP id u5mr11720796qkb.255.1556980847346;
        Sat, 04 May 2019 07:40:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:46 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI clock
Date:   Sat,  4 May 2019 11:40:25 -0300
Message-Id: <20190504144027.31920-6-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per the i.MX7D Reference Manual only the MCLK is used for
the CSI block, so only document this single clock.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/media/imx7-csi.txt | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
index 3c07bc676bc3..443aef07356e 100644
--- a/Documentation/devicetree/bindings/media/imx7-csi.txt
+++ b/Documentation/devicetree/bindings/media/imx7-csi.txt
@@ -14,8 +14,7 @@ Required properties:
 - interrupts    : should contain CSI interrupt;
 - clocks        : list of clock specifiers, see
         Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
-- clock-names   : must contain "axi", "mclk" and "dcic" entries, matching
-                 entries in the clock property;
+- clock-names   : must contain "mclk";
 
 The device node shall contain one 'port' child node with one child 'endpoint'
 node, according to the bindings defined in:
@@ -32,10 +31,8 @@ example:
                         compatible = "fsl,imx7-csi";
                         reg = <0x30710000 0x10000>;
                         interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                        clocks = <&clks IMX7D_CLK_DUMMY>,
-                                        <&clks IMX7D_CSI_MCLK_ROOT_CLK>,
-                                        <&clks IMX7D_CLK_DUMMY>;
-                        clock-names = "axi", "mclk", "dcic";
+                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
+                        clock-names = "mclk";
 
                         port {
                                 csi_from_csi_mux: endpoint {
-- 
2.17.1

