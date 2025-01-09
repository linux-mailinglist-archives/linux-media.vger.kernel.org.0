Return-Path: <linux-media+bounces-24495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365C3A07299
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7536B3A888F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34070215F63;
	Thu,  9 Jan 2025 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CaD5/c36"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC972153FA;
	Thu,  9 Jan 2025 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417780; cv=none; b=BzR8UnOhUkLekgchSb468xTbT1qy3R/Tj9SFkdW0ZfROj/GF0gMX/Potl4WTXlszFogUrvQd87e26xD95GOgkJ1SxxJ9BzK4a470DoZXEd/BVrAg17dSmRI8aZU5sRfnDHqTGlglQjBMwE2dof2c5d0V5JrRutoHPjUezdxzjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417780; c=relaxed/simple;
	bh=Mk2G48JMW8XDrPxFjJ8r+ysLaZt8+NVhobJMJ4aTroM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0Jg48MNa/m/DXhxmVWcTffMp6SRSUZcNAugq6NS72qw+DQAReAIBO3NlNqPOaflqnemRSnJbg1iESzaREWD80b8mxmo5vKzOBXISCdf/G237Q8r4IzZcoLdxrbYq9lVMJLcvCp/hqADGRiAd15pIViqEf1ur6Fzt1aiVLE4Ylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CaD5/c36; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46EF2C62;
	Thu,  9 Jan 2025 11:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736417722;
	bh=Mk2G48JMW8XDrPxFjJ8r+ysLaZt8+NVhobJMJ4aTroM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CaD5/c36z23Q1p9I2IY/WtNMjkznIz9/5oqh5eDElubq8vxoE8aelkVHF8mCx9d8m
	 eDpnjPDK0roO6HUUSm0ACxrzZiI59hXvvW8yBJ4/BaI1LKkU/QwypPysQyDiJLjC45
	 kATJJzPxl2vbta3o4Ts2Jhzsda23mSaF59UqoPSQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Jan 2025 12:15:42 +0200
Subject: [PATCH RFC 1/2] media: mc: Add INTERNAL pad flag
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-ub953-tpg-v1-1-d7392375c243@ideasonboard.com>
References: <20250109-ub953-tpg-v1-0-d7392375c243@ideasonboard.com>
In-Reply-To: <20250109-ub953-tpg-v1-0-d7392375c243@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NusHpdChYyyCk7StcVzNPVJ8GxD0If3nXN89+LAzyls=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnf6Hutu31OIfLc3e0WoOKnmYaKSi0nXbAPvbWA
 I+5cKKlsh6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ3+h7gAKCRD6PaqMvJYe
 9cIrD/9C44yr8XJTacjvJkw26GGj+pK1r1R+hGt0y2nZPuA2NtOPArE7ja45MiKI2FunDTCyf2N
 MjWIRzIa744kIWo1NaoueOmJIkNqoApQEYO8f54nTYuKYa9j8mO/78+qb4J/FlnMgmX34FgBus1
 lL1TP8oMiBGAoMBcWXkgkORADt+rKTCGp19xc05IiA167sjHuKo4icZlQHjv+UjRACOk4hjUjcI
 GiV03+U1gMegyzHpgLZIooVgkUUy659iQRq46IVVV1IDJok1FkUnUcUMkJh5FuBOr+z92TyIJlk
 hDlZ9EHQx/RUJrxslxAu6cSxm74TFDXAzhAfcAyWfl3TZC6Hzz2B2ODwPRciJ0zu4gc//g1lEZP
 M49Wc4aZnck8MUrAlritHpDqxoEIWTq5vQJFFrSl8WoeGJcAyJ5WTFHzrCGh9Bq0Tv1gABt6M7D
 1wNblCfyutp5lnjwHVXF1jZ4vkwhUJz90H7JxUuE35gp3cfnQQAzZVmw1CykhujeszFs09bNZcy
 sdi3gEPeFRnUplqlDDeWjTu/GvcqhJDI5rK+15AuzWAh8yL2xUz+pa4izdocBlzWT53o6dxLnog
 mbDR6O+LhTEwbLP4ZD3l8yt6IgFMmLYyppJrTwkXroK/4ZfvmTOIRTBFJzvo6U0YVK7FtDlZEuu
 vh7hnftJJs/dTrA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
Internal source pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/mediactl/media-types.rst |  8 ++++++++
 drivers/media/mc/mc-entity.c                               | 10 ++++++++--
 include/uapi/linux/media.h                                 |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..f55ef055bcf8 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. Such a pad shall not be connected with a link.
+
+	  The internal flag may currently be present only in a source pad where
+	  it indicates that the :ref:``stream <media-glossary-stream>``
+	  originates from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582..d1feacc60807 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		iter->index = i++;
 
 		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+					     MEDIA_PAD_FL_SOURCE)) != 1 ||
+		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
+		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1120,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1151,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..80cfd12a43fc 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */

-- 
2.43.0


