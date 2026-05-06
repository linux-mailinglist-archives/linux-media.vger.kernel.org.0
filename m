Return-Path: <linux-media+bounces-60661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI3CKV5y+2m7bAMAu9opvQ
	(envelope-from <linux-media+bounces-60661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:54:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF64DE659
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B7B2300D9F2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 16:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D3C4968E2;
	Wed,  6 May 2026 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dscj/9BR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357B48C3FB
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086484; cv=none; b=fQHryHZtGHnaHxEimr/rov09dh6wTrTg6K8ENj2ExiRE2q0VuZ5sKUPYwkVqLkCpecgvETJ8uftuqeZaNvQKu1aYA0/yuWBBt9J4O/Ydrw8jxAhsezxvzCZxnHbGdz8ekJmtj5/xcwj/yJzjKBneBK5ZeZW6X/fdykNTYxyIyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086484; c=relaxed/simple;
	bh=pE5r/0zNaLbc5L577ohTizDRWrr9zIqWafn/ONE/Rdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpAAgbowxiLYx5i6jUKp/6vf3RtVZa92t4XYIyMyXA9oHTHpw3N+LBJIDQyLeTW8+MJu66pQRIjCdBDNf03UKcY9Ku+9O/MlzRDD7ZFYmeujAOldT9yG/+lQMW77tLA+Le4fmCZgWBcnVFie8a95XoN9tKU3i49LsDPW6kYEsC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dscj/9BR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21016C21;
	Wed,  6 May 2026 18:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778086478;
	bh=pE5r/0zNaLbc5L577ohTizDRWrr9zIqWafn/ONE/Rdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dscj/9BRhi5t5DzYB+pFGqYRPPrF6YoKRd2p1Ehw0y+1TTzwO7vcZXlOyypYoktbH
	 DPy18UTZ3ylfXqt4W7paor2WqcNuVIigbIYdkBt7qRNDYF7XiH8/Db82u2F4/OU4lB
	 A6gt2SWgS8Us6d3APWCXYRZ7R67EU3XwYNNY9yCY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 2/2] media: mc-entity: Drop ifdef for media_entity_cleanup definition
Date: Wed,  6 May 2026 19:54:38 +0300
Message-ID: <20260506165438.1767378-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
References: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 69FF64DE659
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60661-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]

The media_entity_cleanup() function is defined in media-entity.h as a
static inline no-op when CONFIG_MEDIA_CONTROLLER is enabled, and as a
no-op macro otherwise. This complexity is unneeded. Use a static inline
function in all cases.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/media-entity.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 904f61c14dc1..d9b72cd87d52 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -729,11 +729,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
  * zeroed but that has not been initialized with media_entity_pads_init() is
  * valid and is a no-op.
  */
-#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
-static inline void media_entity_cleanup(struct media_entity *entity) {}
-#else
-#define media_entity_cleanup(entity) do { } while (false)
-#endif
+static inline void media_entity_cleanup(struct media_entity *entity)
+{
+}
 
 /**
  * media_get_pad_index() - retrieves a pad index from an entity
-- 
Regards,

Laurent Pinchart


