Return-Path: <linux-media+bounces-18092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD0E973E14
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D291F26DAC
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5D41A2C00;
	Tue, 10 Sep 2024 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew+Ju16R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DFD1922E3;
	Tue, 10 Sep 2024 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987981; cv=none; b=cwiG6LODcXHUAwquWetmokeccIIImNKP8p4w1Fglg0pLNvx31mqh6EqlxOkeegfdG/cUuD7TR2OgLW8YD8Ptv1/c+Tv0SSzeUPE+T0Wf1R/th3ybaImrSvyQayhKEcwL6fpaohhh/ejAKEjmikl+yL7/pt12IOm/FaUIzf0d/bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987981; c=relaxed/simple;
	bh=aY/aJQpV38qNROExL3xJqYKRw9fwpPUOQxSrGJ5yIiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Je/FtU1oYPYVyLOVfqGUvN/T2w8s9WcHmYBjl4Da1P3w1mF2lJgEP8J9aQAojY82yMCxIALo+JJSj7xUUxJnDPFVLbqjm0/+sWcNgoSDqIwIgd9gtPA+RuiiVp1eaxwTZ9U77+7+y6A57PWwPJ5zSfaYQl6UlPG02LL24ZHMPsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew+Ju16R; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374bfc395a5so17203f8f.0;
        Tue, 10 Sep 2024 10:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987978; x=1726592778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc7MVYbBTomhAghG+qJoHxAlGvl31VLQMoetsad1iTQ=;
        b=Ew+Ju16Rww2coDa1KTz4nSnQ2YPnhJFm2AeldzViBtOu57yNBagwJX9UW9aeTnZyLt
         zxzV/EeKnVbxL/FY49aAGu3nqpk0leSGmscsXRwsbiFhIcNHQCmjqZ1f3F+AMvYIqByW
         cp5HcR1j09ty8xq1sy3BQIgQBQPXFFIFxJw5fHK4DTqtMvMAwbUCWfZwDugUPY+NbN1K
         PwFqOhr/X33LqbDCuwbbPXdjNSjEjrj5am0NmXzmocK/Zf0WzEFLOF5d/LapdnCzLI/0
         SFZiD/7Mx3t8R3P/DhMPGeMLTGKFfIJ9klxi1cKxiLDrP3Bq2eFd2x/3XCT4+kbFrtmg
         Smhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987978; x=1726592778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jc7MVYbBTomhAghG+qJoHxAlGvl31VLQMoetsad1iTQ=;
        b=d2y6D+QyF69PEwtB/XvsB43ULF9wE9L9FWoza4yl+NETCcNrirtmku+eSta4UPXGID
         9CFP1ddDrgZTl/D1SZQVep88UE6xhnsue7wumx3jvsNL5B5o63W22yv/glFfekSUVe1Z
         Kju/g8vqCXD1q1QSDU770EFDPu3Olv05ZWOEXoj1G6wI/FFyBeGDzOyYHvw9PMXufriZ
         J+tWmvEA36S9zyHfHEfwaz7I9Oc1vGPkG+jsXA+kmRr13jSwPAq0ZA2PWVmnoEaOGiAa
         U/oyxoTXI0Dm7uEd2fmkDtlKSUEUrWbZ7JJhHxZEcoqSCgQrHAAnniWzDKcOxUbySben
         Lqlg==
X-Forwarded-Encrypted: i=1; AJvYcCUMquM5MW60Z1nikoTioEILyaCIvWUSLWmrjof2euhr7Ka47/FgPa0VNNjaZGpX78hDbGFH9sIdc/NFgNI=@vger.kernel.org, AJvYcCVbXtE+AByvORotSqpUgn0tcrRQsY/TcD5mAhFPj60uMPt89w2qgxr3JuqcgOlg0+LXU5B+pt8n6GjOCNjeK9R1v9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FLOPGhDFhR+hTmGaW1uEviY/eCZsGSv8+VkXRXxlPDacRVQr
	CMHgGK7IJAempHSLIcHA/0spzeZ6Md5KpTpl2+UZmojoYM4B5671
X-Google-Smtp-Source: AGHT+IGdEs37CqFnTH/L3fiaagnY/yzdCuig7ywcrD7kKLYsNFPo9lnDw9DrB84U1oqO3LR+fgjqgA==
X-Received: by 2002:a5d:5f87:0:b0:374:c400:8556 with SMTP id ffacd0b85a97d-378a8a1b6a6mr3012695f8f.11.1725987977697;
        Tue, 10 Sep 2024 10:06:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:17 -0700 (PDT)
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
Subject: [PATCH v2 01/11] media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
Date: Tue, 10 Sep 2024 18:06:00 +0100
Message-Id: <20240910170610.226189-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The OV5645 sensor exposes controls, so the V4L2_SUBDEV_FL_HAS_EVENTS flag
should be set and implement subscribe_event and unsubscribe_event hooks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 019979f553b1..6eedd0310b02 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1042,7 +1043,13 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
 	.get_selection = ov5645_get_selection,
 };
 
+static const struct v4l2_subdev_core_ops ov5645_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops ov5645_subdev_ops = {
+	.core = &ov5645_core_ops,
 	.video = &ov5645_video_ops,
 	.pad = &ov5645_subdev_pad_ops,
 };
@@ -1178,7 +1185,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
-	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov5645->sd.dev = &client->dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.34.1


