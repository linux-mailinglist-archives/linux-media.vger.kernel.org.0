Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A29534D46
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfFDQaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43849 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbfFDQaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id r18so7514713wrm.10;
        Tue, 04 Jun 2019 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WVt9PLRHxA5shLBGM+rat6DzEBJdBuHXCCimY/wvQxI=;
        b=Xru/SMuMwtGeeWJ3+w4TxGGjpjQHqX4X8g8eFmhGVvijmB4VGTqI0vGJzZqmhinYf9
         yQbPAkvZt8d8Ss/f2AMKMQZ0gwETtA4010GDyUvDLdgPGzRyVFbXUuw3yV77NdxCu2XF
         1fhbB9o7LmJmFGQ+xYBmghjdwPKM3hZdFWnIVARImSuSyHKqOvi7Pupr60JfEnj5S7bi
         Y0KhiYJKB5XU0ZYNZJYds7HxI87XBs0sWcT+YNXQIlMRv5EMNtVBx6Kvt7YYHYSkkMo7
         G/PWLBmvTup5CJyxk1brnACswG12Zc48cMPobx1vAbLI4vyX88F9Ht3xWc53dJuPQ+td
         aoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WVt9PLRHxA5shLBGM+rat6DzEBJdBuHXCCimY/wvQxI=;
        b=KeFOTzP1o8H9eCD1V/G9Kyh16ovZNADWhrlMJl1thZLAFXLtBe6eUbEmVytWj2PjQi
         0OBxud6REOFl5afbONnhOFG+tLi6kbmpClKwMMdw/mBfEM1TNMByWa8uA31q+L5vVObi
         HhHRL44/z64R2zZeX5rDJwODxd/3dg1p/No40qZ4rNicn1qdZJ39c5ytaPBh6RDqtmaz
         3c5vaeW6Gb473YHyRCEstNN+QOhyAJLJHNWOx6ITe6/iarFq5SulJDKVmb73vKXBBhqr
         Q7owWYe9mBkO6w0FbPKnFjY8g5vhAe3FoWWMmv0HINEVnsQuOjhfSBrFLteSxGQyAZmy
         XrWw==
X-Gm-Message-State: APjAAAW9nTnvarnDv9m5jz2XCyBPKIcYcGUjGLBBDAafzv8stajk2JWV
        PkqaSmSIggR1YDy+EmCaD0U=
X-Google-Smtp-Source: APXvYqzBl9dj83P9V27+Fdl0MwabMhnwcsDkxoHC8nOmjtY9SHfRpfzvhefntyBnBp30NrlHWphusA==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr21919479wrp.240.1559665808671;
        Tue, 04 Jun 2019 09:30:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:07 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 03/13] media: rc: sunxi: Add A31 compatible
Date:   Tue,  4 Jun 2019 18:29:49 +0200
Message-Id: <20190604162959.29199-4-peron.clem@gmail.com>
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

Allwiner A31 has a different memory mapping so add the compatible
we will need it later.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index d02dcb6fd0a5..0504ebfc831f 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -343,6 +343,11 @@ static const struct sunxi_ir_quirks sun5i_a13_ir_quirks = {
 	.fifo_size = 64,
 };
 
+static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
+	.has_reset = true,
+	.fifo_size = 64,
+};
+
 static const struct of_device_id sunxi_ir_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-ir",
@@ -352,6 +357,10 @@ static const struct of_device_id sunxi_ir_match[] = {
 		.compatible = "allwinner,sun5i-a13-ir",
 		.data = &sun5i_a13_ir_quirks,
 	},
+	{
+		.compatible = "allwinner,sun6i-a31-ir",
+		.data = &sun6i_a31_ir_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
-- 
2.20.1

