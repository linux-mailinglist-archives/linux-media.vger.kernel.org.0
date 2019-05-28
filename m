Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51C82CB67
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfE1QPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:10 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34949 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfE1QPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so3548665wmi.0;
        Tue, 28 May 2019 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4pnyJmIUnLoD7dR5gJykJYv78SBMiwJXtAbyq2Z7Mh8=;
        b=Cn+BCXPN3tWrkqRIHS+SVz7wU2FUyP/vggbr76FoHd0VZgvJgx733/uHXbsie0MZaX
         +cwcmWC0Wrxkl2+OsprU/MrsakOZCo1ZRBLShY9TISxi+EIGwvOcEADxmagvr3+SDc3B
         IN4b3//qPKv598ngXH+OZAo0rRnpTuI24ZTvpHat21Yt1hKbQ3oAsrK7IRdBOPqxTTUo
         VgU/eNwicEO3To9yOfmYk/MHYe4hd1qIza3cb7gtlZ1q8mKQvrglruWUj48IlEp0Xe6X
         X3R5BhMcPUSZ1Hj8MXqXlHcXmz9DOt5XSiHUBAE92TkgAgXOp9ZCcK9Xn3k0pAJpKZAv
         Xu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4pnyJmIUnLoD7dR5gJykJYv78SBMiwJXtAbyq2Z7Mh8=;
        b=JTP9GfACkUCrCPwuFlYXjPs/BBD1hKmeGP/TPqJvsTibKBQzOuCk3LYaFZ6OoYCsLy
         u6jsuYj/kgfMt4JtuaNX2NyyedTuIBrAQJBdJ/C454bmBw91IqtldXwKM7tpUFRN9CTV
         CkN7qu5ImTLwraSx5/i6Uj1VztrZpsYvyEhxxUVkjR/qQuq+pKP1e83xJvyqPTHKQfzP
         Yyacl4Li3M1BkJLn7Vj+ZJtj6hjYQ4VJnR0VG/gIoNf5IOyDfsW3xdWmMz1ei+8n6GKR
         NE30JXD4nHcI9oJyY/WR4IOREBnfRbTTdlfnUvQeGn5zXWJuN+DjKPPpL+gFKnEldqq8
         BjcA==
X-Gm-Message-State: APjAAAWKRR0lIlmUi5DJmIb+YgLAcxExrR9zNnXfAboqD96wbpL7EpRY
        qe/10vk8xg5CU9FfjObEF4U=
X-Google-Smtp-Source: APXvYqzZA7E6nZUwcQyfJh5YD5kkkXzwAGN7NdIqfU7H//W/KTi34HryDLMmy0yLkGZ91MwvIS/tRA==
X-Received: by 2002:a7b:c24f:: with SMTP id b15mr3792599wmj.103.1559060107465;
        Tue, 28 May 2019 09:15:07 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.15.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:15:06 -0700 (PDT)
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
Subject: [PATCH v3 11/12] arm64: dts: allwinner: h6: Enable IR on Beelink GS1
Date:   Tue, 28 May 2019 18:14:39 +0200
Message-Id: <20190528161440.27172-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Beelink GS1 has an IR receiver.

Enable it in the device-tree.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 0dc33c90dd60..680dc29cb089 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -232,6 +232,10 @@
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_pio {
 	/*
 	 * PL0 and PL1 are used for PMIC I2C
-- 
2.20.1

