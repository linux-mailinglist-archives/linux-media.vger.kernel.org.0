Return-Path: <linux-media+bounces-61799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCerK/9QCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:11:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3803A55B621
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6818304816C
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213FF3D6CB2;
	Sat, 16 May 2026 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0gmvF4h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAC3C8C7D
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929625; cv=none; b=RpjeET9x42mYtKcpqeWZp7jrEpBrKazpAsxXNiSHdkFZEbOJ+5s9Y0ojkeudXOlcoUjTY0DTD0kQjdinAQV00OWf7Dvj8Ax0oW4aO0o+R8+Dsc7kvvCBbTcrdMOJbJ/HqKeRhp9SuzvYfeShqqcR85NS0nRaVsOlJxC58JrgJw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929625; c=relaxed/simple;
	bh=9xL4k8P4OzDmeuDyBCak9cYfAMz/kFZpIBcu/tKVYxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7XCMoUPS8nu4PQyuJH4v6CquW5HfkVDBCv6sSQU6SwVImjvCpurvL7KGyMJyEXT0k+KvAp7VchuYBCDdNWvpPxMoSuRR5lsQdTeztvMGlWJo4Op/s6lNmbrBgUTmZI6DZaI8bFYSJ1Rp+VfEwFjU6SL06XEyUxLaAXtlIe3pZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0gmvF4h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so9714965e9.2
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929619; x=1779534419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVfs+wqDh2APf8gPwREvGpcVhgxv7KkNQvxDWgzbhy8=;
        b=h0gmvF4hSc0teZTysKlI5gUnQhaDoq3CcSselgyORbUx5s7dJwaW+hBdrHtMqByO0S
         pGnRYKtOAPMPYv4yBtaKxa2VixqKYMYn5Sz7+XNy54aZgoTIM/sk93jkUB6iDqZqJaVx
         ycLYpieUUxM8S+BUtvFPrJXKlKv9dMznd+/2/98NtHmN3l/eiCiuUh6qeuiwZwb1CL9i
         05cQpbv/WLQXaRYYcNohLQy6Wps6pYg8NAu6iKTrOFy5QWOG1ojf3O20WOWRauCr2CPC
         PTRUsxvkLYD7Yr0E566D8Kj6nc8GTs2QgtBkZaLqKkseb2Pr/5D0z17KB5TrSqSyWUyF
         S9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929619; x=1779534419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVfs+wqDh2APf8gPwREvGpcVhgxv7KkNQvxDWgzbhy8=;
        b=U1JP6t/HfL9/19Z92PiO2XXZ+zChTLd34gbI/BMJIhyRA5Uyh3dzYQMIPZ7JnciMDe
         jWPDAlxuHCyu7PoQRRfQQd/EGK2upITfb6Ee0+6js2b7UPOclLmz3zl9Po9UupuUAHom
         pP6aWcZMyAXNWLqKwAM6iOb+fkFERQXsxtUFlmjZrb9xfDOn2naHcWBm2hn4C8wPCsTF
         uuD2jqvlvcstXe9vbTRNjLSB+ZCawLa+4tcSevl0k+rmJKR/UvqDSryfgsTKdzVfmXaO
         /pnsVGrbLDSGZoznW42HbHBt83vfO+n1vsC+Qapm5WMM7aSWJEeuU20/Woapei53uk8g
         ecvw==
X-Forwarded-Encrypted: i=1; AFNElJ/SpyhrgflAdfAi0X0GIr5ZukIjCcDAH2daopKhhJMVIqL6ek2gCEzdlg1wCse4x6pSKBaV2GYT1hicIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6w4hF3Mr/dw/ZFzaLyDr7Gs0GgPfgAe5AnBNlb1KYercZK2C
	JQW53q01MWOyLQmdJXd921akMylzq9mha+LMLVLe0c34WpxuVPYBDM1KDJZXr4Qf
X-Gm-Gg: Acq92OFdXrfANCTegaEDM3DPkl6Xuc7LK+vlkPCd+YW1C7FDt46xpRWfYeWGdo7F4xB
	80Po5Rvqum4dYDndfEj+qNsDPD7henyxQ37rol1NpDW5TOmzLMopOAGQ8RR6OoUZOa01R9ClfOw
	s5bEe3ESmbOP9Us2d9v53pS+SNGLJVQEAJ2yd5+LN+K1kze8Mo9zltiaNRuBRvA23hbbwMttVgI
	LXe04lvHzJgMzk6Ap55ToxaPq6Vy/qlAPXxbLFBrJHuJnPm+Xva6uWN+tt6v6XuBTHrmMMRFeaf
	Yh+bKaowBRpp3BYIsO4+vS0khhF+1nh53MNsKHcW5IjCJt0c3+th+7/Xh8UL1hCmkNm5TuG0PwE
	KD3wuGxu8c39lQFMQtY7Jxt2rZH9xNzK7CPcoce4dfLZdWVZXW+Ll7VsFNh0wfeGunf2iVCTuN4
	ELnXQ1RgEhtuST3iPSIRWIQfoX1axVkiKo0/vBw4K73oP1bjONKHVDgGZzlX5Hm3moBEjDrLQPd
	leupPk=
X-Received: by 2002:a05:600c:c4a1:b0:48a:5363:8cac with SMTP id 5b1f17b1804b1-48fe63268eemr108045305e9.22.1778929618884;
        Sat, 16 May 2026 04:06:58 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:58 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:14 +0200
Subject: [PATCH 11/12] drm/syncobj: add drm_syncobj_export_sync_file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-11-88ede9d98a81@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3389;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=9xL4k8P4OzDmeuDyBCak9cYfAMz/kFZpIBcu/tKVYxQ=;
 b=IyP6KTEg/nnToCAtPFKyKdeoh+C+VT61maR9YZkQriDB2BckEZMqDGD+hg82OZFoyq8W/t5dM
 UcduM0gEp0VDuV8slfvoJd+B0QiHGRqTA8TF5AMzoWTfDIVoRvYYEyG
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: 3803A55B621
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61799-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This makes the logic from drm_syncobj_export_sync_file_by_handle
available to callers that have a drm_syncobj instead of a
drm_file/handle pair.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 39 ++++++++++++++++++++++++++++++++++-----
 include/drm/drm_syncobj.h     |  2 ++
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4c1667c67cb7..d5e633738730 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -815,8 +815,34 @@ int drm_syncobj_import_sync_file(struct drm_syncobj *syncobj,
 }
 EXPORT_SYMBOL(drm_syncobj_import_sync_file);
 
-static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-					int handle, u64 point, int *p_fd)
+static int drm_syncobj_export_sync_file_by_handle(struct drm_file *file_private,
+						   int handle, u64 point,
+						   int *p_fd)
+{
+	struct drm_syncobj *syncobj;
+	int ret;
+
+	syncobj = drm_syncobj_find(file_private, handle);
+	if (!syncobj)
+		return -ENOENT;
+
+	ret = drm_syncobj_export_sync_file(syncobj, point, p_fd);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+
+/**
+ * drm_syncobj_export_sync_file - export a syncobj fence as a sync_file fd
+ * @syncobj: syncobj to export from
+ * @point: timeline point or 0
+ * @p_fd: out parameter for the new file descriptor
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int drm_syncobj_export_sync_file(struct drm_syncobj *syncobj,
+				 u64 point, int *p_fd)
 {
 	int ret;
 	struct dma_fence *fence;
@@ -826,7 +852,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
+	ret = drm_syncobj_fence_lookup(syncobj, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -847,6 +873,8 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	put_unused_fd(fd);
 	return ret;
 }
+EXPORT_SYMBOL(drm_syncobj_export_sync_file);
+
 /**
  * drm_syncobj_open - initializes syncobj file-private structures at devnode open time
  * @file_private: drm file-private structure to set up
@@ -933,8 +961,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 		point = args->point;
 
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
-		return drm_syncobj_export_sync_file(file_private, args->handle,
-						    point, &args->fd);
+		return drm_syncobj_export_sync_file_by_handle(file_private,
+							      args->handle,
+							      point, &args->fd);
 
 	if (args->point)
 		return -EINVAL;
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 1571ffa12a5c..48476c570595 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -145,6 +145,8 @@ int drm_syncobj_query(struct drm_syncobj **syncobjs, u64 user_points,
 		      u32 count, u32 flags);
 int drm_syncobj_import_sync_file(struct drm_syncobj *syncobj,
 				 int sync_file_fd, u64 point);
+int drm_syncobj_export_sync_file(struct drm_syncobj *syncobj,
+				 u64 point, int *p_fd);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0


