Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC94D77B07A
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 06:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbjHNEgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 00:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbjHNEfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 00:35:55 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BC7E77
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 21:35:52 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bdba48eccdso21533045ad.3
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 21:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691987752; x=1692592552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itIjiisrKDd0dEJkr9u7QlSUsM4Bsnb9Jzz0yBh6Gm4=;
        b=Xck3Z5OnJrMbtyD9wFRDW/GmpGf9wAmSvtvm5NQ2xVthLhnRYzQuocKe4GukWXcu0b
         MMoucWrJSb2GhXbqcMLVLtlIBkbvLwycQ16Li2XkSn8YTMF/ecRkjn9rMN/fl4Rj6YqQ
         xi4GlIxY+9jFma3qoicyW/h7wEzrASoM/IFxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691987752; x=1692592552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itIjiisrKDd0dEJkr9u7QlSUsM4Bsnb9Jzz0yBh6Gm4=;
        b=gXVLGZFd6xBmhzJbYbS7YE22P6hs+AdQdRPupobPps4M1E1wI4+fLFX14WVZn6hjh3
         IVfBLkcoLoab8tQUzC7hcNhI/5JeTNFg85quR6hlJXq6r98pX+SMCfZquHSuBEZWeHag
         SsBa6Y8erSspZsRbiMfmwBHBEazb2PDJ+XJwhE6eNdLvd19nXmUr8UQSmMRbwFfKcgfy
         qrfHrEVqOn2BDrfWuZSmRNwvqI3CJuaHvjeG+FO1zt4uVZaX/ZoHTmvaCnUjbq+a0NUj
         Lcvyg2CwAs7o5RN51O/6h8uRWKY3q06OZVDN5HZJEodc9RMyipfpRz4ladr+XqGTr21f
         3vKw==
X-Gm-Message-State: AOJu0YzdSIehuQR1cfqcAsh0e84POetzQP35uBnDiD5Aaaaxowjf8vrm
        H8V689Nwwsxc8GzL4/Q8Ye20Bg==
X-Google-Smtp-Source: AGHT+IFna/y7uVLsE6ruMXik7aDZMg/YGKuA/YEcbhic+a5zZFTG734FNkYHqA7w/8MH8875Vy2ukQ==
X-Received: by 2002:a17:902:da85:b0:1bc:5b36:a2e8 with SMTP id j5-20020a170902da8500b001bc5b36a2e8mr11568693plx.34.1691987751762;
        Sun, 13 Aug 2023 21:35:51 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:4ae6:d1a4:27c2:80ff])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001bdb0483e65sm6761865plb.265.2023.08.13.21.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:35:51 -0700 (PDT)
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
Subject: [PATCH 3/9] media: cros-ec-cec: Support multiple ports in set/get host commands
Date:   Mon, 14 Aug 2023 14:29:12 +1000
Message-ID: <20230814043140.1108917-4-rekanorman@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
In-Reply-To: <20230814043140.1108917-1-rekanorman@chromium.org>
References: <20230814043140.1108917-1-rekanorman@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reuse the top four bits of the cmd field to specify the port number.
The reason for doing this as opposed to adding a separate uint8_t field
is it avoids the need to add new versions of these commands. The change
is backwards compatible since these bits were previously always zero, so
the default behaviour is to always operate on port 0.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 include/linux/platform_data/cros_ec_commands.h   | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index d76a25ae0cf1..e969031e1e0e 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -118,6 +118,7 @@ static int cros_ec_cec_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	struct ec_params_cec_set params = {
 		.cmd = CEC_CMD_LOGICAL_ADDRESS,
+		.port = port->port_num,
 		.val = logical_addr,
 	};
 	int ret;
@@ -162,6 +163,7 @@ static int cros_ec_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	struct ec_params_cec_set params = {
 		.cmd = CEC_CMD_ENABLE,
+		.port = port->port_num,
 		.val = enable,
 	};
 	int ret;
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index cb2ddd10a613..e8bb05db360f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4457,13 +4457,15 @@ struct ec_params_cec_write {
 /**
  * struct ec_params_cec_set - CEC parameters set
  * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
+ * @port: CEC port to set the parameter on
  * @val: in case cmd is CEC_CMD_ENABLE, this field can be 0 to disable CEC
  *	or 1 to enable CEC functionality, in case cmd is
  *	CEC_CMD_LOGICAL_ADDRESS, this field encodes the requested logical
  *	address between 0 and 15 or 0xff to unregister
  */
 struct ec_params_cec_set {
-	uint8_t cmd; /* enum cec_command */
+	uint8_t cmd : 4; /* enum cec_command */
+	uint8_t port : 4;
 	uint8_t val;
 } __ec_align1;
 
@@ -4473,9 +4475,11 @@ struct ec_params_cec_set {
 /**
  * struct ec_params_cec_get - CEC parameters get
  * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
+ * @port: CEC port to get the parameter on
  */
 struct ec_params_cec_get {
-	uint8_t cmd; /* enum cec_command */
+	uint8_t cmd : 4; /* enum cec_command */
+	uint8_t port : 4;
 } __ec_align1;
 
 /**
-- 
2.41.0.640.ga95def55d0-goog

