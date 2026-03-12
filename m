Return-Path: <linux-media+bounces-55493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EiKC/avsmlGOwAAu9opvQ
	(envelope-from <linux-media+bounces-55493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:22:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA832719F3
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44DCA31FFEFF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 12:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB89239562;
	Thu, 12 Mar 2026 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="odxyUs6L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F092BE057;
	Thu, 12 Mar 2026 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317769; cv=none; b=G8XgigTAVkVAt4VBEeJd0a9tETX1nemMQTNubQWKSKdtRsJXE6P4FVLdrxasGISI8Yzu/M8g4+jBwOdXgJEF7UGk5P+67saU/hh/1a6URNG08oYx8Zy2a476IUuedtH6U8T4jaYfZsihyh/SrfcI8h2HngzT/NqMI6zB8MaSkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317769; c=relaxed/simple;
	bh=8sN9QwGz77K3Y0zsOpXU7uArFmzQe2gheap8pVeEnU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3QiTg1DjPWTP/pmrkzcT8k1clzXzSXkD68YzyNoj5PFSwgANOfkoTJkuTEP/VsNqLjobQwO+k2c1Pe4rO+Gr7jJFBmY4086GgEEOrduV3yqaVt+rCPL+HQCRwQP43qLTz/myrvf74FBPC+oG9XvdYS4pOXhZ9pzfapiLy9KNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=odxyUs6L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0964F11FA;
	Thu, 12 Mar 2026 13:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773317690;
	bh=8sN9QwGz77K3Y0zsOpXU7uArFmzQe2gheap8pVeEnU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=odxyUs6L+xgk+IaaGWrGDzqUDCRLDqBW0ZN26av/0fG6RnBfjKS6vTRyoK94EyHkt
	 bo0bBwAvCtYJTtKoTYu3gi3l2Q3UbYrBr5mizHvqrqF+kxX4AG3PbXdJE9xY3Uzeia
	 3SdSbHZiSeXgIMCgnR75pDfZnkS9JOFmnPJO4Pm0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 12 Mar 2026 14:15:29 +0200
Subject: [PATCH 2/3] media: subdev: Minor
 v4l2_subdev_get_frame_desc_passthrough() cleanups
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-frame-desc-passthrough-impro-v1-2-30f64d637a3a@ideasonboard.com>
References: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
In-Reply-To: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=8sN9QwGz77K3Y0zsOpXU7uArFmzQe2gheap8pVeEnU4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsq58qij7D+jcswBbqMiw0ooLI9SZfvsIYc2N4
 fIw7o1XVkqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabKufAAKCRD6PaqMvJYe
 9a9SD/4rX1mdvYj/M32uolVK2mGKMKEwHUELEA4mCvtFyfAeu9inFYyEiSw93IJifhFGN+lgCXp
 SW1HrTkUmEbTmbBe2sQbApRuMGepwBISCXzg0lIRH1qdbdePY6F/DkVuZsFpG3O2EBj2EmudzCT
 1HprUk9mtncikH22SyX5DVAOZLkYUkmspdbW9s0rEyuN2ZezRzgTRzH560ZuGyt2FviFOROpyth
 53h1I0B5g0stw4qTiHpjrcdB290dNIMYsfMnQXbkQQsaKJruwQVrzOjVt6e07sVzP4DOeCQNL+9
 zL1Vs49YZmfdgrXBMFt3v1pjiYqVp+A33PgQ5YMDwoaSiei73Tc4iItVodIYrqkcggKpoF2voyC
 sCC3o+HaP/ETVgIsLBmGU8/JHvw3Fn4W1cfszguOPAlN2QklZw0Lt5ABTrnGmVPayM638IC4Bjc
 +p1I+0VVkjmCUSp2dxlrL/agDGYnEFVS2yj3GdJFPvQXQLV1hNkYH4iKq4qAny2gigs1TupLdmG
 rG+vfBadw9EtbKNCn2iQjo4KzY2AISZI0zwcyKJxiEJumZ6iBTPcz3on0oIKulG4GzJdsh3jhbW
 G7W/Pf44gLYuFmm54PXqrLtzznMLIDco3rjZPmLAX5U6tAc3DSMMcX0a7e1f2NpaoX+jVqSe6OO
 g+SOzwQ1H6wuYHQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55493-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 9EA832719F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Minor code cleanups, no functional change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9efd14d4026f..2757378c628a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2549,14 +2549,13 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					   unsigned int pad,
 					   struct v4l2_mbus_frame_desc *fd)
 {
-	const struct media_pad *pads = sd->entity.pads;
 	struct media_pad *local_sink_pad;
 	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	struct device *dev = sd->dev;
 	int ret = 0;
 
-	if (WARN_ON(!(pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
+	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -2577,7 +2576,6 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 			struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 			struct media_pad *remote_source_pad;
 			struct v4l2_subdev *remote_sd;
-			unsigned int i;
 
 			if (route->source_pad != pad ||
 			    route->sink_pad != local_sink_pad->index)
@@ -2622,7 +2620,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				}
 			}
 
-			for (i = 0; i < source_fd.num_entries; i++) {
+			for (unsigned int i = 0; i < source_fd.num_entries; i++) {
 				if (source_fd.entry[i].stream == route->sink_stream) {
 					source_entry = &source_fd.entry[i];
 					break;
@@ -2630,7 +2628,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 			}
 
 			if (!source_entry) {
-				dev_dbg(sd->dev,
+				dev_dbg(dev,
 					"Failed to find stream %u from source frame desc\n",
 					route->sink_stream);
 				ret = -EPIPE;
@@ -2638,7 +2636,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 			}
 
 			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
-				dev_dbg(sd->dev, "Frame desc entry limit reached\n");
+				dev_dbg(dev, "Frame desc entry limit reached\n");
 				ret = -ENOSPC;
 				goto out_unlock;
 			}

-- 
2.43.0


