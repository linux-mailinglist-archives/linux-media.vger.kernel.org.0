Return-Path: <linux-media+bounces-33415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F5AC458A
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 01:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E3B03B8933
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 23:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4287A242909;
	Mon, 26 May 2025 23:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d75IlXo9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13313192D87;
	Mon, 26 May 2025 23:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748302131; cv=none; b=MKOan+gXxf/Yey7hWw8Yjs3BTbrJZwo7SSn9CM1KdAPuPQLsLQdbi8h106UPBd8VLOV0+qwQFZOLZWHwCyUcmcCz4PiqMmRL313h6WPdTGvIeOXBr9XtbYJa+sZ3aDlEXce+Ic6TXHWTmfQB0ydjGR+sh25I576bpjvAiAAoQkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748302131; c=relaxed/simple;
	bh=kMfRolL74kpOFBhEIq2FKfObntff05SF/J/iabzF7mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhTEXH3Hz7+zwzLaqs3h53DcwcbjT8dKC0Ow+CKoSOoEr3S+4NedNfEwQPyXPKsuOz/PhdsaHC7rYsOTTRTqp1EE20jlEWDtB/gvxYRNuIxssCMzPGWHpfT4xwWBRs5CoRo4QxrcZA02LbPzMPbl/0a8nJesBD65wOngHsxuUXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d75IlXo9; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6faa28b9d71so18571636d6.2;
        Mon, 26 May 2025 16:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748302129; x=1748906929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCF4mNARq4NJl092zAnTtpdU7n/cAiGStZNGX6Zjkzo=;
        b=d75IlXo92mT31AyFFQOCTxfmPj2uCheS/SwZX5DzQXVB4CqoPAIOCDvDEQmLjHhj/L
         1kXky4gEhaRJpJwvayS96TbcYXWQ+njCZfooNa5A+0OzP9CX/TFDppUNzF3uuZBmjA3m
         xwI69Hwh+KvesFWo4kv3fQY/wesGk8sXMgP6Wv8Sr+Ht8yJgo2KOSnx+v1mntWpi2MUe
         WD/N1a40gPTST3GG+oWmUG5G8KchZho4Ko8SjeAN+vBrlisXaSEazRfihKWy8WdH3KW+
         lecP8NcEoDXPsTCAbmLbYzRypKXUDtYYWyRiKbDpEv1MpLUfzEfZnXYT98i+/yaWcwHy
         KqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748302129; x=1748906929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCF4mNARq4NJl092zAnTtpdU7n/cAiGStZNGX6Zjkzo=;
        b=w4dxh0gRKUWugMBrYCZQ+Ef3tccbnxmrCU3aJu1NFOznFG9xYxkOpUg29aRDNcaaBn
         xmYPd4AtzPBzNQOn2226BPG7L5H/I2eMCfQAl4xXOyFh/PNpi6zKxOJzhxO7pbxxxhRY
         C26E+yXNVeGQXhzmIMAKQn8qUEqrEFrRpJBW/AvvmgISjd6mxnQY4AKS/YqSZ0AJmcq+
         TSw5GV8HRhrfGTLUyaOoXhZeIci+T5LvZkk5ESpRWav0qMszwOMnEMF7VQ+dfR5BG8ut
         r2sMwkQY28dmZFSAP1sVKN9QXu6kVhjvj50SgCH+tKGcX0pALYlGuIZWn2zlo1QN0TYT
         QWnA==
X-Forwarded-Encrypted: i=1; AJvYcCX4fT8X7qM4ygdVyAYCj5m9IdVf8sauTL18+8qBWSaJRFCMUOunvL77nVD7cSOekRhgd2dfzjPH4DxXw734@vger.kernel.org, AJvYcCXGSl5emA1P+Hkr5BPo55FCgYDF3zCBbpuzDAiqssC3NE5zH/7D7G8rwJyBXxi64aZrtdbiOdtQSBpHf+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKQV0IfRg8nizzWGrkGRfe/A1S0QlVGRunpQ+p9eusrxMmzqJ
	QYCO/rgseyAiH6cAro8Pr2wi209nTgxXA8FvB8StnJ+JxDp9T2SVnT5/
X-Gm-Gg: ASbGncuWkuRYzFj4vlUvvzDY7H+grlgmjCSGcg1lZmZimRnMmIguCcEMm0MlFeoYbzN
	ZAtWyGPg4gDyHMFD+XSepgGlvWsEc+jhngfH7/VwaKxyykiScq2S9XjOJBZ5vUjmtfSJ4tAMQ2b
	sDTxKlZqJHq+9uIZOP1+ZRX+RwLssYg+00Q4BLklvmIel/LLN6xYlisfjzzJEvQxq1XBvz3VvZ0
	IqbRc02K+76mMxsZuZjdYNzaTOc8jfGGv5gE7t/QB6hObuQB8nPSzuzr0p2UUhcP9UMukyz4bdp
	qppo6PdMRaNkkADsT/5DiWJua7Br6cLUDfftzJ0=
X-Google-Smtp-Source: AGHT+IE6u+B+X2ZVXd18PUXzDvaItaUtUo/QAo/LtW+vxeJ9dqi0Z6q+QfjGQgnjDvl7GyYv0jVF2Q==
X-Received: by 2002:a05:6214:21c9:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fa9cfe74cfmr195233256d6.2.1748302128796;
        Mon, 26 May 2025 16:28:48 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::419a])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6faa2599adasm33888736d6.44.2025.05.26.16.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 16:28:48 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] media: qcom: camss: Power pipeline only when streaming
Date: Mon, 26 May 2025 19:28:39 -0400
Message-ID: <20250526232837.686822-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The libcamera plugin for Pipewire may keep an open file descriptor to
the video device, even while streaming. This simplifies its operation,
as it only needs to keep track of a number instead of a file path. When
the video device is open but not streaming, the pipeline can be powered
off. Move the pipeline power management to the prepare_streaming and
unprepare_streaming functions.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 39 ++++++++++++-------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index aa021fd5e123..8d05802d1735 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -225,6 +225,21 @@ static int video_check_format(struct camss_video *video)
 	return 0;
 }
 
+static int video_prepare_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	int ret;
+
+	ret = v4l2_pipeline_pm_get(&vdev->entity);
+	if (ret < 0) {
+		dev_err(video->camss->dev, "Failed to power up pipeline: %d\n",
+			ret);
+	}
+
+	return ret;
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
@@ -308,13 +323,23 @@ static void video_stop_streaming(struct vb2_queue *q)
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
 }
 
+static void video_unprepare_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+
+	v4l2_pipeline_pm_put(&vdev->entity);
+}
+
 static const struct vb2_ops msm_video_vb2_q_ops = {
 	.queue_setup     = video_queue_setup,
 	.buf_init        = video_buf_init,
 	.buf_prepare     = video_buf_prepare,
 	.buf_queue       = video_buf_queue,
+	.prepare_streaming = video_prepare_streaming,
 	.start_streaming = video_start_streaming,
 	.stop_streaming  = video_stop_streaming,
+	.unprepare_streaming = video_unprepare_streaming,
 };
 
 /* -----------------------------------------------------------------------------
@@ -599,20 +624,10 @@ static int video_open(struct file *file)
 
 	file->private_data = vfh;
 
-	ret = v4l2_pipeline_pm_get(&vdev->entity);
-	if (ret < 0) {
-		dev_err(video->camss->dev, "Failed to power up pipeline: %d\n",
-			ret);
-		goto error_pm_use;
-	}
-
 	mutex_unlock(&video->lock);
 
 	return 0;
 
-error_pm_use:
-	v4l2_fh_release(file);
-
 error_alloc:
 	mutex_unlock(&video->lock);
 
@@ -621,12 +636,8 @@ static int video_open(struct file *file)
 
 static int video_release(struct file *file)
 {
-	struct video_device *vdev = video_devdata(file);
-
 	vb2_fop_release(file);
 
-	v4l2_pipeline_pm_put(&vdev->entity);
-
 	file->private_data = NULL;
 
 	return 0;
-- 
2.49.0


