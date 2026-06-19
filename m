Return-Path: <linux-media+bounces-65277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4ke2K7MzNWqHogYAu9opvQ
	(envelope-from <linux-media+bounces-65277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:18:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80A6A5A63
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:18:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RBscWQTc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65277-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65277-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D7A53041A50
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EBF383C65;
	Fri, 19 Jun 2026 12:17:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D70383C66
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 12:17:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871465; cv=none; b=n4w5kz581aCjqhi3wV0t0ItgOK71fM7DVXawhRvvpX7Ul+tzdnm1U3NtZWnZI7xPUWH3u5G+0UFbdKT+3uj4eODTq9whFJ+zis32aidc0Nt3sxEDonJud4x7ao2df2Etj5VzuYTODZ9MLjO+QA8ulhKrbMlstbfYf+DA+ZKI+08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871465; c=relaxed/simple;
	bh=8rpifABVURtbDeYxAVcIyOeVXIwMqnxKdvLdu97ouvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFUta11k7Mt/1mbzcCBgm4Zzfuq9APbpbYjBQU1KoTz27tTrrwyxiq3rcDnkOB7XgxQsgijacMmHmZjtPACeqNxS6OkEAIDPwzjSkek2SPx7nkYruIEDxAEnEGc7tVmtXjn87x1/pQWmBnqcdqWuTepojtVaHSpThDnwJjioB7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBscWQTc; arc=none smtp.client-ip=209.85.215.173
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c88b7c92577so988919a12.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781871460; x=1782476260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rcV0W3r/htGKSijwn2A596Ma4M4nwm5Ks92ktFEtLE=;
        b=RBscWQTcOuxMpNwGZ4lffG1qbXwIjcFA3VzX5XklTbwgUhhesTAgXvOU+jxxYfBfYW
         Y9Tcj1cEN9KKGSSpsqqKv+0peU8NZI8KST7eJaZyKSDt/zlYrVfyUgFcHx6jphhh19yL
         y0mZx3+FMd7+8kLW4GTIEaHT3UHfOaCYKtKLhMrGx0ovQOGv0XIb/sSZ/2/q7J93qxSs
         AJzwc0sgofrEWnfGV4rA1jCtWYpYYTIuUGMqJqR8wtPVN5Kd6RH3bHaNax4/pe+vMgCs
         823Cpux9OUZS0Jd1N+66CxltapEB6cy3wPEZfbxn2IeckZ1Oux0aTLKKRaMHC3z9lY0K
         IJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871460; x=1782476260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rcV0W3r/htGKSijwn2A596Ma4M4nwm5Ks92ktFEtLE=;
        b=HclKQ2ZptmTVsn6sVLigWX1U5rCUcZoO6sDe7T3BHAGb9M2+p0IVyFDh1fo9NbeLbk
         4ETz5OKD4zT1hBKeLRuNjhrA+davhpAB1/adMyGRn5WonQO/VC942V7qywseZdgMlJKd
         t0xt+FXvMMTSL6o8F2vao9AVc/fszw7bBKvkPX8eOBzzDnKspCtEBXvuUSwBdnSQ1quK
         vovRMU4lP1vq9UOZ6+mr15Nx6l2LuG7Y8Hg/TDbqaa6Gz+y/WNTnqTXYvCkV1rMUZRbU
         8tltJjGTPU26kxiejLjjkFSLdhzq0yxbew9kf+aEKRg7EziEuudIJwfCxrKx8xe6R6tD
         dBQQ==
X-Gm-Message-State: AOJu0Yw/HrvELkpubaf2klmd63/gzLzFxjVsaTnfQk8tpBBfeajgFvHc
	6rg3ZHHv54U3Bmp/0CbbBVnkITj69PXCtQsXcwamhvkqCnrlD0AhTFO7qdxyWvZm
X-Gm-Gg: AfdE7cncZH6S/FYABNFw9Xg5K7Ct0dSb9HTEOHzO95gAGks14FWl6tOXFY4xG4YQ6KC
	WCfQLgFUd0/cC9mj0BfNrh7Gbawi26KNULTSauKUjyIVpg8Tw/K8HcmLTSXYGoqiR5W8wVxl2/A
	rTyvmjKM8YQYPP6nvLNpTT/rUrNnCRwaj/cyHROxS7JiDgocVrJRi85YvXa1EE4WAf9XAznioLd
	7XUHxOwhEzC5ZBkxAKE2MLfIFHYT3ZEYLnpDSv7BQoEKvGcSQ5sFUTYZFrkexyVbVGYgDfT2Tel
	fr2R102h9smi2Ybtp54/qwgAZd4+XVMRGdpyl13b0HjjjcdyRtkUb675r1iPBWwtkQ5ZEug++s9
	VfqGaHuHu9nKk+uHwI0+JJ8WmSXesyotipnFyblS1Tk9FJtrW+IJJegZtIu0fS5iSYHLggICVYb
	wPcD1fmig+9sJ39sKGcIeWgBvm/R9Py1ApEBXD0vsSUA==
X-Received: by 2002:a05:6a21:393:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3bb34049301mr4211686637.31.1781871460015;
        Fri, 19 Jun 2026 05:17:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382586fsm2296986b3a.43.2026.06.19.05.17.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 05:17:39 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 17:47:31 +0530
Message-ID: <20260619121729.24899-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619121729.24899-5-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
 <20260619121729.24899-5-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65277-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A80A6A5A63

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them and introduce an error_entity label
to ensure teardown logic properly inverses initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..61558a71ee35 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


