Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128B6716B01
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233416AbjE3Raz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbjE3Rax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:30:53 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FCF11B
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:38 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30789a4c537so3158951f8f.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467836; x=1688059836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laDlR8DaBG/J9QehfXcjrsfiMQSBDQW8d/iu7w3qC+g=;
        b=GrWexrQiZBDNd6+dGEYG4wny+0EhcgFWlBLwUbDAvJYTp1MPBMtFBxbaDTn+CAxZ3z
         x21Q0L3KzBUKbd8DcqHs6glSmfHnprAJUdjZjGhUO+fyo9MampzN+8IPMOGIrEc+Ea2O
         eWhekBgP5gVejos6uDaxkkLNF0BzmOVeefwoNcz68RRVNov2dGgdeWC85Rzy+FHqxbEQ
         93PwKw4PS+FlJorX/XWzC3yOtKxloopBXXpEEXvh6QhcYwUHLwVF749qBUjeXPweUwmu
         HOb+xr+Gik6qZDm2GUdA2MmUlY0GR769UsyFMdOeUAeziyl9G5B6EwuTSv9G6RRgDxyX
         7iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467836; x=1688059836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laDlR8DaBG/J9QehfXcjrsfiMQSBDQW8d/iu7w3qC+g=;
        b=Uh+zeZvjiuRupQqTbwISKJ7ACfsGXJJV0B/HICmMBFDvUvGi+MekWNKzwyUCmXsbZT
         P1RZSru12C3h6Jq0F+RHKtTFjgzp9XH89FwNb5dIjUkyvZqvFfag0c8tNwjJGf14qety
         2NjYzGM5acsU0UK9YnyweBWyeAtjFv8UwJpa/L1gAlKz1VfGNMBjqnOEA1N5cavI1uYP
         8BU9tuHJDZCfB29WeDpuSYA9nd5FDdJwaCMo1cDJCS8rMBMGzFldnK8h5Cp1JQ6qXzWc
         tg7UQgy/IX2l3llTr7QxvxWiQVDuCsXSMepS+APS+jpo/sIpcrhy+rSGqB+0SePwq7HU
         en0A==
X-Gm-Message-State: AC+VfDzLOfdLIa4JJrPGJcyUO74nCPLE2EvXyX57sDlajSc6uBFTyg8N
        eVUBJXF+q6OcZthpI8o2qttGKg==
X-Google-Smtp-Source: ACHHUZ4xNk5ymHnV7jphCElO/6iAm2THdLiIlxmREwn6XlrQOYuyFy+gcji04nRfvntAoY66A33i3g==
X-Received: by 2002:adf:d0c1:0:b0:306:2b5a:d8db with SMTP id z1-20020adfd0c1000000b003062b5ad8dbmr1675570wrh.23.1685467836767;
        Tue, 30 May 2023 10:30:36 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:36 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 03/21] media: i2c: imx258: Disable digital cropping on binned modes
Date:   Tue, 30 May 2023 18:29:42 +0100
Message-Id: <20230530173000.3060865-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The binned modes set DIG_CROP_X_OFFSET and DIG_CROP_IMAGE_WIDTH
to less than the full image, even though the image being captured
is meant to be a scaled version of the full array size.

Reduce X_OFFSET to 0, and increase IMAGE_WIDTH to the full array.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 946b1a12971d..aabd5c3e8af9 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -340,11 +340,11 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x0404, 0x00 },
 	{ 0x0405, 0x20 },
 	{ 0x0408, 0x00 },
-	{ 0x0409, 0x02 },
+	{ 0x0409, 0x00 },
 	{ 0x040A, 0x00 },
 	{ 0x040B, 0x00 },
 	{ 0x040C, 0x10 },
-	{ 0x040D, 0x6A },
+	{ 0x040D, 0x70 },
 	{ 0x040E, 0x06 },
 	{ 0x040F, 0x18 },
 	{ 0x3038, 0x00 },
@@ -459,11 +459,11 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x0404, 0x00 },
 	{ 0x0405, 0x40 },
 	{ 0x0408, 0x00 },
-	{ 0x0409, 0x06 },
+	{ 0x0409, 0x00 },
 	{ 0x040A, 0x00 },
 	{ 0x040B, 0x00 },
 	{ 0x040C, 0x10 },
-	{ 0x040D, 0x64 },
+	{ 0x040D, 0x70 },
 	{ 0x040E, 0x03 },
 	{ 0x040F, 0x0C },
 	{ 0x3038, 0x00 },
-- 
2.25.1

