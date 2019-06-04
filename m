Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC8A34D5D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbfFDQaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41991 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbfFDQaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id o12so9402668wrj.9;
        Tue, 04 Jun 2019 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=erM6d71aChyl+Iyy/eqYauRUQ2nKHoueD7cmlIRiQZ8=;
        b=t3oo40ApkJgetlJtClCQocXnUUmTkChlEdex6UlC3GQ80y0fNWmq8Zq5ODNWVqaf9d
         wEEg6WTDrN9IVgZ3qMRTAPpKucL/N8LUNJUgxAPKTv3CfDB614ZwfhCZh1EzLcn365hg
         pWxKV/lSDFYDTpdmpZVoiKZ2Rdnt0oS8wbyt9gDkGNd/di1UImBajKdgIvjjl+aBuJt1
         o8bV/bviUis1U/5Kg2A+rXQY3RK9KAXKKMwqzWA0FJcxVaBk9bNRYPdPVnh1k1V/X1Z8
         MCrhx6gOKaluW5Lw1qOzUMpXPqMMFm3FTa6S9hUjuPAsqcRyAsdTeiWkDUTBDil25PxA
         r+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=erM6d71aChyl+Iyy/eqYauRUQ2nKHoueD7cmlIRiQZ8=;
        b=p3ro26YhSaKTI74LiRft/kf1X8suB0c/cWOrdN7IgXyOcla6DN2Xkiut4fbM0XlphN
         2OJo/JXwpOkqABJ13Iw72Q1PI++6puXD294ynAkmAbxpOL8gUgw25hGXNJYd26aoQ3fi
         u7ZwPilpdcb134Q3kijcx8QnSaEPSSpfBQlI52O/l0OqSBXUQl99rfJbYCx/P0jmizTD
         ABXpSUj3nhQJKjTmMjvSCAS9487MCOqW+ckRb/g3gIHPEr+ZABNVNsRXlaoELxEdWXGb
         X3vDsW0CjC70z1nTZepPItffb1d9aVYcqOjSdNVHyEqwNDOScLbvfrv01sKqA99qjH2U
         MvDg==
X-Gm-Message-State: APjAAAUHv8klZeD6ofk7R8ohzyRYhzLkU6+nhyA8j6rpaTCQrgMdROTr
        3wCIZJmTF+JurLzRkK/NaLs=
X-Google-Smtp-Source: APXvYqyZpeeM6tRlWGZbyX1HHA8ZW9ZHAAJzRT1YwNT/f8zYzZwm/vpcR2lGLwlfXCCR+K/roxWZxg==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr21905812wro.178.1559665816776;
        Tue, 04 Jun 2019 09:30:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:16 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 09/13] arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
Date:   Tue,  4 Jun 2019 18:29:55 +0200
Message-Id: <20190604162959.29199-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
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

