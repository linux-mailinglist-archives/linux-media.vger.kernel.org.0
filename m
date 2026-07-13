Return-Path: <linux-media+bounces-67485-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FR+dASnYVGrqfgAAu9opvQ
	(envelope-from <linux-media+bounces-67485-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA674ADF1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SatcBO37;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67485-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67485-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24038305D410
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FD9408629;
	Mon, 13 Jul 2026 12:11:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7079E1F3B8A
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:11:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944704; cv=none; b=dgwmOOGxx17glw9KMRopNckduWZfl/HHx5eca+4FWyC0P16y+Pay10TfbyWmsrDY00g8p7h5qv+oMnAKZXiYry7IRBXBJlwiRp/q/v9ens33aoouxAdZpUYAO6vKHplWW472W6QRADLRGIj0hv7AMkGEJcmFAdJowwyyI7g7FGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944704; c=relaxed/simple;
	bh=Oo1zBhvF60qelrBXEcyAajK7JtUh598aCvxZV7Ifbmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDV+mToAXf5CPt45rExMrYIKlKPpbeMPmTImI9Donp6qkgalRUh9ohAFQxnh9ftYg+8Jl7dtg0Bx4PjQmlIklNzPWLvC/ALwVJ2TzVwdFxx6BgzsCqzEg9U+bQFuIFD8GMLOL8DImeHscE2Ti2lP9n8vkeebeip+6VoP8dhebww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SatcBO37; arc=none smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca88130e09aso2058270a12.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944703; x=1784549503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=SatcBO37GthLcgCzc+9aPHbXjJT9iHq8sUJ5HRYMQ62TUl2aelWG7/mETN5N0zzDtV
         vmZVqdLmvrZAbtcTR1o2YBeUdUKUe2Iel35C0xJbx1k8dWfQf+qTIzIIagA/NKIkaObu
         oib2YOLu/UALvHt3oJOKGzGDKd5Xq2Iz98bntg361NI4o2l4AaAqzbz+5GSGgBnwpoWA
         i0yoToTuzdeacgs92+OUFyvdqwvnRbRMcZVMa2ccsEth69Hcx1rJGHKcXxu+BKPKCkR8
         CSZSmEc0Zll0dWcfVjkSLc0hJaR2aWvJLNJ78Ddp0j+ErhEi0tv5WYtdFI0LDHuN9J8y
         G3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944703; x=1784549503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=bA2gUtBgx6LpgiasoD8S1PHQnCc3avbRtS4OAbJzfYo6oor7//xymWPcjWKivr+TE+
         q75JgDirmAuBf+l8mfG0IKYriV3MTk/kEOouAivgT8s4yuTEQMIaFvrOgbQZFj/i5mIv
         SYp9+PUK/aZv/jL4WLrNwmX85YjHakxSFG0NdyUmNXQFBeHyWp91gCQe/Sy3BaHkSWrV
         qUkjkeMu0NenkAqxIv5hvQjcQnvmM3ExGp3ekyL7WCC4ArjR2UxSpSbR6fDn8qQIJChc
         /795Hztyd5b898qPxJZjY07YH1lBNUUqjJ9JUzZpV1mGg/XbxhtaVDK20d/IEb5SPsdH
         9aVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgDa7VdgF2jFMVMhJ6tl1LWRcVXP3QV6i0IS0URuxILGnnVEGc71X73xKOeCut6Jx0CXAs1ZOKNHdgxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh1kNZREVuu/6sBr5xqgyKtuUOSh20Z/3dFMIdR9MhU3CA8zo+
	gIpAwggLBDsfZ6guxbHgAwLkv7L6PHFoYudtGNtPizyZgDf37Vs/ae9k
X-Gm-Gg: AfdE7cme8A/Hgk45Um6OsWFzEiCMPM66SW5RXRosZmXQWvjkOdI20QVTqNZ9feV7EDy
	5RKraG4q4YbuiyyzhSDp1uc6DRv8YzBA8F4mcWAQ0sC0R6e6evmmq5pz6PZbFa8QLI65lcqJWGc
	v3KN4m6Cc4/SAcrc8yhqw2becWIbkxHEN4FlKPfuwAJkXUuZ4akxg1E3qJrAFXPl7O1DMryUQ4j
	XYeLTi9pZYIymxgt+tceqkXIH7KuigeaAZ4ifpMthIsnaCI/IBge8V223VgaToCxrjgGw2crGfc
	1gFyX8CGLNPiczmDI2biggUMt47AnunbERkzmzRdUpiSpcU9ADJ0bAA56Q2VcaO7Pqz7rDUpkhe
	zr8qX1ETw+tvZIzM4MWcZdyK23hNUqt+eV7S6iOlDIjmDk6J9sOEOHY/sUsazTMZQ+lwcFOVI+c
	BvHpI/Y5Sr6Q==
X-Received: by 2002:a05:6a20:da1a:b0:3c0:9c18:d5a5 with SMTP id adf61e73a8af0-3c111073a84mr9971121637.66.1783944702870;
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 16/19] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Mon, 13 Jul 2026 17:37:11 +0530
Message-ID: <20260713120840.17427-17-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67485-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:nicolas@ndufresne.ca,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,ndufresne.ca];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne.ca:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBBA674ADF1

The vdec probe routine does not set explicit DMA constraints, leaving the
driver completely dependent on platform bus default values. This lack of
explicit layout initialization can lead to allocation failures, restricted
address space mappings, or broken contiguous buffer handling on
architectures with restrictive DMA layers.

Address these platform constraints with the following changes during driver
initialization:
1. Enforce a 32-bit coherent DMA allocation window by invoking
   dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous allocation segment boundary constraint to
   UINT_MAX using the vb2_dma_contig_set_max_seg_size() configuration
   helper.

This guarantees that large, contiguous video frame allocation requests
work reliably and explicitly aligns the memory management paths with
standard Linux kernel DMA management paradigms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index ac86a9c4febff..d33cbebc4453b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1186,6 +1186,16 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	/* Enforce strict 32-bit DMA limit to match hardware capabilities */
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set 32-bit DMA mask\n");
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


