Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F32CB3999A
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731887AbfFGXMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:12:13 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37543 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfFGXLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id 22so3289852wmg.2;
        Fri, 07 Jun 2019 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lol1q6oip3iAiLWaqttTm7yI5iUN53ws0ToXRxpRMt8=;
        b=oXRJCsXeB+er7f3oAowCoBA9MPGtd+CYB5T7BUiotF8B1kGDp8+d9K1KqzKfdShrhO
         EzsDwPmv15ztStk620DR0HwNFQEcBix+D8fW3lgCK/kjelJcdZ/eyufnEQ9SFEp7CQqF
         QuE6sW786uKiJbieQQjXWNzalxrGmb9Sa9/EKROMwFL5KJ7KRaYKt98DNX0BBiCKclf6
         dQQcURi/LwIl9gKW+MYByw1F1CKHTOwEH07eQSwhwRa9olW4UVH7aONLVNvsuaeIDtyf
         Z/Ejf4KPicB5vziOFFhqeruDnkIrNbB9sd66bqwTYwzRvOXLPpzQfirCvfY+m1slayQf
         aaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lol1q6oip3iAiLWaqttTm7yI5iUN53ws0ToXRxpRMt8=;
        b=pHVbYsDydEYfbgFIGoiGmH9rI6d/fnhPjiFz6R/8xZGMf+k15XebLbB51+EKSN+tfF
         uyS+qNH42M+9bmRnczZSOi1D5AtmbLpgmaJRVFLzHxd/MoednLQp2+nS8YrfZt5dLWtx
         7aWJ3K3E5FZcKRbzFOv7XNkTEhyd1oBsLFZ5+BMSDCWQaFOyZZ0THda+wH9jfqhYCFjj
         lpa/NhEZGmicpLmxjjBlUC71yzgvyFmJkZLnLYo7VIxtcPEUJ+nt4WL6TioA03NC9H4a
         S3AKoTEMIDySwopWJKNiEmb56ADgJIXjgOAft72jDMjiuGDrXNjAInt+hhLlF8lTBufz
         +B+g==
X-Gm-Message-State: APjAAAWNvqdozQVyxe1KLYsMXPlMj6CGMnLohkNNfvB87WZoxRPq57Ib
        EigfqgnjT6HtDVZkeoKABgk=
X-Google-Smtp-Source: APXvYqztHS7XCrwAZuxX3MKe/AIl2WKNXYx30cRsf1SdkQ5dTVEjbyQ1ZNptaV+f9m3ZRJVuntO8Aw==
X-Received: by 2002:a1c:c282:: with SMTP id s124mr5382313wmf.141.1559949072272;
        Fri, 07 Jun 2019 16:11:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:11 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 03/13] media: rc: sunxi: Add A31 compatible
Date:   Sat,  8 Jun 2019 01:10:50 +0200
Message-Id: <20190607231100.5894-4-peron.clem@gmail.com>
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

Allwiner A31 has a different memory mapping so add the compatible
we will need it later.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
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

