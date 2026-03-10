Return-Path: <linux-media+bounces-55025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHxLEotlr2m5XAIAu9opvQ
	(envelope-from <linux-media+bounces-55025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 01:27:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5F243085
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 01:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA6093036D4B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 00:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24677211A09;
	Tue, 10 Mar 2026 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFhoGIOG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CD13DDAA
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 00:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102437; cv=none; b=nlx5Y8zMIZ7ahkhT7NwTgXSVKIlReAbPss4saESBk4A3XiBveyLOMsOKiUd5Cjk3F1UETF3mGqfVZuG8NkQaKgqmuIUNyxhRxpOLFtgBhaE+8uv43M1RPyzdeuUq0bogmuyTFOhU2b7o6yi4pSZ3ng2RGdbM1grRl2SRvG2YkaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102437; c=relaxed/simple;
	bh=XJlz7TAx+3J7IJ76cfvjfM28sjsC5jwU+vA9iaG8HY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fL8Mn/fCf86lTOxcPSm/dJZ9SRhJ8ECY3G766j0WbjEnQ2sqU0CbSw+CJ5VaQZyLcjx79pjJwgUxOndG0WrCltDI8ZirA668E7lXBHOpT/DteqAwvceOVJGb7zoGm1JbmxPgjjNDpDAQcx2AjgamPv4WXTn2IwYFKIkp+m0edeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFhoGIOG; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c738aa3cbbcso3465514a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102434; x=1773707234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBSFBJjMJpbjZ3yrhCcXTD3ypyojE/o7DNoxI6+C6lg=;
        b=QFhoGIOGYcPD8TMzi0pHkemrcNtxypLP+nY23YCzpSIFDZPZOYyJAm3mfzdGnWcT3y
         N5eMHcPbU4OcN83J6qw+fdaeVLnKYuv6rI439Sl6Y6/vqkEpduKargKFTvnbIVDjklZP
         fqRojURSGfwLU7YUAdIYeMYtuMfb/lRXaqHqi3JbBVBFve1wbvCPCF6W2bVayqM1WZRN
         E/W8WiKrNpGRAN5ORrghDRXjyTo+j2JhwCdcBUfJKqwPUeJIRcRODdNBKtDAVrraC4SV
         kOkpbhV7jX46Hbej+6RBPrm2O0WZbRxc2fhAkHonoCytZdTnIBtf1NJi8U6b2nwmenV/
         7pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102434; x=1773707234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBSFBJjMJpbjZ3yrhCcXTD3ypyojE/o7DNoxI6+C6lg=;
        b=gphK6JoA8kdWCfOksoY7sHCuqgQ7YK92LvTv0GYg4DJqY93t/9O7qYQg+gn765OKqN
         LLkw4tA6wjBllr+vdiCiQOraYU4C3rCuDRSpnhTYEQJdN00N5+8Go34N00wcfH/Qr3kN
         /15vlF2yQ/ZIAH5kqChb++xQ7SG3b5J4kRXAXJT7uDtuT4MDRXM63qU3uforsrxt2Kjy
         twLFipXxOvGcepORrtsexITtIx+sUjnHxfiXskhae49k2Cu6vT8HlXzw8K5iix8ThbfM
         G5F1+6Dc0c5q5Qh4JI58DNfJXQUP/MNGtrh6CywnGUzbM3HS7zSEuS0sv03LSgYlTWpK
         mwtg==
X-Forwarded-Encrypted: i=1; AJvYcCXIXSDTixsdIGWsPuNDqJ8ybiFQEfUyQJxLwO/o7qmx54jZdJWGk9CFOyZor7kw8WONinHsDDaPgWn5Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj0QwBJNyl/GDVJNCSehGNslw+NJknW2HkrcsbXjNUe7yU5OSu
	p59XoyDd0fNh+v2xVfMWRGdPhTN/p3gOG/B7if+1gPfLKXlwzPzstrr4
X-Gm-Gg: ATEYQzzEN56Te/00rhnLJeq2ht3U0hc6kiMdOtVEKrp9BRQbii0P8/2Mg0tf5pdl1Ll
	s5ZRveIpf0fE8LsHc5/bCbLi/b+DEcV6US/ZPpKW0q8NLtEIvULnjWc+X36axzaM/ZyluX4uUXo
	RWSp0DbW697Wfxqg3CRhMIQLFe2+w5B7bZC6E8NldNYMb9FvW8CEppZkGDSWVWBnTGjAJAtpxSG
	LxiDuHW7OYPCQ/NwNtyHXYAnWZjftoMUBSSWXX/Y+1cDTmT6KWrsZVVWWOMdqVvVrzyEe6Z+1ag
	fR5n8WEtftCGKbaMoreJf7uPBbotGXrM+OBtJI70XnC6JD0MQRRxSOsZ6VnIn3KiJdcjJzAWmOH
	Ylw9uzuo9gvhtE/yzqgvtBkhEdBRf5zWSlFYmWrFmcFZjGOVDXh8wLZtIHhep2GG+XqjiyCy6Xk
	fGWn5KM7N3OpDMps475D2NESPyHLun/LSqrJcq3gONGJUKRqmXOpMWuXBLmkMdWN/4zMzzoHaDh
	YSvFlqv0zegIOs4
X-Received: by 2002:a05:6a21:8885:b0:398:7fd2:5941 with SMTP id adf61e73a8af0-3987fd25c81mr5602489637.44.1773102434555;
        Mon, 09 Mar 2026 17:27:14 -0700 (PDT)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e183596sm10245803a12.27.2026.03.09.17.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:27:14 -0700 (PDT)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH v3] staging: media: imx: fix parenthesis ending checks
Date: Mon,  9 Mar 2026 17:26:43 -0700
Message-ID: <20260310002643.27465-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D8A5F243085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55025-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[marusikadamenko@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Remove 4 checks for ending with a parenthesis by removing unnecessary
line breaks, and forward declare a variable for a function call that
would otherwise remain over 80 columns.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v3: fix commit message
---
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..2339b59af7b0 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -315,8 +315,7 @@ static void prp_setup_vb2_buf(struct prp_priv *priv, dma_addr_t *phys)
 		buf = imx_media_capture_device_next_buf(vdev);
 		if (buf) {
 			priv->active_vb2_buf[i] = buf;
-			phys[i] = vb2_dma_contig_plane_dma_addr(
-				&buf->vbuf.vb2_buf, 0);
+			phys[i] = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
 		} else {
 			priv->active_vb2_buf[i] = NULL;
 			phys[i] = priv->underrun_buf.phys;
@@ -704,11 +703,9 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
 	else
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
 
 	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
@@ -750,7 +747,7 @@ static int prp_start(struct prp_priv *priv)
 static void prp_stop(struct prp_priv *priv)
 {
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
-	unsigned long flags;
+	unsigned long flags, timeout_in_jiffies;
 	int ret;
 
 	/* mark next EOF interrupt as the last before stream off */
@@ -761,9 +758,8 @@ static void prp_stop(struct prp_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	timeout_in_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
+	ret = wait_for_completion_timeout(&priv->last_eof_comp, timeout_in_jiffies);
 	if (ret == 0)
 		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
 
-- 
2.53.0


