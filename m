Return-Path: <linux-media+bounces-10094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C2A8B1785
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A511C21F14
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBD616F835;
	Wed, 24 Apr 2024 23:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cJiZCebQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF74816F292
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003077; cv=none; b=Z/gZMC7KGhitA2f+6aJ7aQDQsTXnw/7I6PbjblfBgkV6FGuVcaVLI1uyZyw6pekjcQOVYYjefTNDbfof94GOKg3vMHnMw8jXjKeHrB2A2wdEg4IGRq1o8nCv7RLjaiIpu9QV4tv0Yhztw4+LN4l9iluoKb6D9ts5EHt5JsseAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003077; c=relaxed/simple;
	bh=fVMTT10sqrBGCEoEQ8HFX71p/79ckrEQukn6p4V2Eo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCe1t4hhLe2neMfUGOnzCk55x4abU7QyjQGHk4lUAB439ZDmSNybcFt51Y3VmaM3XDfiuxJ97PERx31HE6xIQ2gqsvxrYCqWDODwR/WICebeto96kvbQpmwAUNwp5uaObdF9zM5rWyqCtA3UTZosDMIW+DXWPFrmvEroJYFbX/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cJiZCebQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3194966B;
	Thu, 25 Apr 2024 01:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003020;
	bh=fVMTT10sqrBGCEoEQ8HFX71p/79ckrEQukn6p4V2Eo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cJiZCebQUW6xzw3n/yWwEF+r+s17rGfAVI5v91gAUHSHlUxzUne7dgsJet7P73AJd
	 GknSafh3xIJa1swenivOAk5vT+YWj+D9Ujhz1n50egJe76qH3Z2bDc7EkCbtw8rR3V
	 n0R97WTIgP/QKuIGCgejNgOwXk9Zsi9cjPmP3QuQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 2/9] media: vimc: Constify vimc_ent_type structures
Date: Thu, 25 Apr 2024 02:57:34 +0300
Message-ID: <20240424235741.17093-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vimc_ent_type structure contains static pointers to functions, and
no other information that need to be modified after initialization. Make
them const to avoid the risk of arbitrary code execution following an
overflow that would overwrite the structure's contents.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-capture.c |  2 +-
 drivers/media/test-drivers/vimc/vimc-common.h  | 12 ++++++------
 drivers/media/test-drivers/vimc/vimc-debayer.c |  2 +-
 drivers/media/test-drivers/vimc/vimc-lens.c    |  2 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c  |  2 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c  |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index ba7550b8ba7e..89506ae00901 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -494,7 +494,7 @@ static struct vimc_ent_device *vimc_capture_add(struct vimc_device *vimc,
 	return ERR_PTR(ret);
 }
 
-struct vimc_ent_type vimc_capture_type = {
+const struct vimc_ent_type vimc_capture_type = {
 	.add = vimc_capture_add,
 	.unregister = vimc_capture_unregister,
 	.release = vimc_capture_release
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 7641a101a728..6a76717e0384 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -156,7 +156,7 @@ struct vimc_ent_type {
  */
 struct vimc_ent_config {
 	const char *name;
-	struct vimc_ent_type *type;
+	const struct vimc_ent_type *type;
 };
 
 /**
@@ -167,11 +167,11 @@ struct vimc_ent_config {
  */
 bool vimc_is_source(struct media_entity *ent);
 
-extern struct vimc_ent_type vimc_sensor_type;
-extern struct vimc_ent_type vimc_debayer_type;
-extern struct vimc_ent_type vimc_scaler_type;
-extern struct vimc_ent_type vimc_capture_type;
-extern struct vimc_ent_type vimc_lens_type;
+extern const struct vimc_ent_type vimc_sensor_type;
+extern const struct vimc_ent_type vimc_debayer_type;
+extern const struct vimc_ent_type vimc_scaler_type;
+extern const struct vimc_ent_type vimc_capture_type;
+extern const struct vimc_ent_type vimc_lens_type;
 
 /**
  * vimc_pix_map_by_index - get vimc_pix_map struct by its index
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index e1bf6db73050..e2f12a7fb58f 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -622,7 +622,7 @@ static struct vimc_ent_device *vimc_debayer_add(struct vimc_device *vimc,
 	return ERR_PTR(ret);
 }
 
-struct vimc_ent_type vimc_debayer_type = {
+const struct vimc_ent_type vimc_debayer_type = {
 	.add = vimc_debayer_add,
 	.release = vimc_debayer_release
 };
diff --git a/drivers/media/test-drivers/vimc/vimc-lens.c b/drivers/media/test-drivers/vimc/vimc-lens.c
index 3ce7f4b4d2cc..e7d78fa8ccdb 100644
--- a/drivers/media/test-drivers/vimc/vimc-lens.c
+++ b/drivers/media/test-drivers/vimc/vimc-lens.c
@@ -96,7 +96,7 @@ static void vimc_lens_release(struct vimc_ent_device *ved)
 	kfree(vlens);
 }
 
-struct vimc_ent_type vimc_lens_type = {
+const struct vimc_ent_type vimc_lens_type = {
 	.add = vimc_lens_add,
 	.release = vimc_lens_release
 };
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index afe13d6af321..3e32cfb79c64 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -442,7 +442,7 @@ static struct vimc_ent_device *vimc_scaler_add(struct vimc_device *vimc,
 	return &vscaler->ved;
 }
 
-struct vimc_ent_type vimc_scaler_type = {
+const struct vimc_ent_type vimc_scaler_type = {
 	.add = vimc_scaler_add,
 	.release = vimc_scaler_release
 };
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index b535b3ffecff..11df18332865 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -448,7 +448,7 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
 	return ERR_PTR(ret);
 }
 
-struct vimc_ent_type vimc_sensor_type = {
+const struct vimc_ent_type vimc_sensor_type = {
 	.add = vimc_sensor_add,
 	.release = vimc_sensor_release
 };
-- 
Regards,

Laurent Pinchart


