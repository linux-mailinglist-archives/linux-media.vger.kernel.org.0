Return-Path: <linux-media+bounces-66063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qCkWLkOUQ2qHcgoAu9opvQ
	(envelope-from <linux-media+bounces-66063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:02:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA56E2942
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:02:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dxA6zHrP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66063-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66063-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0746303A933
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503113E5A05;
	Tue, 30 Jun 2026 09:58:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3D317164
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:58:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813538; cv=none; b=GPJXdP0NmHB1c9JdOhN3hmzJHYSxqdUgtTNu1CdqabYTYiPNBgMNA4C7yxozszFLoX95cNj5XsCD/oHDkVyPmhIEOWjD3FIVs1+8TUikO/07BfmGii8SB6RDEEx0R8UsdKV+by3/KCbAZlIhvRg9cFLjA4KhfXH0Moy70T1ideU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813538; c=relaxed/simple;
	bh=9qQhuSHrnraxV2wEZtmQUIORoPwLsWK30FJDBQiGRhs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=td2fzo1LlklGv0uM0DcVJG2q/y3m/ZWDW5+rgFrA4DqkAJcvU5fcq6q6ahmcJG8QQZeGz/fvPDZSBzOIXkd5tQx/BKSj1Rs8N8mDyLruY/dUVnYRuT2b5U6YELgFryl8zHoM2zR+nHm17utTCWU7DnU7ss0dzk/5wwwbCoXsctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxA6zHrP; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9b19bbaefso15387525ad.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782813537; x=1783418337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AuNJ6Khls5W9ANuvEwh0h69IOEnu+WTccUiXg1wsIgI=;
        b=dxA6zHrPySouqAbUBqaKmNV2MP0xxZ9KJKxdlQ5AEXlGqkOP8eZgRYsEi+O2tLAtTH
         EbMVk48P+vC/0ViSFvjnFrEXIwc9Wr3jI4f3facFrMbnN6TfnYhIH6yoLqR5+s8x+9sb
         ySwd1l8NJrJsaPkpqmGMGhHtFrsViLobIhw/TSl7XOZJXTvkxSOYF+ULgbh+ohe36jl+
         e1LvIwifzBqpVyKUHl8WMW3vxjdnHTvTx1UHy6Rrog0gAY+h2P7FTQxhhQdL9T/9CUxp
         jogfVnjiulg7VG65sT+6m0iO0TZd6Drj3lx7t9u7lNWso8Irb0GVoGtHaiT3kPafNdjy
         t1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813537; x=1783418337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuNJ6Khls5W9ANuvEwh0h69IOEnu+WTccUiXg1wsIgI=;
        b=oUYgXLbOu72/uZKMe4YEaqaRt2HOeJmlpZQO4YlFgKA5NB6qZ6BENnDKWYQR4z+U63
         BSc0sh/MKHpR4C7b0NwETHR1qzGiXxxU1Kpqhn/V2wleSxzp3DB/TNQr/fptGFAQZI0k
         lsOMev/Hr90pU7PR11kRUETxrZTb+OEK+oRaIcl52159Wr4yOsHKF13LjUIB5w0EZgik
         CcpgUVBYfp/68kjp+BU//ZYhXVCLR2vIRwgv2TaTgir8Ar3eixbv97mA/h4b8jTOc4TL
         lpii+FDRdaFZXvuzYhvfTlCBqRRcurOEfQFjO2M9Ma5gVjDDBIRKN02LPDG1l8woaFB2
         xmeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6YPtZqZzhHQWGXL4AifkwBx7b8QSoF8yyCtp6SBCqOv9VbMPRVc1IKBborKfZDy+Pyx+NwQAdTejPSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+Zt5UqJeynugJ8ZGC3cXU15YdBR0ef1489F1UB/fB/FNe2Lq
	FSPz5GplsGKli863/PmZOD6R6JpUIjWuhwhK3GnfGYjlFqvqokv/wu1C
X-Gm-Gg: AfdE7clrLqdqh/AFVWLplMcWPJfzFIxDyyv3+4TooMoQPjPNA7hF+dI6EUIZpIlPHrt
	G4Ank/SMYl3rbW5Aj7GoYfYSezcivvz7aLC+04kgqDOlGdxN+KSUklkIwa+qM3qyuidc4RVgK15
	4XIWkgtrEPoBha24USApPFvwvWFKGo2YNiFnu/FCY+sp5Y+xlprbNJETE8sm7AcNr/fGYRS/sY0
	NQ33J86kHaXuuu8lewOsbUzlm6oaw4cETdvR3wJor3yeNDZF73Ia5tO4Dwx7Axn5FvRaP/mOxgZ
	Qy+2uMMCmC+U9QmMxwNrMLNz5o5LQW18qKDiKRhaD8kHqdkTzaR1PmdrQy+pq2r3y2RVirTcEt/
	ba2weQA0GgZPVHb9GRQXZXcQpqynHQwsAMN9PJPLHQYJM+Ty1sw3UDj09+4xbhQXl1Qbj6KrI1d
	+DnnABHqq2A5UD9tPSKerQHeXPg7j1nA0CzyhaH54Xeoe6ZFfCSjep3KcrgDY1A27RpdlQEDBey
	0Jw+xobgwG3tYcOMivyFA8=
X-Received: by 2002:a17:902:ce0d:b0:2c9:c083:cd3e with SMTP id d9443c01a7336-2ca2ea1750fmr20931925ad.32.1782813536808;
        Tue, 30 Jun 2026 02:58:56 -0700 (PDT)
Received: from fourcolor-Home.. (2001-b011-7010-d7cf-1ecc-f3e6-c652-23d3.dynamic-ip6.hinet.net. [2001:b011:7010:d7cf:1ecc:f3e6:c652:23d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bf5sm10234455ad.2.2026.06.30.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:58:56 -0700 (PDT)
From: Shih-Sheng Yang <yshihsheng@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	kees@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Sheng Yang <yshihsheng@gmail.com>
Subject: [PATCH v2] media: v4l2-dev: fix media controller registration error handling
Date: Tue, 30 Jun 2026 17:58:40 +0800
Message-Id: <20260630095840.1749448-1-yshihsheng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66063-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[yshihsheng@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:kees@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yshihsheng@gmail.com,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yshihsheng@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BBA56E2942

__video_register_device() ignores failures from
video_register_media_controller(). If media_devnode_create() fails,
vdev->intf_devnode remains NULL but the video device is still marked as
registered. A later video_unregister_device() reaches
v4l2_device_release(), which calls media_devnode_remove() and
dereferences the NULL pointer.

If media_create_intf_link() fails, video_register_media_controller()
removes vdev->intf_devnode but leaves the stale pointer behind.

Fix this by propagating video_register_media_controller() failures from
__video_register_device(). Since device_register() has already
succeeded, unwind the device with device_unregister(). Also make
media_devnode_remove() tolerate NULL devnodes and clear
vdev->intf_devnode after removing it in the link failure path.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Shih-Sheng Yang <yshihsheng@gmail.com>
---
v1: https://lore.kernel.org/r/20260625193916.3562596-1-yshihsheng@gmail.com

Changes in v2:
- Move the NULL check to media_devnode_remove().
- Use device_unregister() after device_register() has succeeded.
- Keep clearing vdev->intf_devnode in the link failure path.

 drivers/media/mc/mc-entity.c       | 3 +++
 drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 3fa0bc687851..79f55375e9d6 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1563,6 +1563,9 @@ EXPORT_SYMBOL_GPL(media_devnode_create);
 
 void media_devnode_remove(struct media_intf_devnode *devnode)
 {
+	if (!devnode)
+		return;
+
 	media_remove_intf_links(&devnode->intf);
 	media_gobj_destroy(&devnode->intf.graph_obj);
 	kfree(devnode);
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5516b2bbb08f..56b51d5d49ae 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -896,6 +896,7 @@ static int video_register_media_controller(struct video_device *vdev)
 					      MEDIA_LNK_FL_IMMUTABLE);
 		if (!link) {
 			media_devnode_remove(vdev->intf_devnode);
+			vdev->intf_devnode = NULL;
 			media_device_unregister_entity(&vdev->entity);
 			return -ENOMEM;
 		}
@@ -1092,6 +1093,11 @@ int __video_register_device(struct video_device *vdev,
 
 	/* Part 5: Register the entity. */
 	ret = video_register_media_controller(vdev);
+	if (ret < 0) {
+		mutex_unlock(&videodev_lock);
+		device_unregister(&vdev->dev);
+		return ret;
+	}
 
 	/* Part 6: Activate this minor. The char device can now be used. */
 	set_bit(V4L2_FL_REGISTERED, &vdev->flags);
-- 
2.34.1

