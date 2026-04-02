Return-Path: <linux-media+bounces-57984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGJTNN22zmmApgYAu9opvQ
	(envelope-from <linux-media+bounces-57984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:35:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6638D377
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30D4E30008A6
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 18:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F163EF66B;
	Thu,  2 Apr 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b41sDTQU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A03DA5B5
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154866; cv=none; b=mA7J1R9zdl7++3v3HvTbkofR8UU4O4cYAk1XUOnxQTkpleSMIILCW26z+giSLZH4LDPi/3vYU6RMU5RPFqbDBL6gI+NtzCtFgVUGsJGfvISklvE0F5hnZMcvfUjt8NxswnSZNw+Li/yvxqWJ+DRFH7CYYbaIh+cWDuRz4hx8irE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154866; c=relaxed/simple;
	bh=wyq5W/u57ccvu5nuOwIucSKyF20x4rNLLNnxHJNFwaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoRC2k4IjaIjdd3mm0vHzEev/aBKiToYwoiZ0dV055zoa4aoUmoh4hgkX0+VzksNzRBGLLJPps2T1v7OJiE0LF32hrt9b3XDJOWifIgIgxwLEZAFM3w7tjcw9Mu6R5Plnm+7whzVuEkCDxW4bACqiu/GEVV5BYOpYFhmxReDxic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b41sDTQU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso10906135e9.1
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154861; x=1775759661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=b41sDTQU6uU59S6RPTpqwIe3+FhNPMSbc4ucUO+PGFbWPtMNNUnCwbgCwcRvjR0Ndc
         ENcEFmoCtYAD1POFlNb698j1jBfAjs36lwVHAm7AMSIqFXl9dykwpZb+yOGCr5vvcers
         LLqslZremkG1Xy1st2/HUn5HxjAWVZpjQzgyrbrE9jTf2UDAKeMwgmmF//XNAj3if2xJ
         KdTruIWz/hKShUqaAf8AhKIB/dHF/EH23/KhUz9gSq6zU5/VjP0gf4CQpBj3S2EWujCi
         0jDUvHMVdxKKUUXU0mkupa+gmCdaFC2BydQv9zcUOUuawzJZ/ScaJ0l7WjFPe/yHeXhZ
         5Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154861; x=1775759661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=rJuLY83lSIotGvD3Dm9CpiP0oEKA9/CZUyVWcHHSDMoanGJ1Ux3ArcIiCv6Q6k0fpy
         b/Z5iyJKZv/feCn3vLKL2l46D84hErZR2rYgTBtJZrS3ZJ1jT+lp53T8bYe3lQvyaJvT
         1OuFTRwvjJ1oQviJuB6yMNIEKr5TrVxUGFnbHSkakMjN3DDUhkad2YKC+VkhJfZCmcjB
         YeCjlpui//J+x6uofqWuXBn3p3bCwMUKF16JnaoCj7eVOge9v3/vySarIGmwL9Pnn7OD
         JouLUgAnbK5RfiLeySRNd2heFXGQxhCzo4SX3BRxNTAMRVaCm9Ly4XZWzRTMvwA/ubCT
         z79A==
X-Forwarded-Encrypted: i=1; AJvYcCXAh5V206BTBC5qGMldZLs3reMVGCBCV6OQQaQ3NvDFIRLZdXogOED25TnE7oPlJ7wR3CqHvesP/8wxZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySCdcHdIkCHQFngZQM7XR3Lu2soHuS2CpuYDp5r3Pt+8pUPB4L
	EdVsY/9r3dWO9fh2q+tmTMeBrwpRMCgj7fPSM2H7BNkPHM5mOJ9auN+C
X-Gm-Gg: ATEYQzy5TrKzMoDyKWwy2GEkqkxgwVcbjxZ/WSsM16NRvSs9bkfMYja94DclYJ42t4v
	Sawy5SyTForCW4XGyFoi+NQbhgkepIVyeg78TcyWYguh13l+OGSNYM6K9mt1P3qlS+XUg/f1Us9
	OMpeZXOZ4Xe9DrFg5EfTLpOlnQ+J8ghPHGvmQSvIszB9GI2IiU3XMhofGcLEAdUQqzeb0GRFn1l
	ahT9CiLnMxYjGuOzhR15Z1PfhgOn7nAN/iP0rBnPFn/7Buz26oERSqXWxtqNW0kVR4uCEK1hFXc
	2xc8qgWpZ9tXn2g0qlc3RbkigJzfzwP3xIwB/7b1f78dicTGZHcp1BY6Ux837iXV4Nc5dEV4ATk
	MwZfniPkRfwNGPZ9E0xNIkXIzt1CjujHqHy3LN9Da4KgyMk8TL26rMxgNBzaqn46mojDLL6oRkE
	mE+Hxey6M+0nr8uSkNkbMBglYmWAzkyfydPTHDTwXMwG/aU8UtUZf+Umw=
X-Received: by 2002:a05:600c:6286:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-488996dfebamr1784015e9.7.1775154860903;
        Thu, 02 Apr 2026 11:34:20 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm205797825e9.1.2026.04.02.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:34:20 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/2] media: atomisp: gate ref and tnr frame config behind ISP enable flags
Date: Thu,  2 Apr 2026 20:33:44 +0200
Message-ID: <20260402183402.444630-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402183402.444630-1-azpijr@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57984-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6D6638D377
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The FIXME comment noted that delay_frames can be NULL for certain
pipeline configurations, without knowing why. The reason is that when a
binary does not enable ref_frame, delay frame allocation is
intentionally skipped to save memory, leaving the pointers NULL by
design.

The ISP feature flags in binary->info->sp.enable accurately reflect
which features are active for a given binary. Using enable.ref_frame and
enable.tnr as the predicate for their respective configuration steps
ensures the configuration path stays in sync with what was actually
built into the pipeline

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..abdffff41ae2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -775,9 +775,13 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	ret = ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	if (ret)
 		return ret;
-	ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
-	if (ret)
-		return ret;
+
+	if (binary->info->sp.enable.ref_frame) {
+		ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
+		if (ret)
+			return ret;
+	}
+
 	ret = ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
 	if (ret)
 		return ret;
@@ -807,22 +811,18 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;

-	/*
-	 * FIXME: args->delay_frames can be NULL here
-	 *
-	 * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
-	 * suffer from the same issue.
-	 *
-	 * Anyway, the function below should now handle a NULL delay_frames
-	 * without crashing, but the pipeline should likely be built without
-	 * adding it at the first place (or there are a hidden bug somewhere)
-	 */
-	ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
-	if (ret)
-		return ret;
-	ret = ia_css_tnr_configure(binary, args->tnr_frames);
-	if (ret)
-		return ret;
+	if (binary->info->sp.enable.ref_frame) {
+		ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
+		if (ret)
+			return ret;
+	}
+
+	if (binary->info->sp.enable.tnr) {
+		ret = ia_css_tnr_configure(binary, args->tnr_frames);
+		if (ret)
+			return ret;
+	}
+
 	return ia_css_bayer_io_config(binary, args);
 }

--
2.53.0


