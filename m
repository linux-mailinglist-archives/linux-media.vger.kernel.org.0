Return-Path: <linux-media+bounces-60914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C9fMvqz/WkXhwAAu9opvQ
	(envelope-from <linux-media+bounces-60914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:59:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE594F4A05
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB9C6301AEF6
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F223A544A;
	Fri,  8 May 2026 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKxAwJu9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9413624A5
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234358; cv=none; b=H+aQZXx2JPWAle75aJq3itaohuLThYBY42TJ4IDPoIkMmUj9miuyViu+VakceE1g5MpAgczMiDtFMiygMAD1Lv0383ZwNZIy8iD38EY+lz8v7LxBU+sz+Ws9eP3hEzKrQeUSWIqSAr/XKmKBlqKW8tbFkkxWlsqyjR81LrSD5J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234358; c=relaxed/simple;
	bh=qDpRiVP7yy2vZXwlKwWWMHcQ60seEAa9/LRbPd9AM5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqkltCq/MJ1weZS7lEVhCk9irONFrQACdu0yLirTxc/JhGrShRY+gBwrAiZu5/0UKq7LdN7VORkfFypWeiPh78mTcs4sYaQuxpoBq6hhWsbSGjhUjJyNEDUL3NA29prGK7e2/vWQMvS3uhFLoMBZ41/9IXVe/Pyh5df3qrtJuXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKxAwJu9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-444826c16ffso1633234f8f.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778234356; x=1778839156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LpTxIGRwThEUVNq/DxFwIbrwCO3s6L/v7P5s8pgCg4=;
        b=ZKxAwJu9kqWVj3eSgqSZIlQu0VyzY+hEfDRLIxLku0kHnGrn3VdmEsnMblYRpD4gN+
         ApkSWa5WuNaApknB8j1hHgT3pZ5l64BO5Znz+8eTTS5H5Zxt2UyI46LOKjYYO4Uwa6x8
         zP5Ej2gCTE9+Jwh39cqe61ld1X26Up2ed8UME59yLsHfMVUxK37P2WuC35WM5Z1cVqvm
         bjh7V+5cLziRRvo54q3oUmQRrB5wqnkCOMTtVNUQlZ5NE04uQgUtGBT5ov2mSExDYNgU
         4rkTdbe1p5Z1nsRkbHgH7H4AhFmPZmEap6VqVStHq0IhZktg/o7HRAyg7LaXSfMXDo4J
         hSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234356; x=1778839156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LpTxIGRwThEUVNq/DxFwIbrwCO3s6L/v7P5s8pgCg4=;
        b=Ubk9cyIsGuWJbC+eMzPPTI8bjwgUfDvfa+W9jAwTCzqSQFcEMRpCHOpdurt2nJHQ8X
         0EtPHELHB6C+u68PRtVm8950EkdaOJR4daTPtvEqsOXjNY1z91hO2R6rGypLElDG72/G
         2/en2z9b4fMTCKjR3qZd72Yi4QB/71U3GnzEP2vw+YOv+UgTrQll49Y5g47KuBXMz82W
         7sz3mYlIdi9cFS4CLH31D1hDQnLRfjeiMAc9NS6Lazkju9B0JsmddaS4pVDrO9g8FfBQ
         8ec8Ge8bSHGAEVWgWY8EkOa8F8SP+OYh3See+9ru9a5XkP1UmWMoU52gaxCm9GrLcUm0
         ufQA==
X-Forwarded-Encrypted: i=1; AFNElJ9juSoBaWeWPAM6cjTDao948+4G9g/kzhLR5fqMkgZ9+a80J07olQ98K0dcEFM9uPNZ9Vq8Qy5yh10H/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfHujEe688nDOlWuPlQwf7sFiPqFNH2N2Aoifoix79aYxK0dx
	KwjZMVkb8hBRRXc156tEZ5zWU7SEDgaXAfae0tBwbx8CO9nGD5wi6CpJ
X-Gm-Gg: Acq92OFwMd+4fzWWvanOtYsj+9HZcWxtAu+Mae+V8hBc0IVonFbiGqOKmBR2ECKE3Su
	lElH4idKgu8a7pNfxHDFhejhXYhVeAT3nsZnPT5cJroijyCxOs0k+R0+hrVqCqZui7ZCcHuY7GN
	S9QNH9EoCtKhfSQLykU/6AZPy8RTuAish8Qv9htOevGn//qGD/Gn0irzA2v0OW1FLLNY9wMJV07
	XYi5A3u4iex2V1+FTGnuwniOBSLMItXq3MQn8cjoTiZ3tkjL31lomiEY7Pyhwte9Js2hkalw8vi
	YdOdLwZyhxaRJ01NeE/qFR6tX3CfGkrFxZrikoyyB4P07uskSeJPGPfU9ArnLJPfKcnxGEqlkYC
	st6YaZZyt8zAsbau8ZIItfqtNOmnc5xNejO+y8Rp8KIds2oEsIauVzdeSEfqq9WJwNrzB+okXCJ
	7fUkY4q/khHFNwt9C4etNEGHM=
X-Received: by 2002:a05:6000:2586:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-4515b61bcc3mr18843966f8f.14.1778234355604;
        Fri, 08 May 2026 02:59:15 -0700 (PDT)
Received: from avt74j0.. ([2a02:8109:8617:d700:d9bb:cdec:69e5:2f8e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm3060894f8f.24.2026.05.08.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:59:15 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	stable@vger.kernel.org,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: i2c: alvium: fix critical pointer access in alvium_ctrl_init
Date: Fri,  8 May 2026 11:59:03 +0200
Message-ID: <20260508095906.500220-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6AE594F4A05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-60914-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The current implementation of alvium_ctrl_init creates several controls in
function alvium_ctrl_init and uses the returned pointer without check. That
can cause write access over NULL-pointer for several controls. The reworked
code checks the pointers before adding flags.

Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
Cc: stable@vger.kernel.org
Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
Changes in v3 (since v1):
- Split conditional creation of manual WB controls into another patch.
- Limit changes only on checking returned pointer values.
- ctrls->pixel_rate->flags is readonly by default, no need to replicate that.

Changes in v2:
- Has been rewoked completely because file was brocken.
---
 drivers/media/i2c/alvium-csi2.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index b62b45a4f2fc..f51f9b987759 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -2100,20 +2100,21 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 					      V4L2_CID_PIXEL_RATE, 0,
 					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ, 1,
 					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ);
-	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* Link freq is fixed */
 	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
 						  V4L2_CID_LINK_FREQ,
 						  0, 0, &alvium->link_freq);
-	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (ctrls->link_freq)
+		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* Auto/manual white balance */
 	if (alvium->avail_ft.auto_whiteb) {
 		ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 						   V4L2_CID_AUTO_WHITE_BALANCE,
 						   0, 1, 1, 1);
-		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
+		if (ctrls->auto_wb)
+			v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
 	}
 
 	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
@@ -2122,6 +2123,7 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 						alvium->max_bbalance,
 						alvium->inc_bbalance,
 						alvium->dft_bbalance);
+
 	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
 					       V4L2_CID_RED_BALANCE,
 					       alvium->min_rbalance,
@@ -2136,7 +2138,9 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 					       V4L2_CID_EXPOSURE_AUTO,
 					       V4L2_EXPOSURE_MANUAL, 0,
 					       V4L2_EXPOSURE_AUTO);
-		v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp, 1, true);
+		if (ctrls->auto_exp)
+			v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp,
+					       V4L2_EXPOSURE_MANUAL, true);
 	}
 
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops,
@@ -2145,14 +2149,16 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 					    alvium->max_exp,
 					    alvium->inc_exp,
 					    alvium->dft_exp);
-	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	if (ctrls->exposure)
+		ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	/* Auto/manual gain */
 	if (alvium->avail_ft.auto_gain) {
 		ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops,
 						     V4L2_CID_AUTOGAIN,
 						     0, 1, 1, 1);
-		v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
+		if (ctrls->auto_gain)
+			v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
 	}
 
 	if (alvium->avail_ft.gain) {
@@ -2162,7 +2168,8 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 						alvium->max_gain,
 						alvium->inc_gain,
 						alvium->dft_gain);
-		ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
+		if (ctrls->gain)
+			ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	}
 
 	if (alvium->avail_ft.sat)
-- 
2.43.0


