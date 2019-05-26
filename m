Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB17C2AC84
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfEZWZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39068 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfEZWZz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so9891123wma.4;
        Sun, 26 May 2019 15:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f1zmDm9n7G9V5x4Qey/KRvnzXY0A1V0uEl3s5XqqEzY=;
        b=ixgQJky1wVVtXXRKn3zr7saZgE0rP9pmcvwINRRzOo4E+4yOBlqJp6zBzQcTxeQxvd
         oLoeCKu2uMQBjgggE97DtGKGjWrO65/MEGPh47rscGdM1xqxkksgLkxo7Z/U0g6nDjue
         Rlono7E6sbZPeJcpU/fE+rm69q09z4XJRCCDSIcRjbymMEY/ITp79RXGhsLlBrFnKRrc
         HScM3R8OvipPRfq/knihNMJxa+4FAP740gDYm+xAf/jnnpdpL4a89frAoGULifp/juvV
         p4Wsq1PIe4uO80qdaewWnRzlQxMgaXe0tmgTBXaiATFozPohVQPODnSS733FOcYgzr03
         o4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1zmDm9n7G9V5x4Qey/KRvnzXY0A1V0uEl3s5XqqEzY=;
        b=Fopo2jWw/pf+gc+SUEL6RR9fSLhpr04OcZkVD6xvbP4qwQn4qTyoWsRs/JKio4k8ze
         VzYdwHiLN3XeIGwTC0O6aU12FqcLVwBivKe/qVpQ07XuvUun19LcSXKytblZPNoMp+R7
         pK5y2ixkEaoVhJXdTEQlle3cV+Klu8JUDqLbqNHE6SXLO1Z1/fMnVE3wViQFHyp6gCsI
         /P1SbgYHH7l+GxwjK7rWuOxOwQaQwaJs2siz0r71G4q8fGWQlJmU5SpcMkqo/WSZnhOx
         /lca4OzYZK8BmPQNyiQnQObdymhM1hwtMtIpYPmG8QDFuNWF/HNlYpQDlyed0UFzFGkY
         IiAw==
X-Gm-Message-State: APjAAAXu5/Yc2Z1ZIocEr8Umo2RMAC5o2KqcwTCxS1E2cs9X/8u+lkBg
        lsv/oJunIkh6SJq//UxOuZc=
X-Google-Smtp-Source: APXvYqzNxMDvJErVSAYX1CErZnfVjsHwRpfsjf26f1XbSjKAv9Dl2F0QIgr6Sh6x3Y/xidX4lHWv2Q==
X-Received: by 2002:a05:600c:228b:: with SMTP id 11mr108670wmf.26.1558909552439;
        Sun, 26 May 2019 15:25:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:51 -0700 (PDT)
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
Subject: [PATCH v2 08/10] arm64: dts: allwinner: h6: Add IR receiver node
Date:   Mon, 27 May 2019 00:25:34 +0200
Message-Id: <20190526222536.10917-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526222536.10917-1-peron.clem@gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner H6 IR is similar to A31 and can use same driver.

Add support for it.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 16c5c3d0fd81..649cbdfe452e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -647,6 +647,25 @@
 				pins = "PL0", "PL1";
 				function = "s_i2c";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL9";
+				function = "s_cir_rx";
+			};
+		};
+
+		r_ir: ir@7040000 {
+				compatible = "allwinner,sun50i-h6-ir",
+					     "allwinner,sun6i-a31-ir";
+				reg = <0x07040000 0x400>;
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&r_ccu CLK_R_APB1_IR>,
+					 <&r_ccu CLK_IR>;
+				clock-names = "apb", "ir";
+				resets = <&r_ccu RST_R_APB1_IR>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&r_ir_rx_pin>;
+				status = "disabled";
 		};
 
 		r_i2c: i2c@7081400 {
-- 
2.20.1

