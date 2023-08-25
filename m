Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6F4787DF5
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 04:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237528AbjHYCuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 22:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238021AbjHYCuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 22:50:15 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52471FCE
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 19:50:13 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso4310885ad.3
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 19:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692931813; x=1693536613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbs3zfrjEkioEJ9A7S9+7yIB9Y9LXlYVB3KW5HxvSkY=;
        b=Z2e4gZAsfIorNq2oTPkyzzN9+rjHyuYMHyjsUQ5E8ZKHqEPkOKJ+m7jwoNZLJgiA/V
         gJck18tgBflBykMf2U9MPRFJGt33miqjeQMRNdq59fC4Cu5kCjisnkZ1D/cLkivM6q7Z
         LS1r0MfEDAY6eTMyIva+Mv8A7BQAUEP2qjoh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931813; x=1693536613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbs3zfrjEkioEJ9A7S9+7yIB9Y9LXlYVB3KW5HxvSkY=;
        b=CEMSBbrGwUn8cYnfKzr1ZqEP9456zU6froroU2Aeu4h11RCDiR36eTkS2KjFgrQvuD
         LqJooBYLAPOPVAnEw5k4Odyx2PXKAdltGj4ZPhOr0Nbn1Yzk+9pFmEs1j3lD3pbjbRiE
         azLuhg65T9PIPd4QKWlkpY2LQ+sEWNdMJaFfrND/7s+Vgkx3P9Aaj3SwaA0i7FN/cwcM
         N59KWRA/mk9ruCZKiYPdqX9D7Q5DRi28uYQQdHdmC8eJ2hBMljPsqjLUfpXBTFe8vC/d
         wGVpJgUu6OKyza33as2LTDMkE52yuwWXdaByXkhzYOEfD5ToolMDmgUzsMxdZAVhf/3c
         1Lpw==
X-Gm-Message-State: AOJu0YzjPJgcCJjW8HJSwIjOB8M87uyNln9UaDme/s6rofLdOujb5Scu
        vJLunokiZlzxkm6FAOTKBMGyfg==
X-Google-Smtp-Source: AGHT+IHYQNJF+LrXZHfOiEcos54AW3bUXshSIa9aYDvLHBGxuDWvRqvvXT3Gao/lVXpH37Om06ayag==
X-Received: by 2002:a17:902:e74b:b0:1b8:aef2:773e with SMTP id p11-20020a170902e74b00b001b8aef2773emr17278466plf.46.1692931813384;
        Thu, 24 Aug 2023 19:50:13 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:50:12 -0700 (PDT)
From:   Reka Norman <rekanorman@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Daisuke Nojiri <dnojiri@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stefan Adolfsson <sadolfsson@google.com>,
        Reka Norman <rekanorman@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 1/9] media: cros-ec-cec: Use cros_ec_cmd to send host commands
Date:   Fri, 25 Aug 2023 12:43:54 +1000
Message-ID: <20230825024735.1443836-2-rekanorman@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230825024735.1443836-1-rekanorman@chromium.org>
References: <20230825024735.1443836-1-rekanorman@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the cros_ec_cmd helper function to reduce the amount of boilerplate
when sending host commands.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

(no changes since v1)

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
2.42.0.rc2.253.gd59a3bf2b4-goog

