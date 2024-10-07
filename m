Return-Path: <linux-media+bounces-19183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1139936C1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D48A21C21110
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE761DF975;
	Mon,  7 Oct 2024 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbdmg4Sv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822421DF73F;
	Mon,  7 Oct 2024 18:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326951; cv=none; b=MH+Xm1ae7ZzU5Fbr01XNACHU2j7uoEAoKAuQPl0XXB5/f9S4zmTYGJ+G/FgJv4vbuIJGQ7Yigm9A+L9jKMTi1P7gFgUz+JnExQkDL1F8ZmbvaPi0LcSO/h3Njgz0hDXRU4ppbnAsevimuya37/PBohNiwn9BpK+YQ5csuEens54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326951; c=relaxed/simple;
	bh=RsSdZNrx3Rc7LnOARDgr5Ae2+j/EXAx9YIy2cRRGl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjTw2az2IcA/3Ov8wAukF0OZBJxXXiGFFEWgIzUDJ4/yzyjvjoX534GRlkp6STUsN3ICI0imObH1PRWaawxO07OnO2OsNfWcI2vIaRIdej2GSOovsYuH/eSEtfwh4ZEZnDeSUHRpqSvjR/Jwkt8m7aL2+A1x0IOn1ZcPKY9iH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbdmg4Sv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c5bca6603aso6091180a12.1;
        Mon, 07 Oct 2024 11:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326948; x=1728931748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08FAam47UPSI6H+mP70G73QMJj9mpHg1g0p/c3RuM3o=;
        b=cbdmg4Svy27v5+3STVQoT81l0Amfr18wIAE2TD4OcY4zPFiA/UJsExV2ZOUR/5EdJp
         YqtrMXmFpPsj2T1VwzNJWp7iQNUa2CfZjkGy+3gnjnmkJpg5+lSYdYCCxMvI+gl9cLTc
         bcyqWdtjEmg5b0I873W7lyaozdPfWs9/2gMtT1/fGcEJ24j0iHR9OyHSGRkZajF/bWKe
         xmN3cjBH8ylws9AJcVE5BBZBsL8HRGwEwIg9l/FTq+z4eWM9LO+uCR17CDhN+0lZhT+G
         kIAaMjqFKJ9YQaM9OqZPZ7/AC70fQHNYj79WXrDIJdLm38+WuPRpU4tPOtN3d26yJNzS
         9UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326948; x=1728931748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08FAam47UPSI6H+mP70G73QMJj9mpHg1g0p/c3RuM3o=;
        b=YhsSRud6QAyRzavvmAn8E1JEZ/8sE1DveAdrRSSQUkhIJnF/0ZlX6wbmcBu8yOSmgH
         3nh84fuNprlzf4Wlxl+gCfzlvziIhTx24R+SgWC5Cogl0oUjX9ByMTaeYzmRbt0QKVrC
         xAWqFVYUQXHlhWexv0xmfq2CMthRSfqT4BK6U+1JI2KOJspu90CbM1xmWT7emdeCU6TD
         SCqgQf6tMQT9+8sgsadE6ajKEaXl2QCwfnyFcta3kHbB1fMcRGRX6PG6DEOTFic8OZU4
         vhusuaPRkaSFgblfbQuPKvMsSfarCLR4E/7tFT4TMjV9z44u3J6fJ9jfzmtcge83DSu3
         14VA==
X-Forwarded-Encrypted: i=1; AJvYcCW9cEic3dL2DU+T8NZHIwrfNGaV6+t77dVKc1y95W0tGFZh5yDkylRZGTlaLvvU9h/v850Bf6vMPbBByQAkW8BqwCQ=@vger.kernel.org, AJvYcCXZwURCZUHPasRrgnu/sOKpAQOe+19ua1sM5sYTuTlbuwablX4ji00Sh7XvVJahjxCf8R7Po7Qt6uJDE5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynhbon+M0yLDC+KqHKLluwsiY9sDJYzyaJsuMMRQSdCwkpv+TK
	6k5wXvVprYQmkD5SqfUpwt1S4s8PUI6hYLoOH9Z5rGT7zDv7MKwj
X-Google-Smtp-Source: AGHT+IHg2+Nth1CMVfZ4r1VYzlkXTkDPoovOxUkEI8i+SAlaEmpH+/WZFFteM2Mnj4QL9pXThm4qdQ==
X-Received: by 2002:a17:907:25c1:b0:a91:15dc:31ab with SMTP id a640c23a62f3a-a991c06c9e2mr1123521966b.53.1728326947758;
        Mon, 07 Oct 2024 11:49:07 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:07 -0700 (PDT)
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
Subject: [PATCH v4 14/17] media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in enum_frame_size
Date: Mon,  7 Oct 2024 19:48:36 +0100
Message-ID: <20241007184839.190519-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Make use of `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size() to
validate if the `fse->code` is supported.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 7b76d495cfe4..e21142d3b67d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -573,6 +573,9 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index != 0)
 		return -EINVAL;
 
+	if (!rzg2l_csi2_code_to_fmt(fse->code))
+		return -EINVAL;
+
 	fse->min_width = RZG2L_CSI2_MIN_WIDTH;
 	fse->min_height = RZG2L_CSI2_MIN_HEIGHT;
 	fse->max_width = RZG2L_CSI2_MAX_WIDTH;
-- 
2.43.0


