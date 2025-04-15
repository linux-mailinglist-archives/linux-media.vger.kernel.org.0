Return-Path: <linux-media+bounces-30225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD6FA897D3
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 11:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E57C5188FC7B
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A97C2820B0;
	Tue, 15 Apr 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QmWaUoDT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EuZmUEZW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QmWaUoDT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EuZmUEZW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D9205AA3
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709089; cv=none; b=kp2NrbSEK7KX+CZmFYUizS9Dq+eE0KoVkfwj06eQGS7W41EbVs2/B04Epw94wjwv6SXIDtFIDZrlbx7348y9lzTAMUV92HNYQX/XBqA5LNqrHtrv7Xnf9eJwVkeDhWTREueVol5fOm+upvd1KTy3wYLbi6Yiy1AGl2ZMWtxA/70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709089; c=relaxed/simple;
	bh=kBlm22XqaLL30mrlY3NE4ShPg2L2mmh28W82el1hOU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nMxG5tm/vLQG95bRvWJ2OKuTW1SVOjRjo/1CzJeXQS0a9utY7GwI9zoTMjuWOqvnOMHk3cq4BpFK7Tm1KouajNbtiELHs1gIhjXmNmO/JwSjHAZ+oq1oSPY5HTx4MC69R/LK7Vbj59xMWV30kI2/H7JUuEpvtXUK0Wf9lbJtjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QmWaUoDT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EuZmUEZW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QmWaUoDT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EuZmUEZW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0777721166;
	Tue, 15 Apr 2025 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744709086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
	b=QmWaUoDTm78rh2I7eeAuGlsPl3O5FkLtbXw2BTx8yLzbCj10q2HzV8/o+ir2/pRNrq4AZ5
	nPXlcl2KD9gcTfihd6fa2ywfyidiXpNsSoXuWxxz+Gd/6TZN2X+zKu4TAQIFrKqwQWx8+5
	dzg6XWUT/BoVXiAacsdxV20u4qonN74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744709086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
	b=EuZmUEZW1WzfE1dcFsQb4VEiqDYcCWnr+cFcAJleATSQw6z3en4cE98nZoO9ZljWf/nD7h
	AJsr+q4zIjRDBqDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744709086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
	b=QmWaUoDTm78rh2I7eeAuGlsPl3O5FkLtbXw2BTx8yLzbCj10q2HzV8/o+ir2/pRNrq4AZ5
	nPXlcl2KD9gcTfihd6fa2ywfyidiXpNsSoXuWxxz+Gd/6TZN2X+zKu4TAQIFrKqwQWx8+5
	dzg6XWUT/BoVXiAacsdxV20u4qonN74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744709086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pm52QsRmxq/tllwdensBCR+Q3LzdvPqrpt+hOA9XWXo=;
	b=EuZmUEZW1WzfE1dcFsQb4VEiqDYcCWnr+cFcAJleATSQw6z3en4cE98nZoO9ZljWf/nD7h
	AJsr+q4zIjRDBqDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD358137A5;
	Tue, 15 Apr 2025 09:24:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LFIcKd0l/mehVgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 09:24:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	asrivats@redhat.com,
	andyshrk@163.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/gem: Internally test import_attach for imported objects
Date: Tue, 15 Apr 2025 11:20:40 +0200
Message-ID: <20250415092057.63172-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com,163.com,kernel.org,linux.intel.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.de:email,suse.de:mid,intel.com:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO

Test struct drm_gem_object.import_attach to detect imported objects
during cleanup. At that point, the imported DMA buffer might have
already been released and the dma_buf field is NULL. The object's
free callback then does a cleanup as for native objects.

Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
clear the dma_buf field in drm_gem_object_exported_dma_buf_free().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
Reported-by: Andy Yan <andyshrk@163.com>
Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
Tested-by: Andy Yan <andyshrk@163.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/drm/drm_gem.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9b71f7a9f3f8..f09b8afcf86d 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
 	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
+	       /*
+		* TODO: During object release, the dma-buf might already
+		*       be gone. For now keep testing import_attach, but
+		*       this should be removed at some point.
+		*/
+	       obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP
-- 
2.49.0


