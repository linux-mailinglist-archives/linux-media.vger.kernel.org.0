Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7366B716AFD
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbjE3Raw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbjE3Rau (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:30:50 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4C6124
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:36 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so3153111f8f.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467835; x=1688059835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R06QgnOIc6JgKZENg1I2OL1jwi9EcZ87JyuvJDeto3A=;
        b=tKP76imLLXQxdtAPEEPtgsdO21bq7Uds91Wzv55c7j6SJfO/so/hWcXV1qEkR9ugmD
         dP94pJ0TlxvXrsPahmIGXp6nmlpOBJdtrCjuEWkoh/eXzepGBZDjmVJRjQ5HBaxE5YCc
         AtkfX1vj8TSlXL6imQe9J09v0rDHPTzxt/FEecRhZ3SqcRJ+ph8y3la5VDm+h75m5Bfy
         hkDQcND9qWb8Yw/PvJktP45b1rVgGoY4UOu3op3FI7O8kCSzGx0SvBrSjlLcEI7WJWda
         qGR8KJyRlKZrTDvN+Uia8hlWvvwiXUAP84FDKk4y0h9Mk91/NmJYsmBu1sdY+6QJGk5f
         rUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467835; x=1688059835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R06QgnOIc6JgKZENg1I2OL1jwi9EcZ87JyuvJDeto3A=;
        b=XuhxkSgTR7b/2Nql+xS0yJDH6eRcGoj2k4yyEZjCZleEYYswhTEwFw92l6ZyBbOOfm
         mddfNwtErt1rGRCXwAECYDpS+dcvSlzI28sek0h9Nk4a8Y/0wB+M3+9uyeR1cnQLzVEY
         jUZQMl2vTAaqfluQeChfjZ+ddc8swtkAwN4dc5kfbBq7lQmo/IDmVfK2hiMHEYWM+Vcr
         Yds1mSu33RYtb1YEwyYcA773eZgVzSb2ACASf/Hy8o3sw/qSAB2QnpFQBfbi4QL7obgk
         dfIsB+sX2Tkoqgz4hv8jcaOR3V350tv0JMJ6DLtV1lLsVvHeOkMG94Il6QE/Y/SEw/GV
         drOg==
X-Gm-Message-State: AC+VfDyruIyKZW/83nrRIaVs8j44XzX3sOx0PBaVS/yyFiO6c7rQObPO
        hCGG1sqrhkUWSy/6pRlMrv6tgA==
X-Google-Smtp-Source: ACHHUZ67Dhm4m4Vx7L3nMLJoFcwqPEG2bGGs7sMNRgY5Xw3DtQEr8fgODkkxHZKnXX4ZW/xbM7PVhw==
X-Received: by 2002:adf:e591:0:b0:2f9:61b5:7796 with SMTP id l17-20020adfe591000000b002f961b57796mr2180627wrm.29.1685467835399;
        Tue, 30 May 2023 10:30:35 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:34 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 01/21] media: i2c: imx258: Remove unused defines
Date:   Tue, 30 May 2023 18:29:40 +0100
Message-Id: <20230530173000.3060865-2-dave.stevenson@raspberrypi.com>
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

The IMX258_FLL_* defines are unused. Remove them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 85d73b186111..6028579393b5 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -29,12 +29,6 @@
 #define IMX258_VTS_30FPS_VGA		0x034c
 #define IMX258_VTS_MAX			0xffff
 
-/*Frame Length Line*/
-#define IMX258_FLL_MIN			0x08a6
-#define IMX258_FLL_MAX			0xffff
-#define IMX258_FLL_STEP			1
-#define IMX258_FLL_DEFAULT		0x0c98
-
 /* HBLANK control - read only */
 #define IMX258_PPL_DEFAULT		5352
 
-- 
2.25.1

