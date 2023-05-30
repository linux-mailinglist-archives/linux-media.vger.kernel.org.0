Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A84716B03
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233443AbjE3Ra4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbjE3Ray (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:30:54 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2A2116
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:38 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so3153168f8f.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467837; x=1688059837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNvQ77TjHdn7xwbRTU0kRT/fFnnc0Ql3C6LB28GoFhQ=;
        b=C+tBtFwp/c+s4jh2lyng+JKXf1I5MkQCiQB5WljFY3cc2BVCqsgAIt8eFa2d3XIPoC
         ICzCGI//meWa5ae0Qo1ylNIo4Ti0QjkydLrymgxLMtfyU5ffcKRMtaENQQ0ri2qLlUtq
         XVfMTxUdzo5gJ9JezyLi0OuUnX1s36HkDLA9FYelt5H5Y0R7zm1C340ZbSXcg1fow4Mt
         cTtn5H2G/ZPDgDPqzIa1iRv5KHS00OqxQRG/um7O19WF3+mRdQmzgyiXEp3sh/ctc2n6
         kkD1HaNetRR0gfVGdKRvtwi1JAggKql4tYxY9/bFEVo5g83FAwXHJLJhBwwjps6BRsKA
         dIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467837; x=1688059837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNvQ77TjHdn7xwbRTU0kRT/fFnnc0Ql3C6LB28GoFhQ=;
        b=eY3LZ4SB8Nmm2DTx6zud/CMXwa4/R/iYmiStmwz1tjIoI5TeVPo1zHuKj/YAWo81GX
         S2X5W/5s7GwsJI+0EYQnZ+XsEE695PixEnP4AV+T6ATVGBVm2rohmOP97S46G9BPpehF
         P80o8QGy7pSpLvemNPA7C3AufwFCFOFrkHPPeXPTsLqjY1TOmPRiP2DrKJ0Rh6w8tT4S
         qrFZDjpBkXIyagDwFtjmA/0npHjoDHHYcRgqBb4vCalYcjWt9hs6zUDoaVvcHtgiTTsn
         n333Kj2KoHNTfAi+6Y4pWtA+LdXyyD6i2g+OsK1VcUqBg0x/JkGVg6QpgP4ZPJDp27L/
         1raw==
X-Gm-Message-State: AC+VfDxWJJj0lmwnqo34Jn+rL57Qu0TB5ls8HwT22BTwYebsvR6g9Sz6
        GJhi/XwToJunymJEHjTT2ICtNA==
X-Google-Smtp-Source: ACHHUZ5BLuPx8Jx93Zg89Xzzt9/DkSqXRdx24AvfrBtzHIKYJYgk0iZIGjXhn/xQkIZWq8NpRcZeHA==
X-Received: by 2002:a5d:4eca:0:b0:301:8551:446a with SMTP id s10-20020a5d4eca000000b003018551446amr2170729wrv.2.1685467837548;
        Tue, 30 May 2023 10:30:37 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:37 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 04/21] media: i2c: imx258: Remove redundant I2C writes.
Date:   Tue, 30 May 2023 18:29:43 +0100
Message-Id: <20230530173000.3060865-5-dave.stevenson@raspberrypi.com>
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

Registers 0x0202 and 0x0203 are written via the control handler
for V4L2_CID_EXPOSURE, so are not needed from the mode lists.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index aabd5c3e8af9..b695fd987b71 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -237,8 +237,6 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
 	{ 0x034E, 0x0C },
 	{ 0x034F, 0x30 },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x0C },
-	{ 0x0203, 0x46 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -356,8 +354,6 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x034E, 0x06 },
 	{ 0x034F, 0x18 },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x06 },
-	{ 0x0203, 0x2E },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -475,8 +471,6 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x034E, 0x03 },
 	{ 0x034F, 0x0C },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x03 },
-	{ 0x0203, 0x42 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
-- 
2.25.1

