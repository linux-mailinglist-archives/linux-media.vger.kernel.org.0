Return-Path: <linux-media+bounces-37772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD9B058A5
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20C4616ED49
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D51E2D94BB;
	Tue, 15 Jul 2025 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="c57NFUN2"
X-Original-To: linux-media@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E12E36F9;
	Tue, 15 Jul 2025 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578617; cv=none; b=Fv7qvvPUXRz0TYVcmIaZEfpRl2cuS39W4WDcneTd0+DLg7VpKEaM7Lyq7z8yp3Bc4gUQ9Wy1G5poKHSeLAYcZzfIJgXF7NfSBZ7wsQDCkwAgTpl3kRowZ3/+JrjgLoCy+UogKKamV7g6EkHuZUApYx81Ba3a06N1ERvsnfq7X1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578617; c=relaxed/simple;
	bh=+QT/M86zCskmytZ7PZWg4WVlio2GCkF63P9EEQ0oGEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PoETkBGSTEbthCfgyGlwFLOZx4YSSMSp8XsE3Di/Qs+YT75RgRDM7jErgQDHrdh9bzfLLSLLqvtRDIfRxxqrIfkI8WmJpYgVemiBMBw8SMDxg4Dzu6GU5DcUq99fsM8yDMESbnrGDrVoICESmU7fx3zHeDdK9FAHZFzHFX9bfkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=c57NFUN2; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qXcgEUsTZfebWBfvSms5BR8nw6hkj5uYS7YW+R+nOzY=; b=c57NFUN2qNkXIqORI+Q5PrX25x
	Yyzc59qOKW+2HZA4/X+bP4WC34D3IYH1/C9TUFjllWYfH7440eY8D2GkTtC6ImGlTae4siyPGCQjn
	q44xFu+A7LCQzJbsc3M/FDxs48QV/VXCHgc5SXXgvgursm8SKq3ekAHeQG2VNLzeNiYhlHSaqkWCX
	spQZwXn4iRwVQWPqGLARKKOMNyQnfL+8GJKfq6flfDhEtHIzwEoLNFvvZ1zhv0KJAxki1/9iBo9fJ
	28Fs6Etwb+mm6QkMZ8BE9XRlbFjEtt6H+BHKYYcso8oYy9VudxdK7fzXGeuG2ghxoRbqwPM1+vgjr
	YorlXirA==;
Received: from authenticated user
	by stravinsky.debian.org with utf8esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <roehling@debian.org>)
	id 1ubdkx-001qFO-GL; Tue, 15 Jul 2025 11:23:31 +0000
From: =?UTF-8?q?Timo=20R=C3=B6hling?= <roehling@debian.org>
To: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	=?UTF-8?q?Timo=20R=C3=B6hling?= <roehling@debian.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] media: atomisp: style fix for trailing statements
Date: Tue, 15 Jul 2025 13:23:26 +0200
Message-ID: <20250715112328.2997-1-roehling@debian.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Debian-User: roehling

Fix checkpatch errors "ERROR: trailing statements should be on next line"
in drivers/staging/media/atomisp/pci/sh_css_params.c.

Signed-off-by: Timo Röhling <roehling@debian.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Changes in v2:
- Added missing punctuation in commit message as requested in review.
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 0d4a936ad80f..2eeb75653392 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -875,7 +875,8 @@ ia_css_process_kernel(struct ia_css_stream *stream,
 
 		/* update the other buffers to the pipe specific copies */
 		for (stage = pipeline->stages; stage; stage = stage->next) {
-			if (!stage || !stage->binary) continue;
+			if (!stage || !stage->binary)
+				continue;
 			process(pipeline->pipe_id, stage, params);
 		}
 	}
@@ -3045,7 +3046,8 @@ process_kernel_parameters(unsigned int pipe_id,
 	/* Call parameter process functions for all kernels */
 	/* Skip SC, since that is called on a temp sc table */
 	for (param_id = 0; param_id < IA_CSS_NUM_PARAMETER_IDS; param_id++) {
-		if (param_id == IA_CSS_SC_ID) continue;
+		if (param_id == IA_CSS_SC_ID)
+			continue;
 		if (params->config_changed[param_id])
 			ia_css_kernel_process_param[param_id](pipe_id, stage, params);
 	}
@@ -3600,7 +3602,8 @@ sh_css_params_write_to_ddr_internal(
 						    IA_CSS_PARAM_CLASS_PARAM, mem);
 		size_t size = isp_data->size;
 
-		if (!size) continue;
+		if (!size)
+			continue;
 		buff_realloced = reallocate_buffer(&ddr_map->isp_mem_param[stage_num][mem],
 						&ddr_map_size->isp_mem_param[stage_num][mem],
 						size,
-- 
2.50.0


