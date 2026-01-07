Return-Path: <linux-media+bounces-50163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE6CFE9E3
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 16:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B430302EA1F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 15:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8E835FF65;
	Wed,  7 Jan 2026 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTv8eUix"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CBB328631
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798577; cv=none; b=bKpgat2ICSpzE24k2fNJrCRYvl5YcQsYfSRfb6mSKn55OKHTRmTB6LEZFuav7AuO73wfYyYnzzzQTRlxlOdFjmv2UaCBozBUoNuJAZIjhbW4fHXf0LQKcvI1onnwznl7et779jYyib6LPwkk44iPBhfpz/hXwwMCiLVUhfoI3A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798577; c=relaxed/simple;
	bh=iGThI7AMvpXUH2QvGeoBUTMOmlzpo8uINvbPcxu0oHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jiE9i1oeR7DOaOWKWE5nIkKk4nCMFrsZ//P1EYF9MlnFVuOu88np+sVEMb/eP9/DcFc/bE6JQ5UDwXLW1ToBJrnZO0HeDP/x/GyJ76h5c1eIcakHQIDp/KDu8piRHh+rXS46qK/OXu7EtHCiDVLQal5Oa/oP9kk7MFJupLo4ZLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTv8eUix; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7f121c00dedso2083030b3a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 07:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767798574; x=1768403374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=839scXuIahBjk14ZPBwF1ot2Ofseckln89nJ0huuhEU=;
        b=dTv8eUixXPWQIz8vXukRw2gjb24E5bhcWjl2tJ60kGhZvvVoNlmzlNMLTboqrpuFAq
         LuxMOhENQWNEkW7YcN9JixMluMfwate5O7oPfoynynWNB0OHCH8qWKVmGr8I0aLcoISa
         oJYOSKVdVp7WPgKLC7/vVNZTPHkost/iEPUIj02g0xHM7hZjsBih/qTir2C5cIba9lpV
         9WwWxtECctydUinw8eDMGJ4yBwicZpbE528qEe7Qm005Zl5YfbtoD6iXJk124jgamHUN
         SUToLVPF40xQaTkn7Q4Lget6N1rHYUEIsdvq5sJIKyiz2RsChshKp+BZMCm/Zpy4cpDD
         v9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798574; x=1768403374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=839scXuIahBjk14ZPBwF1ot2Ofseckln89nJ0huuhEU=;
        b=kfvYoRgV0Ku/AQTizqGlAPu4DII7MWmfJ0TQK3io1kyY0gDHklJqjsoESuhAV9CiXl
         Zc+h5+YEQKJK5r8xIr/kBVKFp7G7RXYDxJiO3gBMDgNfDr9GcM5IhSYtfqI/a3anoXjk
         b/0hoUsnteQkr6jLdh4w8FuE23FfqKfprAZooul7c1jY38Wc0kzBSkAk1zRa5651RpDg
         uvQCK1uZL5Lzttq1U/Z/c2/RBfz35CsYxxQviSuaRlmtdUTT2MEByH45XHjjh8LJMd5Z
         u30QzPBIPJaE7DFCmjh17MnDtaeNGvSTLEX5pAt/G5JI5HRvb6FwS3MT5vg6VOwgKKla
         Q+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBznfV+7KIOQQfNcksNmrmHNVFqnmxFY8TSilEimgjyjda5cWmCpdr2a5cfaYFU4BjnaiYZwcD1mJz6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfM4dW5isOdO7cHCiOorn4r4LZFAY/qNfj3gmflBdZZYNZp6IF
	BroKPI/MWNFD/0xIlONEdRHZ/Z9pcWs0ti8NuT99pvyNAhT8zuR1rX7j
X-Gm-Gg: AY/fxX7pS5VEV1TaWiPKC1xkHmPV/Ul0LMDPrxvGJg7GfZEtoUIJWOcOTArpXYxknat
	dvlIXAwB/MUBrYtY2SeJYW2hIgUDCPSQWDG5OXJ44r6iSloucMF2QFwCxOeTFd0XDnTHGQUJuo/
	EtavKg0KCNZBiJ6sz9qQwvv26/NymAIFR+EGsm6QWBq54Ne/wEswlvDultdSqq25mzYavUXsgYo
	mMACDbcKB8RPLT7FAZCDw6Ocyb7yb9aFBKNh+6uWBGnv2rNNr/zdBS7zvvIot6lNN2Rk2tncIJu
	y8acbkUYnAn+JyTG0niW5bST/Sf6gyy0P3CJt0ypiLq4sGZFiUunjtf2mtWGfBWthj5yaLKJYtA
	FIlhcK5Uwhb/0pM2S5xrAEWzcTSpOoeO+MmT72mu6Ft8So1u4YGo7N7FkPfRCdyUsy1WTtZwQrw
	V8dbtgCQ8AtVU=
X-Google-Smtp-Source: AGHT+IHBpXqkh/7RGbwjPDPLci2dCtXCz7QKcOwf/IAx50TXMsFMeoxMZ4/+sP8T0Bj6SQUlodTgPg==
X-Received: by 2002:a05:6a00:f04:b0:7a9:c21a:559a with SMTP id d2e1a72fcca58-81b7d86249cmr2486687b3a.8.1767798574470;
        Wed, 07 Jan 2026 07:09:34 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59df961sm5246114b3a.47.2026.01.07.07.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:09:34 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v4 2/3] media: atomisp: consolidate statistics buffer allocation
Date: Wed,  7 Jan 2026 20:38:57 +0530
Message-ID: <20260107150858.79818-3-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107150858.79818-1-karthikey3608@gmail.com>
References: <20260107150858.79818-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor atomisp_alloc_css_stat_bufs() to use a new helper

function atomisp_alloc_stat_bufs_list().

This reduces code duplication for allocating 3A, DIS, and

metadata buffers and centralizes the allocation loop logic.

The helper returns the actual error code on failure (instead of

hardcoded -ENOMEM), triggering the existing cleanup path in the

caller which correctly frees any partially allocated lists.

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


