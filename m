Return-Path: <linux-media+bounces-61555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKg+H+oNBWqBRwIAu9opvQ
	(envelope-from <linux-media+bounces-61555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:48:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DADFC53C221
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 902A7301BA7C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6123CC7D1;
	Wed, 13 May 2026 23:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqSjwDsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2A2D29C8
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 23:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778716133; cv=none; b=K4b/BiXc5gKdhY4/whpPIA/JYGeEY8GB0SCfG6jvw0sFwJg7horby3ty/ysFa0kG6B0zvorv3S2qGXkbzfJaxQJ7tn6NzOD7ayjLc+kT7AeMo3V6nD/Ok1v8WanQE7m27DFzIPvuNcAh+Gd3srn3dOMtsuBlrzQtpBJ4IIfLg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778716133; c=relaxed/simple;
	bh=7RnweES/3BBDREpOLoaPAoFF0/byxvWbvetddrWEPaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WsJD9qZmgG6jsFTlRQumVAqQP0wfBA0JV+lr46Lzpl+vum3GzbKDU+OFwyTXCrA6S4lRa9sr6U66Xsu6mOIwOp5c38rADv7wyRPzkrlMd//qMBOHQhigVURE28AUjNxB3cDT5h3Ei/7NrOHYz6kYqdmP1MNt3ANsKP+GFgV1Iyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqSjwDsJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so4612475a91.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 16:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778716131; x=1779320931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UrZms1YGy08pfMZYjXbQCN+Raqs8ZCHu2rMaAiJhY8g=;
        b=cqSjwDsJnIdEGI301VSh+BLefBggpYL1crDvdzGoO7KMnpzks3FqsNNpzRfQxYjESq
         mYmkOv4Myl9Gx8RVLoqqsfumnIMrCxGUVIeXbuqTW7x4Zt4fIFu3oqi5PQVMgXdo6Hj0
         CBfm83g2YaO42FwDFlCytMmNd+XC4fPaUCh47esXX1978vAHLOjfhDM3xSNMiPIuOCAm
         mw9cp7A3afFraj6GsSfK+B0Dkaw/XqXlk4xWi4/2juU8qjaJJZZbKmbiS1PNLM6X/Lnb
         4jkTRrQEDH0T/9bCA08NnwFTeuZvD6v0M9umo1861n3LPeyvvU4W0aQukyNLXwSvCZuB
         MSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778716131; x=1779320931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrZms1YGy08pfMZYjXbQCN+Raqs8ZCHu2rMaAiJhY8g=;
        b=ioJ9k8eumBb0U3KRktTmDgK0hwDQ+ZNkz9CnB38rDlFTVfCggnjIZuAXmEymhiQ64I
         1m0VYOju4GpqnhWAyvnp+ZHzNQAqQKchevH+Drh6sxXz3YGobL/MsWBketqAeu2lKLfm
         RT4LWI/6fq2I+KXI2FvvlhRyEOsaY4qJgp6IE8RqgqR5zqDaSiGtMGkEstVBagaNqe9/
         7xu0WunMPYOVB2+9CPf7a622T+CgP0iYnIiIE+pejRf2FyEoc8RI8hTJY4VwburAnXBT
         LrN2UauOT1/XGg2N10ZSnhSmv/wDdHBpsfwbZBMqIPmgp1XPbNtwyC2amreLdaM9REn6
         tF/g==
X-Gm-Message-State: AOJu0Yz4gvvwr9h3PnlVg8FyAH98rffRDxFdqcsAZ/deX5QAyNzQOMTG
	uvuPBwPvSxd42Qdym7zJB/sE2pAAdfFIW+iN3ocSV8TCZbqZsxr5wWmsPpI3z5ZB
X-Gm-Gg: Acq92OHKtLiVwWWZZf4pEZuLludh/4C/e/51NikYwX7uYt4EZUsOA1byLx7rKjDBzrT
	khZANS5KSBxhHCHUyNstOBFcEYEeFwbUaqPh+H2Y0elbsEd7ijruqzmFkvC8cCWhFiYmsOlBo7I
	lVw5acKRfxmt0A32Hpcf2MPHDwJp8gSo2u/BfUkdtX2RIQo98Kg3K6olw3fJKTYIOKccMuoZ+My
	4BBhaeuDDIQ3YC4xvACotA8y9MHUnruB2KfSzBjmbnC+NGtZeGTcMWPupz87Ay6nX8pMTmx0M8R
	rMXBFvmNLb4sFwitCsb+KjCWq0FgoO+6/Iz28ConO4OVzblttwnOO9ffjAhYQAsCIjxcpJvT6ix
	hQ3e1xEWdW35EDjHLPaug6bk+0eGygDiHy+xnfjvdZMeKgKyf+5yMs1KCBXt0s7AQsn6b0UJAQr
	rVlFR5QVXUcgO3qqVmbZSKWZkSNNjQMIcf/G1SAPC/4UcE3wKoDw/T05BbVTA6mOmfj9D38Zv6h
	NCOEQ==
X-Received: by 2002:a05:6a20:94c8:b0:3a2:e0d3:37d2 with SMTP id adf61e73a8af0-3afaf61f28dmr5796571637.35.1778716131079;
        Wed, 13 May 2026 16:48:51 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.102.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1156absm365440a12.27.2026.05.13.16.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:48:50 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Moksh Panicker <mokshpanicker.7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Wed, 13 May 2026 23:46:14 +0000
Message-Id: <20260513234614.8889-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DADFC53C221
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61555-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
Fixes: d90b336f3f65 ("<subject of that commit>")
Cc: stable@vger.kernel.org
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..9908675c355e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
 	int wo = (rbuf == NULL || rlen == 0); /* write-only */
 	int ret;
 
+	if (!d)
+		return -ENODEV;
+
 	if (1 + wlen > MXL_MAX_XFER_SIZE) {
 		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
 		return -EOPNOTSUPP;
-- 
2.34.1


