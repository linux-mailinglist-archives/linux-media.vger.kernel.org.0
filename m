Return-Path: <linux-media+bounces-23426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 673589F2198
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 01:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C69271886377
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 00:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A274437;
	Sun, 15 Dec 2024 00:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fXDycUgC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47257E1
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 00:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734222844; cv=none; b=N2rzL7g6Nq68rNPw5ZzMJycScBg9IbtUwc18TxlrV95vTBDhMJWvbQGRhN44/KQOv339ATJQn57rxGSUmyYaSqR79/QW1bF6MDw9oX+ICcHSafePuwf5tQZjGL/ZLsfYh69C0dpCppAQDFutHpgTlETfpry9M9IHJ0fEGjbs5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734222844; c=relaxed/simple;
	bh=pWQn3JV+/a88gt8ILo01+Z7GYnZjpGJjND4nuVqK04o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HUyV/Fb9RgurZQEpESzlsd9e0JLBRkncrEwZUEazrhp7XZMSyQ1n4qgVsgYb1EMKYlowq4VMtsWWscwXaKw/B7xJF59xnCfnSJkcvSuFlh9pKoFQtTGOSuNblWLxAb53vWP9OZYo4KjZiOUsmnJdSj2VkLuWJj0p/G2bcNpV+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fXDycUgC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so32349425e9.0
        for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 16:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734222841; x=1734827641; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JAPvPxiy58GCJu8OdAKmusbfiRklcnwh5LO/YJk+t9w=;
        b=fXDycUgCYtz7a/WZKH23BwZ+ND9yZNH0z+d8ym/afYaojkMfyVJ2jxT/kn4KgS0jor
         o6QI1f5gLhaiRptGfX9TkJW61SyuN/L7jEobXkWKasGtkt1jcCtD2Rzdv9rLT+vKyNK2
         IChr/xjU7msROls+K4ExaTeRWTW1eOdHKxIq2E5eBFGVxRl+jVfK5SyW9S66uFLoheAp
         Ocvw8rmx8CUt8bOsH4mKXDthtE+3S0Q20dbDLhy/7lfN1ju0GW5vKqPbFz7FYZske8WS
         mMXopA6D12uuQqFQqaDoRnNanebPB6sTo75SHAgrKsZoIEf0uEHKdql34lXZOlbDYbV+
         CxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734222841; x=1734827641;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAPvPxiy58GCJu8OdAKmusbfiRklcnwh5LO/YJk+t9w=;
        b=c+XM8WkdGFRKLYDwfVQ8AH6Z3lc6Kf3BB8Pz3qXhOo9G9pQjEMANg8PVUeUEasV3w7
         fg7PgRKv01bvrI8JUT47Ne6IaExE3AGkgba9d3q/yUje6URluBzM5j/W6cvEmtFBkKeY
         j8hQl76nQT3v/F5TQvh9QyBjLi1v137EWZMQL7Qf692J64/pLb8EJrcALjZKEbz+3pQ6
         cWV1htNPzXe0+q1sXKkHUOvDpcPQRZcsV3bE9JfKjiqZaqrsO6eonI9JuMQrEn187fvU
         GqLwS/dfCZqfx41rNL4o2BTgxVfDWGjdB49uUnZeQNgQLojGlF0mMpRaYYlevu0LRjFw
         6JVw==
X-Gm-Message-State: AOJu0YzaMJQujDUztyk1SGm401y87nQ+Zmolf/l8WJMAw8OM2FsdLucy
	Ww+t4dGejjhTmGPjHqSm+V/1ROZez6q+PFDZ8GClEcvb2hPbEhslcfa72jDBWJ0=
X-Gm-Gg: ASbGncsnzx/4uVf6qStuhTndIGWOEzA3drYn82cyeGgD36uo0DBH6KzSwj5pVmW3/5X
	gdZ80I2Gkuncu7SgjFiCtS0bWb9EE0kfdJ3oXq888od901B2tNb+mFxuYDMIT/XRLXm287M3qWH
	mAAmFb+DuHXXrsyf4/d81L0LjfTKdPcoUsK/JCzago57EZDBO1ee6/rp/GVQCKFnwd93nGxQ1hP
	TbcFUNTR9X8SkUlFwOlm0zjnnh887MljWfZ0K1oUKpyS/ZFYlPp7BDF82qByFErIg==
X-Google-Smtp-Source: AGHT+IGJWQ+cT8kcvTA+plzjPlFZBzh252TYfMJKFBanLQAiwOK+dFP4ErkBxInK+AZXxU7scor2OQ==
X-Received: by 2002:a05:600c:b95:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-4362aa3d1d2mr59250775e9.19.1734222841049;
        Sat, 14 Dec 2024 16:34:01 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363606404fsm38540095e9.20.2024.12.14.16.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 16:33:59 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 15 Dec 2024 00:33:58 +0000
Subject: [PATCH v2] Revert "media: qcom: camss: Restructure
 camss_link_entities"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-b4-linux-next-revert-link-freq-v2-1-62d5660004ea@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPUjXmcC/42NQQ6CMBBFr0Jm7Zi2lhBdeQ/DAugUJppWpkgwh
 LtbOIHL937+/yskEqYEt2IFoZkTx5DBnArohib0hOwyg1HGaqMtthZfHD4LBlomzBWSaTdP9EI
 jVrZpS298dVEG8shbyPNyHDzqzAOnKcr3+Jv1bv+enjVqLOlaKadK5zt3z1kj8Rylh3rbth8KD
 0aGzQAAAA==
X-Change-ID: 20241214-b4-linux-next-revert-link-freq-74ab5f2f7302
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

This reverts commit cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e.

This commit has a basic flaw in that it relies on camss->res->csid_num as a
control to index the array camss->vfe[i].

Testing on a platform where csid_num > vfe_num showed this bug up.

camss->vfe should only be indexed by camss->res->vfe_num. Since this commit
is meant to make the code be more readable reverting will simply restore
the previous correct bounds checking.

We can make another pass at making camss_link_entities look prettier but,
for now we should zap the bug introduced.

Fixes: cc1ecabe67d9 ("media: qcom: camss: Restructure camss_link_entities")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
v2:
- My SoB was under the --- fixed
- Leaving out cc stable because this is reverting a commit in next not
  stable.
- Link to v1: https://lore.kernel.org/r/20241214-b4-linux-next-revert-link-freq-v1-1-5e970d05dfcd@linaro.org

v1:
Testing this commit out as I was adding in more CSID devices to my working
x1e tree I noticed a NULL pointer dereference in camss_link_entities.

Investigating I discovered the following indexing error:

> +    for (i = 0; i < camss->res->csid_num; i++) {
> +        if (camss->ispif)
> +            line_num = camss->ispif->line_num;
> +        else
> +            line_num = camss->vfe[i].res->line_num;

This statement is incorrect, you are indexing vfe[] with a control derived
from csid_num.

Below is the statement removed.

> -        for (i = 0; i < camss->res->csid_num; i++)
> -            for (k = 0; k < camss->res->vfe_num; k++)
> -                for (j = 0; j < camss->vfe[k].res->line_num; j++) {

As soon as csid_num > ARRAY_SIZE(vfe) the code breaks.

The commit is in linux-next but not yet in linux-stable so I'm not quite
sure what to do with a Fixes: tag nothing I think.

In any case we should revert this one before it hits stable.

Link: https://lore.kernel.org/linux-arm-msm/1a570c17-c501-4a29-a4f7-020f41563f3d@linaro.org
---
 drivers/media/platform/qcom/camss/camss.c | 155 ++++++++++--------------------
 1 file changed, 52 insertions(+), 103 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 004a74f6b2f6ce7eef15765ad1eadc14a08a3908..a85e9df0f301a933d7e47e07b9fec535819aeb14 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2298,6 +2298,7 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
+ * camss_link_entities - Register subdev nodes and create links
  * camss_link_err - print error in case link creation fails
  * @src_name: name for source of the link
  * @sink_name: name for sink of the link
@@ -2315,64 +2316,14 @@ inline void camss_link_err(struct camss *camss,
 }
 
 /*
- * camss_link_entities_csid - Register subdev nodes and create links
- * @camss: CAMSS device
- *
- * Return 0 on success or a negative error code on failure
- */
-static int camss_link_entities_csid(struct camss *camss)
-{
-	struct media_entity *src_entity;
-	struct media_entity *sink_entity;
-	int ret, line_num;
-	u16 sink_pad;
-	u16 src_pad;
-	int i, j;
-
-	for (i = 0; i < camss->res->csid_num; i++) {
-		if (camss->ispif)
-			line_num = camss->ispif->line_num;
-		else
-			line_num = camss->vfe[i].res->line_num;
-
-		src_entity = &camss->csid[i].subdev.entity;
-		for (j = 0; j < line_num; j++) {
-			if (camss->ispif) {
-				sink_entity = &camss->ispif->line[j].subdev.entity;
-				src_pad = MSM_CSID_PAD_SRC;
-				sink_pad = MSM_ISPIF_PAD_SINK;
-			} else {
-				sink_entity = &camss->vfe[i].line[j].subdev.entity;
-				src_pad = MSM_CSID_PAD_FIRST_SRC + j;
-				sink_pad = MSM_VFE_PAD_SINK;
-			}
-
-			ret = media_create_pad_link(src_entity,
-						    src_pad,
-						    sink_entity,
-						    sink_pad,
-						    0);
-			if (ret < 0) {
-				camss_link_err(camss, src_entity->name,
-					       sink_entity->name,
-					       ret);
-				return ret;
-			}
-		}
-	}
-
-	return 0;
-}
-
-/*
- * camss_link_entities_csiphy - Register subdev nodes and create links
+ * camss_link_entities - Register subdev nodes and create links
  * @camss: CAMSS device
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_link_entities_csiphy(struct camss *camss)
+static int camss_link_entities(struct camss *camss)
 {
-	int i, j;
+	int i, j, k;
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
@@ -2392,68 +2343,66 @@ static int camss_link_entities_csiphy(struct camss *camss)
 		}
 	}
 
-	return 0;
-}
-
-/*
- * camss_link_entities_ispif - Register subdev nodes and create links
- * @camss: CAMSS device
- *
- * Return 0 on success or a negative error code on failure
- */
-static int camss_link_entities_ispif(struct camss *camss)
-{
-	int i, j, k;
-	int ret;
-
-	for (i = 0; i < camss->ispif->line_num; i++) {
-		for (k = 0; k < camss->res->vfe_num; k++) {
-			for (j = 0; j < camss->vfe[k].res->line_num; j++) {
-				struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
-				struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
-
-				ret = media_create_pad_link(&ispif->entity,
-							    MSM_ISPIF_PAD_SRC,
-							    &vfe->entity,
-							    MSM_VFE_PAD_SINK,
+	if (camss->ispif) {
+		for (i = 0; i < camss->res->csid_num; i++) {
+			for (j = 0; j < camss->ispif->line_num; j++) {
+				ret = media_create_pad_link(&camss->csid[i].subdev.entity,
+							    MSM_CSID_PAD_SRC,
+							    &camss->ispif->line[j].subdev.entity,
+							    MSM_ISPIF_PAD_SINK,
 							    0);
 				if (ret < 0) {
-					camss_link_err(camss, ispif->entity.name,
-						       vfe->entity.name,
+					camss_link_err(camss,
+						       camss->csid[i].subdev.entity.name,
+						       camss->ispif->line[j].subdev.entity.name,
 						       ret);
 					return ret;
 				}
 			}
 		}
+
+		for (i = 0; i < camss->ispif->line_num; i++)
+			for (k = 0; k < camss->res->vfe_num; k++)
+				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
+					struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
+					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
+
+					ret = media_create_pad_link(&ispif->entity,
+								    MSM_ISPIF_PAD_SRC,
+								    &vfe->entity,
+								    MSM_VFE_PAD_SINK,
+								    0);
+					if (ret < 0) {
+						camss_link_err(camss, ispif->entity.name,
+							       vfe->entity.name,
+							       ret);
+						return ret;
+					}
+				}
+	} else {
+		for (i = 0; i < camss->res->csid_num; i++)
+			for (k = 0; k < camss->res->vfe_num; k++)
+				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
+					struct v4l2_subdev *csid = &camss->csid[i].subdev;
+					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
+
+					ret = media_create_pad_link(&csid->entity,
+								    MSM_CSID_PAD_FIRST_SRC + j,
+								    &vfe->entity,
+								    MSM_VFE_PAD_SINK,
+								    0);
+					if (ret < 0) {
+						camss_link_err(camss, csid->entity.name,
+							       vfe->entity.name,
+							       ret);
+						return ret;
+					}
+				}
 	}
 
 	return 0;
 }
 
-/*
- * camss_link_entities - Register subdev nodes and create links
- * @camss: CAMSS device
- *
- * Return 0 on success or a negative error code on failure
- */
-static int camss_link_entities(struct camss *camss)
-{
-	int ret;
-
-	ret = camss_link_entities_csiphy(camss);
-	if (ret < 0)
-		return ret;
-
-	ret = camss_link_entities_csid(camss);
-	if (ret < 0)
-		return ret;
-
-	if (camss->ispif)
-		ret = camss_link_entities_ispif(camss);
-
-	return ret;
-}
-
 /*
  * camss_register_entities - Register subdev nodes and create links
  * @camss: CAMSS device

---
base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
change-id: 20241214-b4-linux-next-revert-link-freq-74ab5f2f7302

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


