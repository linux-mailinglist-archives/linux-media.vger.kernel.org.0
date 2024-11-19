Return-Path: <linux-media+bounces-21601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C99D2FB0
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 21:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E331F22788
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 20:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06D71D3584;
	Tue, 19 Nov 2024 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VbKHY+ml"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3615853A;
	Tue, 19 Nov 2024 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732048972; cv=none; b=hlh78f21pRkexHAO9BlRrr/CoeXkboUEJrjfsNhdRYqDFkvVF2DhVvoopKE6E6+psYzszXmyrPdJBMendM3tkiofJumoowJeAYIyoC+5SRQo0IECvlqoEYdnazBGgo2K4fVp+DjhpF6iXr78E1wNQCkGCvvGL8STIFO2DP8lWDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732048972; c=relaxed/simple;
	bh=3lXxTb1SdDh9ydSVgaqyBCqdnMn1iBLrcRXrWySr1zM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7j+INY5qV3PM3Q+Fl4MeHCFwtL1L8RDmuag2mfB81B8DUFKNqibTYW0ouiuINzcjB29HaYJ4kn9Uimhl1Ub9Hf/vKXE8gD3MIACMowJRwdADgwYgmsIftYrPdb4/u1D11zzepWdCnNVLdCTEsAzTxYdfVGqBH4zoWQx8Ntai/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VbKHY+ml; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DV3WtqL3lt7pwDV3Wt8WJd; Tue, 19 Nov 2024 21:42:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1732048961;
	bh=oTvpCQq8alGc1ZL61S7t0BIfplAY2aaCla8sSIriT5I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VbKHY+mlpgskjUyX+wxpYcuC1c/8GQQ+E5Enw/i0AuZkoWr1oQbGbExT7uhBNkz00
	 bQqT2jvlf4lhLEsZsvW6KqO39EFWrxzo2lus8pANKgVycmVgEpkOvFYDKvjRP5F2AY
	 xm9JACV6Nad6i7jZi+pS8C0qW16nvijQq39k4sle2GIN378TguFs7ElzPhqO/tvTBj
	 QZuyzfQbsoLgW59qrdar5uiWMH+xK9OH/X01kYXX2egrEpQD9XDPUZMOo63r+TfFBB
	 R9hJiemZsljz8f6+9rnCEUUvHLQ4rD3DfAeqGIgHG1lrDGBqe4gFuxBqnDtrWjJdEc
	 GNgkuLSgKhk9Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Nov 2024 21:42:41 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: s5p-mfc: Fix an error handling path s5p_mfc_open()
Date: Tue, 19 Nov 2024 21:42:28 +0100
Message-ID: <b486e0ede5803258464c97d702f6588e7e7d3077.1732048929.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A mfc_debug_enter() is not balanced by a corresponding mfc_debug_leave().
Add the missing call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Apparently, only a debug message was missing, so don't bother with a
Fixes tag, it is not really a bug.
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 2fe3c9228ac5..5f80931f056d 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -774,8 +774,10 @@ static int s5p_mfc_open(struct file *file)
 	int ret = 0;
 
 	mfc_debug_enter();
-	if (mutex_lock_interruptible(&dev->mfc_mutex))
-		return -ERESTARTSYS;
+	if (mutex_lock_interruptible(&dev->mfc_mutex)) {
+		ret = -ERESTARTSYS;
+		goto err_enter;
+	}
 	dev->num_inst++;	/* It is guarded by mfc_mutex in vfd */
 	/* Allocate memory for context */
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -946,6 +948,7 @@ static int s5p_mfc_open(struct file *file)
 err_alloc:
 	dev->num_inst--;
 	mutex_unlock(&dev->mfc_mutex);
+err_enter:
 	mfc_debug_leave();
 	return ret;
 }
-- 
2.47.0


