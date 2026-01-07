Return-Path: <linux-media+bounces-50155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21119CFE5A1
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29E28300531C
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E24734EF16;
	Wed,  7 Jan 2026 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ7FuTOb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8462634EF07
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797002; cv=none; b=FykStja6NnO2YSZDOeJV8LaGnhfRn35LFleT0+sv5qAHSukMaMbtNBGLhu02Hew8BAtn/r4YFd0CX2aAHbWKtK0GHT4P1tf31CC1GL4qSFBxgblVlefQwwCAtYeG8AwkUw/BP3b6djkdiWYVoneo45tZE5k4VJ9t63GLOQyh944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797002; c=relaxed/simple;
	bh=TKdeBU8mKT5yWGknDxcWZj3m54VDH36yEoT5RzaujbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOcLtUCs7rAeCBlCjXDpoYh8yFSGvwlzAnjO7qHplurMxQwZ8Z61CCenGAzRo92ZOioS5BOmXE1kEWYmN1cIxV9inmCeCDcxfH8iw/YoQeNe5Irnr1L8+9cnAd4k+YvbqS5wP0fBx+jg99NCyd/hjPy+yiXNvdmk1w58+HHWCjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ7FuTOb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8035e31d834so1788265b3a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767797000; x=1768401800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkj6vssmN7l7h2hvFyd91TLIHv8AfgSmQLvANyZ3hxM=;
        b=SQ7FuTObXGP0eMqGtgpgya13rNARC5lEdApr0sal72+gUr8C03S/kcMopQVQq9xnR+
         affgWN7V9IVA3Tw02eN7J+rzallgGoarmfLXjcZ85bi26LFGnfkJPSTXU4Qn3CxKKo9j
         jb/dfy13t5K9YiPAVtu/fpnThM4VZgmQRstT+menAi/YzS7BeRQQnVJ9oqZNEGiBFug4
         6aj5D7M9B7Sgdy+33+JWX7c7btayQcm/0NC0WSj6bCwp4F8H4LkJQtOpu5uaKutsJUEZ
         LYzGcTZiJbeJwkO3JtN/KMhJCU5Sll2cNN07sjFLTfh6coLapZxvx3c7/AAWCPuTE3lA
         5oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797000; x=1768401800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fkj6vssmN7l7h2hvFyd91TLIHv8AfgSmQLvANyZ3hxM=;
        b=Ku/u2cm9hT9iPc6hWK80GFaToCC0au61LNJD6q4s9R5ZV/B3SRwQoo0dCASjCK939A
         CvRauRB+S8YkhtxMkK00mEo9Md2wEPTHdQqEKcJFz7oZnF1gUnxlz4icjPFidVILSuDF
         BR90viFTQRIxX8y1vRiZ0/pduBuC6iujXWSGD1jPiFm+cSuy+jfD+kUFKAiWihGW+fCP
         BMz9cpVv4GJsXn4jEUghEnS2FMTCmwt6nDDO6jCzmRB1TFA6ZgrIZmuYLiSe2RFVAJ2P
         /CUBSGC7nBwdR0Guub4KKKz+XSy0BRhcp2vdvkCMIqA5Q53IHTb3fWVVsK9OIS2+dJRB
         gGcw==
X-Forwarded-Encrypted: i=1; AJvYcCV/BIVHc8KuRH2B6Et4LaxYLDTdEaY5Xc9l5ObVyXew4N+h+HEyZLM+/ccLo0vMtLIzocrogHqomsF1sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMALqVkcOaQqO9DdzzAbptlEEoR5LI8ShsNs99DDv8Muvc3T1Z
	TeLP0yjFttgAnQNwqpp0DczpcTH5Foh0B5yW6XkUl0WbW47eLDnT6oeq
X-Gm-Gg: AY/fxX4fQxNTHmCMBa7bYrEm/Ef4IvtI+T+xsqIX5HA5IuvRMZUNYDSpnV/zKzWh3yC
	87lZU+j0g4hiKiiSCEnL6HKF5SszWpr9FdLEyUODzAgOnIMu6lwndK8OJrnbRryC5pDDCmD/NFc
	lVu3TQmR/SALq4RTYu9+O4+I5vRWMrIVIQ5Tf3zUxVeSg1mYh6+JzKhmwnkdjvu4JxCUD3XgA1f
	Nbl3iA5tQpjaF/QZChXWV6cW54ALmqJUwrInJT8DcwI+fLywywJIRoQFuvT22X3lpR+RSUymjWP
	G5Lp4mIb+zW0uIx5iBHtYWJk0xmUhcUqxyMHQvAHBIEj9QwPv5v695cKy9PcpmMhqjPdtruVxj+
	atkNoVSjV2KiXLy2InGyR1Dfj46beFdkrhQyP5YzdfEyev1eA78GAZJWZdQuHtEDpcJjp6Zelvk
	kI6HkKjh025gU=
X-Google-Smtp-Source: AGHT+IFNKIgoAsSsAaMWMKXlRyQndBGHQdjiItfcgOkO3GbHXWCSaLvMXIyZsGQ/A7OHZizbcUKpFg==
X-Received: by 2002:a05:6a00:ad06:b0:81a:857b:f944 with SMTP id d2e1a72fcca58-81b7dc5b474mr2840179b3a.26.1767796999769;
        Wed, 07 Jan 2026 06:43:19 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59da826sm5168936b3a.46.2026.01.07.06.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:43:19 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3 2/3] media: atomisp: consolidate statistics buffer allocation
Date: Wed,  7 Jan 2026 20:12:51 +0530
Message-ID: <20260107144252.74666-3-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107144252.74666-1-karthikey3608@gmail.com>
References: <20260107144252.74666-1-karthikey3608@gmail.com>
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

The helper returns the actual error code on failure (instead of

hardcoded -ENOMEM), triggering the existing cleanup path in the caller

which correctly frees any partially allocated lists.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 127 ++++++++++++------
 1 file changed, 85 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 5c0a1d92b..c81773a75 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -678,13 +678,82 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
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
+	int ret;
+
+	while (count--) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
+			if (!s3a_buf)
+				return -ENOMEM;
+
+			ret = atomisp_css_allocate_stat_buffers(asd,
+								stream_id,
+								s3a_buf,
+								NULL,
+								NULL);
+			if (ret) {
+				kfree(s3a_buf);
+				return ret;
+			}
+			list_add_tail(&s3a_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
+			if (!dis_buf)
+				return -ENOMEM;
+
+			ret = atomisp_css_allocate_stat_buffers(asd,
+								stream_id,
+								NULL,
+								dis_buf,
+								NULL);
+			if (ret) {
+				kfree(dis_buf);
+				return ret;
+			}
+			list_add_tail(&dis_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = kzalloc(sizeof(*md_buf), GFP_KERNEL);
+			if (!md_buf)
+				return -ENOMEM;
+
+			ret = atomisp_css_allocate_stat_buffers(asd,
+								stream_id,
+								NULL,
+								NULL,
+								md_buf);
+			if (ret) {
+				kfree(md_buf);
+				return ret;
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
@@ -695,37 +764,20 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
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
@@ -736,19 +788,10 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
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


