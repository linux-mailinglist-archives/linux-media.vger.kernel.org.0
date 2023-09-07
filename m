Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C057978C7
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244045AbjIGQyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244679AbjIGQyq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:54:46 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3281BFB
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:54:16 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so1648019a12.0
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105584; x=1694710384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA5jwmfCSlNH83mfRCiNqnTglrB8xLWvA9YsruFheoo=;
        b=Gq/zkd5xU4cnWdJ2I44s4BJop5yLSMrqwG9hMDJVvS9/NbRPOoiXVTDRgbK8/FL9mU
         M+KBJLgStUKGT9tbxlxbnn1dI0NZQOHE9jHvn0GhObQm5L/hdohm8v146h7ms97tq/OZ
         31GoUGpd+Alg7HFbKRyXZXrDvMOJbHWs0YJ8DTcpZGvyj8Dxc+EOH7AH9KiwPYTbRwYs
         6Uc7MshR1LZKmJlCg17MDKdNbsb8zuenWHK9q9xwg3zDl0DCyrF+xEj+KsoB2XwpGYZq
         SQWWyJxSk1J8nhq/76IceHXsxPiNfGyvvWDsFW8U4+FQTAdvyxnIb6lnAkIjLQUSscaW
         5T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105584; x=1694710384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA5jwmfCSlNH83mfRCiNqnTglrB8xLWvA9YsruFheoo=;
        b=jqZjqaYppQ6KoNfe+WEIRFSpp+f0Ti9eZwcdc/RkIgbq2BSTaNbNdbCe9qI+bV1r4s
         K6e4S6XTWbFbv41nCp1DtQZtLkOwTNs669g1Jls8LpWWMlxacfKLCzvh5PEUpnGoLpVE
         UQyjBZ5vTKn7TDvH+tvBZtaENfSvVejWOOvAsCOca0+qLcsqBtBWSuzYWws9KKTwUDmA
         3LXotFS8YDxxkzhByaer8K/x47o/LtRvLIE89II9/fOG2Wg/up43JoxnCFI/BizQ0xbB
         lyNRYbwDh/FL3MHMIPPhOQPHecca+ZvBUn9fkToFOA3vETIdHbYxaMRCOCKipZgTdnwn
         FHUA==
X-Gm-Message-State: AOJu0YxeBJ5awO+I7RQVn19mUyro5ApeqjAoo+qjUoc4rt3OunprzFKy
        0Vi066RfbXcF9QRUWt+w/EX+CCq9wb40TrC0zkk=
X-Google-Smtp-Source: AGHT+IFroVO8G3mbET4JOoWsuUdk2z+EQkzfg9MqOG6q51gWHzzSYhkYXfwGQSn9ILQzuo7RsAP0eA==
X-Received: by 2002:a5d:4204:0:b0:31a:d2b2:f28f with SMTP id n4-20020a5d4204000000b0031ad2b2f28fmr4918993wrq.51.1694105075012;
        Thu, 07 Sep 2023 09:44:35 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:34 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/17] media: qcom: camss: Move vfe_disable into a common routine where applicable
Date:   Thu,  7 Sep 2023 17:44:08 +0100
Message-ID: <20230907164410.36651-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We can move vfe_disable() into a common routine in the core VFE file
provided we make wm_stop() a VFE specific callback.

The callback is required to capture the case where VFE 17x currently isn't
VC enabled where as VFE 480 is.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-vfe-170.c | 40 +-----------------
 .../media/platform/qcom/camss/camss-vfe-480.c | 40 +-----------------
 drivers/media/platform/qcom/camss/camss-vfe.c | 42 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h |  9 ++++
 4 files changed, 53 insertions(+), 78 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index a5aa799501861..0b211fed12760 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -494,22 +494,6 @@ static int vfe_enable_output(struct vfe_line *line)
 	return 0;
 }
 
-static void vfe_disable_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
-	unsigned long flags;
-	unsigned int i;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-	for (i = 0; i < output->wm_num; i++)
-		vfe_wm_stop(vfe, output->wm_idx[i]);
-	output->gen2.active_num = 0;
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	vfe_reset(vfe);
-}
-
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
@@ -555,29 +539,6 @@ static int vfe_enable(struct vfe_line *line)
 	return ret;
 }
 
-/*
- * vfe_disable - Disable streaming on VFE line
- * @line: VFE line
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_disable(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-
-	vfe_disable_output(line);
-
-	vfe_put_output(line);
-
-	mutex_lock(&vfe->stream_lock);
-
-	vfe->stream_count--;
-
-	mutex_unlock(&vfe->stream_lock);
-
-	return 0;
-}
-
 /*
  * vfe_isr_sof - Process start of frame interrupt
  * @vfe: VFE Device
@@ -770,4 +731,5 @@ const struct vfe_hw_ops vfe_ops_170 = {
 	.vfe_enable = vfe_enable,
 	.vfe_halt = vfe_halt,
 	.violation_read = vfe_violation_read,
+	.vfe_wm_stop = vfe_wm_stop,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 43a2964121f22..f2368b77fc6d6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -327,22 +327,6 @@ static int vfe_enable_output(struct vfe_line *line)
 	return 0;
 }
 
-static void vfe_disable_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
-	unsigned long flags;
-	unsigned int i;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-	for (i = 0; i < output->wm_num; i++)
-		vfe_wm_stop(vfe, output->wm_idx[i]);
-	output->gen2.active_num = 0;
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	vfe_reset(vfe);
-}
-
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
@@ -390,29 +374,6 @@ static int vfe_enable(struct vfe_line *line)
 	return ret;
 }
 
-/*
- * vfe_disable - Disable streaming on VFE line
- * @line: VFE line
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_disable(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-
-	vfe_disable_output(line);
-
-	vfe_put_output(line);
-
-	mutex_lock(&vfe->stream_lock);
-
-	vfe->stream_count--;
-
-	mutex_unlock(&vfe->stream_lock);
-
-	return 0;
-}
-
 /*
  * vfe_isr_reg_update - Process reg update interrupt
  * @vfe: VFE Device
@@ -581,4 +542,5 @@ const struct vfe_hw_ops vfe_ops_480 = {
 	.vfe_disable = vfe_disable,
 	.vfe_enable = vfe_enable,
 	.vfe_halt = vfe_halt,
+	.vfe_wm_stop = vfe_wm_stop,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f3cf387e4907e..26817f9ca4f1a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -410,6 +410,48 @@ int vfe_put_output(struct vfe_line *line)
 	return 0;
 }
 
+static int vfe_disable_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output = &line->output;
+	unsigned long flags;
+	unsigned int i;
+	int ret;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+	for (i = 0; i < output->wm_num; i++)
+		vfe->ops->vfe_wm_stop(vfe, output->wm_idx[i]);
+	output->gen2.active_num = 0;
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	ret = vfe_reset(vfe);
+
+	return ret;
+}
+
+/*
+ * vfe_disable - Disable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_disable(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+
+	vfe_disable_output(line);
+
+	vfe_put_output(line);
+
+	mutex_lock(&vfe->stream_lock);
+
+	vfe->stream_count--;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	return 0;
+}
+
 /**
  * vfe_isr_comp_done() - Process composite image done interrupt
  * @vfe: VFE Device
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 4783afa73a365..09baded0dcdd6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -114,6 +114,7 @@ struct vfe_hw_ops {
 	int (*vfe_enable)(struct vfe_line *line);
 	int (*vfe_halt)(struct vfe_device *vfe);
 	void (*violation_read)(struct vfe_device *vfe);
+	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
 };
 
 struct vfe_isr_ops {
@@ -192,6 +193,14 @@ int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id);
  */
 int vfe_reset(struct vfe_device *vfe);
 
+/*
+ * vfe_disable - Disable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_disable(struct vfe_line *line);
+
 extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
-- 
2.41.0

