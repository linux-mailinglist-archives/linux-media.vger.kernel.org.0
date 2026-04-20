Return-Path: <linux-media+bounces-59113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id om+aBwKt5WmrmwEAu9opvQ
	(envelope-from <linux-media+bounces-59113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 06:35:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AEC426BBE
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 06:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4896A300BCA1
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 04:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394163815CF;
	Mon, 20 Apr 2026 04:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGGLNkvr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C24192B75
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 04:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659702; cv=none; b=G39sSqc5JvYaNFkItfGa3kDTF8T3tlUS9pzpqM5JjqesYWQiNR/awflQCIrLAjGaLyFG5mwWD/YuHws1QdNG6yP6bLjyBi4vK8QrhS+Khqyys8752aw7XjjEmH+QAQFalegCXc6/HynSQV3cLxFW1Yk+9BiLckQzCQs1dxruWOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659702; c=relaxed/simple;
	bh=2HPqnQMRtv0/eCGmh4tSrfTxg0tc2Yxqnj6WCItB6pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5qtcVyeIrJzgDC3EQbZBsuxtJpoe9sCkpdzk4M/NtVBbBwmg7JnWjiLj21hT1fsrCsnuTjikPimCLnpJCTMq/+goVGkUFxt50rf3/0GKXo2FRoXQcdJtVYc7nY0K3qJfYD+nCVRFuo7jXJzWlGpFlnkAXQ2CZRvHQuSVd9/3oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGGLNkvr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-827270d50d4so2400780b3a.3
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 21:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776659701; x=1777264501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOcTTerYRxScw0XuJN9vjsh2E4H0d23/wA4kuMvKkYc=;
        b=pGGLNkvrmX+CEUwTehh2oW9xpoDPOyyrj6m2ShVYOan1FQn1/Jl5XmLPvBnO+Upaqj
         aN1qVo3Aoyc481/DPzyQAsEddIr0IMa8lPUbtB7yBvAxT4Myg4Vtl6gVAawq7CYOkwo1
         ivkkR2OzfN0HGtWA5eQs3z6IBxYVTtnl2f9fpb7alrr5dN4xQ6KTktu60zNtQtmImmqb
         VeY/Ww0wlE0opgpOmXt5WpM/FeYM/ZtBEjXI7AXLfYHvENMIXHrzdvduFKJv4GrtNV3P
         F7Y4LPDwmmxbiI59I6yEbgjKka2/MbeglaHnX8AE1AURlQun+6OCjwyf3gOHkVlq2O7M
         GQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776659701; x=1777264501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eOcTTerYRxScw0XuJN9vjsh2E4H0d23/wA4kuMvKkYc=;
        b=Cez61xY/DmU+bd79QQfm/BlJW/7T2F2HFACXuyl6R7ODS3p4l7DGYnTsR5iLtBc/j9
         A+D/IoFiVUR7mbSN5K+35p08+XN6+S5zD5maX9zB/myRzFZaaQK0OEJ3LnAlgq4lKvwY
         NTYPyJGr7znkthfuSEXgCJRf/0GsqtMA9s7U4sshhWXJD1W1wNp/gj56NVeBZmtaEzS8
         tQ2Ir1m+Pq+9YNaR+Qc3JlCvBsrcHOxPHQKOHJ0VMGQ2uD/6578A/CBA5RIBx8bnTPx+
         nqssph5hDmy0PqUqTYIcODbjRi4QkLTi8n1y70dvm6Su6sxkFZmOuhOJtfyr8VpTuK92
         gh9A==
X-Forwarded-Encrypted: i=1; AFNElJ/5POhQ1Ljflqo/m+eDp2PMZQJek95R3KXKSf/PMPS8UwNb8NdsjIu+MJE6VTZ11HDBfJebCpzcM/+JsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ATngsj653SGbzir5A+Ptfc1VNGT9H1vEvyNvBV2B6jatu1/Y
	WlMp1AQwV0v7XjqmCnmEmruH7qXgBoZPxOJOWRYTmzENsBqYBAMXgHEG
X-Gm-Gg: AeBDies2kau3ESon/capVsty4/6n3zMkoB61QplSPEJWP6Bs0zYcR7lNod+pFs5lNlf
	pRDMreXEy52CaDp9or/UIkyXOys/wkNZFQkKZGEcgyWctVRLaQqquZukjrl73XrO7AahAWovEp3
	8c5a7zMMZ3D33sFL4eaUSuv/KfOpeS4IZnLpkz80wrFAjdtf3/rdeETPVSzANv1O9ITbs+OxqKu
	kOTFg/2OhbJ+ImW292/PJlH+3YMPEzTQIUQ8KSxMJUfaPu509fMhVQE1PKoHz+Ec3USkVUovTyr
	/xxZF03ycJfiy1mxKiQxKRPS4hv84tQhj9O62SzcLXVD2z1AOrCe3MDftG2vqCXkhqFktKj3ive
	Zq5GcFcVkVpD14AhozlvZ1OF26I3G4TY36j7Dszb//HamFarUrSvWapJkPQgdTa73COnhF/K55N
	vTpTt89hz0Uhee7BrLOL8RxENmDG4Dya7mcgALZo57RmxrOC9MvfWX
X-Received: by 2002:a05:6a00:1953:b0:82c:d861:3caf with SMTP id d2e1a72fcca58-82f8c907fbfmr12578564b3a.36.1776659700685;
        Sun, 19 Apr 2026 21:35:00 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e984f20sm9868599b3a.8.2026.04.19.21.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:35:00 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	debjeetbanerjee48@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Mon, 20 Apr 2026 10:04:42 +0530
Message-ID: <20260420043442.60982-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420032701.33250-1-debjeetbanerjee48@gmail.com>
References: <20260420032701.33250-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-59113-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89AEC426BBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CSI2 source pad format was set by blindly copying the sink pad
format, regardless of whether the sink pad is receiving a DPCM-compressed
mbus code. This was marked with a FIXME comment.

When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
before passing it to the ISP pipeline. Therefore the source pad must
expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
the compressed one.

atomisp_subdev_uncompressed_code() already implements this mapping via
the compressed_codes[] table in atomisp_subdev.c, which pairs each
DPCM mbus code with its uncompressed counterpart. For codes that are not
DPCM-compressed, the function returns the code unchanged, so this change
is a no-op for all non-DPCM formats.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..e723304bec80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,10 +107,17 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
-	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
-						  CSI2_PAD_SINK);
-
+	/*
+	 * The source pad must expose the uncompressed format even when the sink
+	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
+	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
+	 * so propagate the sink format but map the mbus code to its uncompressed
+	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
+	 * unchanged for formats that are not DPCM-compressed.
+	 */
+	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
+	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
+	*ffmt = *actual_ffmt;
 	return 0;
 }
 
-- 
2.53.0


