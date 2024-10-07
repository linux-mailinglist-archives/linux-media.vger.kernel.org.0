Return-Path: <linux-media+bounces-19180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 381849936B6
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09CA282091
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F82A1DE2B6;
	Mon,  7 Oct 2024 18:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3GpGrvo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE221DF24D;
	Mon,  7 Oct 2024 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326947; cv=none; b=iz/mLiRQZ+HF7v7M0R3CDVVBsACazQzknc68jfwGgBfYJl9F8S2qTyleFQ11Lx1lgsFM77uMT2AqeELb4406qgONwAe573SN8oKOAS+PmfdtnZqU3Tb2Y/GC+YUd3jFtxM8srwftIA0zvLV7ARHGfSCe3GyB/hmChzvkdedRkFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326947; c=relaxed/simple;
	bh=Gmq4utQK+adZYhL7UUoG0fDZ7cjEvOJPyR/JCmBJmD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lw3PN5FG9UnYizjmYZ3REGs37GIqe4DYVof1rUFdTKUWwjEeGNU3+JfPGn+v10Mo9g/dGYh3ffvzPySq7p79vpzowDap6vph6ODlnNVHHGEkxgCFbIDgaPcXju+4pkRo4eLFbMJcaSFeFKGu6t27cgEcrDntQhX7TzcvZXroRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3GpGrvo; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539908f238fso5345631e87.2;
        Mon, 07 Oct 2024 11:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326944; x=1728931744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb9cm8GogiuPGh5bPslgEBHPGO7Vg4hjXnxPsK5tFso=;
        b=O3GpGrvoNEJ2sEdJGOZJUrSupGFhjqNcm1fkq+efzGjQ90xBh/PJspj5zcAAS+ExrU
         5pTiHRws3KCbAbtUh5xWMGFZvAzkMgM/zElEOFR7qp5/tEj9zHEA9FPkNg+1TA4vkPwK
         MJ0aNsOduL1U94XUmaJvw4Lbtty1XIpF9ulehqHdnzYchyJHjH6LNbrKbBz3HfZlqK6r
         c8k5PWZv7SCik7TxWVwQcDITMYp1cyLhS5S09W4s6/A9m1t1eUfz4B3TTGVmtDIWNhXV
         bHX+QYHVjdOBv137MwfG4LhDTohQdDEiy+7kzFKTTVW3S7hcSw5QWrQGgQwUjZi6aenj
         /8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326944; x=1728931744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lb9cm8GogiuPGh5bPslgEBHPGO7Vg4hjXnxPsK5tFso=;
        b=cBSpc2WbQuIejBb27kNGttKejWcRaLcQnfrMUk4HCyGrpqKRgfkaCjJpMS4fhk9odM
         5LFFRjv+dcifFHd8dz5L0cFDfI9h6B46HP8fkMMv8YQ7+twa/7D9FhFaMIA2wUG+Le9t
         bQpZd3SYanW9E216fU6yGkahPxyIlxqLiLp0o6rgJe6kpUe8oyBPEC75oJ4chwcYI1eJ
         uPt7lUH4olzRaQ9auFTI/U/jOFmi7Me22HOC56QC2T7QVUL6cB1MrqMcq6aUFkE8eqfS
         qrkFe0VKUTUzB3Y05k0XFpwRlxjAJPYbROkaibK8BvariO3uJ5KwI2WKoZAYMzTM3ox2
         fIZA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Fe6HSgOx6gEWuhLuQUszT55glJ0XemPbIzhG2eT7iVQ8dewF/NYjZJO/QJ3EcGOwIEJsKaJg7HBYG/g=@vger.kernel.org, AJvYcCXljTcvLAVhD8FXYmO189G/HYa5VNVOHwOtb8reI1x5mTS3Z8WFLwtLxKPC2OjeCoAf8kWk15cFF0C05r9yD/G2Q1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WRTD8NUB5jC+A0DjBlAJVmCi98LUhJMdUVInNTP8EZpS2SAG
	LNNI8HxH9SujOFWgxNzjTEbojHliYcIrSeZMRsRXeEJ0GOSoi7KJ
X-Google-Smtp-Source: AGHT+IHIWhDL2zYM56ll7KHchCRSJhPblusn2Km5xw7ldV9OjSifOPWq0jAF25M468Q/hh3v09ZG3Q==
X-Received: by 2002:a05:6512:1250:b0:536:a4e1:5fa2 with SMTP id 2adb3069b0e04-539ab88cec1mr5872499e87.26.1728326943705;
        Mon, 07 Oct 2024 11:49:03 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:02 -0700 (PDT)
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
Subject: [PATCH v4 11/17] media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
Date: Mon,  7 Oct 2024 19:48:33 +0100
Message-ID: <20241007184839.190519-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use the `rzg2l_cru_ip_formats` array in `rzg2l_cru_ip_enum_frame_size()`
to validate the format code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index fde6f4781cfb..fc9fbac72762 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -166,7 +166,7 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index != 0)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
+	if (!rzg2l_cru_ip_code_to_fmt(fse->code))
 		return -EINVAL;
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
-- 
2.43.0


