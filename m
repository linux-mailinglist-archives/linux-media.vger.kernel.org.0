Return-Path: <linux-media+bounces-45084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B28BF35D7
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 864E4408651
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3412D9499;
	Mon, 20 Oct 2025 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QoTuRiFH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278D2286D63
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 20:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991501; cv=none; b=dz4ekGOMF8YOJI/Yw1uhBwUP/3trg/bfqjrGEqIb30bZ9ou5vKjLMJcNfOeTr/ByKTqwB3YoRmXorCTpMJOgXitjpiv6UtUvXqaRxUGESK9wNL1aIfaf5uoCP4alJ2npwv7mdtdqomLzvrB5JpCj0//zCNJ/X/OLdInltC7Enqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991501; c=relaxed/simple;
	bh=EWAMQZDJQxduT4rtJbL/Q1SO+4wZ+3sUMZ2oQUIjKx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qdt1XlBZwa25kih1zHY72qqKtQ/76nhuOQXndQk49zffsY8Rh4mg1EbcmLbd/7QWp3xmX37pqyMbKOsTAs1VNKeTN9CQ7m5tqjfQ5TgqlLJZrFoCdUg1eatEBhldcXGnk4U1n1e2NjjrnBB5Fhz0RkDWY2mDOjQOraZL8YMv/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QoTuRiFH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-376466f1280so49908451fa.0
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760991497; x=1761596297; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r56O9mvxtSY5qJpEf4fOIaAUlYt5/4uKLCNd8pJLXy4=;
        b=QoTuRiFHj0y/OGRQE1uenVss+8Mghtxi3mptzQa3/otOOTov3XQvx+rO3KSF+E635L
         7Gw4QiY91kkBxo2EHfYHdIHwm5h2uBYF1T4LWS+/IdGpcH+1ydvUZBVhx8KTG1lQqyfa
         V+0W+VPlUW3z3YbkSPWikpR1LflbjJVxsqbIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991497; x=1761596297;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r56O9mvxtSY5qJpEf4fOIaAUlYt5/4uKLCNd8pJLXy4=;
        b=cPqMZsusweiQ7y2KeDe6IpJ2hQX5bZLvLKpjS8ld4GGdRIwAW0LoGFPUa/nGDmKy6V
         VxOS48inaZMXzqjPviK9mesvbos2Y3Om1Tz7FWKHOyb0WcjNb4MyOm6KIGZwODE12rxA
         w9MLVrSDY4BAETXXecK3dCbgKTBNgA7dclu+xiruTHb/KjjG9InsmReOm8hU7VAB20ys
         VwJkRE/rM+oSDp+5fmrmODSjf7OOd22LF2Cnjb8DYEhna/mneaO2ZjN/t38V8WkI9NTf
         fk8an2chOvgcm2/v6B8VBzyYsU+rQl1SvoLFhJFLDeMIDeUGrdm3YLXHxLfXU4VL43zp
         qSCg==
X-Gm-Message-State: AOJu0YzoxqBdV5vYAaAERPgaY3kcheBT34VCXu+5JRZFljI0fyPCZlIl
	IY7VHVSpAICMelR07cxTmETd2j1S07HoyJH5I0RsM18I4ndT+P/gp4ZO28O4sEJV5g==
X-Gm-Gg: ASbGncvaC405q3PNSx1ZBFnJ1O3lBbY32uGE6+cG4c47dBJcr71SY7jHqLwevCYkFNc
	LrQhGKZ7jue2aP/hcgEteWZOT8/R/L5JELDFC7W5XuIuQJqt4lMk0fh6OOxqZkugt/E/LazhpMX
	3ykMNG5Wvs7bC9bSWO1iVy0QlVXofAZcYSQotcbMgfKhbcj8S/NYMGAoRNfa8Jf1wLIbWSLtT6k
	2FIj8w5MbX7DX60AO37CoUjDUn1ejT7yOcurItqSs65fpJ9p6O/hXUTb/V9CjuwCNcahc2Hwpk5
	xCekZkUr7Xk4ezONR9sIAnb2e1awUjYv7K/1kvQMEpxAAyIypWmDntbIphv2zzuY9u29uy+g5pI
	dhBpSCSv6g0p00Hci034oGss3mZK8wIubqx5zo87fmDym9CaOgz6xjXgf4LMBv5B1uPB6VnakMP
	pwHRgn6yB3fMIcFpZ5+mPVTIbgmm5z6W/lj3GeqYOnF09a69GUwqTJQ1qgveMpqoEBJg==
X-Google-Smtp-Source: AGHT+IHETxJ6w1KzieigKaMEPUVnnKpx42BSC9i3WPVemUmwa4hzCCWJYg4zCDNafpV2HQvagTU4TQ==
X-Received: by 2002:a2e:be88:0:b0:352:b6c0:d33e with SMTP id 38308e7fff4ca-3779777cf98mr42861861fa.11.1760991497146;
        Mon, 20 Oct 2025 13:18:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91f3008sm22940341fa.15.2025.10.20.13.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:18:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 20:18:13 +0000
Subject: [PATCH v3] media: i2c: imx214: Rearrange control initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-imx214-smatch-v3-1-2c9999efc97c@chromium.org>
X-B4-Tracking: v=1; b=H4sIAASZ9mgC/3XMsQ6DIBDG8VcxzKWBAy3t1PdoOlhAuQExYImN8
 d2LDh1Mmpv+l3y/hSQb0SZyqxYSbcaEYSghThXRrh16S9GUJsCgZgquFP0MXNLk20k7qqUpd5G
 gTE3KZoy2w3n3Hs/SDtMU4mfnM9++/6TMKaedMLypxUsqK+/axeDx7c8h9mTDMvwAzsryAEABm
 ASumBRMNeYArOv6BZlh8UHuAAAA
X-Change-ID: 20250829-imx214-smatch-c4d4d47428d5
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Smatch is confused by the control initialization logic. It assumes that
there can be a case where imx214->link_freq can be NULL and ctrls_init
returns 0.

Re-arrage the function to make smatch happy.

This patch fixes this smatch error:
drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Right now we are handling this with a quirk in media-ci, if Dan cannot
fix smatch in a kernel cycle we should merge this patch.
---
Changes in v3:
- Rearrange init function. Thanks Sakari
- Link to v2: https://lore.kernel.org/r/20251014-imx214-smatch-v2-1-04218043086d@chromium.org

Changes in v2:
- Fix typo in commit message commit
- Move error tag where it belongs (Thanks Hans!)
- Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
---
 drivers/media/i2c/imx214.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..d4945b192776bc76f4645ec9ddf047088934d3c5 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1014,8 +1014,6 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 						   V4L2_CID_LINK_FREQ,
 						   imx214->bus_cfg.nr_of_link_frequencies - 1,
 						   0, imx214->bus_cfg.link_frequencies);
-	if (imx214->link_freq)
-		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/*
 	 * WARNING!
@@ -1038,9 +1036,6 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	imx214->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
 					   V4L2_CID_HBLANK, hblank, hblank,
 					   1, hblank);
-	if (imx214->hblank)
-		imx214->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
 	exposure_max = mode->vts_def - IMX214_EXPOSURE_OFFSET;
 	exposure_def = min(exposure_max, IMX214_EXPOSURE_DEFAULT);
 	imx214->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
@@ -1060,13 +1055,9 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 
 	imx214->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
-	if (imx214->hflip)
-		imx214->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	imx214->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
-	if (imx214->vflip)
-		imx214->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_cluster(2, &imx214->hflip);
 
@@ -1106,6 +1097,12 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 	}
 
+	/* Now that the controls have been properly created, set their flags. */
+	imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	imx214->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	imx214->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	imx214->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	ret = imx214_pll_update(imx214);
 	if (ret < 0) {
 		v4l2_ctrl_handler_free(ctrl_hdlr);

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250829-imx214-smatch-c4d4d47428d5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


