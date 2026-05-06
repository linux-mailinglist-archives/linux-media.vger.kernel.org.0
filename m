Return-Path: <linux-media+bounces-60660-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOmAI1py+2lgbQMAu9opvQ
	(envelope-from <linux-media+bounces-60660-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:54:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DCA4DE651
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E08FF30099AB
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 16:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3BA495528;
	Wed,  6 May 2026 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CCUr/4Iy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CC47798A
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086483; cv=none; b=gzeGI4Mru1PNKGM1ZNB8OosGCdrvNH+wJPZA142V2gu8bTBsMtINHJzUU7NMCxlAsrFl4s1Box0/Yj1QcYpzGxe+pNIC5TJbxJIVl5ZCiyxY0/TRU+RwvcEBTjvCVoFQPU1YFqRaWgkdxcMS1fMQeTyDquuMuM2/tQl/edB9d1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086483; c=relaxed/simple;
	bh=vcf1pPQLfBWc+IOVAhYKKKflZzozFM5Lc6hoUVnejAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pWtZ6XHW+r1kLc8eugWgqrziLY9YqdwOo0Hrfk5Rkx0CKKaB+2gc8UkNHUDG2xXZplJNtd4uWj2ugRboLcsyWAaDGjLakNX+Fq15orN1or5RXFgzdRMN5RHc6ec0+wKOfKPdzk63XzZ67xvWoxiuWzegAzjHb6uj+2gUgcYfQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CCUr/4Iy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1BC863D;
	Wed,  6 May 2026 18:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778086476;
	bh=vcf1pPQLfBWc+IOVAhYKKKflZzozFM5Lc6hoUVnejAs=;
	h=From:To:Cc:Subject:Date:From;
	b=CCUr/4Iy8cClr/AodMNnOF7wXBRuEDcRS37Ne6lxig/RcttH/7eCNHA2pTlNKDzDV
	 l/U6Epe/8zb2cZYdgTMwjfDX7yJ86ifYXwCfRt0SG6b5gfXTjx6hUe57jKZ/COtrnO
	 glzpHSY98PZTe3++8w7eVzNASaSzMpI6GNIVLh48=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 1/2] media: mc-entity: Fix documentation typo in function name
Date: Wed,  6 May 2026 19:54:37 +0300
Message-ID: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F1DCA4DE651
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
	TAGGED_FROM(0.00)[bounces-60660-lists,linux-media=lfdr.de];
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

The media_entity_pads_init() function name is misspelled. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/media-entity.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index b91ff6f8c3bb..904f61c14dc1 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -726,7 +726,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
  * the entity (currently, it does nothing).
  *
  * Calling media_entity_cleanup() on a media_entity whose memory has been
- * zeroed but that has not been initialized with media_entity_pad_init() is
+ * zeroed but that has not been initialized with media_entity_pads_init() is
  * valid and is a no-op.
  */
 #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)

base-commit: 3cd9b7011519c3fffffb7b6752fc7603be52dc1d
-- 
Regards,

Laurent Pinchart


