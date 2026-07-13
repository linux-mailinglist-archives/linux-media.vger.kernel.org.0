Return-Path: <linux-media+bounces-67484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o/j5CRDYVGrmfgAAu9opvQ
	(envelope-from <linux-media+bounces-67484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2261774ADE1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o2N95+fS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67484-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67484-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05C493054980
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AFE40B37B;
	Mon, 13 Jul 2026 12:11:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21734408002
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:11:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944694; cv=none; b=fhPBeBi073CednqE1O0rhlEwjAfGmh0SX+uZRTu3hVkTRpr6OQUw8B0Yw223SzF5UNdYzoqihE788qSTunMN6da91hAxGwor1k0NS5UwsbDtyfR1WaES/bB9SsjHja4I/DsKtBgKmI8KSxSDGJouR0Kq6SzWl5mf6/b9EYJA3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944694; c=relaxed/simple;
	bh=PdPDblUOn/WdFcz0v/ad9NxuPCUExDaGjMo+g3Frs3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=md31BcXxVmUD1ljbkrf1hIBE9eLG3frpK5p4KgBBYcyOLvBr8Uy54b9Kg/V/ExWMfrrV9uUIg2CWmMm54zJ5JaVlGVA2YNRT3EMgi0TT6HTYd/OHBDjWj3K1kTDN7Ol8KwkC9tABw+5X33CbdSX9U42NAfh20tGtZODX68b9fpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2N95+fS; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381216921aaso3398455a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944692; x=1784549492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=o2N95+fSvtnQBbxQmd/l5AZzbWf7C8AD/N8gsbj3hbKkEkrTdE4R7lLPDoFEPfS/wt
         eH3oI751UNyOPGG5ZAzwjLGCzGqEj6otaKKExQ1mYirWn/+Dc7prPr+C0EIKM9NFE3gZ
         C6NZAaV8zJxVYXQlfe5gemnYcg0vPwJBU5BQAo8+1D3QqhlgTwhToFVBcAP5sNfftnTf
         +tRMGSrL4Y9oTGGSAtJ18XigSxqizvAxFiTDXL4hLgOQ0oR7Mr2K1wTX/leILfIaOtRm
         oddhJ1DuLfIgFnYOhVTx6BZIda7/5C4/PXCy+rXYPL609xzRtoE0aMZlyrUptQ42GnTN
         ZCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944692; x=1784549492;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=GVyHliRsWLz2mOl7j5U2uK/hHZ5E+GcmNeixgyHAHQXs1QlOvgXS0j66UU6YnKowWe
         zCPPJL/QjYvLHGjmE/0A0vT61YCTCBE92U3EI5FuPK0Vi6XhHSHk/0tq8PUz3oI0pgQR
         knMDH7lDlCHSEO6CuBAgjLvI5R55Wh41ln3CaQjK9m4D1RaJ29KiaqpYxz1MgFrZWL8m
         OPdEmcXvcM+ww++zj7oDoar4lyBOTT7dqR/6XLAXrTMZc9QvaBpafz0kiNHSaU81XnoI
         SmkRShn/8cMcaVqfJtgvrQ0aZ1gG0xYVe0Sg+8UC1YAnGSAu62bHRZCBFhVBebwooKcw
         K2iA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4PCiSfUaCseQ9h1t6IC9bSlUOFJdaqnUuugv4WHZIovjSETAn7+VJCsggQQn0RcdiL4PK5bN9CSdyGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD8/YxZ/sEuXHV/mTPBmu0NHl+Ut+QXV3gL5I/1PJHvEy7ExZq
	uQlUifpEiBemVxAZlMjRQdwxS9yEn52KDpo70xqR43rfxRwYpu6wJuje
X-Gm-Gg: AfdE7clr1Xwm7UOggyW/8SxUlRgZNetw4lbefeW/dPm7+0neT7me6Mk6z6/QEhxcxH/
	9r9Wk/RkGYUFteWmDy0g8G24gNYYNcIzgnyQU2DnMUWz5XAuplYGwT8RzSW/WDJgvoDfzGYNYBc
	vRP+zKZPkGa3f1va7SxwFfohBIwWvYHxLdVTMSDnbi9wUdE92TEVnP5teXHf978/oBPC43o1edq
	WR4t5fOZiSmxcXIQSwparD5tC7/JXcKvUE04+NNW1V5Ss1UYIKlJwYta2uq5ekaJ+UdqdiK14lE
	2pN1rqbOergegZXYoQAZvUD0a42lQ11yeMu0Pfzs1hmYOW533odyO1YXIrsS6b2kYuz2Lc5zDka
	UQUkzmeRhvXYkc4N+pkrp6l+joFk2Vha/pl/01qH9DMiFFdZsimhfvuT5QBTmlTapx+MuK7kqxh
	q9CcNsWG4/7A==
X-Received: by 2002:a17:90b:180c:b0:38e:fbe:b67b with SMTP id 98e67ed59e1d1-38e0fbeb818mr766655a91.0.1783944692422;
        Mon, 13 Jul 2026 05:11:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:31 -0700 (PDT)
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
Subject: [PATCH v7 15/19] media: meson: vdec: Fix concurrent firmware loading race and hardware timeout
Date: Mon, 13 Jul 2026 17:37:10 +0530
Message-ID: <20260713120840.17427-16-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67484-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:nicolas@ndufresne.ca,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,ndufresne.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2261774ADE1

The vdec_1 firmware loader used static variables for DMA buffer
addresses (`mc_addr`, `mc_addr_map`). This made allocations global
across sessions, corrupting state when multiple decoders loaded
firmware concurrently. Under stress this triggered KASAN reports,
lost references, and memory leaks. Making mc_addr and mc_addr_map
local to each load call, eliminating cross‑session races.

The firmware DMA completion check also relied on a raw decrement
loop of 1000 iterations. On modern CPUs this loop completed far
too quickly, often before hardware signaled ready, producing
false "DMA hang" errors. Replacing the busy‑wait loop with
readl_poll_timeout_atomic(),  providing a bounded, microsecond
scale poll with proper timeout semantics.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_1.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index a65cb49594465..27363c9a5af3c 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -29,14 +29,14 @@ vdec_1_load_firmware(struct amvdec_session *sess, const char *fwname)
 	struct amvdec_core *core = sess->core;
 	struct device *dev = core->dev_dec;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
-	static void *mc_addr;
-	static dma_addr_t mc_addr_map;
+	void *mc_addr;
+	dma_addr_t mc_addr_map;
 	int ret;
-	u32 i = 1000;
+	u32 val;
 
 	ret = request_firmware(&fw, fwname, dev);
 	if (ret < 0)
-		return -EINVAL;
+		return ret;
 
 	if (fw->size < MC_SIZE) {
 		dev_err(dev, "Firmware size %zu is too small. Expected %u.\n",
@@ -63,11 +63,11 @@ vdec_1_load_firmware(struct amvdec_session *sess, const char *fwname)
 	amvdec_write_dos(core, IMEM_DMA_COUNT, MC_SIZE / 4);
 	amvdec_write_dos(core, IMEM_DMA_CTRL, (0x8000 | (7 << 16)));
 
-	while (--i && amvdec_read_dos(core, IMEM_DMA_CTRL) & 0x8000);
-
-	if (i == 0) {
+	ret = readl_poll_timeout_atomic(core->dos_base + IMEM_DMA_CTRL, val,
+					!(val & 0x8000), 10, 10000);
+	if (ret) {
 		dev_err(dev, "Firmware load fail (DMA hang?)\n");
-		ret = -EINVAL;
+		ret = -ETIMEDOUT;
 		goto free_mc;
 	}
 
-- 
2.50.1


