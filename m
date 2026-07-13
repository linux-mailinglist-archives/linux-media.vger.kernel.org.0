Return-Path: <linux-media+bounces-67488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fmjWM6bYVGoOfwAAu9opvQ
	(envelope-from <linux-media+bounces-67488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:23:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD74774AE48
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:23:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I3YaPjb5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67488-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67488-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A30CA3079BC6
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA00C40961C;
	Mon, 13 Jul 2026 12:12:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113640680F
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:12:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944737; cv=none; b=ptZhu5OqT9J0USwHYPiWMz9SUjA41khE0yk0e6Av5F595fRDm+Q0c7FVqbYsahkJnxCHFeAGt18vMk+zp/PR6pTsh4Frs/HE7MNcSA8LptIgZ5Y3u/kaE2mnqIlM/88ymZpve9cZqHmj4WTchNL8LVamKUQV/769Bo5NqaO+u00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944737; c=relaxed/simple;
	bh=UMezn0MtVX4wmhIqEFMG2LHdGGi0DGlWMdQqs9pdrgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNrTTqrI7Bk8PXnlXYt5rM716tI7QpAX+QQqLbZ8D5icKUge27JtaIRF4jtvARrBlTIelWfB7Fe6q4q8KBmwqpOD1rpxc2Hear+A8zo17NV762jDgUS+BM1tTp2aeMaH9i91p4flJuveg5et98Zc3exqNAFPtxT3Al8m39S8Ngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3YaPjb5; arc=none smtp.client-ip=209.85.215.179
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso1952551a12.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944734; x=1784549534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=I3YaPjb5ZzjEuHzLKf5dGxe0UuhsZNpJ/c9bq8XqFoQZB0HUU+RhkmScD5huaHEw2e
         Q3Tq349pYSmafF9pIWXkt5K0AXQ/fY9+8cpMhg2HC4hwk+bA8BSyWX9jCu7q79rtNmsM
         VdHUsI/nt9O0WqyR3MKL9PE/kIT9fS6+KwHh4ZlhyDxmsMNh1j63d6is4fE5O0tnuWDG
         AViDe5lp5vPAqeH3iPaacg/QOe0isSC9llrYPlEORrZplA7s/wgLshyTjonKgS9eGJ9L
         zV4YUlrVb5EfqbgzucaMwmgD6b5rCC5t7Sxb/YmkIv7hUApUwI5gBfA6IPv0TfAiEXf/
         Eirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944734; x=1784549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=prRlHsJKUDkkWGafnXU2/3zK0CaLwRwzs/3mxOUlHDQDPNRZfe2gi0wvXwN64BtYza
         w89FbEx2DgyrxmDvcnHmYkOLqTkeFDk0EI/yB+DUanX1fCN1qhR0D1dcrVxONQchXjLy
         vQdBhm/ScPaeN4HPEjXdZ0rVr4QLfibts4IyO2rXN/xmGup9SFBXV/sOS94ptCSCsRtk
         4Nz8W6QjjjGw0wCFiK9azy4a1V0rRRXc6lBTL9PF6ICxPpnQeTFIwhIjhGdqmckMbLkt
         o3MEoeOGbhvTgkIBs2Wy6HZB3wrA1PDR3c28Vle1sDv952PXXmYrYrSuXByLJzdEzn7g
         MmYg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8/u9fDfuNAcrB21rNkTqbcFsM6Vtv8K9CTeJyuLd+Xd75psxF9Nmdc43j6vPjEb1BVp07BiHLanA50g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0m4ox8keCG+T6LWrRGj7nwvydg3pMs4nDsd7f1UYWMGCYn1l
	sr+ypqsRUwDuqequtlXAvlUbUXehT3MtP3/+OBxYtTZT2OP//LGbXOp6
X-Gm-Gg: AfdE7cnLc2bLjBqsak8Xkk8PiC61XkmmZLmbftUEYFJ/7IRNNMEdCFPCdZufsJm3TKX
	UE0n/SNnk45EEn5iH0If6vbUMnuXB4dkPANgfOfI6tRun+lz+SriQmG1Dkpv9dv4pdTZt9lcMuN
	w75FojNJ9ij3z96dVPMG5nydHf66Ud3a2QMRNWPYScfXCivo5aUQax8OBkQKVfPo+FvW8fLS9f9
	0OhIoK0ZCM7A10KQJJoe5G23BHWbrTPaacmW0v9kCNfN/eznfzE8pJzDmZrVpN1IyURWmcamo5u
	QSz9pSma+gxEzn0Z8NgxlBcdY+Lf3z+xKmQnk8Xq9Cjp1LdUN2wW4jRLSRPMzjkWykT3X6pBs+O
	JUxEWHPYS44AtBU1rWJRAiD//8p7iV5kfi1ZYh+mnu4cqcEHNgC7GDH+0N1fy/1wXiKIn8kaTpb
	kDYgoXWh91Dw==
X-Received: by 2002:a05:6a21:6817:b0:3bf:80b8:9c8a with SMTP id adf61e73a8af0-3c1102d7cf9mr9542534637.6.1783944734620;
        Mon, 13 Jul 2026 05:12:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:13 -0700 (PDT)
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
Subject: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits and maximize allocation boundaries
Date: Mon, 13 Jul 2026 17:37:14 +0530
Message-ID: <20260713120840.17427-20-linux.amoon@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-67488-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD74774AE48

When importing DMABUFs exported by the Amlogic video decoder driver
(meson_vdec) for hardware-accelerated rendering paths, the DMA core
subsystem throws constraint validation warnings. This occurs because the
display controller master device lacks explicit DMA layout configuration,
causing it to fall back to a default 64KB maximum segment size limit.

Address these architectural constraints during the master bind sequence:

1. Initialize and validate a 32-bit coherent DMA allocation window by
   invoking dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous scatter-gather allocation segment boundary
   check constraint to UINT_MAX using the dma_set_max_seg_size() helper.

This guarantees that large video bitstream frame buffers can be imported
and scanned out across sub-driver domains without triggering allocation
warnings or page boundary splits.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d32..899e70bca4ce2 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -202,6 +202,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto free_drm;
+
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-- 
2.50.1


