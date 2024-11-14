Return-Path: <linux-media+bounces-21415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB629C9228
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EE9E28114F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2311AB531;
	Thu, 14 Nov 2024 19:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tg3svBF9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD218A95D
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611452; cv=none; b=tnMl1JAxcDPeiI0suUW+UOQMpSf/EhWB5qaY5gHSIyN5PGe2CcS2+itzzwN55fz7gFdxLMg7UTKkALQRdMpatBZv5mX5e4+NAAl+Nca0kZDGzQHPS5GGgoW40vyN5m28oyQH1NtMaDieXBibD35qfj7u2dAZTrkWx6vbwH2XQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611452; c=relaxed/simple;
	bh=891vgr8ZfTyBnkF2hdx6x/M+sg6ZKCMBjz6/1SYlOIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GW+gMUNVPw/CP1XSjqqf8o80RFQ9uaI0DDTKKAj7E/GowYTVAtSiV8XH1javLl3DSU/HI641SprintGkThWR60gSoeF3tT1gP899S/eIiSvrWnlyxvl7iV7r5kb0kN7CUAAjrKgQ+iHB4I6vXK1WcSELTCiujeLKMazd+n+DTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tg3svBF9; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b15eadee87so57290185a.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611449; x=1732216249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69mn13H1PoKT9uFw0cFCsSqSTFJ/p7+Sw2nsU0oDXCo=;
        b=Tg3svBF9/IZyK6wj1cqMuySbmmqZm8zAft/J3IRBICwjFpKe/cNBe1tkSInM1J2fNZ
         qoxy5iVT43v1lIipA/XOxTz4pntAEVl0ZPEFIicGtTXoGBj2p68sUhEVD3B6TI7ntibl
         gYJXboqRQ3e6SWdGteUmqTij297V2mzqsBBYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611449; x=1732216249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69mn13H1PoKT9uFw0cFCsSqSTFJ/p7+Sw2nsU0oDXCo=;
        b=NtyNAGKY3qHr/7/njEra7+SOWagnbD2ev51GZnnO62Tk9iWLfzoMP9nyAewuuAcjzz
         PHi3myyIRZPn7T9dLdqo3q4mwq2Nj1h99s2YokW94OKqdJb2aFEdSSCbvxzvkGN713IZ
         CvRJIPLIJGa2WxHiPlwH4Atx7gGW0hbLjnF0TIBxwbeipkh0bFKlqs8jEANSsXnHnV05
         9cEtaLlskhxKcOySn/7rAqmvzFSOXDip+yOUaFtCSzdAj1hZ0eA0Lfju453syC3/0sI3
         YRAxlI0R1iU+EpH+jzJbCnSpelGKaVoIxHp1hiO7KMi7f7hPZK+Wzr+9l5Gp0Y1wiv3Y
         lRIw==
X-Forwarded-Encrypted: i=1; AJvYcCXwVh07o0mB2ZlUgS/7Cg+YKkhi/L8vSqalNJW4h1qun5OsJ2MlLWCHkaYIgCDdAJxYexHE+H2Yi9wEiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN05lcKJQoa/UOZuhYOr5ZVZ3j2Rhq0/P+g6FZBF/LkUwAyDMF
	5UVf8LODbIBsp/cdc84e/lsydgafBg6frL8iDKx4SVf/5XQLVcgij33Ytue5wQ==
X-Google-Smtp-Source: AGHT+IF0l8bNoHEVEJoX/hMNb/j5aEKx9CFbpJx4t69EN9a8/Orafd02Wytr+RNNBbEhefyTuVpv4w==
X-Received: by 2002:a05:6214:448c:b0:6cb:d376:2b27 with SMTP id 6a1803df08f44-6d3dd060784mr99646816d6.29.1731611449136;
        Thu, 14 Nov 2024 11:10:49 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:48 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:33 +0000
Subject: [PATCH v15 04/19] media: vivid: Add a rectangle control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-4-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 2b5c8fbcd0a2..57346b714534 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -37,6 +37,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);

-- 
2.47.0.338.g60cca15819-goog


