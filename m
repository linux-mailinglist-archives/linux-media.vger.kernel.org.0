Return-Path: <linux-media+bounces-46177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC7C2A307
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 07:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C6A188799D
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 06:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFF421883E;
	Mon,  3 Nov 2025 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaQODxYY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83098BEC
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762151434; cv=none; b=s69fydI5SX4W/WP36NCZRshxvUSbJbBDB4Cy5RZP1Ux6lDqjYLC3oi0qFrUtT87kiEBuW8q6gtu1/oDZZl+jOcgqDylFwTqRvnqyrRdq3YWulxT76uF/PencQcvPl2DUjDwaFkXomEbQrv43GuG+AMPBGcwJEI8Jzqzb9dJUJn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762151434; c=relaxed/simple;
	bh=q9U2/lglyvUZ+6SzKjNSNlDwmEjWmsKN97d6E/pOIIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqtOwQ6DrwTWchqV9yFVJt5PpaA4ptfqJGXw6nX31ft4iIPcT6ZOKJcDxw55Esoic0YtCeD0eV5ghbjdqB/jZa5UD6pjJXC5Opf1MTkNXtfPxPolRs/mQObuLbphlKlmhLH79tBnksn61jlUU0Pgy0HGhEB+wHg1UN0O1jDkGn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaQODxYY; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781206cce18so4310288b3a.0
        for <linux-media@vger.kernel.org>; Sun, 02 Nov 2025 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762151432; x=1762756232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7GOu69hsNGmnIy0MHORKTrtvDnS7Wvg9FFJEsAiMq0=;
        b=GaQODxYYmJhe7UP+0MMsBGc3nF/Sn54ltQ0g0/ZJm0QfbGet+yw+XPYvK+XQFr6koM
         w+xMuiiwmC9qqsqNWkJ+cW9WlljOSLVJWgT8E3cL01VcWdUkqq3Z5sMT1AyVzMHjPeYk
         yvaVxUi2kKUsK0DkTiWk8Pz4hzKEQKyoQ5N47PwTC8MnV8OOmGsLfVMi1krAWHJG0SFv
         zvtNZeXhOGDvcrMcah6ma/HryEjRHwWPy6q19GeXGRluO1zyX0x92v5f6guyUMDP32w3
         zmHuP7g8br+XMyePhgu5yDyCDKFLXrJQRGI6TGTZRQwgplam2X6fuNKjE1USGt2Zp3k4
         FiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762151432; x=1762756232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7GOu69hsNGmnIy0MHORKTrtvDnS7Wvg9FFJEsAiMq0=;
        b=L9Fk1SkXkyOhFjHntJX9LmhqYUfjCoteN7lOoTF1LC/ZvyV4pDWyYrRCdn6XCcLYZT
         WMs5EAP9rvJsFZ8LwD3qK4hWT/M+F1JnqBxUakHscG5p20tA/S+CjF5W4hcsee9VKtba
         3dSgjJRw/SChSPdz8q55h4LU+DeFiK2qsUMtj1k01WFab3ZCRestPpZgjqq439QqBZ7/
         bLQLT5C6rwdSXNsibghE+IbiIXufpq8qTx0SNgcu7SBEt+BWvHyCh2WnWcOO6QK/EMWv
         k9X1CvQuoEHR/A057Sm8xKgWmlWGNk767+BFlHazcd6Hjn4s05XHBH6VHjJ1hOkIQJ1K
         hUwA==
X-Gm-Message-State: AOJu0YyZkBUy8rwiE/sA5t2WIkDqm+Ux+W2HE4XLX6lucM4FLGsWgkyZ
	g+Xzt5j4Bdt31x6jisi8ebP5uf2eWY3IYx1Wg4qsP76RDbsX8mf+CK2x
X-Gm-Gg: ASbGncsAkvtCBhOSDusGMI6hkQsLC/RHo9fNyxg5O8rbL6qBC+fszik7ZXlwmvTy9Kf
	IFGsSnf4I3o5fdfBtVSvIj+yBAKW7me6CeAQVTcQazK+DX6o7m5/4ZT9B2PSyBZrKf4Oi4FFepF
	6naPQLkoUrp7EZ+ZCltWnYGhW6KlqFGOkLJQFkLL9Gm+o7hmUgeCQleTz6sJDw/aXkvHBhpR1Xf
	XMnf+WkN2vtyczCmtAKw9ps9q7z/WYlCvXZRRE1BcoTuMyVAWGUJ7H7P0WV+Omkl//wxAVE5FlQ
	D1dNyjraico9Tm3LzV4MxzdXfyOTaVphcN5tSrbO1D9EDQ3qZyffXW58cVfzFiBP1i1qhCfsQ3i
	E9pP7X/TYNSv1EpznLSSd1AavL9P9ze7xG1VySXI1zuWzN9dSO70A0UheFjTYNT3p3JZTnUDzol
	ZJXaNmQaFyK+s9zwUmTV2bHZNhnHwj7dcjQaXwlloGZwt+gndIlToZ2k794P4s3RUf3cDAXs4B9
	TnA9H/EUlRvZaI=
X-Google-Smtp-Source: AGHT+IH8JSZYoTXiwFVK51/reIB6Nmxi0ztVqfUYR2UVDlC40mTO06fpWw0pvOd2IY7E3YIpGwSnRg==
X-Received: by 2002:a05:6a00:26c2:b0:7a9:acdf:e8f8 with SMTP id d2e1a72fcca58-7a9acdfee6fmr4765880b3a.4.1762151432018;
        Sun, 02 Nov 2025 22:30:32 -0800 (PST)
Received: from opensource206.. ([106.222.234.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ab30909fccsm2143549b3a.20.2025.11.02.22.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 22:30:31 -0800 (PST)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] media: vimc: capture: support custom bytesperline values
Date: Mon,  3 Nov 2025 12:00:27 +0530
Message-ID: <20251103063027.31858-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow userspace to request custom bytesperline (stride) values in the
vimc capture driver. The driver now clamps the requested value to a
valid range instead of forcing a fixed stride.

The minimum bytesperline is width * bytes_per_pixel, while the maximum
is limited by VIMC_FRAME_MAX_WIDTH * bytes_per_pixel. This makes the
virtual capture node behave more like real hardware that supports
aligned or padded scanlines.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 7f6124025fc9..7164ec51eb80 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -85,6 +85,7 @@ static int vimc_capture_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct v4l2_pix_format *format = &f->fmt.pix;
 	const struct vimc_pix_map *vpix;
+	u32 min_bpl, max_bpl;
 
 	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
 				VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -97,8 +98,18 @@ static int vimc_capture_try_fmt_vid_cap(struct file *file, void *priv,
 		format->pixelformat = fmt_default.pixelformat;
 		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
 	}
-	/* TODO: Add support for custom bytesperline values */
-	format->bytesperline = format->width * vpix->bpp;
+
+	/* Calculate the minimum supported bytesperline value */
+	min_bpl = format->width * vpix->bpp;
+	/* Calculate the maximum supported bytesperline value */
+	max_bpl = VIMC_FRAME_MAX_WIDTH * vpix->bpp;
+
+	/* Clamp bytesperline to the valid range */
+	if (format->bytesperline > max_bpl)
+		format->bytesperline = max_bpl;
+	if (format->bytesperline < min_bpl)
+		format->bytesperline = min_bpl;
+
 	format->sizeimage = format->bytesperline * format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
-- 
2.43.0


