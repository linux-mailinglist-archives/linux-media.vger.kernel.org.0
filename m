Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A106C524C70
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 14:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353571AbiELML2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 08:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353570AbiELMLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 08:11:25 -0400
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C72E36329
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:11:24 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id a5so3174150wrp.7
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HJwU5LS4I0ENs9QTTUdJs7vGUcZGBL8PpTeBRo7Fi8U=;
        b=X9WmS1kKwDGY+0D8mYvHs3ZCHYMiCt06dp6hnP7WSYKkw3axAS9olhrRHUvhea+eif
         EGcRIt357iK127DLjHyU7gsHRA7i1L9KuIBhKln5J107h1OiP2m3TPgj8gjGhteUNpx2
         Hu3OJK3WFfYHXXKenATTS+GF/hVOiCcrF3uxICW2vOjiBiqgqMMNWj199KnRa6ffJwzv
         JK6R7Cdu7pMPJAGlhSatbv767kUf4QrdG6VgBBnggdLFemKTLBuuVmFkgy8IhZaalV+C
         lan+M9qQPqsEN3ZfW7NUOhe3RINtQBm0r+257QV1BWbiW3zFH3YmHUqHjRhszBU0icXR
         J6Kw==
X-Gm-Message-State: AOAM531mxLkosHKqycTmjE5zM7l7s6CFQ9NCX7EYJkg0D2iBy+iFRgza
        AF6o+68M1riNeamEm6kzK//Y8LdqYyQ=
X-Google-Smtp-Source: ABdhPJzz8Kn9KmeYcDPnI3RMhD87C0YT9uXEsR0rbaNhgfxvyPkCMSI0T5h6ifWthtYqdz5ioebyxA==
X-Received: by 2002:a05:6000:1acd:b0:20c:811c:9f39 with SMTP id i13-20020a0560001acd00b0020c811c9f39mr26378264wry.482.1652357482851;
        Thu, 12 May 2022 05:11:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:26:14d:2383:a80b:b4b0:e183])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003942a244f2csm2659331wms.5.2022.05.12.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 05:11:22 -0700 (PDT)
From:   Benjamin Marty <info@benjaminmarty.ch>
To:     linux-media@vger.kernel.org
Cc:     Benjamin Marty <info@benjaminmarty.ch>
Subject: [PATCH v2] media: i2c: adv7180: fix reserved bit in Video Selection 2
Date:   Thu, 12 May 2022 14:02:10 +0200
Message-Id: <20220512120209.11614-1-info@benjaminmarty.ch>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This bit is marked as reserved in the ADV Hardware Reference Manual.

Resetting this bit seems to cause increased video noise. Setting this
bit according to the Hardware Reference Manual reduces the video noise
immediately.

Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
---
version 2:
- Fixed Kieran's remarks

 drivers/media/i2c/adv7180.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 4f5db195e66d..992111fe249e 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -43,6 +43,7 @@
 #define ADV7180_INPUT_CONTROL_INSEL_MASK		0x0f
 
 #define ADV7182_REG_INPUT_VIDSEL			0x0002
+#define ADV7182_REG_INPUT_RESERVED			BIT(2)
 
 #define ADV7180_REG_OUTPUT_CONTROL			0x0003
 #define ADV7180_REG_EXTENDED_OUTPUT_CONTROL		0x0004
@@ -1014,7 +1015,9 @@ static int adv7182_init(struct adv7180_state *state)
 
 static int adv7182_set_std(struct adv7180_state *state, unsigned int std)
 {
-	return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std << 4);
+	/* Failing to set the reserved bit can result in increased video noise */
+	return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
+			     (std << 4) | ADV7182_REG_INPUT_RESERVED);
 }
 
 enum adv7182_input_type {
-- 
2.36.1

