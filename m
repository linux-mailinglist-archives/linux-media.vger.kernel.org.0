Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE8877B078
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 06:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbjHNEfG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 00:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbjHNEeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 00:34:36 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C54E71
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 21:34:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bc3d94d40fso34611705ad.3
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 21:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691987674; x=1692592474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYvNk0F6tYkddjPM1gjr6zJLDh3fOJZ+v63cRgPJjfA=;
        b=H7zzWBlWpbodL7W+6k8K70XBLbZ/RNtZxtCDAwQhN7RZrum1aHa1NFieQVQkx+VpYk
         +Jh6j44slWPePa7rpDNelCk+yrvPWugPSBBVUJjNvy7QJdc49CdUcPqp5+iuQwlVE8bT
         W6MhOBUBugTeZ7OGaaUeVZkLK7jvEkHPB3TT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691987674; x=1692592474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYvNk0F6tYkddjPM1gjr6zJLDh3fOJZ+v63cRgPJjfA=;
        b=Z/gA71ULw7a/edMGW1Mp8ivJwqDRATZPKhXFYvGu0fttHX8xABP2Nb/ux4xPI9/mXN
         aIjOG9MpYMEyfaU841ya8DLmiV5H7gxXE0s6AYMgpTZCMRhl5XJPbPKh1gMHHUXxa/nS
         1iahDLGDBFR/n7aEAQS004SoN7I0GBM7scEIM2m0JzejIPXY7FeDZfMJ7vy5UHZVFIgW
         VH8ZWO0+GsGlZiOZbPHKKl9qKLH4YAIRQAvlK4nba2dDqeJ8ZiPt/hMfIhkly5n3VO+n
         7WZPrzFMJe4dfvJdHlT53J8Fm9TS0kBhI4h6c7clSXsjgu81sAHYPzRpSz79V3RWp06R
         Hq8g==
X-Gm-Message-State: AOJu0YyS6Zcf5Z4ZjZDBWPWC6GExarKG2c8ZjOrCHdtmcOM3/2uz5fiR
        xdcRmK6qSCeYq45dk/IzypQ3JQ==
X-Google-Smtp-Source: AGHT+IHfnYKjQj8WsxQRE9dk4FSHNeYQqT6ChPM5Z4x8Zek8wEZS9VddxNTOaE9+wtyoEQiUGDMZEQ==
X-Received: by 2002:a17:903:2d0:b0:1b8:a697:3719 with SMTP id s16-20020a17090302d000b001b8a6973719mr10622994plk.25.1691987674497;
        Sun, 13 Aug 2023 21:34:34 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:4ae6:d1a4:27c2:80ff])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001bdb0483e65sm6761865plb.265.2023.08.13.21.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:34:34 -0700 (PDT)
From:   Reka Norman <rekanorman@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Stefan Adolfsson <sadolfsson@google.com>,
        Reka Norman <rekanorman@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 1/9] media: cros-ec-cec: Use cros_ec_cmd to send host commands
Date:   Mon, 14 Aug 2023 14:29:10 +1000
Message-ID: <20230814043140.1108917-2-rekanorman@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
In-Reply-To: <20230814043140.1108917-1-rekanorman@chromium.org>
References: <20230814043140.1108917-1-rekanorman@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the cros_ec_cmd helper function to reduce the amount of boilerplate
when sending host commands.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 44 +++++++------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index c17faf002877..8dd95fb38546 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -95,18 +95,14 @@ static int cros_ec_cec_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 {
 	struct cros_ec_cec *cros_ec_cec = adap->priv;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_params_cec_set data;
-	} __packed msg = {};
+	struct ec_params_cec_set params = {
+		.cmd = CEC_CMD_LOGICAL_ADDRESS,
+		.val = logical_addr,
+	};
 	int ret;
 
-	msg.msg.command = EC_CMD_CEC_SET;
-	msg.msg.outsize = sizeof(msg.data);
-	msg.data.cmd = CEC_CMD_LOGICAL_ADDRESS;
-	msg.data.val = logical_addr;
-
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_CEC_SET, &params, sizeof(params),
+			  NULL, 0);
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error setting CEC logical address on EC: %d\n", ret);
@@ -121,17 +117,13 @@ static int cros_ec_cec_transmit(struct cec_adapter *adap, u8 attempts,
 {
 	struct cros_ec_cec *cros_ec_cec = adap->priv;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_params_cec_write data;
-	} __packed msg = {};
+	struct ec_params_cec_write params;
 	int ret;
 
-	msg.msg.command = EC_CMD_CEC_WRITE_MSG;
-	msg.msg.outsize = cec_msg->len;
-	memcpy(msg.data.msg, cec_msg->msg, cec_msg->len);
+	memcpy(params.msg, cec_msg->msg, cec_msg->len);
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_CEC_WRITE_MSG, &params,
+			  cec_msg->len, NULL, 0);
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error writing CEC msg on EC: %d\n", ret);
@@ -145,18 +137,14 @@ static int cros_ec_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct cros_ec_cec *cros_ec_cec = adap->priv;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_params_cec_set data;
-	} __packed msg = {};
+	struct ec_params_cec_set params = {
+		.cmd = CEC_CMD_ENABLE,
+		.val = enable,
+	};
 	int ret;
 
-	msg.msg.command = EC_CMD_CEC_SET;
-	msg.msg.outsize = sizeof(msg.data);
-	msg.data.cmd = CEC_CMD_ENABLE;
-	msg.data.val = enable;
-
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_CEC_SET, &params, sizeof(params),
+			  NULL, 0);
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error %sabling CEC on EC: %d\n",
-- 
2.41.0.640.ga95def55d0-goog

