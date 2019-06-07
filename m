Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C5F39980
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731716AbfFGXLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33745 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731692AbfFGXLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so3667852wru.0;
        Fri, 07 Jun 2019 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=erM6d71aChyl+Iyy/eqYauRUQ2nKHoueD7cmlIRiQZ8=;
        b=M8xAidn+V0cDdtxVKZcU0GsUhS0BGe2it4zhUBpyeNxNEcOr5R8PfJHWcgzm971XgL
         PvhZ3yFhEiAAcHa9oTIOzu8Vc1N9kJTQV6TLaaLIXrRNsA6ZPQFDm9cR+y0wrwkWuN0b
         uaHQCU7c/L0hmB2PT6DgmtblerDjdmxAFq/VKgc5xnyMTiygGLu5ZwfnMkQN3UuEUllq
         Hmd8hBHmfLYjfIIhzdKSVzWL2sMqpCMW2HtaKVnBO9VoccEo05Xy4FuAwmc+RBopfb/w
         SnCy8MzVtBRv8+jr5dU01qgL8aaKlL1+Dg1aYEIoou4Z90mTGMTljKR2RSkbmA2MdBn3
         Vp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=erM6d71aChyl+Iyy/eqYauRUQ2nKHoueD7cmlIRiQZ8=;
        b=VFkK4sVZhbTeKlczlysiVdf9FgBZnhfKNWn6KSD0oDleSOxLC0mIi8lSwJPJUQabL8
         qlKGefp+r/pI/AcVRA8rELZfOla7gF9cjMj9PEkKddSYgQeNrwF8dcSJkLzEi3anLZm8
         2NbITnElGpUHRL6a945bF+B7S/oJjt7TqNabiHR6C9IAVFsUNdgs4hXWBLWMA8aj8RvO
         kXvYreyuvzp4TGmScKqXbdtL4mESCMHwrg+o9ZdHBFvYeViXG0eL6HeWfZtL/FEeRpt1
         jQWE76/Vgp2pZfaYHOGD7hZc1p95jjsMPtTo6x3zB8AJDcaJZxSypHat5lMKTp0yGyzN
         xDOg==
X-Gm-Message-State: APjAAAUMKvZ9F2TUScPrxNlp6xzPwuJMjjI+A4pYodW0W31KOFT1R8yH
        yBrPkf2io8z6b1UZsGMTAC8=
X-Google-Smtp-Source: APXvYqzhAaNc1KaAVPMCpP/YKiDq4gEpDCjaNfnx+VL50LxQ1xgj3PKgBe8srCe5bCOuxpxnMq3tKg==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr4235805wrq.227.1559949077999;
        Fri, 07 Jun 2019 16:11:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:17 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 09/13] arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
Date:   Sat,  8 Jun 2019 01:10:56 +0200
Message-Id: <20190607231100.5894-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
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
Acked-by: Sean Young <sean@mess.org>
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

