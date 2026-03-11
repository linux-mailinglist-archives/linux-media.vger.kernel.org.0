Return-Path: <linux-media+bounces-55349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGCqK/0tsWkVrwIAu9opvQ
	(envelope-from <linux-media+bounces-55349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:55:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0925FD0A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55795301CFFB
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641FE3C277E;
	Wed, 11 Mar 2026 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3tHGlyI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329943C3422
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219300; cv=none; b=AkqhGoWgc8crQLm4gieZHaIOfvOAKMpVqzl9dceLm1MnCZWpkX/An3TnRy1UUbJKB8CSVClsXT7r+wdGWF8a8/3PKG8oLkLPbSMvw273am07ixFdPYmO6QRrwSRa1qSh9n5ZbVwqvIj6vcFFQ/ZuTggVkgrRTU3tTzPbWYwAcjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219300; c=relaxed/simple;
	bh=rjJdLlKEuej0RX2tfsJ3ch7JAAjsB8Axsa3M+SadHJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=istEQNgpN78et0DbP2eiqqw67hb1/u9mavGFORHwF0Emn1sNtVTy/SDFZ8XyfcoH7fiCrwp8j5ZdZMxNR/vL3DySQ6oDyJz1VoiZZya3gXBogOs/y7i3YSO17/nhN0E2nW8uzXGyIF6rmn186LOQtnoEnp2JYKK/uHQLun/xl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3tHGlyI; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c73967cf77aso2196147a12.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 01:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773219295; x=1773824095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DRY4xaexHYmn5uiVwVpT5IF4eldjts7I75zF1CWyLU=;
        b=b3tHGlyIrng7DxAme1Czt8HOTBCuXCPbtV6Z1zNmEKuuZ/uy8RfRmu6CZyiAmblrnu
         NcNAXyM4CNukz2thd7pqUMg04bZWJt2t9pDxbKVzH0nIR5Yt1/InVbd+RjdRbNHGnNnX
         yJM0aQLHlML5RhzmC52iY61BOfk7qsuK6Yv50hqGiq9DvKwrXEdP+0gPmZcxg793dvpq
         1BLndPC21ToJRTWXVC6iauoy23M1Fihdoqz9Z8a6VIgge42Woy9XC0Mp5aUsuO+/o9/X
         mZu1ChrvEsBM9MX1vaEJ7/VRxwlb80Fj+HG1dE45tq9C66bGkjoWvMQsRWeRqxO0TFoX
         T8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219295; x=1773824095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DRY4xaexHYmn5uiVwVpT5IF4eldjts7I75zF1CWyLU=;
        b=sJ3ST7ZWN0qc5nPDNku8DFVMSLNZL/AP71WqHx4FEI611H+/96x4OX++9sv6mPM+kT
         JqXVZj8K9OLMxOQPhf1F91Cq3gDUW5aEFSAcLBJZRaBZWpswt1aQ//xgc7XvdfLnYB3q
         zWcLe2zawGIMP9W9M0RGOtHC37jKQJP7BPQxmDpd8wDn/7B+9RFbEOvWA+CcYhJ4nH1j
         WhHplOJCCrXi+EFtiKw6LgRxyteoQ3kS/VHanGm+UlnVx/pbsaI3D8T8ArPe9ub/6iYR
         ihV2PQOeSHLdm6dOERAenNA1tZHZGvrUHkS22/L4NKdpRUDXY4GaptgFXcnSyGNXBuaV
         Mv9A==
X-Forwarded-Encrypted: i=1; AJvYcCVfF6m2AtGzMIFqnFUcCD3DKkKCpPkaqCfc6MzsfYCm7L9Nrh42kHa/IzSsixnT+58QAlx+hPpHcbtjkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyET6JrJ2zwQI3eWfz73H+v08ov8YaoSjy8OQ5GFpAr1oiQhy3p
	mJHSXZz/5oQOF47pzJriD965dPKDGh9Xf3wEmK5RQ7DwibEOT9og/OkI
X-Gm-Gg: ATEYQzzy7pJFWbtMbm6LOti4KDzzqwtxzd2pmw2xXcwgXJ/Z42xuHiGRy7yJFPPJHc4
	27gm1HfKw93a5uMWFJ5IWyXaMEeS0dsRPBQS18r/7uIearsOI5MDNcuc5+oDXtrJ9hb/Bc1N8wn
	830nzQnQs+WHLnCKkFxBsIASQoaN2xafOyaecpyfDZdUhOYzCOBwNXl5QL2VIVE2zoX5BVz1fh+
	fZX3wUVL9FdwHCvRsjTdtbIrrDiH2AeBmzZlLipyXkDv7uR7Pw68iIm6Y6ufnkL2cMN7sdGXtSu
	87gG1GLN7BIUzI37R9xRmFgyWgx3Ll4S8FB2PBN1v0IUEWhiW5tioDnESHah4NXFfI6JBeaHkNd
	KbflVSThU86dvKyaSVXJhyeo4dBLNSDLb9gvM6T8JBPmAudVBjsgWARzhhW+4MDabBEGLqk/+mI
	jFyRL0xs/3Q9TyuBlNI3naH1UBe61R8ypLj/s5PjMcmg==
X-Received: by 2002:a05:6a21:700d:b0:366:14b0:4b09 with SMTP id adf61e73a8af0-398c6182de7mr1631877637.69.1773219295225;
        Wed, 11 Mar 2026 01:54:55 -0700 (PDT)
Received: from muhammed-shadab-H81M-WW.. ([123.253.236.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf204afsm1486475a12.10.2026.03.11.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:54:54 -0700 (PDT)
From: Muhammad Shadab Khan <shadabtg4@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Muhammad Shadab Khan <shadabtg4@gmail.com>
Subject: [PATCH] staging: media: atomisp: split long line in sh_css_sp.c
Date: Wed, 11 Mar 2026 14:13:18 +0530
Message-ID: <20260311084602.6088-1-shadabtg4@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4AB0925FD0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-55349-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shadabtg4@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Split a long line exceeding 100 characters to comply with
Linux kernel coding style guidelines.

Signed-off-by: Muhammad Shadab Khan <shadabtg4@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..c38a7c69728b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -983,7 +983,9 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 						    IA_CSS_BUFFER_TYPE_DIS_STATISTICS);
 	}
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_METADATA, thread_id, &queue_id);
-	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id, mmgr_EXCEPTION, IA_CSS_BUFFER_TYPE_METADATA);
+	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id,
+					    mmgr_EXCEPTION,
+					    IA_CSS_BUFFER_TYPE_METADATA);
 	if (err)
 		return err;
 
-- 
2.43.0


