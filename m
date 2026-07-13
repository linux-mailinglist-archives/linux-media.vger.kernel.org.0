Return-Path: <linux-media+bounces-67480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZg7HuHXVGrbfgAAu9opvQ
	(envelope-from <linux-media+bounces-67480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:19:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BE74ADC5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:19:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XXOCGOpk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67480-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67480-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1835E35DF7CA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B02A409638;
	Mon, 13 Jul 2026 12:10:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24E408629
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:10:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944652; cv=none; b=Hjfz4/a5WXZpYdi13trdcMDRjUlk7Vgy3YkyEKa4vwHgMec+n2tp5TKfkW3+Ui51PRtjNNRG1jpIz6YUfBbRB1W2i2iX5YpOTQOywgk57DJVCCfqvmv7H3HIJ+9/fK0Qh70gYv9A7SDBSOlYO6ZUTV5Xie6hSiCyptVPZ8ZPgqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944652; c=relaxed/simple;
	bh=86BevP00Vb2nr0l/gWPTl/2RFuTXiK146v6jmeBi3CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B79sHR1tEUV8nzqZBtZKFB9bA4XsWD8nf4lhmMZClZcKsL8CP3fNi5gZJvgQgLNU1RnNBxm7wceQyrNEZqPj5lIAu21uTsliCahzI8I270U1uFsHv2v+5BhWZAzrh27HDfgGpaDll6cpssO0PeAGFZqkvEnjPevfcnikGTQUmeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXOCGOpk; arc=none smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38101f85591so2893122a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944650; x=1784549450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBddtjFYWhyXG/z7saOr360Gpb3JLBOtzUiY/pJ38ko=;
        b=XXOCGOpkUgaV/3+z0sqPfYO7HxkLlNfIPH9eebx4mUe8KMFF8Z/hWVH+O0kReB5VJc
         RZuryn2ASjEC3RDkmPVmUSBKkvMxvDiq+13DW8ew7MOKY+MwpeIMz+Mhv0pnOreNtqlY
         ijbE9J0rHRL8IvDiHnbc6ITGU1J/BjlMyUo7Yu16Z+JMizr1cgEQQ90+wyKkFF1qrnwu
         XNQV9txsyDjOpTUC5qW28IegxQwdgdge8vdkD0HGnCAohX12Y/1V2B3DTw939vEXYISP
         1zr4Cxv//NSwjYINsAepcGTbA9MiM1G0dP+bgcscBAOpM8CMlXjdqqr9RaORlFMlxSyN
         K3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944650; x=1784549450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBddtjFYWhyXG/z7saOr360Gpb3JLBOtzUiY/pJ38ko=;
        b=CzhH3AcoFhoddKzDPjQEGHxmPlyzSX5fxHSnSBlCcZgxFix6eXbAkJ/IDN+oSzG+wI
         FS7amAzmcMC/5q5p/LBa6KRUcXmIbuXMI9nFuz11wkCZYOqVyvSwTSw1AIxEjevGGReX
         neQFU+tVjJc0RwgwGjxdBb88NRA6DfDUPF/lYdX5oYm8zMDVbLvmacbBDsaslfYslgqr
         rsAhTb1CjjxGo5/HyiyF8Eu2+MM+cqccLgJDR8hETZOO9IT5Jqbhb9JST6FJ6KMe0tmx
         BhzXDH00Vs8XYTYZbBNj7OW/DwyqRQhnCZHOR4I+3eDNfzajDNdKpnaydPBCUdMGepLg
         5o1A==
X-Forwarded-Encrypted: i=1; AHgh+Rq7tK1ss6PchnzlA6Ks2Bol71esejiaSGD5SIUIWNuypXpxcOi7QELrPSqKlO+NAj6FKZAkclWs7Pog4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5V1XlCTLAl/SPg8AW5FXPepLIqXEXjUBv2ynOWjEznUUj5kr
	tRhTAHPkvk+Uedjvqw0lhwjYt3jNSblMOtjY/wZGoR0dUJS2ucVIFwYU
X-Gm-Gg: AfdE7cnVRg8zamlYGrDX6xzajuusgh+XXjierIfxWhWx5YFKr8M4n4t2Z+kEbzIkbi7
	kwiOAlY25pRJ1Kl9oCNA21aL70OrN0s3YS0x4681lyp+wEwkqB2EqmqxrhxwWfY15aYrc6mslnM
	9uQ0jJ2f5qgG7IBuj1lwdRaDJMR0Xn7y2kdd6FeuH+jZg/4+EtM4qlbkpd+Rsc+bJL30iYfz5ZF
	v0YmtDR5vBGd+W+3CC9kUscnHPGRajQXi+PICmao980WsEp2WhLNYvRj+HL2oHwTkyNzcZh91Bf
	SkICiXMEhIhaMelXwqw8KaxzmucPtU32GZfs5cH49ZkHs4Fj90ddwe9r2EH189xRkf9C+DweROX
	SUpMOm0jfdQMJKRhYQY3mUWJa++8kfZCwKfTzm5g031LisEX9cyv6xpH/DtGBDvjlI/8PD8DPNt
	JEKf+ygc6KeBc/0Fvk75dp
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr15327432a91.4.1783944650044;
        Mon, 13 Jul 2026 05:10:50 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:49 -0700 (PDT)
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
Subject: [PATCH v7 11/19] media: meson: vdec: Update core m2m stream state during transitions
Date: Mon, 13 Jul 2026 17:37:06 +0530
Message-ID: <20260713120840.17427-12-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67480-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D68BE74ADC5

Explicitly update the V4L2 core Memory-to-Memory (m2m) framework's
internal streaming states when initiating or terminating streaming on
the device queues.

Without invoking these core framework helpers, the m2m engine's
bookkeeping of active source and destination queues drifts out of
alignment with the driver's local 'streamon_out' and 'streamon_cap'
tracking variables. This misalignment causes state validation stalls
and incorrect polling outcomes when the device is subjected to quick
runtime cycles or strict testing setups (such as v4l2-compliance).

Fix this by integrating v4l2_m2m_update_start_streaming_state() right
after a queue is marked active in vdec_start_streaming(), and pairing
it cleanly with v4l2_m2m_update_stop_streaming_state() at the end of
vdec_stop_streaming() before the session core mutex is released.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 83a9b1238972a..0eb39aa6014ee 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -299,6 +299,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	else
 		sess->streamon_cap = 1;
 
+	v4l2_m2m_update_start_streaming_state(sess->m2m_ctx, q);
+
 	if (!sess->streamon_out)
 		return 0;
 
@@ -529,6 +531,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			sess->changed_format = 0;
 	}
 
+	v4l2_m2m_update_stop_streaming_state(sess->m2m_ctx, q);
+
 	mutex_unlock(&core->lock);
 }
 
-- 
2.50.1


