Return-Path: <linux-media+bounces-61800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN9MOOhQCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:11:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD9D55B606
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA6E1304523E
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41483D88F7;
	Sat, 16 May 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoL64YiQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4EC3D75AB
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929625; cv=none; b=I7usWtvj+JisX8OfIlFPv0gs75FCyqeLamaRxmGdhy3UhFgEcmtE645lhLRKfo7MHssP6TbPUYkunF1zHWRF3eB3rV+ApfcydZjavcp101hdKrQ1CcxRyNvzNUezw1hwvKp9pJwFwpAXB63FOUwfbbNgAeQ/27iA1XF0EFrUrL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929625; c=relaxed/simple;
	bh=5APNMtl2NCstrrwoxtWKTvFVItf0IqBmltZkdCTjBxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmsYxcLVJYVJJrIOAEioNS8x9VYJtSx6n0P03u/TdS/8GgbHzZIyG2u5nhU/XRjjeyMA3oIb/11TwDCLNimm6lKxm1Kj3vw7HX/Lpym9d6s0NwjxKfC+RM6yobov9Oovp2HmRxYozQLhs4TL5rlPokdqKE14PvYk1KvoVH1PoJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoL64YiQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso6846125e9.3
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929616; x=1779534416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUzK0JUispp8nMHz/jfrYyUsKO3YYZqffLIW7XXNsp8=;
        b=AoL64YiQVahJ8Xq7A3slMhWKv+Qt4lDYANxRnhdwcXqknCwjXGt5dxsJZZCgllYP+Q
         NfDZB5Z6sldo6/fwJQNwbAwXcwq8/1xHqW5TPUCsXyxlDMS5mmRmvLvntNlm/THnxcrC
         ehd1TwMWi+HbF+f41BQ0oRe0zxs0IwTr3iKTd3//HdSzgmjz4RplkbbqanE+SFEVjejo
         EgHvqDuuw2Ro0vp342ClO0d0wiAUw16ZRf4xwvCLu1nfNbXdXWSRyyON60SnZhNRyZL/
         B8Gn2kfuJT37z1YsgQJW8xFA/1X/8UKF2WPj77bXf25Kqdi52dX9tV83/rYZNjp5HeDv
         wePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929616; x=1779534416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUzK0JUispp8nMHz/jfrYyUsKO3YYZqffLIW7XXNsp8=;
        b=R4ilUe2xMaQvNRKMKnD1BiabqrKHKF26C8eDnhMK2pKCxc1eXe4ZmZxOCw+djJftw0
         0Cle5O1igP/HhC5uRaLeqF6viLBHVi5eZE4zuVYEYd96fhUiHJDVyRDDspOeLFjxUyYc
         9rsTJ31NnJmSiJjcQfMU1gCpMhJJEEBA4iOrE3Fc9bJwQu3j1Z9YWWf3wneJ5VGVf4/Y
         U2Emuupd8x/LJsKOZLZizjdKq+YGo3kCd9yS7SmdTx28abxP2G55zTQ0+zKgILB336Lw
         ZDHDIJ0UP9DBSfM7BI72DQ2U2zUQvMVWnK+I9+NMrnPf3X47zqpzHzCQFSdk/4hTUCnW
         P0IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WfakclPsbwIQjRz/kmavFp5yJk6cyfJdOotZ5AHUvnGED2xF5iab+2x8reIpFgC0g5EOtFy8Xrtejpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJowsQSikMmlxLj/3dT22bBTjdP/40feI0cU6sOW54Phrgncyv
	yIQXLeu9y4DfsPuF7TbzYWz8CY/Sr5AoGr9MUl3TNWTkdRxrjEPrPvzYA+FOLdTY
X-Gm-Gg: Acq92OErr6n0FRlHcU3y+FYYAWxKknAqb3+lJqMKKZbhXC0PqbNoanQBqklCgzW2fVq
	c29SWSPbmoVEAi9TVOLC+ajPEXg25aw8NJR0IFEmcofZuvv7HkW279RPB/s0tEQHLbij81CqCXn
	aSsduAC5+1q7dbngsyJZUHQQfLnIL54HZk+UhGhKTHWW8rjr3kyxi3PGo/BEVIey3+lEaVm6G02
	kfIwqwjpXB0Lv4fc/j/5+CbYSKMlOpPNPB0KZoijKOczGT1H0nrnRVy+5b73yGu/bFLPMRa4Pzh
	jVdu5c3bR0dmnSYreS9FHwa1vMQEO2vtinqsw7dLMJvhShGOneDceQAPagLPW4S9IpH44heXS+U
	i0RANYshsRM2DjpOUgtu09dPDhfktO7pABcnjAHas6jQVAljo/9JX4JY1A8Z9JGdmKRL9aoURqo
	mDNZfampOu5quEeRoyeNcIBQbTOFbxkq6gDGYPVT+eYPwAJqAXrXa4a5iyYLacPQsidSqwSpHOd
	f8aztQ=
X-Received: by 2002:a05:600c:c087:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48fe5cb36aamr88176225e9.0.1778929616265;
        Sat, 16 May 2026 04:06:56 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:55 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:12 +0200
Subject: [PATCH 09/12] drm/syncobj: fix resource leak in
 drm_syncobj_import_sync_file_fence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-9-88ede9d98a81@gmail.com>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
In-Reply-To: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 ju.orth@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=1383;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=5APNMtl2NCstrrwoxtWKTvFVItf0IqBmltZkdCTjBxU=;
 b=uBiahrAmREDZy7Fj07y8SVauSH9GmZFa2clMwUB1MLOYdGIifgpx+NgONorTf5/6Z4hk84rCI
 KXcKOq9bDW9D2GMf5/UEmHT+/8WQoDxsc8BjwHF2qniEf5cY8txk1A8
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: 4BD9D55B606
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61800-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lwn.net,linuxfoundation.org,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Previously, if dma_fence_chain_alloc() failed, the syncobj and fence
would be leaked.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 9b7ecc2978f5..1da96e23dfc0 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -767,30 +767,35 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret = 0;
 
 	if (!fence)
 		return -EINVAL;
 
 	syncobj = drm_syncobj_find(file_private, handle);
 	if (!syncobj) {
-		dma_fence_put(fence);
-		return -ENOENT;
+		ret = -ENOENT;
+		goto err_syncobj;
 	}
 
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
-			return -ENOMEM;
+		if (!chain) {
+			ret = -ENOMEM;
+			goto err;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
 		drm_syncobj_replace_fence(syncobj, fence);
 	}
 
-	dma_fence_put(fence);
+err:
 	drm_syncobj_put(syncobj);
-	return 0;
+err_syncobj:
+	dma_fence_put(fence);
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,

-- 
2.54.0


