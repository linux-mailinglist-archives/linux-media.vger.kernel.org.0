Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B338716B1C
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbjE3RbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbjE3RbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:01 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE88FF7
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:45 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30af20f5f67so1636267f8f.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467844; x=1688059844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0RVCChZrw1HM9gOYT9R7Dq9M2JqYnSrsD9fDiYXZqw=;
        b=Mk9j0A28T6ZsD/yDUdYTaasqk+2b7wKUk8E2DlztWHh0RyXRVFPSZD7ZFthFUpAdrG
         XT7y0PraqOExWZyDr3DW/zW5kv1lZduZS/yWQTcwt4cQuXGneoQCTc5EYZUPD/C9N3MI
         rQ8qLEbk0YZ/DQcWp9mrTnjHQRAHU6P3f5EFCQQCBownaSvGlzmSc7WxBvb0m9Wh6sO6
         /t5/namP+ryoxiOM8VAIZ0qSOS4TG0d9zYoR29nca3R18m/pVoB2tu6337r41oo8hlst
         rhZa4vvN6M6hD1tiHrFC059RUIwDNRsz8a6AidKnYjJkrWTsOPfCyC9nkmK2y6Lj8AT6
         GuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467844; x=1688059844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0RVCChZrw1HM9gOYT9R7Dq9M2JqYnSrsD9fDiYXZqw=;
        b=I3Sr05Rp1kLHE9laAl3d0uOvdUKO5KlPqN0tSPv04vHqQxkI+J6ZOXQ9hK3O7NN/E1
         cDiT/CZ83ol053FT8CwMLu0Q6/CrTCaJ4y/ZQsS+JF4QdEmddpzAYMBBCm3flZunUnCS
         VsvXfOlbdPVJA0UjseFzVbYGKDR5kdzuqtyu80ecMjm9Zt8+Qa4huzEJ8y+S090SLbz4
         +d3q6teKKfGzdajToE1UpN0DLxeoCw4P0AFnwImEgOrMHyH1nZqTss914CGjKk9rtH+M
         a83hCgHJWJAbiK2FtML9JldWCgafNm6QbiqMzZMnFD9EYwWX4hom+rf45vi2LbbIFOv5
         gKqg==
X-Gm-Message-State: AC+VfDwtLmObPG7OrNlKwz0qxGzueAcnjCKJiiyD3/O7VVWHr0bQk4dy
        1djk+mLWQYWBtuQUn9I6i7Dgyknkn9VES3wFV5w=
X-Google-Smtp-Source: ACHHUZ5Y27ra5AaDsbjy8uc6KnHxbqSIL9rvP8ykCeiZTJYKsmQpxOYMh5RFpxYgewnchbx9vZqxow==
X-Received: by 2002:adf:d851:0:b0:304:8147:f0ba with SMTP id k17-20020adfd851000000b003048147f0bamr2494403wrl.3.1685467844357;
        Tue, 30 May 2023 10:30:44 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:44 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 13/21] media: i2c: imx258: Correct max FRM_LENGTH_LINES value
Date:   Tue, 30 May 2023 18:29:52 +0100
Message-Id: <20230530173000.3060865-14-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The data sheet states that the maximum value for registers
0x0340/0x0341 FRM_LENGTH_LINES is 65525(decimal), not the
0xFFFF defined in this driver. Correct this limit.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index b5c2dcb7c9e6..f5199e3243e8 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -28,7 +28,7 @@
 #define IMX258_VTS_30FPS		0x0c50
 #define IMX258_VTS_30FPS_2K		0x0638
 #define IMX258_VTS_30FPS_VGA		0x034c
-#define IMX258_VTS_MAX			0xffff
+#define IMX258_VTS_MAX			65525
 
 #define IMX258_REG_VTS			0x0340
 
-- 
2.25.1

