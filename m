Return-Path: <linux-media+bounces-54848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCLFLOvEq2mRggEAu9opvQ
	(envelope-from <linux-media+bounces-54848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 07:25:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D922A5F4
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 07:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41AEA303C014
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 06:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968933081D6;
	Sat,  7 Mar 2026 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwhOEqsP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A92264A3
	for <linux-media@vger.kernel.org>; Sat,  7 Mar 2026 06:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772864737; cv=none; b=osGrm09IHKESpaDmWMwNR96+FR8lhAj4Y/EKDWfeSgMVoNfKJ+2Qsr2s//794Bo9DS6ppc4qdfln5Bx39dsiroYkr6FnDSC2uwbdM2iQhItoDlEGC3NeEUeQMal/muK4pcAIwDdIpTRLoCNcrFy9f0/V/hNqY0Pk9JxQF62jYoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772864737; c=relaxed/simple;
	bh=7GXPB5tPIENL1r010383M94Fh8cc+1SaXwJPoDMp1a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYdZx6xwKvUzUKaerMCKUPbX6QFNYFBiOcLYC+bVJ9Mhe+xEDjko8U14kFYmSqyuXjEG82pfQjCHSepYpTlCT69fDVGrZLwgFEO4sjSIDqP9sxmpsJmtkadbkhVzwig+ZaUyBzLdp7V5HvRjhmHNQhhKqR9E9yrLw2xmunB6zw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwhOEqsP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-829865a8471so2686108b3a.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 22:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772864735; x=1773469535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hV+qom7OsL2lmYdSGEPwQnrfWB7wQ9siJwxTvLW3avw=;
        b=NwhOEqsP909ZmAvdJ1PxsyY3DpgsQ/2kt/UkqBmWRQ83lxZanJuqz7gd2rglGBIbpy
         i5mC+SLpuYuICRH5REJen4N+lbsQV3hjEXyYsRESWRNMYmwiLy5EL18W6dkQ1CPoUyul
         /Hw13eMh/c1pqW8t/MR3Fs8+p/Ue8/9El/oaU4cVGNblUbep37gRxKPglzE61VYoxR8F
         5WfJR+4ydc0q/XGIggHQ2RMXT/yOFZ8CemgJ5qqqOiHql65uxasCGiRg2HeQN2ctbrs5
         hS+4FUrdezYiPkrl16QYEogVkkNXIuMqDxDWffO79/reeHVwXLGxYGVjuTjfJePaoGh/
         M6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772864735; x=1773469535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV+qom7OsL2lmYdSGEPwQnrfWB7wQ9siJwxTvLW3avw=;
        b=dXAlCW2lCyY1A8ZHl9OVjuEqG4+kyTgEPErigPMtqoYNlJWizS91aqeW9NGy/2Gp/A
         DZOrsoM8CPS6SFmu8DC6NlLmkKrSpiP9/ZPcQfjZT7HWwz+hC1h8PNSPZkjx0OfO6ZTa
         Jvk8MDx6t5hIGBviH0Z6O8NgZSKd0bfn+6L8oEa/IlJN7/yYgWxmVEAem8hzkRYNfwgx
         XxemwlBD/mHhwJfZp5YoqUOy8XZ13FqEKnAzPdTI/VJmjo2gC4PwpKepu6CF9O7rsKDf
         ASsz256McELjpCccn5KentuuNb9uXy/pFWP2S14SwvLotqxQAMJZeyOfDnb4scqmSzPG
         vYuA==
X-Forwarded-Encrypted: i=1; AJvYcCU7qedXI55Qf+Smu9MME5z1hhBtCSJWCjgOPe0WxBVoTXkFBlMpqXOX9OKjfvwu8j1YZw1sLEdwJ9M41A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcKlDxew2gtX6/7b/iwMRqAV1/fqlN/1Ntp2sESSUomr+MIUuv
	52agHX12+fv6Dd2S+lYo3T9jIu17XonKtJcAJEuTS+IQKv/RpbNqZH/Q
X-Gm-Gg: ATEYQzy8z0GdGRNKcx+DMfuKx47bwxPJv4m8fqVi3qLTf9mp+E0cPgrqPZtgGssjo7z
	ryOQAZ81IVgPGyj4dSaz+5x+jKZzk4PxLDhMW5z3t7CTV/VyMm++AfFxezvuywzd2N+WgUycBui
	wmihXJ2NvjSZrIptsGGNmzATeDvFIBt40EUCaxeRhDBiu5j1d6rmw5wD4rlFzv9Ec52Wi1/Snak
	DMrXHPsLPT4Z7N0LPxFQuQR03oObaxF5kqVZpK8a5AAdW5vcoaUAKhp5DZHGGdloRcNqkPQuT5m
	eZEbZrqkiotB52jBd6Zh4UpStqKEmODEttTYVILhkLgwFGoYivJCmJQUksghiKealiNOW13bl3+
	lV5wY41UTLAohRaUCHzqTCu4WC6gi18wmdZF4ckE2jyEOyz/W5ZVoxJbLF6uSFh0ol+fefYJMGS
	jzwWAx5SvSaANGwire3VWC4/harLW9OOwAjGutwgT8ZB1WwXwiz9+GCU3iFqGZMO3OO8nyS95uB
	1dZoGw8PVMJzLIX
X-Received: by 2002:a05:6a00:c95:b0:823:edd:20b9 with SMTP id d2e1a72fcca58-829a2fa9676mr4591649b3a.61.1772864735289;
        Fri, 06 Mar 2026 22:25:35 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4866a72sm3451754b3a.36.2026.03.06.22.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 22:25:34 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: media: imx: fix parenthesis ending checks
Date: Fri,  6 Mar 2026 22:23:53 -0800
Message-ID: <20260307062353.22069-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3B4D922A5F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54848-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marusikadamenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Remove 4 checks for ending with a parenthesis by removing
unnecessary line breaks, and forward declare a variable for a function
call that would otherwise remain over 80 columns.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v2: remove empty line
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


