Return-Path: <linux-media+bounces-41897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2BB46F8F
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46FEB1888411
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4C02FE573;
	Sat,  6 Sep 2025 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP2cr26Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87462FD1D8;
	Sat,  6 Sep 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166863; cv=none; b=duLr4vnDprlvaUw2DgFQO2cKspeZcO00mQs4/f3hq7VfgdI61N3hb0aSzadsQk/Q/MmMannmEwmO9NjxOQbnCLq7C7ENoqv9VR//+2ZGzOX0d8T6g/lnwpY5JhcjpfVaDZ+ZMhzJ0YGxITOxIBkKMsAO1lRe+1/LBEgxCzaDsTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166863; c=relaxed/simple;
	bh=UMCSVacuCqCwvhsGPrhVtzf2WPxDWMp+oNTk/U1V7HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlPyIk/UHzWakPRV0KhuuJVsCugFUffZLfGUi+N+hIFrimws8J8JvIv0F+dlFLpmf16XaEMHqggVg2cOWnVA6Odz+rlCnvNTqR3KAyup8DJQtNqrdnnP8gRTkOgh4hN5BoXdcUNNanFEYqtTb/sobwj6WNeCbvE6kh2ElXHdQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP2cr26Y; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6507bd53so3063249e87.3;
        Sat, 06 Sep 2025 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166860; x=1757771660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WIdATCDvQMnbdC21C7QVK0YJMHWri/9rANxhXm72f4=;
        b=SP2cr26Y/+8hEs4uRUxeLvIdh9r4LeRq+waD4YCQvXGjPFaYeMh4a9l3/DjSUK6lrn
         db7vP7AGtpYpNGk+2jmkP5CyMVuAKciJcnArubWmrtkErPiZuNFSAEnsI6tiWaaiHwtu
         MJBBcrZQp87qgUatkVlEYlB6Y1GhLKDw4/i3AbIZCIFSktOALXu7zkbLb+C4AqDlraAK
         lwI2NxUAWtImuVnsSHmJ5dIHfnB5vrjda//iLC8xlb7zVCkNI5kpe0r+37V6/Elc2xHZ
         7Z0Km6x31Tw7jR7ttvmVkq+HWPSBL8AbCCO4s1H0rXxbtt++F7A2GAQTpj9FJ/FEbogy
         Dfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166860; x=1757771660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WIdATCDvQMnbdC21C7QVK0YJMHWri/9rANxhXm72f4=;
        b=lcN17CqkO6ORAZMo/BSta0GWQgvNTuk5tou9m/CaeIWfRI+dC0bg5PJ6sPK00KqkFR
         hlFvowJA/qSSPLXwdECmLI0VNPZUjlhjTkhspMKfhPY5qWRzojgEDCY5QfK6cDZptz1M
         irlCJfGSVeFgHP23zvVLeDYvk+3pA66K1BvqXu7abx6KM6U/nInWjfKvmku0Qihjoqt5
         OupOswQgMNc/muaE++4JUVV2Co9YHKdMROhBNyGPp+qVlqlxQ3kUmiiPLDZNjnVxO0FH
         kXPpL4mPVxHBLxa1IpLSrICNj5YaRVJNX6mPWuIyoztyQV1pg88HIrr3AqT+3GV/xHoI
         0T2g==
X-Forwarded-Encrypted: i=1; AJvYcCUG1QBIlAW5H/Egh7J1hffEBOVvhgzH+653UOoL207cZPfHa4gxteXZt/LpnRUUnnMa9JbGdPGntwxQYZM=@vger.kernel.org, AJvYcCUeu2/883Vi5W04dZ8wYi/pFRN17TrUgkghXtSQp4OPiCUq2Kg+qW5z/GCjNjAP5oevqI7hlahvQFAo@vger.kernel.org, AJvYcCVTQf5Mv2ImS7ISIouvXlECAZvk09fCQqFYtSHkowP37P3BlRgeyaL4LOAaEE4axqk8nV99+bFlHWM38ieD@vger.kernel.org, AJvYcCWmrRF1EyPme2ZunZK06KdKvoZFLzqJHt6r5FcjPOnMyIO3LGUS8KJIog3C1o1u2EEYBOoz+iu3tNUxkyo=@vger.kernel.org, AJvYcCXFJgXNkHBq+5BtPWL4MYEr28UDQtCDyAEws9S15+BnUqtBOPQJ3mBtKHRU4ycWo+COk10B0LVVom6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HNtGlzsTqQArumR1J217RJq/1Tf6JBK+NKMFTWWiqyUsJNcW
	22VoJLfFOpS0ndSgVnD1NGs87TAe6Zg4dhycjHzbOiL+U2Mh+q5jjzY6
X-Gm-Gg: ASbGncv2lF4lxQaqZvTGrAvYWzfJUxPWpm+OOY2NMevIRjm4+0AFcCK7QWFyyKKTz9P
	TdOKcHer8rwQo5XSvHi08rQXScKBjmFIAL9foR0g8FNpTwWKXzoIzehP802mKK/NW4ZAdf7+ygS
	133Lcq65z//1R5e5W6ktDqj+g1bD92ffbc3KDmwEYi/+sZrS7TqNdwzHoOAkD+/rHuGlK94ZPej
	fCEQoqBHQv3BHArBu9Hn6zVb4CTi+UiTzgGgtXn4olpn6JjcuhaAQHJhfG3r04T/zUswW+EsURc
	l0HE0C55xo0JNTp2VbT2Kj7aIt6gsecHFI2Kw3aXaJKGuFvfhpLemSEUuTaOAFTqWhGYLN6fJy0
	lp1VBySkd5Lae6nP6ytxUWR65e0Eb27D7lg4=
X-Google-Smtp-Source: AGHT+IFNwfE5WsBiCnMDmHHRkAwMlu0XKdppumOKmQdJeOPj17Tc0h1VteTrfL9JbG9gfpAEqTCYzQ==
X-Received: by 2002:a05:6512:6404:b0:55f:6902:c9f0 with SMTP id 2adb3069b0e04-5626310bdccmr579045e87.43.1757166859396;
        Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check to tegra_channel_get_remote_csi_subdev
Date: Sat,  6 Sep 2025 16:53:32 +0300
Message-ID: <20250906135345.241229-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST. Lets check if returned device is actually CSI by comparing
subdevice operations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 12 ------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 3d1d5e1615c2..c848e4ab51ac 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+
+	pad = media_pad_remote_pad_first(&chan->pad);
+	if (!pad)
+		return NULL;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+	if (!subdev)
+		return NULL;
+
+	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
+}
+
 static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   struct device_node *node,
 				   unsigned int port_num, unsigned int lanes,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 90473729b546..2deb615547be 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,18 +160,6 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
-{
-	struct media_pad *pad;
-
-	pad = media_pad_remote_pad_first(&chan->pad);
-	if (!pad)
-		return NULL;
-
-	return media_entity_to_v4l2_subdev(pad->entity);
-}
-
 /*
  * Walk up the chain until the initial source (e.g. image sensor)
  */
-- 
2.48.1


