Return-Path: <linux-media+bounces-19895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D19A427E
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237561F2208F
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC891F429B;
	Fri, 18 Oct 2024 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQEdxING"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829A202F7A;
	Fri, 18 Oct 2024 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265581; cv=none; b=A3WMRFTunNbBpYFI/gGmlyq3McLjFzji+QGxiAnASXbf5DZM8FrXn0lk+HxwyUo4qZIoOqW6k53+RDG/PeU0AsE28cekIisNN8sWfws8zOt523UdwbChwSoyl/1fMTmiW7zM5/QgHGuQzOMKjU2CDN4Cg3SZZbq1j5ai84yI6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265581; c=relaxed/simple;
	bh=Z8MUiE56nJaTof0NTjgLvPG6b7BifmiJSNlhMRDyrAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVt1vQWh2BZbpeMO1a4YpkMQc0+sHf2TeBdH88f6LCbVR2+BLcR+nsyGOLK4tOQRP3ESsYKMEmasy3yGOdBVhF35E//SZ/KSh3fnqA4iBKqI2KYsMkADY2fMiixNgQKB2LDYCk8nZdRbxAgjdGqWtUUj+1Bh6Qx0n4Zj00bWuOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQEdxING; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d495d217bso2115160f8f.0;
        Fri, 18 Oct 2024 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265577; x=1729870377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGd8BHOFGtdrxt1HTKBDpNthWMTvTzeo/RdRnhSqOng=;
        b=nQEdxINGO5WB8ZYy/nHudAbj1RHqkhcq9BibGvp/29VPal9yIirkycuqM0QO8HUKYH
         7gLArFB5sMV91ixHkR35J83BGxJsodGxhvuy15qx99+/YBYgXm4qW9AN1P2L0jkG+APe
         2wycl1GptJEiutfDFTXx2MMjFSspg1T2fzE1YUxlGB9R1LlkosCWOce2Z60nGjqub4Zr
         dNA68giRMNWDWtF0CMzFRCCXF+uybMqExs2941g8EK29qpDGEw1t3yLGGj7OhUHUZg21
         nyKTVuladowBp+UBE3E3NY0ufxSLZTOPf/Woz5mYRFjSpPNbWlwr9N/eIuRm4iaePKd/
         Gtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265577; x=1729870377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGd8BHOFGtdrxt1HTKBDpNthWMTvTzeo/RdRnhSqOng=;
        b=fHb5j/qI/9xUpDz1v/Vssd44mbIq96f/ywwbUFhGHVwZzwIDI2xwZRMBEi5bEh/0yX
         i6QnskL8cVCUW/twhZV4x52R0VAwRR+Lsg+jXloFXu+0/bKS7wapOLvrQsDVWElEe2+v
         fhZu36V5vPuvmBYhvNGeB0/FHukHEg6FxJIcbBJDrPdLI4ddOM+rKHBspVbIbWn+hqxn
         atz4oIaMCN0ueW2NYTaFnQMkPuzIEYOkEysoKX5wC5lgO2BTMqQO48SnPFGIsDovuZwC
         DWxHbHhq7q7jvk+PQ4n6Xi1hQS9hNS5vybufGfwOG8FXVhTRqCtOVBmZL6ORMqWyb2lY
         fNKg==
X-Forwarded-Encrypted: i=1; AJvYcCWILVYIWOXbCJ0UIWrBndYiOquaunCh43ks6KBzSfnoFv9MGYd2tHUBJqYMXKq+QfMvPu8J8DzOSRI7xzY=@vger.kernel.org, AJvYcCWRmfA9gHbfQm/sZHG1H5tIx8rS86KEpgLimZtkHzfJ83LiL0DAx1YhHX1H6+p7R6VzdHKQ1x8BZ3t/o7zBj5Cohck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GEmShkvl8cnz50p0yv77vcTtg8qoi8T3H3Y8qAwQUrN/oPuA
	LN1v/6yZtS+8iQ8dQsndjxj6yb5LIylfIQ2PjotV9lR93pT2qiiy
X-Google-Smtp-Source: AGHT+IHRdrjdAW4wU7AByu1q5/Op/t7wPr6K9l6qAako5eWk4RYJ96XQa9YRylrBwnZzaK6dqQ948Q==
X-Received: by 2002:a05:6000:90:b0:37d:5296:4b37 with SMTP id ffacd0b85a97d-37eab2e2fbbmr2631742f8f.24.1729265577462;
        Fri, 18 Oct 2024 08:32:57 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:32:56 -0700 (PDT)
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
Subject: [PATCH v3 04/10] media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
Date: Fri, 18 Oct 2024 16:32:24 +0100
Message-ID: <20241018153230.235647-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Utilize the v4l2_async_register_subdev_sensor() helper to register the
sub-device, as this facilitates parsing of firmware interfaces for remote
references.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 520afd3d2aa3..1f2800b3d005 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1236,7 +1236,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	ov5645_init_state(&ov5645->sd, NULL);
 
-	ret = v4l2_async_register_subdev(&ov5645->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov5645->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "could not register v4l2 device\n");
 		goto err_pm_runtime;
-- 
2.43.0


