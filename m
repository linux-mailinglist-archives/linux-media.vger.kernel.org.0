Return-Path: <linux-media+bounces-22960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B68789E9F7C
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C77282348
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D39319C560;
	Mon,  9 Dec 2024 19:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bLvxZVLf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B54199249
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772342; cv=none; b=R1hLlxO9MtCX5IbQwgf67/t1r+qd0k6Q8kclu47VREAbPgCG2Tmkq5Y+xQu9oX4T6Ypt/u3CrM0UPRkdKClATzsYrHEuz1QxkC2ryho6LYgUnNYS++dt6Xui/ccivvYfLPE+3r3iX1vPpZSr/0z/BaS+4qs+5z5eWtVU3hz1Le0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772342; c=relaxed/simple;
	bh=3hn+UbgNRo1Vvg//E6tf3MH9DX6Es4eU9XONllUKPyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXN0SdP+a3eAboa841xFj75tl6mNRu6TWTuw+gCSzlRZ/XxXCGbOBKdL2rbmqWljHu6Ix+j3znFdetmBUzUt6EE/Glt6jEf3/ANeaG+k9aLMiBFprOxtqlEGLY4aIxZq9BPp87pV5IYK1HiEXadh6a8In9cJA7rhSZoex9Au1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bLvxZVLf; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8edbd1a3bso23221576d6.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772339; x=1734377139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ2bYJmReZdYhWgrWqbpm/s7LwVM5L6DZW3JOy2ZqFs=;
        b=bLvxZVLfJsZBwDreq9bMF0xGQRIpteKVAZuJV7c2roC+c4knnOur5AydYTB4SmeDmh
         tBbbjv9xNPo/TqZMV1fw8TVIFnGh7tniypSQoSnflmJW2N+lFEqpz4kGGizYIJ9JruFv
         fAdnqVipkQtZXi/nZCz4OHJ2mfENiMg7JlwdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772339; x=1734377139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZ2bYJmReZdYhWgrWqbpm/s7LwVM5L6DZW3JOy2ZqFs=;
        b=FSnuLYPbCbnp8TIvlDEj6cctqGpdC+QSbACo2QuZiyGzqaGVWm0Vtpxc0F6wy1JD/E
         Ae3JEmC0SW+kcUDMWNuYOrWENIGH/pVOoP9ymTMgiQSQarmJwldsDHmibx2ZmoHwcYJG
         fed0c6Jg+vRB0jzgT0VaS+GlKNvyHIxchdXOUiiIGi5vEBpWVYb2y3ivTrdqqyCDamTh
         ydUgIMVBQudUbAbrRlQq+BKvcj2ccS0enG5PTb2nrVcvgcJEOZF7aDl1pQmQgb/lUVb5
         Cy+JpIsrIrcWfuIEG1HKuuYiPJOgM+QJgm50ufFT5obCCZ5dmmTwlUH2VLUYGZt0pG4B
         lHBA==
X-Gm-Message-State: AOJu0YzqFFJyPXRp6oIUngA3MQ+22nUHQKOcoNiLZ7BPxOOGWufKxReB
	u+TmuQ94RJMNH+rMYC8P4u94OAawZH04F26XopbDmP78IjMwzmSS7Nqf9R7CrA==
X-Gm-Gg: ASbGncvnIXIP9rPZysygUtVahs034c6ASU8viz5heaWteKkNkYePoXto/3OZnQnBMcs
	Er586LVWp8iHsouWAgRV3uekVusvUnX+FQTDPu/mViJrQlLxz3uyPwFSF1wMDa8rqfdDLZ/oMTI
	cPpJSlzAzRJgvMe7Jp5eJUWtKJiw6D73vEyVTvX2qT2LxaC4pqxFhjbrI0urR6pGvB0aDv3SSEZ
	i/E8ROojsjDxXeyNDtMIexg9kyFmBR3ehkYdDT7oHwPl/A0gk8lwqmWHixuMkIksuzt/aw7GF+Y
	NxFJTzkCpsmLZchlp5TGGaSm
X-Google-Smtp-Source: AGHT+IEEzHN2lOcUckbzOhPkCQcj1XO3mZCg8zUBijND4xHIzep7iljKXyw3l3y8ggzjN0SCzkOjSw==
X-Received: by 2002:a05:6214:d84:b0:6d4:1e43:f395 with SMTP id 6a1803df08f44-6d91e399f68mr25209096d6.24.1733772338843;
        Mon, 09 Dec 2024 11:25:38 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:36 +0000
Subject: [PATCH 05/10] media: atomisp: Replace queryctrl with
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-5-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The ioctl framework provides an emulator of queryctrl using
query_ext_ctrl.
Replace our implementation of queryctrl to support both.

Now that we are at it:
- Add comment about missing functionality.
- Remove superfluous clear of reserved[0].
- Remove ret var.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 34 +++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1a960a01854f..d24420d8bd57 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -34,7 +34,7 @@ static const char *CARD = "ATOM ISP";	/* max size 31 */
  * FIXME: ISP should not know beforehand all CIDs supported by sensor.
  * Instead, it needs to propagate to sensor unknown CIDs.
  */
-static struct v4l2_queryctrl ci_v4l2_controls[] = {
+static struct v4l2_query_ext_ctrl ci_v4l2_controls[] = {
 	{
 		.id = V4L2_CID_AUTO_WHITE_BALANCE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -1140,31 +1140,35 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 
 /*
  * To query the attributes of a control.
- * applications set the id field of a struct v4l2_queryctrl and call the
+ * applications set the id field of a struct v4l2_query_ext_ctrl and call the
  * this ioctl with a pointer to this structure. The driver fills
  * the rest of the structure.
  */
-static int atomisp_queryctl(struct file *file, void *fh,
-			    struct v4l2_queryctrl *qc)
+static int atomisp_query_ext_ctrl(struct file *file, void *fh,
+				  struct v4l2_query_ext_ctrl *qc)
 {
-	int i, ret = -EINVAL;
+	int i;
 
+	/* TODO: implement V4L2_CTRL_FLAG_NEXT_CTRL */
 	if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
-		return ret;
+		return -EINVAL;
 
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == qc->id) {
-			memcpy(qc, &ci_v4l2_controls[i],
-			       sizeof(struct v4l2_queryctrl));
-			qc->reserved[0] = 0;
-			ret = 0;
-			break;
+			memcpy(qc, &ci_v4l2_controls[i], sizeof(*qc));
+			qc->nr_of_dims = 0;
+			qc->elems = 1;
+			qc->elem_size = 4;
+			return 0;
 		}
 	}
-	if (ret != 0)
-		qc->flags = V4L2_CTRL_FLAG_DISABLED;
 
-	return ret;
+	/*
+	 * This is probably not needed, but this flag has been set for
+	 * many kernel versions. Leave to avoid breaking any apps
+	 */
+	qc->flags = V4L2_CTRL_FLAG_DISABLED;
+	return -EINVAL;
 }
 
 static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
@@ -1561,7 +1565,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_enum_input = atomisp_enum_input,
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
-	.vidioc_queryctrl = atomisp_queryctl,
+	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
 	.vidioc_s_ctrl = atomisp_s_ctrl,
 	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog


