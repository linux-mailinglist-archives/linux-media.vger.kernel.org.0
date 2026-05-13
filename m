Return-Path: <linux-media+bounces-61480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAkhBPKtBGoSNAIAu9opvQ
	(envelope-from <linux-media+bounces-61480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:59:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B968953793B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FE9F3008C17
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1C14DB55C;
	Wed, 13 May 2026 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iz7J+lbh"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA3C4C0419;
	Wed, 13 May 2026 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691546; cv=none; b=QQlqzc7D11eKq7FtgA2gtIOixdm8sLq+TtJS2rcyaCfv8tkrALmXNfEu73ljoEZvJsmjQil4lKwArGgtupVOYOM58bSyfxFy+vCvGuE74a2HM7BBTDwEbfkJhj3+VLgDScTiCLmto44ZnFTf6R6qGGfbtKByNMjNeCyDceDjTpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691546; c=relaxed/simple;
	bh=AAqKJoPOOkLMripnuQaHw9xbx35RrEUMeTSdxMx4p6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B77jKLGCt8n+KRntvz8bAwXYj9Q2q0cYGKxFWa7GcyebYFxaq83VVx4VdLxHRyi8h5DedlQE5KC4ogeBb/k7tLqJ+zzXZQiB2/YkVDQvbAJCmk3f76kv3DfQVVuwhe2yVijr1sMU19qZvVMXCak4M4YDnIu2VeL6S2mv+tsOI5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iz7J+lbh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778691542;
	bh=AAqKJoPOOkLMripnuQaHw9xbx35RrEUMeTSdxMx4p6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iz7J+lbh0ukvjOToMFhD5Zp8Se4seX2ihx25f/7zzFUb0I7hTL8179T8uCclw+FSw
	 1MRunWebsti7/QI1M/oKi7k3n2cTIo/Mb1LtRxiV4099JPsz8qbhZdDKsYSoFqDtb7
	 B9hN248Y6p+ePLN9GNKED/cXdduVAQb0q485ypZmmKxANrbTGBD+4eqCZqGY2YfkrJ
	 z12Go3GpLzOD3CKfNRrw5ud+cAnuQtUyDNaqNblSrYjK6NyUdkKn4ADkxANeNdT6ro
	 CAszu8lPyEaUkjJW2sFw01FhuRYrqlWH83unEuhlFyH8Q9mKVU6axEOViIayI0oDAB
	 A685TKVXB1fTQ==
Received: from [192.168.1.38] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86F8B17E1584;
	Wed, 13 May 2026 18:59:01 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 13 May 2026 18:58:51 +0200
Subject: [PATCH 3/6] drm: Define a conditional guard for
 drm_dev_{enter,exit}()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-panthor-guard-refactor-v1-3-f2d8c15a97ce@collabora.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778691539; l=1053;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=AAqKJoPOOkLMripnuQaHw9xbx35RrEUMeTSdxMx4p6s=;
 b=FYRu54IWmcIrt4VqItE/N6hDpklTqfnMHVMRaefA+rhpji77Nnesrd2OBc/n1HO3aQJVUjjtc
 z7TIGQgNP8uDMCgjQngOurcrLUVY/qExit+MP4PzEpPLSs8Pva8lVXu
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: B968953793B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61480-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Define a conditional drm_dev_access guard to automate the
drm_dev_{enter,exit}() sequence.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/drm/drm_drv.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986d..79d1958f93e4 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -490,6 +490,15 @@ void drm_dev_unplug(struct drm_device *dev);
 int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
 			 struct drm_wedge_task_info *info);
 
+/*
+ * Only the conditional drm_dev_access guard is valid. The drm_dev one is
+ * here so we can extend it with a conditional variant.
+ */
+DEFINE_LOCK_GUARD_1(drm_dev, struct drm_device,
+		    { WARN_ON("Use cond guards"); _T->idx = -1; },
+		    drm_dev_exit(_T->idx), int idx);
+DEFINE_LOCK_GUARD_1_COND(drm_dev, _access, drm_dev_enter(_T->lock, &_T->idx));
+
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
  * @dev: DRM device

-- 
2.54.0


