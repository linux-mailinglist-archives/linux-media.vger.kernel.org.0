Return-Path: <linux-media+bounces-19899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17949A428A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5313C2872C2
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645B720493B;
	Fri, 18 Oct 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+7gqM3q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B5020401F;
	Fri, 18 Oct 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265585; cv=none; b=iygvD6u/P2bm08JQsPy9a+/KRMPQJiIyLEFFXGX2tRkN5ojEIEvbvk9eLouai6fjY+BiH3caL6+M2lOzdAEfa3geOL+1Y0THlqaXCqiExkrgawb2Yc2zLCH7wk7mEJNzuf07rhEh+UuFz+2kiGdveawEiOYRX1b2RPhPMNHwUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265585; c=relaxed/simple;
	bh=f0Mwr+ptIIXMGBAoFhINE9Cf+b0Gf38ktqtVQlKOavw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jItPj7/e30vZK9yXzKx+Ir4eBGoCQr/DkzGf2RSctmm8PMeYJCq3/+wIstcfwTMgsCf7KUHGLcRc8FCR5VawK3jgVWkdGtIzBEhgFxb6TpJPCpwnzDzQd+zJqf5xVqnBkGhCeGCfSwdbf5LwwCEsSzlQv4LfbPIUQWrXhiwquBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+7gqM3q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so2015896f8f.3;
        Fri, 18 Oct 2024 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265582; x=1729870382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8HU4+NPJIOQdRkx+IWrO+EeuP4w8/aQF4LuT+SJSN4=;
        b=j+7gqM3qcTJ9ANW8Mrk9JiMCGeKBcovv+AAueCZRvsb0wEpfyKJzMryVcQFEREFRfX
         4Q9TPwGwgCaGbAPbDl/VEWjxaYzj+3viwA6r71r3Xne43no648EtQTPY79m/E+3Hvx6L
         PrbP9Xs+FmusZpm3YX3C58ikb+cg440M7KC5Er97hwapTSTZ53JmuFgDFADq5cgLT6xX
         a0xfr2XMXK/ZsaHDzk83f3zUTFFYImXIh05bMxenr0Q7Oqar+7uyDdLDccy029S2vKe1
         ih+POdzUkxA2UhC7rZaj82YApw2rdzZqj0kHKsZfVh5cYJCDLLmZhf0NTbHfee4Uy088
         yDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265582; x=1729870382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8HU4+NPJIOQdRkx+IWrO+EeuP4w8/aQF4LuT+SJSN4=;
        b=KGj/abIBBjMiiGW5HwfJ0tDVhpeTC7l24h5a21YbKWqVvGizYTliL+pNom6AYOaJhn
         M47LggdHZxYR5h0JmobQ/uxcQ8+Tr2C8iRAsU1SEm09QQ96BbhA+VzEwhdv0wiJ6ESNC
         8cYxJgUcPU7Nu7fGzUJemaUjCdzISj3pf/inE1OQAZ63QiDbvZLmokudjWC1eqCI8A5M
         KGoOdyncmd4I9wmDsaYpGgInsa439OT57fN8iqAYbxiWTHXqvCCAgXAIcVXuIPBMbY1W
         AB1iSTqH7+6docpQqYYmLNM9ijjK3s6jkP2oiurNG5G7QTv9v6vz7KBDI/SuonX+qxaw
         KOPA==
X-Forwarded-Encrypted: i=1; AJvYcCURwG35SR7bwGnog+S3KfZTk0FkYtcBTaIg4IuJVhcjxNPwsBXHWiAD+U1s4qOOISFttI8oIX3DULVQeyI=@vger.kernel.org, AJvYcCVStjViKj5nsWG/jmPHyM4PH6JdV5s4O0j6viaikNhOGyUDRoOFuqnESlYnMgwdsCkV5iOhixaALmAilM2X4KkfQl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrmyCSLEhTnjwMdqeTIkK7h5g8zoMaFedcXThITrRgeuDLby4u
	hJ1jaTgPj+ylklUSnLvsICvXR/C7cNaasT+4ydJ1nU9kBFH5EoxN
X-Google-Smtp-Source: AGHT+IEmgc48One+kAunpZpy1Byv+n2iVHAsoZ0w7YLqMSLPT8TNqhRw4vJkYj8YGjvU30zP8zfA5Q==
X-Received: by 2002:adf:f645:0:b0:37d:4c40:699 with SMTP id ffacd0b85a97d-37ea21c3e39mr2853193f8f.5.1729265581567;
        Fri, 18 Oct 2024 08:33:01 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:33:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 08/10] media: i2c: ov5645: Report streams using frame descriptors
Date: Fri, 18 Oct 2024 16:32:28 +0100
Message-ID: <20241018153230.235647-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a3b9402d39af..e3706b6b5621 100644
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
@@ -819,6 +820,29 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 	.s_ctrl = ov5645_s_ctrl,
 };
 
+static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	memset(fd->entry, 0, sizeof(fd->entry));
+
+	fd->entry[0].pixelcode = code;
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
@@ -991,6 +1015,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
+	.get_frame_desc = ov5645_get_frame_desc,
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-- 
2.43.0


