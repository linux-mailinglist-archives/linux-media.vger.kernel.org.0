Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF16E6543
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2019 21:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbfJ0UIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Oct 2019 16:08:17 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33966 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbfJ0UIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Oct 2019 16:08:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id v3so8104178wmh.1;
        Sun, 27 Oct 2019 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uILHnq2ITfdDUPR3qFBlC6hvnz1kzbF3v1izfuQrKFw=;
        b=KosvU5MG6bLLKxIv6Q1GTSUvZR2Y0/dnt1uUCaeKm23meFQ6ZyXdc5rIx0y4b6mlvr
         W4G48Tg4nYLf1XzXNokP+Zk16znbBAyuc1shsbomZUzwA95PkYYE3N8qhz41TJOfaQyu
         Ar5YJOxzgr0RH16u4xoAeNBYiNoEjUouGcqttTEBZD4mc76yvCMGpbKsF+lSwaqS6XL7
         FF6XFS5X47EjY0XuTf7PgzpnMJnDVM2ZyLBuk8sG3MYf1CGs/TXz1r9A9snvYeow7JV7
         eZ6M6JHbe/awtIKk1Vyb+PK2N5GeAH98rdpsdh+lyrrgLNU3/K9tw1NR01IpnHHLvs6V
         1PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uILHnq2ITfdDUPR3qFBlC6hvnz1kzbF3v1izfuQrKFw=;
        b=IEiy4uW96cy0OptnSHJ9/d0IjxmvUNvwb/EMPNlL5/8jC3efN6eQk3RpD+D/NRJBkn
         Ven8PlhlheP4rxwHl+q9BrulpbSjluApT0vv+BJRAYsGvMLeszHMPEWJjXDycbX8DGg6
         LZ5z05gkuz0HLrA4F60mdoYT0+m8hp1XXGG7G/G+LzldsiU9AmiotsiUyurGpOrqgNj4
         gdzJdTM76tGVwaz30ObN3A8a86BR7iPPe+d2c6C/SQXHJIX0jIWZ5E2PiZVhgQTdwvZ1
         JdAhyo5bZpmv8k3HOIZ9SvgsY//j8oPTEYmApMcovkMbtjKYF1VdsoEeerKO8VvMLgi5
         /GNw==
X-Gm-Message-State: APjAAAV3oZoGUWIf//fnpU6HnPQXgrIplvlHDhcO3DUBVlKhHsN4LaUA
        2J6+Se4Q8vQCL5eWFmiVGTwQTdHcOdo=
X-Google-Smtp-Source: APXvYqwyOASmJjLwg6ZT+C/jtzSWM3AVB0aUtxw+W5AEL7GrQyB/V5+FJN06i2VjrR7nVF3WoGClxg==
X-Received: by 2002:a1c:2b45:: with SMTP id r66mr11035621wmr.163.1572206894390;
        Sun, 27 Oct 2019 13:08:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o11sm8539538wmh.28.2019.10.27.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 13:08:14 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Sean Young <sean@mess.org>,
        Christian Hewitt <christianshewitt@gmail.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: beelink-gs1: Add rc-beelink-gs1 keymap
Date:   Sun, 27 Oct 2019 21:07:38 +0100
Message-Id: <20191027200738.24802-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191027200738.24802-1-peron.clem@gmail.com>
References: <20191027200738.24802-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Beelink GS1 ships with a NEC remote control.

Add the rc keymap to the device-tree.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 1d05d570142f..ce4b0679839d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -252,6 +252,7 @@
 };
 
 &r_ir {
+	linux,rc-map-name = "rc-beelink-gs1";
 	status = "okay";
 };
 
-- 
2.20.1

