Return-Path: <linux-media+bounces-19174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176E9936A3
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 033B8282F73
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF1E1DE89C;
	Mon,  7 Oct 2024 18:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeZHBfr5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8781DE4C7;
	Mon,  7 Oct 2024 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326936; cv=none; b=vDj9y12bnNI62cF1LPzOdaGesmyh7pgrBfb3XQOkLPM8F+C9Vk5ZzcgLQS5T2C1qB+avDfSMRbmuu3t9XhhXo6p0OGK5Mr4EjzHAT1A2Eq414US9bP+G1EZrKNG24Y9RJO7tzwIGe74EoHYZshadC2BvVStyquhDSr6o9YiHdoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326936; c=relaxed/simple;
	bh=7XriRKCpYwD8owVfe8+uQIfwJyyzecNO4HObS1ODUME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GM8RXYh7kUseS+TwqJ5ZM3fdfu3Cgrd/gtlxfp5fYdxQGUKF5LoykugtV7hf/fVpvLOT5yljOY4ASezxH+NE3jTUP5/rW4zgiFSaLotx3JGQNkYzChAfjiQA+M8EvQdl5N/2EqKuLqSDJL68Eb1pNcL1ZF3ZVWcsGUCAdm1A56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeZHBfr5; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a843bef98so642279366b.2;
        Mon, 07 Oct 2024 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326933; x=1728931733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuJj8iAoHYUBdDmpC5vawKODy4yu0kSUJX/hjCQJ+sc=;
        b=jeZHBfr509CI6fpG1DN3NH6QL45JEdUm4qV+ZA8ZcyoE4ol7BWBpnhv9vJMFgsCdio
         SCSMsa8poMhP1FyvJYfKgkg3g8rdHmWLI3RvpaDAQWqjLvZB7/X9bjpAd1zKv8YXZvVo
         tQI0YQ7sDMOVZTA5RwG/2/5MfIaW5Uy57u3eELhR5K/UoV2R9XK/JkozLVV72lwseOxZ
         cJxtcrudVTV/Se9QPqQUu3MqrX6LBqmFsVXbiFmlrGnMdvC8dL/LbNk4OaB79e0m01+i
         rRvO3ci7YHvSxlq2MFQJVXAlAHZY7AtfdrtWng3vXNoHAm8ELLWHfrsRUiQMFAFx+v1A
         sT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326933; x=1728931733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuJj8iAoHYUBdDmpC5vawKODy4yu0kSUJX/hjCQJ+sc=;
        b=IAqRAkHCSnMAMA6sMesKUKbA3rXu2l7WPKoSfaFy706hers3Q4zL2B35Xv9zwmkXf1
         5+8ivi5fGy7UjpAZnFSJFAyV5jCmwE+N/HucOtsqYiZCFLDwEyx6jy8Sbf/qJdP7VDO2
         5Mg9oAYsipFPDoYEY7GMWT3J3gAQZP5UIzvl0ftvIYe4oY8gpZZHhLhbSgW7RSlXpzQH
         zHaFAzw6FU+b5V3wIhV5A5WueMEn03G1yKy0RRT6eRvzdsrjk26d/frtYezMBwZCjtLD
         Ta3rct9e8ttYxDKXvsp1XFnaRXOYYwhDELkfH6c3u2XchtYcqhkfYCdvoLSiyHxqLqVs
         ut4w==
X-Forwarded-Encrypted: i=1; AJvYcCUCQdfosy3/vuOLclXi7o2G7Abc3JJ3uVCY8aAXHvB+D2jO0RXcvsfVz7O6gBZUGAVPr49+NdnyA7+whtM=@vger.kernel.org, AJvYcCXpPcW9mfp1yoQIv/OOD2AQOqGzSAXdIZA0Pq/ejwOM4vvp4V21n9wWx7JllASw103vI34NcQnRzYCCpQwWVofpA7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFcGJwYCAlVsKG1mkXi6bxL1YaRKMOH8Pd8xXgI+6g9fQzR+0
	L+SysgTq13V+27QsrkMy7JVeV/K39ec71/rM3URXQpUxisOCpFCx
X-Google-Smtp-Source: AGHT+IGZkKa8vnRrWQ+XIpIVzr3LAbJFo1i0vzokOUumSnPqxGPrVphhdUXG8vG4Of5MqK3Er+rOMg==
X-Received: by 2002:a17:906:f584:b0:a99:d52:451c with SMTP id a640c23a62f3a-a991bce3436mr1327506266b.13.1728326933050;
        Mon, 07 Oct 2024 11:48:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:52 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 05/17] media: rzg2l-cru: csi2: Implement .get_frame_desc()
Date: Mon,  7 Oct 2024 19:48:27 +0100
Message-ID: <20241007184839.190519-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L CRU requires information about which VCx to process data from,
among the four available VCs. To obtain this information, the
.get_frame_desc() routine is implemented. This routine, in turn, calls
.get_frame_desc() on the remote sensor connected to the CSI2 bridge.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index abacf53b944c..3fd0be6a3b65 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -582,6 +582,25 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				     struct v4l2_mbus_frame_desc *fd)
+{
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+	struct media_pad *remote_pad;
+
+	if (!csi2->remote_source)
+		return -ENODEV;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
+			csi2->remote_source->name, PTR_ERR(remote_pad));
+		return PTR_ERR(remote_pad);
+	}
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 	.s_stream = rzg2l_csi2_s_stream,
 	.pre_streamon = rzg2l_csi2_pre_streamon,
@@ -593,6 +612,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.get_frame_desc = rzg2l_csi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
-- 
2.43.0


