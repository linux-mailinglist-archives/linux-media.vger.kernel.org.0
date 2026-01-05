Return-Path: <linux-media+bounces-49927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEABCF44D7
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 16:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81A6430082E9
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 15:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA43F30DEB6;
	Mon,  5 Jan 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBq9/XyF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870F30BBAB
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625108; cv=none; b=UrWTN+kMcrQJfwYozG2AnLdtzRNcStx5tyCGll9ZsklW7rqKe1G4mJhaq8nSf5oxhpTqTjfhcT5ayfpR07F/4YgN8uuCE51VHwgPDjQg4Rekr/al0UcEzhYmvVxsJVdkuyK52Clo+kIurFmgtES+7LE3oKFNbZhZ4ut1z9r0VhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625108; c=relaxed/simple;
	bh=7aFJtkTCn/RUyXBqDN5A8Rl1FrpL/MQORLd7fWn3cOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAxNeAi/M94DYjQVUUTKUdT29trplTRLK915zIQ1oXhAS8PbiOZsT1gulkZPFose5qrBotRHpIt6JxSaK5A3GiuFeRntdYNfbEW1K5oV3EXqUAQg+LFy4g3uu5gRJhTW2igcqodg3NrfHY5ExcQJyURItquvJiV7Hav1Tm5WiBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBq9/XyF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0d5c365ceso187554285ad.3
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625106; x=1768229906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=MBq9/XyFYPKbzlnRavv9/Uv2M1u1CqjhyxbtDbJkoMBpaRUdpAB175P6Rs3omI3fbG
         jcNTJyDnuiWbGiMxJV+Vb2zI51PESZeYHVsbEaORHrEWVP1HA1S29Ti8O0hHOIbqckTF
         NxlEKIR2hXAQDaGDJN9L/fJ1kz8wBMcGBKQmx3fy872aT6x+OUDQjfKdM2VRKEVKYBvj
         5nv+yStuq/rI+NSadysv10oACPTPC2M55IJU3EWjhgc7CAd5cVwRA3Z/UPD0lYr50ANm
         nAHrgY97j5/vqVcr9fmBD9+vs//bbszrB24aGnnnGrW2Prxx/GA39q0EVDa0oW55AZov
         bzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625106; x=1768229906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=W8NH38QgVmS1tqY/6QsPZEcuUCh64vUz39QYWgHRWnk+ahwdv61c5GkaVBhDA0Q6rk
         7uUJSq/9NJ4SMWInWBgau8/wl0nK1WRueeWasg06I1RCz8dBhwQvGfMWBJSmVLdH8KO7
         oxq3hjmZUAYhd38UAM92Wt5I0SLHGT3u6/mCBV+6wLk/XFaNPff7xim5X/P/WEf01NZv
         PNotbJyGllnExj9+yekVEzyadhlsKgKgYe7Eyw3DWRXcqwIl0J5ZnTKAub/pwyl6R7iA
         Oa3HDxPRqzjsU+ypzMohyDmL9cQOy4J4VlMVGhLkMTyy+rTXo2SdMZrtQ9zDc4rtN/me
         GbJA==
X-Forwarded-Encrypted: i=1; AJvYcCXBkqnv21gFrOUNxSRnoNkWZ4ltbgAh59U3x/DHmpSQudHzSenAHvthMOksSM2kl0v+nD9CqMdvOZEfMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQ6HGmY2LLPx2hEEfSS9loi7vp8ySM45Yqy2llmo/kkO+nE0S
	M3x46RLGPXT+kxR2Lx2+OLYKe27WrJc3uugPVNLvf2c+ekuYJv43lG7qwB+iaw==
X-Gm-Gg: AY/fxX6ULYzMswLrAQNvCUr4w/s0Xsx9V9T1wKNg2I3YVHNihioU8XVShpRn5PYUBXM
	6ducZ8NQ2gI35CAQ6EGqbypHov/jKJ40kAd9j+l2tMnvZGj5IA7UxX4CF6j0zvQHdN8QaNbLy8n
	nTRWHy8Un261TWmuQ6Pzwra/WdZgficAEhPVWakgMK1/fQJ3XMn9GVE96yXffn6ztkMChRto8y/
	8Fs42U1VW62ZqsfYmuGUX3xpc6k0KG0I3CbhbjaHWzRsdNN51cGs0feYgZHbFFNjF3GtnTFgvCZ
	5ZU6/TnHZr1EGvItg0fFGXieg1tK1n0OG0Uq3jckgAPbo7ghQDQFBLqmrz7RhPOMyfqaBETvI/u
	/1em1wfIQQ+93y7ksFIbiKMRIbAq5H1y3G7u56ogb4KEKsWUSFr1ST4yBzAr3ow97McNvzERvBp
	RlKmy/KKX6Cak=
X-Google-Smtp-Source: AGHT+IEThfma4vyAoTFD9Z1px96n831nFofd6uJzy0WpP50OzQzghORJxsBujiDHnCn4NZgVK1DF1w==
X-Received: by 2002:a17:902:cf0e:b0:297:f09a:51cd with SMTP id d9443c01a7336-2a3e2cbb55fmr472125ad.14.1767625106054;
        Mon, 05 Jan 2026 06:58:26 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b81484sm715955ad.78.2026.01.05.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:58:25 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 2/3] media: atomisp: consolidate statistics buffer allocation
Date: Mon,  5 Jan 2026 20:27:23 +0530
Message-ID: <20260105145724.37305-3-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105145724.37305-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260105145724.37305-1-karthikey3608@gmail.com>
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


