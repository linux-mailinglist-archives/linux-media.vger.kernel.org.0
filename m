Return-Path: <linux-media+bounces-61790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHLfE91PCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:07:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E579755B4AA
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C8713007B8D
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AB83D668C;
	Sat, 16 May 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgodxZ/j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067F266581
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929610; cv=none; b=aog3LclWRrtemGgB2QYXXfbhIGKNvlUPM2FDaVYL0DyfdiwTC3gHC35iexdZKOcz7+5HLgf069lgJq7xdDTtihNyO/nOz0Xnl/2MELAsHMMBkdNhDczfjJtdsDD1qrrCU+zomtGscjZ7A3CX0GJiiLaXzsvJwWvYxKcDcOmaq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929610; c=relaxed/simple;
	bh=Xxs8inG7yNnVnqsTeDmsro1fFz3EEPayoUW9RCB58oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8mz6zdwhmNVjCCE/ojs64Jmp3AHQPZwqTvYAlvD6LZuCezeyuFB8g+OJIm9mRmYDhXVeq5eqo6d8fnIDhS8JnKAIx6EDoXOp8Tj5Id/qs256cU8GuyrJEocMFttJXZsn44GrLS/WwfUbX7fs64OYdZy7dN6sZYzl8eGqPtbRZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgodxZ/j; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so2709015e9.1
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929606; x=1779534406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYlLPOH4yVQW/c+VIhwYHIXyYVIQiO3ciiQAaKF6Jpo=;
        b=jgodxZ/jxYCIXxZ0DWvuYV4eOdWbBJb/DIvMH4xAruNdnoRxmVwmJSLrEDx33sG10m
         8EtR9V/DxPSuA09hOri+Q0z+0LZOV0xewWB8W4iiFd41RGWqQZUdKG0eroVi+Z2Fxnt5
         KhK6r3BFhXEodPXtMeytke3mabM8zy1XjiK/Pil1aHgmT2JTL8tVEAeq+4Xxd8o6L40I
         1apc1QPKFwvVgHI46ZtWK7sRT89JwiGzKlC0ALU4d4H6QDakr3QXeA6khYJ5HhlkKBsn
         AyGrBRhm78PmFwc1Vpi37/Jjjp44FiTuTQip3nMyRwLzFor4Vbl5vO66TEQE6rdwTs7D
         WlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929606; x=1779534406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lYlLPOH4yVQW/c+VIhwYHIXyYVIQiO3ciiQAaKF6Jpo=;
        b=UQSEuaIwa5gNus2+0ENfthhdGUuYkhvNq+7zmBX/sWoUg7IOP1RPig6m54YojElGcU
         cDCHyk/BbPB9J9arR/NkTSrY1+0tahtntVhHw77hsBHhw8YomLXkTV/Pbkoz8wCTywDf
         6W0QEaD2TWmupil4Sn+/qlFyRXazRtEZU1JTvbXllscm3H+1pGR5+tZItG9QI7bFiTr0
         m7FKWgqu0E73G1cQIlN15Z2c8c3P6K8i+wGHULNSbP661q1VijwFS5jU2kfOmrFdjtC0
         ikHobyDeG+QJZfZAFipGOCuuny+Owos6BDw5eBpkFpUyL0xQiKN1FuA6xqoLfgtD8DCh
         0t1w==
X-Forwarded-Encrypted: i=1; AFNElJ9Lrxhqn0oIG6xjGVxmSXH7M8jTg39l5mmEod6tHbIGVG0bZTU+9aowINaA1hJdCBIFh02cUcIbElV2ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbAeXT1+PlX96huv5G7ESJt9tWmgetMXV1Nhm15NKTMkglFcJT
	23iOpDtcaxnQMTDdVVucM2Kw1v1o8QJrNoge5xSb9N9OvZRapcIZSsrlTdt9hU+i
X-Gm-Gg: Acq92OG2axt7CyMeDHHDePAcOpD637fvZ5AypJsfN0VEhQAC26pAXkg5XKiZgnF6Ctc
	68JhiOh2lqZM2BhoZTi75gEGFjQipKQSDP/Vj3XlYas0JLGxi75XSUX0Nu6XOGl1jNr5UgoSkEZ
	YypZfP0trIoBDVhN92nTV0KXvPpI9sxglC8Uxb9D0ljHOVpqDSRc/nL7g6BgsTuP1z8ySLxQzml
	4emtHzy9cTXsW1opwctNaVzTNyJvqo1dWY3fODvid1m5TMugQfWUeWCK7RI3axLTqcaeLDX6DKB
	HOh20MMxnTz8SZWLgYuoFLJE19H4RFxIHs0yr69hTzaDsKyKTkIk1nEL+7zK60wg0qXWLm+ScYE
	fkCgRZeC4EHZp2QAcXCWB3d8VPuw0j3B5ChJwqsozgs5ffFmccqLFZPX1sV9O+iSdH2QJPpZSXJ
	Jmme3flWAYXyEFM00vR7rFUTmsHh0MPl9wlW/jIJX/PyC3GeaRGKcTGUXWsQVy6u9O9pbO2UWH6
	GijvRQ=
X-Received: by 2002:a05:600c:4e43:b0:48f:e230:8cad with SMTP id 5b1f17b1804b1-48fe6632135mr98825375e9.33.1778929605528;
        Sat, 16 May 2026 04:06:45 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:45 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:04 +0200
Subject: [PATCH 01/12] drm/syncobj: add drm_syncobj_from_fd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-1-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2530;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=Xxs8inG7yNnVnqsTeDmsro1fFz3EEPayoUW9RCB58oE=;
 b=+8Ntp4CeTenAuSVPrMlJyQQ3aZauaK6+QLTjIL8uRDHdQOin3LlpX/RlNsbP4/cmzUNFxQZTX
 jdMvakZq1vTDS+YTjld0PyK5yiRyPU+nmJ9Cooj8Tm+KOPLpLdSvCEH
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: E579755B4AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61790-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Given a syncobj FD, returns the underlying drm_syncobj.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 37 +++++++++++++++++++++++++++----------
 include/drm/drm_syncobj.h     |  1 +
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 8d9fd1917c6e..d992aa082ace 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -684,6 +684,31 @@ int drm_syncobj_get_fd(struct drm_syncobj *syncobj, int *p_fd)
 }
 EXPORT_SYMBOL(drm_syncobj_get_fd);
 
+/**
+ * drm_syncobj_from_fd - lookup and reference a syncobj.
+ * @fd: syncobj file descriptor
+ *
+ * Returns a reference to the syncobj pointed to by @fd or NULL. The
+ * reference must be released by calling drm_syncobj_put().
+ */
+struct drm_syncobj *drm_syncobj_from_fd(int fd)
+{
+	struct drm_syncobj *syncobj;
+
+	CLASS(fd, f)(fd);
+
+	if (fd_empty(f))
+		return NULL;
+
+	if (fd_file(f)->f_op != &drm_syncobj_file_fops)
+		return NULL;
+
+	syncobj = fd_file(f)->private_data;
+	drm_syncobj_get(syncobj);
+	return syncobj;
+}
+EXPORT_SYMBOL(drm_syncobj_from_fd);
+
 static int drm_syncobj_handle_to_fd(struct drm_file *file_private,
 				    u32 handle, int *p_fd)
 {
@@ -701,20 +726,12 @@ static int drm_syncobj_handle_to_fd(struct drm_file *file_private,
 static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 				    int fd, u32 *handle)
 {
-	struct drm_syncobj *syncobj;
-	CLASS(fd, f)(fd);
+	struct drm_syncobj *syncobj = drm_syncobj_from_fd(fd);
 	int ret;
 
-	if (fd_empty(f))
-		return -EINVAL;
-
-	if (fd_file(f)->f_op != &drm_syncobj_file_fops)
+	if (!syncobj)
 		return -EINVAL;
 
-	/* take a reference to put in the xarray */
-	syncobj = fd_file(f)->private_data;
-	drm_syncobj_get(syncobj);
-
 	ret = xa_alloc(&file_private->syncobj_xa, handle, syncobj, xa_limit_32b,
 		       GFP_KERNEL);
 	if (ret)
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index b40052132e52..5da9988834b5 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -117,6 +117,7 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj)
 
 struct drm_syncobj *drm_syncobj_find(struct drm_file *file_private,
 				     u32 handle);
+struct drm_syncobj *drm_syncobj_from_fd(int fd);
 void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 			   struct dma_fence_chain *chain,
 			   struct dma_fence *fence,

-- 
2.54.0


