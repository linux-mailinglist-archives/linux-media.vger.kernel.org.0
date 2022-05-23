Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4A2531086
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 15:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbiEWMZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 08:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235362AbiEWMZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 08:25:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9ADB1D5
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 05:25:21 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 1so3642505ljh.8
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahnev43yZCQb1bY5tOnPA6ILBF0xBY+QOg+eSjRkkjY=;
        b=LK/WBUlsWW9/MC8bx8fVQeL9Aaw5xk2vLdNiXWOcTEcVuPpzYpwUbPIz+Mqtre68WY
         wK+OLlbXSRsb/DrF/ZgCS/+y70Kj/uM6bQ/ste9Xq3VkJ3CIawzAcyhGN9nzfUajQmQe
         OTCNVMK5tq4PW0gM8Wqt7h2HlR8FAi6K030VgseeCLs8ki9ZN+5rLtpzrUwFSRCJ9fur
         cd7pPwKErIPmolJ6EZ/fagWFbzwQIDjKYknzw9Eajj7LqshnWb+sxN8Vx3oKbN1tD6V8
         DOUce1bwWIDUvnpAXi0J2SY5CmEpfC2oTNUWI4M3BCP03fUvhkmbFYUsC2tpL3sp+D/0
         Yo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahnev43yZCQb1bY5tOnPA6ILBF0xBY+QOg+eSjRkkjY=;
        b=TO2S4up1eF6pZ/d5QKHbGanahKYjforp/0/pUCuQxRMuk5OFYaqEp54SSxEuLrDHMn
         hjWqzdpGsTffxkdOxeD245R1cGFYW1MW3Q3CI1GPQrMnC2Gv61q1L2VyIsYMUu9OkLgE
         fSBYPZGeIoetg4Bq68iNGDn7DNHHfDgZga32rUYxqLjyGnMSwbDU53amd+c3vEbpblhG
         VlobuV1gcppP1g04KxyaU2Uvp6t5BmO86G5we7e+U+U4Uzy5BUmgAuJ9Q5F6P+S1mQD4
         WAqBZGGMASkN9XtL8K4uXx93ZWorUf/qxc5cd4zE1J3Pd51FJ/vkJAUnKP5Mr2no+Nxm
         Y5RA==
X-Gm-Message-State: AOAM530dhz5nWmiQi5pEc9E37HMosrNgUxEdyBlkPbY3+WT/Kwrkp++P
        EH20OCqCNGR//TsXKmb8ty58cw==
X-Google-Smtp-Source: ABdhPJz5R5RraWQ1DuphyRyHH0plo1kz6kbqjCzZJZMcv8RI1sHnOIHeWoQ7JwA2ZOfZeFsTOe1feA==
X-Received: by 2002:a2e:8eda:0:b0:253:ebe2:393b with SMTP id e26-20020a2e8eda000000b00253ebe2393bmr2690447ljl.384.1653308719383;
        Mon, 23 May 2022 05:25:19 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id y27-20020ac255bb000000b0047255d21132sm1953179lfg.97.2022.05.23.05.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 05:25:18 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: camss: Move and unexport functions specific to ISPIF
Date:   Mon, 23 May 2022 15:25:13 +0300
Message-Id: <20220523122513.2064305-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Common exported functions msm_vfe_get_vfe_id() and msm_vfe_get_vfe_line_id()
do not have any users outside of camss-ispif.c, move them to the latter
object and staticize.

The change is supposed to be a non-functional one.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-ispif.c   | 39 ++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.c | 34 ----------------
 drivers/media/platform/qcom/camss/camss-vfe.h |  3 --
 3 files changed, 37 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 4ee11bb979cd..91e6a2b9ac50 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1252,6 +1252,41 @@ static enum ispif_intf ispif_get_intf(enum vfe_line_id line_id)
 	}
 }
 
+/*
+ * ispif_get_vfe_id - Get VFE HW module id
+ * @entity: Pointer to VFE media entity structure
+ * @id: Return CSID HW module id here
+ */
+static void ispif_get_vfe_id(struct media_entity *entity, u8 *id)
+{
+	struct v4l2_subdev *sd;
+	struct vfe_line *line;
+	struct vfe_device *vfe;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	line = v4l2_get_subdevdata(sd);
+	vfe = to_vfe(line);
+
+	*id = vfe->id;
+}
+
+/*
+ * ispif_get_vfe_line_id - Get VFE line id by media entity
+ * @entity: Pointer to VFE media entity structure
+ * @id: Return VFE line id here
+ */
+static void ispif_get_vfe_line_id(struct media_entity *entity,
+				  enum vfe_line_id *id)
+{
+	struct v4l2_subdev *sd;
+	struct vfe_line *line;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	line = v4l2_get_subdevdata(sd);
+
+	*id = line->id;
+}
+
 /*
  * ispif_link_setup - Setup ISPIF connections
  * @entity: Pointer to media entity structure
@@ -1285,8 +1320,8 @@ static int ispif_link_setup(struct media_entity *entity,
 			sd = media_entity_to_v4l2_subdev(entity);
 			line = v4l2_get_subdevdata(sd);
 
-			msm_vfe_get_vfe_id(remote->entity, &line->vfe_id);
-			msm_vfe_get_vfe_line_id(remote->entity, &id);
+			ispif_get_vfe_id(remote->entity, &line->vfe_id);
+			ispif_get_vfe_line_id(remote->entity, &id);
 			line->interface = ispif_get_intf(id);
 		}
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5b148e9f8134..76e28b832568 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1422,40 +1422,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	return 0;
 }
 
-/*
- * msm_vfe_get_vfe_id - Get VFE HW module id
- * @entity: Pointer to VFE media entity structure
- * @id: Return CSID HW module id here
- */
-void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id)
-{
-	struct v4l2_subdev *sd;
-	struct vfe_line *line;
-	struct vfe_device *vfe;
-
-	sd = media_entity_to_v4l2_subdev(entity);
-	line = v4l2_get_subdevdata(sd);
-	vfe = to_vfe(line);
-
-	*id = vfe->id;
-}
-
-/*
- * msm_vfe_get_vfe_line_id - Get VFE line id by media entity
- * @entity: Pointer to VFE media entity structure
- * @id: Return VFE line id here
- */
-void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id)
-{
-	struct v4l2_subdev *sd;
-	struct vfe_line *line;
-
-	sd = media_entity_to_v4l2_subdev(entity);
-	line = v4l2_get_subdevdata(sd);
-
-	*id = line->id;
-}
-
 /*
  * vfe_link_setup - Setup VFE connections
  * @entity: Pointer to media entity structure
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 0eba04eb9b77..cbc314c4e244 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -163,9 +163,6 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 void msm_vfe_unregister_entities(struct vfe_device *vfe);
 
-void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
-void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
-
 /*
  * vfe_buf_add_pending - Add output buffer to list of pending
  * @output: VFE output
-- 
2.33.0

