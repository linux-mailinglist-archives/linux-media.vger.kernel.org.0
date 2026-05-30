Return-Path: <linux-media+bounces-63108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF+FFPmxGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:46:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EB60BF45
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0343F307DE1E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C57539A048;
	Sat, 30 May 2026 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIeazxf/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626B39E162
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134307; cv=none; b=nkQsYCm0reP+aB5Pi8CGMVPOKyB7WmZssu3kbb4yLtne96u5qW9twxrDX+5GFJCzjmhptvezA6K42DP4s5Eny+nAPFtvx9CGvBcur3iRysfeO5xqTUGs4c5mM7rzWfzNwaTwn3aUGpGds47cUVCZVZNKKiyzruOGJfnFR5dkjEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134307; c=relaxed/simple;
	bh=g7WNCB9Rt/1OuSYvuRDcXaghERK+Kgq7rXBJpRUKNDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFDppGLspnBeQVjVbQC+kQodqN64oDgZ7D3Dfw1v68orUo73jFNGqoQaoIK4CXgI4WrfZadpn5ovbUjgngXDhIrU24v5ByBUPzwrFwzhUKQ4xkJzmUFzI4vFjMZSJmRYi0rktQp5cUtmn+OozkSu1IY71FatQIxY2BxIckqLf4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIeazxf/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba4a1a0325so98840265ad.0
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134306; x=1780739106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=VIeazxf/pOgIOrSnPe35VdjpGxmNQAboJ7opWLOaRxgi6s4qOTroJfCziQi1IJKHus
         aK8Ya6Eet6D9HWVsbgIUlxADr+HUcdftQX133EFn97XUGWt0+YjIGNq7qUPay2blL+r+
         kp3KEkX+gyUhuZOU+pCYwlaJSqrqBMdXy4TQh/PkVcjLztHL/OTIU1sAmo+IPl6smJSc
         pJQ26uib882FcqVZHCoD5x+BQJ4+llX5TmbubN7rXv0r8ws/O1Yz4JB1tuoBK/VsPoxJ
         n6jRPqLUqKzlGRr8Aj9aH5ljK60h5sToBnGA5H/AzSl+qtZUT4ItnUOHtuWMEPjlsZj0
         xfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134306; x=1780739106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=dulUKAgesUnC0LDwX7CGtjVLtZVZwjs8Vzi0CvxqCWZgMrnTc2nPHwINu9AUDLVLBo
         d/NtYmqS/OWVvcugVtO/DU+oCR/4vYyfVynCc2SUEESfdr8SElPAKfsbLDj7VwJJgm4x
         HvTN6BFqJqYYJMEl7fPfLYOHSJFsW1QxxkC8F4Qc9glxEiLDi7pyOmRTn8IeS9vSZqab
         85KBN9ytXszTkYYP5qVL3QuKtdvU86uOxQw0almpSWMSRdFi5uOXIhOALg/4GmqcV8Ng
         1cWOWQUvMDVjeuUvu8BOReEqomrdaK0jSs1Uafg821cQc4wY6MdDeyuN02x/AruJefCS
         SnOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CkFEvzR38XTO25k8yxYou86aW3TI8x5vqc310ocknGfXngAOEVT2rI8xb7B+RqnqaV8LtoIlFJcR7yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR02icQ94kRZe/h2rvXnhkTc+O2OG2ryC9VYwsv6RHQyYigKeu
	VrVFUOaFsbzNpY/zX8tgjc2wh+8Q9mJ8K/t7sDLJs72kBhrYH56SB5bTmVXCdg==
X-Gm-Gg: Acq92OET64ReYr/CEeVrPNd3OpjQu8zPYm8vyvpO71hEmlyOdBhxT14fg2ZXoDe4djm
	LcxLXd2OFdSzucPhyitDe9M+ZGYupen+p+emsgHC5t/dt1H/V6KqoVMPzrHpcbJPuA2XZIIj1ab
	7vLNvAHaWhccI9t4bYsy0k0rflZksgtLEWpE2PMNmfGYoEQfK0HsTdr8I9Bhd3aiiI0ovHn8BR/
	ricH4beHjq3oeQt02Mzg2ijES83aADxjkGM6z4OVeiy5SO8PjWZ5y7aUX5jN2I9eM9ysMUQ5yxU
	yNa5dvmhD9SFiTAzur19BbkDcWtucatJdOycpQXOuvknPpiQdq04wZrW6jPKcMkwbRnA5LsAt+9
	YTDMsQ7MIy6vp7cYJO6ECwRJM87vF06wQGFmodTwetY9vVaxoiW4fgaw0/FI0pC/wJYJX5UH4Wc
	AHLZP0Ja6ucy9HgLoht3lKXdVr7SUfQW2g1/Aun8CyLQ==
X-Received: by 2002:a17:903:32cc:b0:2bf:23ad:8598 with SMTP id d9443c01a7336-2bf3679336dmr37430715ad.5.1780134306001;
        Sat, 30 May 2026 02:45:06 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:05 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 6/8] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Sat, 30 May 2026 15:12:52 +0530
Message-ID: <20260530094326.11892-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-63108-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ndufresne.ca:email]
X-Rspamd-Queue-Id: BE3EB60BF45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vdec probe routine did not set explicit DMA constraints,
leaving the driver dependent on platform defaults. This could
cause allocation failures or fragmented buffer handling on
systems with stricter DMA limits.

Fix this by:
- Setting a 64 bit coherent DMA mask with
  dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)).
- Configuring the maximum contiguous segment size to UINT_MAX
  via vb2_dma_contig_set_max_seg_size().

This aligns the driver with common DMA setup practices and guarantees
large buffer allocations work reliably across platforms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4884ee04b352..f99335effe17 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1064,6 +1064,15 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
+
+	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set DMA max segment size\n");
+
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
-- 
2.50.1


