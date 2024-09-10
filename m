Return-Path: <linux-media+bounces-18102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0877973E36
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E761F24345
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972AA1A2841;
	Tue, 10 Sep 2024 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKnYfYO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F61AAE06;
	Tue, 10 Sep 2024 17:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987995; cv=none; b=s8wItHS1CxyTtOWTy7fUYfQOmgbdntZCRpbJ7DtDvJY5w6wxtfp2A8McvV7pditLgR5TXCq+p00T1UywlkO7x5/x0tEqjR2x4VjtNWnxsphJE+o+rSD1m/izlsfSK3qJzEcSYn8A2qIzDPzgO2KTdBqua9pya6rh9zdDD6pPxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987995; c=relaxed/simple;
	bh=jRrPVVAvrp3Vll+FUIssss1zRjuem5ArSwL4fJny5qA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E78Ymc0iUg1CdMHHEhQjZ2LqousqGorDTGrKszEN4aihVhElKks9i7xtTTBvrDnu4LY4fZ1rbKwjCLz9BYfRXwkMh/JekHY/69/9tIDvedDqlqVbFHXaACC0XUnV5yFnqEqgXL5m+sZRBZG1reOPQb9N0W1NDSyHOgd/WHfa4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKnYfYO/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb2191107so23560375e9.1;
        Tue, 10 Sep 2024 10:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987992; x=1726592792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQMHTCEpp4IX3yk3G5kxDgRhnrTtnfOFN8NLqXpo8sE=;
        b=gKnYfYO/MG+ZQp6nehF1BZpxRQNJUOuw70QVcNarRSkm9z+Jx0pamak4K5S0VEEwkQ
         X23Vt/laRFUoQQIcXudo3/2E/AL9/V7aKNUt61NtRHRVMgxrp1WmuH/4RyIDQHb4M50k
         lcZWH8GBgS9ymsUlXViRKk0sFqHsa0aEuvPi47p7QEKQr/nqOTSih3889OCZ0AEuN/t4
         HDb7yOWhJsgfEDXxE+n2hvf26bf+W3D9/IJploCaJNhYqRZiSJsxfIb9aORdQezF8wHa
         AaOLQq6WA3RGf8/2uQoiD+pMJUTVUlm8u91KoZVdUzeuwhz3QYBmNYmrZ/CXZ7rY7fGH
         8Mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987992; x=1726592792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQMHTCEpp4IX3yk3G5kxDgRhnrTtnfOFN8NLqXpo8sE=;
        b=C38POWei5fVPLzIDyKbB5XzZzYQynROghI+yIGBDvY/sx2hdqxmk0eNwFVfGWULZy4
         CkbboUXqiQ8BdH0iardN8xkdN2JpxGdEXWUDZdDNlM7oWUSgyTrTMo3rmWMWyE/wcUl2
         GmNmS++CtfjfBfUmDKDtUIFiFiN+30jTJdo0enrTGoVhwSUcprozWCmRjoDoM3jsU6qE
         fQMNOKJIh//ckac9oDNzo/gf/pgDbJuo8eTpemRP0grnAz0xgY3lYSlIeDCl8k5jRGJX
         Cszg4EUHKJ2EkwB+rKA90vqjGULTcgyc5k9b94AIS8/qr4N0e9rlqCy2sL+O63WA/snM
         h2qg==
X-Forwarded-Encrypted: i=1; AJvYcCXBWp7mWPzKpsKTHoHBO25HBUQZFG41kmX/dVIv2QNOBDot+Mi9TPwSHe35B2Dww1g/wwuv/6KuukZL2b7BNwAujko=@vger.kernel.org, AJvYcCXiM5kWAT4ROVA8DWJapNsjPh8jnzFNNm61Q23euf0U7COW62+TA5fkAe0E+FUjWlIZQdSUQChvI5fIEvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmeN921co0NlmPd0GGb5T8nswc+o9BCC2n6hA1APfjoFWehzZm
	cQ1SneCiKinMKlNPfVwAU2tda1qB+ZDu8sD64mjFkr23cLpfSVlp
X-Google-Smtp-Source: AGHT+IHCIAWbw+eAm5SROvYzPz1sWj9QkYeDiWGz2IuG8TYLQTwbpr1D/Zpp4M/M+FsBjtFTiU82Ng==
X-Received: by 2002:adf:fc91:0:b0:374:c432:4971 with SMTP id ffacd0b85a97d-3789268e9a0mr7381931f8f.16.1725987991762;
        Tue, 10 Sep 2024 10:06:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 11/11] media: i2c: ov5645: Report streams using frame descriptors
Date: Tue, 10 Sep 2024 18:06:10 +0100
Message-Id: <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 7f1133292ffc..c24eb6e7a7b5 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -28,6 +28,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 	.s_ctrl = ov5645_s_ctrl,
 };
 
+static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != OV5645_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0);
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	memset(fd->entry, 0, sizeof(fd->entry));
+
+	fd->entry[0].pixelcode = fmt->code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
+
+	return 0;
+}
+
 static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1062,6 +1089,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
+	.get_frame_desc = ov5645_get_frame_desc,
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-- 
2.34.1


