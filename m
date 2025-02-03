Return-Path: <linux-media+bounces-25572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F8CA258CC
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 285273A85AB
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967E4204599;
	Mon,  3 Feb 2025 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i0Gmb3Pb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F27B205E17
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583767; cv=none; b=fYAHUdnPJirSHqt1uLnrLq3wLJLgvkLhyjvCNdAjkUSCEC+fPlXyPEcAEFs2b0DNaZCzw7b+IF3jgZC2HCbKaoSwpfh7Fl219qHbWGPIPw4wGfkTpty6AKxOvzuJa9vrPp1XZnaJ9W1goErZkZPOTusBax9/HEWMSwsXeBaf7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583767; c=relaxed/simple;
	bh=jr+PsfqAe1DMqBhomm2T99WaHj0J+agxbYUDnZWYmVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0nLnvG+iaw53KOiJ30SGsMLZmuBa8KPDgUGfIaZJRrerrbZlazNMW/tZiqBRqEq0/y+F0YHVkLn8OInh+ci7rTrYxwvIPfwUltyoqmicop9Z5NMR5tXVe4pRR/5Faw/slADhT/8VDx+8sCLfvO6Vi6VEd3ohGTsreKNQNUxJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i0Gmb3Pb; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51e902b58c0so2452364e0c.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583765; x=1739188565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmRIEuGB9w+y+UYSlcNFeXKIfbL+PvnOnrm5AaSkwZM=;
        b=i0Gmb3PbE6//JW6+QrWIoPueO+VT/dSK/YH1XG6IvIVjYrMsXKNDjvpP0hhueydejj
         uNgX7YA4xAn28FOVb1KNtrJ5WkAgKT10epxFZEAYDcs4r4Xmf5pkizZc3X3sTwiVlLHV
         heDNYnYg2/GBT+TrAU+8NDxdH6uSWXyeuImJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583765; x=1739188565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmRIEuGB9w+y+UYSlcNFeXKIfbL+PvnOnrm5AaSkwZM=;
        b=gFdSorHlgE98aEX71mWs/OSsDmU8p0TCha7kax+AHCZsZhVV1bWgXgJwD2gv08lnCM
         PolGStAv3gcJNivtogTQysL45KKMw+7A4W8L0KFJQkYoHv4Ujh+8XbxRCTJ85arMSzVC
         poyz6KVNgPoRb4Mue2p3Op9maRo0L/uZq7Y/WM2I8UL/F3Gtya3nwG2MpKUfia9DOBGL
         46kVYRe3BsoIDZ2QhBqtZpo0ZK3OaCQyvK7vdo3ntdF2PKSB91wzbmmA7JoDUrgbH82V
         XqVDVnSUxmjsq1N1WOEq4Sm1p3HBWI2sYGac1+oe2kll9SKEs4Vt0nvkDXkniED+iyKz
         e3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjO0m1wt8QL+731T+YHOUXrMs5MDE9zWQi4+eTEPeC2a4OdT9XM+7YEhbJPQqiKVvB2zIl1aRBMsLxnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1umUw5kDVnrNQkHpm7IAxcdfYRlDIxA4199ioS5ceaB8cM6E2
	QW/RNGGrb4TaSTbXUlN56m4G0rgmtviSe2/GoQWcOUMJC7eKfrNuCwFJPvb2ow==
X-Gm-Gg: ASbGncv1XkxeQnTN8M2g6LOFRQCmGuKbuyYkGzsmo6crqVi+FslphrEBrQYJCIfk2l+
	bIGjwgbcSwKoX5/1uWjPxzejcxwsg5xS2xoeoT+pLIDeFRtDR+URCMc1L1p7zvO9NU+hpqk5nwV
	88r/hp6kqwt9sJGX0q0sjVqMJyp/igVKKUJui3/FYRpIaNqsKjVZHf0q5ZWnOdr1r4uKUgcfiO+
	E2x+s165TzrnlSdcB/b4pm06iuaqgCZRK5sbxBxlZQZoLCsyX75PfrSSh3sPU/+Gke8JglVFf1m
	fh83pjtl9oPs+NeeH9bp0bibTtUdxT995xRiJ+GfWzqkH4ngrGxY+Tq9iiV3teL+Cw==
X-Google-Smtp-Source: AGHT+IEWbBLDqt8daDt8XTdjdKHl7zjnPV3tGAcQZ8yqpswx+3L0zw81Fua6kDJHw31NjGMFcULexg==
X-Received: by 2002:a05:6102:e11:b0:4b2:7534:f26e with SMTP id ada2fe7eead31-4b9a525cda5mr13324873137.16.1738583765161;
        Mon, 03 Feb 2025 03:56:05 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:47 +0000
Subject: [PATCH v17 11/17] media: uvcvideo: Factor out query_boundaries
 from query_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-11-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

Split the function in two parts. queryctrl_boundaries will be used in
future patches.

No functional change expected from this patch.

Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 106 ++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 46 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b8bf8ca95747..6e27075939ac 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1374,53 +1374,11 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	return ~0;
 }
 
-static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl,
-	struct uvc_control_mapping *mapping,
-	struct v4l2_queryctrl *v4l2_ctrl)
+static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
+				      struct uvc_control *ctrl,
+				      struct uvc_control_mapping *mapping,
+				      struct v4l2_queryctrl *v4l2_ctrl)
 {
-	struct uvc_control_mapping *master_map = NULL;
-	struct uvc_control *master_ctrl = NULL;
-
-	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
-	v4l2_ctrl->id = mapping->id;
-	v4l2_ctrl->type = mapping->v4l2_type;
-	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
-		sizeof(v4l2_ctrl->name));
-	v4l2_ctrl->flags = 0;
-
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
-		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
-		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
-	if (mapping->master_id)
-		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0, 0);
-	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret;
-
-		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
-			return -EIO;
-
-		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
-
-		if (val != mapping->master_manual)
-				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
-	}
-
-	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
-		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
-		v4l2_ctrl->default_value = 0;
-		v4l2_ctrl->minimum = 0;
-		v4l2_ctrl->maximum = 0;
-		v4l2_ctrl->step = 0;
-		return 0;
-	}
-
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
 		if (ret < 0)
@@ -1464,18 +1422,74 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
 		v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+	else
+		v4l2_ctrl->minimum = 0;
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
 		v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+	else
+		v4l2_ctrl->maximum = 0;
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
 		v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
+	else
+		v4l2_ctrl->step = 0;
 
 	return 0;
 }
 
+static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
+				 struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping,
+				 struct v4l2_queryctrl *v4l2_ctrl)
+{
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
+
+	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
+	v4l2_ctrl->id = mapping->id;
+	v4l2_ctrl->type = mapping->v4l2_type;
+	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
+		sizeof(v4l2_ctrl->name));
+	v4l2_ctrl->flags = 0;
+
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
+	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	if (mapping->master_id)
+		__uvc_find_control(ctrl->entity, mapping->master_id,
+				   &master_map, &master_ctrl, 0, 0);
+	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
+		s32 val;
+		int ret;
+
+		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
+			return -EIO;
+
+		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		if (ret < 0)
+			return ret;
+
+		if (val != mapping->master_manual)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+	}
+
+	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
+		v4l2_ctrl->default_value = 0;
+		v4l2_ctrl->minimum = 0;
+		v4l2_ctrl->maximum = 0;
+		v4l2_ctrl->step = 0;
+		return 0;
+	}
+
+	return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
+}
+
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct v4l2_queryctrl *v4l2_ctrl)
 {

-- 
2.48.1.362.g079036d154-goog


