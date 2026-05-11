Return-Path: <linux-media+bounces-61164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLfrIaQOAmplngEAu9opvQ
	(envelope-from <linux-media+bounces-61164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:15:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6842751331D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C4873032D36
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B46B44CADF;
	Mon, 11 May 2026 17:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1B3cRTm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7501441037
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519550; cv=none; b=nEZ5PUpkiUJCWrmF7uhuMurRylGi6gHq2Vzn2k1QxhYpiNFDfqNtUGByakJDQqs6dfNO683n98HsKRY1RSty/m2uNm8qSsMC7xehtB3lA8VmUC9BP7ge4TRuQyk0SSktIcV+fyUX0Ln2oAKSjh99cHx4/ps9qbqq0lHWD/eqirI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519550; c=relaxed/simple;
	bh=Gt3yIVFcMfYZ48mYTPU++4MAqYZaXfW/cae5IEUlc88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecPCjeTk4To48sk+3wq/ucuRIIis7skIAbVbvsC8m7uXxQd90mBjzBkR7XKIfacyTAzVscqQ+TCWi1VHErpOzsetn2bIMONk1V7yLT5MDC3bC0W8ibstaj7xyMFVaaOCKn3qdqF6NDcZfv9cxoLSMfiE05t43UahMEjGcOW00nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1B3cRTm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4971146e87.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519547; x=1779124347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HLgvNKbFd9dvErpzRIPe7Oy/Q20OX1O2SmZxWVb8gM=;
        b=S1B3cRTmdSG7WhR78gz+ZcCvPVN3Qqd1GOUiUd1N7KWGflFn2rOwh9TzFmt0FrfwY/
         z0rHWIeH0CALbtGzZHAoX9BnoEnrUzhh5X/9QCTz2+0a5PBPnTVtXY3ia6gpdkUSiMsy
         9HY/mbKKLOYOQnVuLinJ8mhZZulo54IWIpsic1j0rLvDe4dSo5/M432pvzDo5YMCPBEk
         mER9FQ5Zvn+gr8reKT6HsYS0Mo5VZZLw0oS6FVz57kvzFg8NaKL+a5G3z3jKc1wPET6K
         phcXLI4idnuWe+4lD9yqf1/UUaOZ77BG+SP53JrC38qsAxTDgd5uS/wRboaCrNNf0kZZ
         lSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519547; x=1779124347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HLgvNKbFd9dvErpzRIPe7Oy/Q20OX1O2SmZxWVb8gM=;
        b=HoJl7bdqV0p+EgqbzqRfX1LrJunDZwR2ncyJ8EKOtGOgxP9Wg9wsYoMpHuln86jbra
         HbQr8ytDpEUILZoy8pV2WmrhGjzD7wGZxnaXqKNcSLpRbhyklg/tacY0McUk1Z37j5BI
         Ui1RCI0Y+T6ebjEMuDtw5XHWU85JaqTHc/gaaNb4REYfYWRfxGwq/g933eCPBpHKDu6S
         ZR6x4256GaEu+89+9nhYDfltbnfYisn+84EAXJfv2LdGQi/awL8V8PPM1isRkXvNVGRk
         1rZU/mtodd5l7x1Tc3pVdOpwKDQ87SAsX6V3EjCYBZZbsN2TCnlcSlBn715pzQaA6lVW
         8IuQ==
X-Gm-Message-State: AOJu0YydcMU/LpoDEZP7LE9PScoPKhJ1W7/J79YlESW/8Q0dA1VTyFD9
	hBRgOK8tT/bMVPcwVPJ/jAgP22xiOiL8/o5mVdLPx7whAyvShekxJwaWa66at8G06luR1eaIw0g
	=
X-Gm-Gg: Acq92OEgGGr/Vsox4bcu+TUrcduwZHLDhQeQClHkhVgA1BBc1AZqdS+U2aH2tbLgLJm
	Mx3YarR/Ld4kWrlT+sYSAUL4K7LMI+AuQqBARlPTBe3N0RZk8crx6Wg/1Zs/VD+QXrVPDRUM3FK
	ttsExOFDN3AoxvJ/yestVF6P5L5Ut89oFHwdqq9K5W5a81pgN1nUXlhtczD7eLuY1N9B/5zrrbK
	5X8FGZ3CsgjABAoDhk7092b57P64XyE3fYd2uFArlVr3HzKtxR5KJU7NhhqqW7tPrx/bLtjOD+M
	Z/qNqPTTQjg9IqWtGdwMyRNbamenALocjga7z6Z23+x9x96FQdd7zoC3EPP5dpf97UzW1wxmHV3
	M/WGMsmSgykmfuZXAMWl75yhxoe/8pflkRJAmf2WCo88wlIKj4Kx3jPbEXyetoRNZ8o7qcN0kRm
	rJvouJC9XL8WZ3s/nA/I4tL4nEf3JRJfzuYik0iL5Kltmxz9KeyW2na7zrvm9H
X-Received: by 2002:a05:6512:3d8a:b0:5a8:a558:63b3 with SMTP id 2adb3069b0e04-5a8b709b088mr3026360e87.30.1778519546521;
        Mon, 11 May 2026 10:12:26 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:26 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] media: sun4i-csi: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:11 +0300
Message-ID: <b914d204dbcc642e56a8d54dff33c94f1a9802fa.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6842751331D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,gmail.com,linux.intel.com,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-61164-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

sun4i_csi_start_streaming() returned -EINVAL when no matching CSI
format could be found, before any setup (scratch buffer allocation,
pipeline start) had been performed.  The remaining error paths already
converge on the err_clear_dma_queue label, which calls
return_all_buffers(..., VB2_BUF_STATE_QUEUED) under csi->qlock.  Jump
to that label directly: the intermediate err_disable_device /
err_disable_pipeline / err_free_scratch_buffer labels are skipped,
which is correct because nothing they would undo has happened yet.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index e911c7f7acc5..4781db21c205 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -234,8 +234,10 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	int ret;
 
 	csi_fmt = sun4i_csi_find_format(&csi->fmt.pixelformat, NULL);
-	if (!csi_fmt)
-		return -EINVAL;
+	if (!csi_fmt) {
+		ret = -EINVAL;
+		goto err_clear_dma_queue;
+	}
 
 	dev_dbg(csi->dev, "Starting capture\n");
 
-- 
2.51.0


