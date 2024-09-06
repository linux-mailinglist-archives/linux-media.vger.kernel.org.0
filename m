Return-Path: <linux-media+bounces-17814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0896FA0A
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78392282D53
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755B11D79A1;
	Fri,  6 Sep 2024 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8j6CAp0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496FC1C7B68;
	Fri,  6 Sep 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725644428; cv=none; b=YDXQLYKbahaTcZEQxbnB4hXqGuV4P+UPl+6NsFz6cwQEwp9R4M6QGmUG6oFG45jsJ4rGkRRKeGhWt4AeemyTogzSNJJHFWesb9i9IcuNqqw/AbWStqr6o+1QPmEcnWXdMV7la3DeaYTurUnDSGJs9BtNvGxlU4GFkDm6GnacWC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725644428; c=relaxed/simple;
	bh=J1D08QP3JWZC9EPGqmGFwOWwTT046231QJ//mMazpms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QuhA62iPoYvyO6g+0P3ZNUiY05JEu63eSjWF32q1D2T+3OrFpPhZi88/XBmgMYCxqvuBnYwzVNSPutspY7+GsWuqkLGycuAqYc916sVWthEulVggcpnzjiuC9U/4E9KRHOdE5a/mARZsdmd4QJPDTe7CQehrfUOYlW54+mfe5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8j6CAp0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c3d209da98so3323611a12.1;
        Fri, 06 Sep 2024 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644426; x=1726249226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4LxwlnlL6G3NSnwOnhswZ56WZ0hWrrgxscofAMV3pQ=;
        b=S8j6CAp0FnkIYrsGqj0n3F82UEE/+ZPS5ixkKH2AemC/ctTHtmxjnhrvnQoWOSuwII
         4cI0MJIwBOM8ST818DzuggX/Q/QMAYeh3PbJZN/UEc4ZiYJ8sjAosPcbOFdr9bnnGbf7
         fp6DG7c0xTrb0Wtcjn3/JrKSrE12+CgHND+BBCHSsUoqXnMZNRU+IuUV1RhqIAZQa0WW
         9Hi7n+XoZdRs5PjeRJGFQG8qDVmWFJxYj3khUtMQpOCOTWDkih8Iq78qYkO2nx63s4FG
         GGUKfl1hsu4dHcyQs1LvMrvqCeOkUdbWA+tffxTrMU2dLoKJ8Ak57jcWBRFqz0sVUJCW
         xZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644426; x=1726249226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4LxwlnlL6G3NSnwOnhswZ56WZ0hWrrgxscofAMV3pQ=;
        b=ek+dDkZKHpgVF6ElPtMroW2WPMbC3llC4PWgnT1N7nhGm01ofZpbPMK7Cq3v89kkxU
         dRx4mRRawF2+sBDC/aKdQj06vzL9RLR3AUKGucvthd9EFw0sLRhzJkpE9X8cHgz1plXa
         NFtEYP3GI2zvrpZoQuvG48FPOgUWo4FGf8U8QoRnhi18EGHGFeD/Cbcup+Wa9DcoE1D+
         Vnd/kQkOGXnceWSGoq57th6Q0zVGMRhprd+jldjlMwS/UdpN2BsbXv5NyIEHELmOFsPv
         hmLLZfxcAf7KcesB3D2/+rnKR3x/tVxAsnGcSuNZP3mMk3+keYC1cyhjEBZK/PonJFCM
         5BSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWIL27NvQnPSmF8+4AEAQPHHS31n6wF2QVTpu8Wsdip2QsU8UgUov3REWN1ht+DaOmwrWrPYgeWDKt8hdUpLISKEM=@vger.kernel.org, AJvYcCXyGARpRZ4+bOXPNpAj+RtIzefwrz78EqTTAsRC8QaWcppt0p12hqJj3nWwL3/Y7zw2D93XwxFXwdkCH9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDeL38fdzZliCUiks3jj5gyOk8+9yALHNtB1anjFnRCiRpeC6
	3bexJoVOaskVgui36o1xeWbOaOu0GTxNCB+XuQzbNU5m/1aOjqk1
X-Google-Smtp-Source: AGHT+IEBATDsW2UtMPL1sOLSbyFPMYv4uTIYnh8/ihZ1yE2M2iIHdfCI2vb1325KAmc2aIf1h7Blnw==
X-Received: by 2002:a05:6402:1d50:b0:5c2:6b31:29e0 with SMTP id 4fb4d7f45d1cf-5c3c1fa0603mr10397130a12.17.1725644425812;
        Fri, 06 Sep 2024 10:40:25 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc697fedsm2623557a12.64.2024.09.06.10.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:40:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] media: platform: rzg2l-cru: rzg2l-video: Retrieve virtual channel information
Date: Fri,  6 Sep 2024 18:39:46 +0100
Message-Id: <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
virtual channel should be processed from the four available VCs. To
retrieve this information from the connected subdevice, the
.get_frame_desc() function is called.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index bbf4674f888d..6101a070e785 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -433,12 +433,41 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
+static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	struct media_pad *pad;
+	int ret;
+
+	pad = media_pad_remote_pad_unique(&cru->ip.pads[1]);
+	if (IS_ERR(pad))
+		return PTR_ERR(pad);
+
+	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc,
+			       pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+	/* If remote subdev does not implement .get_frame_desc default to VC0. */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	return fd.num_entries ? fd.entry[0].bus.csi2.vc : 0;
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
 	unsigned long flags;
 	int ret;
 
+	ret = rzg2l_cru_get_virtual_channel(cru);
+	if (ret < 0)
+		return ret;
+	cru->csi.channel = ret;
+
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Select a video input */
-- 
2.34.1


