Return-Path: <linux-media+bounces-19467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 876DC99AA50
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9798A1C27395
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25B31DC753;
	Fri, 11 Oct 2024 17:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxQUoivI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54061D1E77;
	Fri, 11 Oct 2024 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667884; cv=none; b=OTlN3HY/nwQ5NUEsjjCN1UxgDqwChCA4q3m4KNlnF11hamrDkRKhrcr2GZNKGTjNAMShdqBNuTsseaG6RKAi2TASv04pMMcFu7t79eWWqGIRYcSEaaqp6+xXOIBeP8PNTfKR652OHnGDxYvZhjtA0JhDjpX9K9376ct4OvwpUXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667884; c=relaxed/simple;
	bh=RsSdZNrx3Rc7LnOARDgr5Ae2+j/EXAx9YIy2cRRGl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTYzL/rnLkhjcJ+mqEJd6UJtOTeChZ1fXhYUIhHaiAglA9FbaX/3+bQQ//89GoLPZ8YN7Wj5AZKtbZEko6qngVC1YdbBGrk8a9aMrZZIEPxN2tWojIXGV01Aw0RXF4sPRHEb2kk0MUMTeMnEj+zZQnOks3EqLjflQwkITEEcelQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxQUoivI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d47eff9acso1234484f8f.3;
        Fri, 11 Oct 2024 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667881; x=1729272681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08FAam47UPSI6H+mP70G73QMJj9mpHg1g0p/c3RuM3o=;
        b=UxQUoivIzObX3XJloWM+C7x3Xse3x/7JetxLnZxDWpqkiupFiDL3ujjPiDLYahIoko
         rZUddcySMzAb7ltaRiq2lVxicHHAxHTWy/mS3582b3MElb7jyZcWuIJFcX3XW9sk1RbL
         LteYe0kqhmEkISI20S/FNx962vvorbZdrtWTcrxsQiPP86PlkCxCBbvDQ+LRR0/po7m/
         6LyOtSZGsQSuOoZy3Q6Fzr/DqQDDbEvNB8iF17XLzocsxCxfAusADdEKGJVZtAepkq6l
         cXuRcXydolmGPn6j5T+exxEpq/j2LGcINSXK0D96nwGMKsnhHnTkgVn5hD3Z6ual6Pb/
         0HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667881; x=1729272681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08FAam47UPSI6H+mP70G73QMJj9mpHg1g0p/c3RuM3o=;
        b=kCP+Onn9e6iwsGPk87E3BI7i8rVXnCFJUn1XSSYkDmD9pRNXjQ0ffbHFgF3hdMFzBx
         2OwxsaynP+6O167umDoqmqD28iyQwvWSr1hzZ2t7wZV16k6AcDK0LifBsTHcSZNsg7PP
         dhJecPCWufV6HXvbbn1lhsma6abDurH0au/z6VTh+gpDFIIObRwXi04RxJ8lPTzFfVkJ
         39qsA33wwjziQwSfv3o59mtH4cfsPPgUuKIQ5VqT9xQORoOSSPboFuRjS/z4CKyeIHkx
         3vLOipooR2JwacMBnUV943mX6qCCpk9+w8ozpS08MxLI31aWNQrTSCoQer7Txin81wn3
         oRpA==
X-Forwarded-Encrypted: i=1; AJvYcCU8f+hwgP1RCQlEzkV+eS8ohS9enbZdLld6x1lJ1oEk/puB7g7V3cYMsxz5WsXG6ebcns40vumLXgh3QKA=@vger.kernel.org, AJvYcCVyLjEYa+4boUkzSyZ5xMIWMwns6M6GWaQOq8b5MVFHLodaFJgevqqKBkVSMVhAFxvueStvDhgjtNYM7zpFjlcyVlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/ryk+JrtuIIPhOQWtOOX/fR2FgH2QYh1LCAoOQAmNzvbzIiU
	+HxYjjaWvofUkZxntxRuDS3YpjGV4YwmcaFUA8TKxuZrtTjaOid6
X-Google-Smtp-Source: AGHT+IE/+YdT1TgsNx+098QeAWYkq+c6emdAovRZ1H2XxXlWCApndzkDj6NW3VWT+bUw6H7E6gLDlQ==
X-Received: by 2002:adf:f70c:0:b0:37c:c842:a16e with SMTP id ffacd0b85a97d-37d5fe96419mr304694f8f.5.1728667881003;
        Fri, 11 Oct 2024 10:31:21 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 19/22] media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in enum_frame_size
Date: Fri, 11 Oct 2024 18:30:49 +0100
Message-ID: <20241011173052.1088341-20-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


