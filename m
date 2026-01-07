Return-Path: <linux-media+bounces-50143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D0CFE1DB
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 14:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F09530AEAA2
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3782332EBD;
	Wed,  7 Jan 2026 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5xWl8vC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C13328E2
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793759; cv=none; b=pmL5MyydXg7AcJz+QQdbcDSimDL76xiwT7XxRunFHi+f4TytmbS4sTCURjTaPeNthxBbPkXyaszuyTpEXTuDcEXO/a/NYO0arLNUvdRtq8K0D8BosovPdkuM5chF1ITbikcqOawjkNRypC6gPnqR3r7Ahc/JIzbIgOL9ShpOw48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793759; c=relaxed/simple;
	bh=7aFJtkTCn/RUyXBqDN5A8Rl1FrpL/MQORLd7fWn3cOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiBPh7hETIPun9Gc9upBZHvm2DQ+E2XP2XonXUyip2c5KgL3ODw4DgUhmCCtIvpB05BcczrdjRz0IKCaDhScsQPFfVfwAhNIhbyIiG1S3p63fiieqBYuYixGtuzdgj/KDdvGCxFgYXXvxAHqpKjOqove7HaR5kNTEcxaDvyIUso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5xWl8vC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34cf1e31f85so1500059a91.1
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 05:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793755; x=1768398555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=i5xWl8vCXaigEqSuE1V5RY8bQkqBbNHHINBNQ+Rs2XSi8P08eAbLPQ4gjojz6YDJtR
         xnp6pMFT0XjdoK7IIgh05/tIqE+/Ie1EwrWz22k8Ef7qnZMM6ao8tkShQNDtE6dUT4Jo
         AhQ5zsJVwIHAsCCY3uZ3UQGE1Q6y1YwjkdmnLI8Als3+rk29pkwvurQSso7QoFZYQMlb
         SGonTbEPpHbVObh+d0t8uJvjwFmJjimlPCmEJ0xV195QkgZLallu5lu7VLs5WFqMLmzz
         R8w8p44uTsAuWybosPLUr7hQMShPJmNmmlahY8NFP8ysdK0HxJqba8iEAZFEM6492Qdd
         DZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793755; x=1768398555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=F4lsPSEgk77ufAM5KSsmnGV/DvMsIQvzaJZb1HhgOejkvVDdkm0xbFL4p8c8Kv3szR
         ZQFuMgdZTmU3X0Lh4m3mAqOeLYSJXimSWdPW39LLyUPcBxT2YQbtp62B5qrGfsYQ6Y2w
         xdMVGVp9m8/cimRNrrRL2Z6ip67I7yL3L27GeSNOcgTXpLmfCH8IQNszyiQmaW+tJi0A
         Ead9YL6oqw0jX++eb/RSDnPkyXy/3YCKgwCzRucQRYVbSGlDuJWmHk/Pm99QQyYQlPSm
         SpOAPoVTKbm6So4p+TdHYIFT9taOmMRGPBsK/BiVtOC+VBjmwBAbgK5n4JQB8CNrZCfC
         +LDg==
X-Forwarded-Encrypted: i=1; AJvYcCUIm3L0TUNsrmwBuEGH9auCoLIcdUB+caDjLzd5SSAbPgX5btHXoHtbj7fxBtVAQmpeRc7dFQv1g8egAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBTTPiA1EZRCcQ0Jcz4ddpRN0PiG6OyLvLoyP+eb8y4zuydKD
	dkCfbiFOk0b7Lr37JtB4gPl8vih6ICtdgo4xqjr7C92ogf5fs3Q36/6i
X-Gm-Gg: AY/fxX5ClOxX1YCLy5fcUGDCG9s3PFu7cUZM3PVgmEvHTKFzL5iR7IHytmTLUfued/S
	8kRnlaWQO44dXituUEW/NmVHamEX8ld5XZHaQfk6krzXPUMbtByczpXppy0/QhEqRrkMjPbIS00
	n1HDQ0dNlSLTO6uLrjgTfR8oTP7YloqBQGom3nobJppIduTUsbKDuRSFvTG5dBifI+VDVl4LTW2
	jPQB11VMSHB0melkqEfX5MDJlWHs8Qar/6ufIY8dKGUV/3wWX/gUDZhXA/O9Qkhu9aQ56e432KZ
	etLJBrOqHG2FihQDxrwhSyR0bUEjz2WvGhn+I+n9f0a2APgtbWz3ZRqXzTvJyqiRY3ZELk+Jjrs
	XI2f3X2k4i9sSkFunACsXvG8P+VCtX5yPzOSqp++TUrHkSr2sFY4tcM79hq+jMp0OEOLLcHkw+j
	8CO0FwpaSQ7Rua32267sHuGA==
X-Google-Smtp-Source: AGHT+IE7J+DUw5Iqs5C2fpYR9e3jAQUDZORywRhmTE7GqrIw5ManxpPFTH52JMOGUB9mdhbFJlJkqQ==
X-Received: by 2002:a17:90b:2251:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-34f68b65ff0mr2290395a91.13.1767793755014;
        Wed, 07 Jan 2026 05:49:15 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm5109577b3a.42.2026.01.07.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:49:14 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 RESEND v2 2/3] media: atomisp: consolidate statistics buffer allocation
Date: Wed,  7 Jan 2026 19:18:43 +0530
Message-ID: <20260107134844.68074-3-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107134844.68074-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor atomisp_alloc_css_stat_bufs() to use a new helper function

atomisp_alloc_stat_bufs_list().

This reduces code duplication for allocating 3A, DIS, and metadata

buffers and centralizes the allocation loop logic.

The helper returns -ENOMEM on failure, triggering the existing

cleanup path in the caller which correctly frees any partially

allocated lists.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 123 ++++++++++++------
 1 file changed, 81 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 5c0a1d92b..9e572b3e6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -678,13 +678,78 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	return atomisp_try_fmt_cap(file, fh, f);
 }
 
+static int atomisp_alloc_stat_bufs_list(struct atomisp_sub_device *asd,
+					u16 stream_id,
+					struct list_head *buf_list,
+					int count,
+					enum ia_css_buffer_type type)
+{
+	struct atomisp_s3a_buf *s3a_buf;
+	struct atomisp_dis_buf *dis_buf;
+	struct atomisp_metadata_buf *md_buf;
+
+	while (count--) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
+			if (!s3a_buf)
+				return -ENOMEM;
+
+			if (atomisp_css_allocate_stat_buffers(asd,
+							      stream_id,
+							      s3a_buf,
+							      NULL,
+							      NULL)) {
+				kfree(s3a_buf);
+				return -ENOMEM;
+			}
+			list_add_tail(&s3a_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
+			if (!dis_buf)
+				return -ENOMEM;
+
+			if (atomisp_css_allocate_stat_buffers(asd,
+							      stream_id,
+							      NULL,
+							      dis_buf,
+							      NULL)) {
+				kfree(dis_buf);
+				return -ENOMEM;
+			}
+			list_add_tail(&dis_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = kzalloc(sizeof(*md_buf), GFP_KERNEL);
+			if (!md_buf)
+				return -ENOMEM;
+
+			if (atomisp_css_allocate_stat_buffers(asd,
+							      stream_id,
+							      NULL,
+							      NULL,
+							      md_buf)) {
+				kfree(md_buf);
+				return -ENOMEM;
+			}
+			list_add_tail(&md_buf->list, buf_list);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
-				uint16_t stream_id)
+				u16 stream_id)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf;
-	struct atomisp_dis_buf *dis_buf = NULL, *_dis_buf;
-	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
+	struct atomisp_dis_buf *dis_buf, *_dis_buf;
+	struct atomisp_s3a_buf *s3a_buf, *_s3a_buf;
+	struct atomisp_metadata_buf *md_buf, *_md_buf;
 	int count;
 	struct ia_css_dvs_grid_info *dvs_grid_info =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
@@ -695,37 +760,20 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		count = ATOMISP_CSS_Q_DEPTH +
 			ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL;
 		dev_dbg(isp->dev, "allocating %d 3a buffers\n", count);
-		while (count--) {
-			s3a_buf = kzalloc(sizeof(struct atomisp_s3a_buf), GFP_KERNEL);
-			if (!s3a_buf)
-				goto error;
-
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, s3a_buf, NULL, NULL)) {
-				kfree(s3a_buf);
-				goto error;
-			}
-
-			list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->s3a_stats, count,
+						 IA_CSS_BUFFER_TYPE_3A_STATISTICS))
+			goto error;
 	}
 
 	if (list_empty(&asd->dis_stats) && dvs_grid_info &&
 	    dvs_grid_info->enable) {
 		count = ATOMISP_CSS_Q_DEPTH + 1;
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
-		while (count--) {
-			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
-			if (!dis_buf)
-				goto error;
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, NULL, dis_buf, NULL)) {
-				kfree(dis_buf);
-				goto error;
-			}
-
-			list_add_tail(&dis_buf->list, &asd->dis_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->dis_stats, count,
+						 IA_CSS_BUFFER_TYPE_DIS_STATISTICS))
+			goto error;
 	}
 
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
@@ -736,19 +784,10 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				ATOMISP_METADATA_QUEUE_DEPTH_FOR_HAL;
 			dev_dbg(isp->dev, "allocating %d metadata buffers for type %d\n",
 				count, i);
-			while (count--) {
-				md_buf = kzalloc(sizeof(struct atomisp_metadata_buf),
-						 GFP_KERNEL);
-				if (!md_buf)
-					goto error;
-
-				if (atomisp_css_allocate_stat_buffers(
-					asd, stream_id, NULL, NULL, md_buf)) {
-					kfree(md_buf);
-					goto error;
-				}
-				list_add_tail(&md_buf->list, &asd->metadata[i]);
-			}
+			if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+							 &asd->metadata[i], count,
+							 IA_CSS_BUFFER_TYPE_METADATA))
+				goto error;
 		}
 	}
 	return 0;
-- 
2.43.0


