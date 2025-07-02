Return-Path: <linux-media+bounces-36605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E3AF5C83
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88E161C45086
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722203093D4;
	Wed,  2 Jul 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dKkqt25J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4035F27A12F
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469325; cv=none; b=hyu2EGywhDxFminikPzV0Ni5g0i3tWxKin/wb8iYaO63xz2XhJrEyTzTgGWd9sNQAebcJoyvDLH08IGNArJ7hByWnPPGWCZ5b6x0b4JJ33tK2CjmoLuGPAu2tgPBrXdzNBLdEsVpBWwMH6zlmGzYN54UD2SZWj9c+DXdlRF36eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469325; c=relaxed/simple;
	bh=5ils8X8rWXor21Om4G8EhDArChARho40CAL6Ox0iifI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKsqgXCkVBcQEI53EX0c+Uq8i/qLqJ6jaFowKR5Ou9hnUNMK0UfJdmcP34WEQmBnQhhsP/OE/lIsY28HjmfLGlLhlkGqF1goIfekgmd+JIC5xaRoTToh+7CZVGLq0Rh8A0UQfMM3pmX1nFddCY8wTMyJXAS5nq9Vc3iOBkWppbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dKkqt25J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3C131A04;
	Wed,  2 Jul 2025 17:14:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751469299;
	bh=5ils8X8rWXor21Om4G8EhDArChARho40CAL6Ox0iifI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dKkqt25JqXuEUl0xqgHQVGsORdxlVfDvssbrQvMVHNUYenb+vXd1yzK0pvr8d9VZv
	 bJoI3foOk7HLQ5YSakRmV73BD8r76KZfatn025dgYOcGpvhfcmP4EOfAucyt6NCgwc
	 ernlmbHkPPStNQ5oZwUpszBvaLD19RmQ2IfXvCLo=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 02 Jul 2025 16:15:02 +0100
Subject: [PATCH 1/4] media: mc: entity: Move media pipeline entity
 iteration functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pipelines-v1-1-34525973e773@ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
In-Reply-To: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3528;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=5ils8X8rWXor21Om4G8EhDArChARho40CAL6Ox0iifI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZU0IPNMycJrJf/gnkNchWMdhu+NI73HpMjB/m
 8jXvHQn/uaJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGVNCAAKCRDISVd6bEV1
 Mj8hD/4/zXJWMHV0Wc/gg8CfuLVfU3v2gbAcVaDieZhAC++EKUJYqrLl8zowmnCBMVAkF0TS24s
 YBjpBrcfA2U8Z269FrihepfJxLMQ0kMin+ojFjk2DTwbGeSEfjMlt8iXMiJL2UeQfIOSQIwA7tL
 9I1r4E2aluZfn1A3/iweR4PMeTGqLWRtiOvpBPpw2P2dan90CJ9XEM9WeZiw5vFaxoB5GuRZ7xe
 b3vo4RTjOqroGbuwy5AOH1/oW8qk9sByYsFdOhK4h/l/XQJ/xCuEcIOtUKlsp4Zp1DptstWg24x
 F63EpeC5uRJv//OAkrJSnVtGfgj+Hv50UTcSTolMjJeOsxtHpyXH7RMFf2MV+fDUF6W6Y4JsKE6
 /or0qZiJh7hb7Y1vAn7HKupTPm+trVgIGWVDkcW8+M9DlSaoTWGeH8TRr8rKqn0KgDupf8teqmu
 RUapUlwDs0QYi45baPVxkVIuU148Yv69DYQaDf2sKA2I0pgccqQwKr3Hbujih1w3uGQ5ZGOkZyi
 6GqRNjuVlRM9RnhH7g4YCsOVeFNRY3hapHCv0ABO0r4AWi7pOeu3pGdVND1N58eEYmh7KH83zBO
 K8uD5X6cgkQnPtjhTSvYEDxX8dEalsoE9v6NPFOVCRK2VgIuA/EmgAZ2yLSrr/umsse7upRvd4y
 wXLOa1phfi4vJFA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Move the media pipeline entity iteration functions higher in the
file so that they can be used by more of the functions within it.
No functional change is intended with this commit.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

---

Although there's no functional change here I thought it would make it
easier to review if the re-ordering and the actual changes to these
functions were committed seperately.
---
 drivers/media/mc/mc-entity.c | 74 ++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582054c46656e20463271b1f93fa6b4..eef2fd4b73a11eba143243c964852cd494422204 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -704,6 +704,43 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 	return 0;
 }
 
+int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
+				    struct media_pipeline_entity_iter *iter)
+{
+	return media_entity_enum_init(&iter->ent_enum, pipe->mdev);
+}
+EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_init);
+
+void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter)
+{
+	media_entity_enum_cleanup(&iter->ent_enum);
+}
+EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_cleanup);
+
+struct media_entity *
+__media_pipeline_entity_iter_next(struct media_pipeline *pipe,
+				  struct media_pipeline_entity_iter *iter,
+				  struct media_entity *entity)
+{
+	if (!entity)
+		iter->cursor = pipe->pads.next;
+
+	while (iter->cursor != &pipe->pads) {
+		struct media_pipeline_pad *ppad;
+		struct media_entity *entity;
+
+		ppad = list_entry(iter->cursor, struct media_pipeline_pad, list);
+		entity = ppad->pad->entity;
+		iter->cursor = iter->cursor->next;
+
+		if (!media_entity_enum_test_and_set(&iter->ent_enum, entity))
+			return entity;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
+
 static void media_pipeline_cleanup(struct media_pipeline *pipe)
 {
 	while (!list_empty(&pipe->pads)) {
@@ -1016,43 +1053,6 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
 
-int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
-				    struct media_pipeline_entity_iter *iter)
-{
-	return media_entity_enum_init(&iter->ent_enum, pipe->mdev);
-}
-EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_init);
-
-void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter)
-{
-	media_entity_enum_cleanup(&iter->ent_enum);
-}
-EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_cleanup);
-
-struct media_entity *
-__media_pipeline_entity_iter_next(struct media_pipeline *pipe,
-				  struct media_pipeline_entity_iter *iter,
-				  struct media_entity *entity)
-{
-	if (!entity)
-		iter->cursor = pipe->pads.next;
-
-	while (iter->cursor != &pipe->pads) {
-		struct media_pipeline_pad *ppad;
-		struct media_entity *entity;
-
-		ppad = list_entry(iter->cursor, struct media_pipeline_pad, list);
-		entity = ppad->pad->entity;
-		iter->cursor = iter->cursor->next;
-
-		if (!media_entity_enum_test_and_set(&iter->ent_enum, entity))
-			return entity;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
-
 /* -----------------------------------------------------------------------------
  * Links management
  */

-- 
2.34.1


