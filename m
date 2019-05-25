Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832892A60B
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfEYSJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:09:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52249 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfEYSJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id y3so12351198wmm.2;
        Sat, 25 May 2019 11:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MeV22BL5hfS4X5C1QCisA6E+loww6qQHxa27Rpq4STA=;
        b=E/UQ5JIHesOPtiu4FL0BhljleB+aD0rTEDWuaxZoJa5isG8BJI9F8PmZeW5/F7rB4S
         LP0d6JhrmUFVZVIomPF1TpgdDrMbKUFkzYTGlyaholqHCILiy+LRmCS2UYJdHr3dtqVw
         1bVR6OY82EwKrmlF5JXlDWtUsuQSJ3SDzoqBlo5J6XsMB3PHrFmBCyIiDftiThU0k9wq
         VWqsQto8YaVMHEzUkWOyqiHbUDyiGsov9ezi5+Sqkzt2RAZ5nztNIN9tLOXWL8EfZAMF
         a37aZSpFUWfk1tBTZS1f8zfPV5RnFvX9x7jvrGC9Fu+Bg0l44rKJ3colnn1YeYPw/Geg
         Ivqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeV22BL5hfS4X5C1QCisA6E+loww6qQHxa27Rpq4STA=;
        b=q/7rvI8GcxjPr6ckSyaVPt46jDoJPvgVmdmTQxMuMhrOmy85ZNj/PmqVNtbs0yUPJq
         jNLIK4lITQTFq/HrbO48Lcb3j23Va/WVzjOrwcDwZfsh8rG/R/RnRRbbH62/Gjza6GJc
         4BPIpJv6h2Rdnih+TnH0lrDKR627kTI41xuaRkExeuea1gpi/povhSFwG+8Sljx1tH7n
         1RphSSHWO1qPfTWzPR4xWOSVftXUoVlLh43qh1eyE5C015NRW+PKxtaSPqP90YZ1gabl
         d5e2D6p8PY9HPLdpSZPS5D2ZrVZ4IP9zBXBC8Iq/EBdG9ZKEe3YKtN8usz/B29N1K2or
         rpaQ==
X-Gm-Message-State: APjAAAX6ZnyaRGySqf+pK39FK9Mo1naGJRgjyZDy4q62yw07+Dzb7yY3
        hE/Pp8xOkER9I1S7Bf7p8QY=
X-Google-Smtp-Source: APXvYqyuB8ZzyyXSuy9puB2CojEz488f/zhX5rZLHL4vMzWRCG/4KEMvBoEnjFLLdJnh72W8+Q+i2Q==
X-Received: by 2002:a1c:9d0f:: with SMTP id g15mr4162775wme.97.1558807775821;
        Sat, 25 May 2019 11:09:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:35 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 06/10] arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
Date:   Sat, 25 May 2019 20:09:19 +0200
Message-Id: <20190525180923.6105-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525180923.6105-1-peron.clem@gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

OrangePi Win board contains IR receiver. Enable it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index 510f661229dc..e05191b71adf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -180,6 +180,10 @@
 	status = "okay";
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
-- 
2.20.1

