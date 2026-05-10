Return-Path: <linux-media+bounces-61033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICh7MkG/AGoCMQEAu9opvQ
	(envelope-from <linux-media+bounces-61033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 19:24:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40167505664
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 19:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4996A3008E25
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 17:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C6F3B38B1;
	Sun, 10 May 2026 17:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfnWFUry"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855D3B27DE
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778433855; cv=none; b=XiCjNYrBJRPoN4qKMz2n+RDPLGZVoYhMNPHC3WbsN61tF4LQp7QbhPtx72BJfs4c/cvYY/YkMerGHZWL1DfqW8cRCIZTnAAcxHWQarDHvK6p1ehHBaVrWHzb0QSHmwhJPhy1+Jfo4f2ni9CgTfp0g+2Bsx+oSgqiP2fTjQvi6wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778433855; c=relaxed/simple;
	bh=pOukjRE3AhLVGkpDoO7CixW5vEgLTaHzy7FZxk0/pVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g9n96EquxImps/J6gUTXlMTFNMWuU4l3hn1dFW7VIxb4ZBB/+Xu6uKJCvLltEZdnSrK3p8TsF1sVrPrY3bPhXCyRQrarsR3/HGHOFdTne18Rd4RFSIDJtIZB3k3HgjZBZLK2H55W6v3ELoGBlYQyVqU+QW6StkUnkjbPXZWKklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfnWFUry; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-365eecc5885so3449505a91.0
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778433853; x=1779038653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPd2RlUj6wU/iDOi4CdTz2GJRj2DC/sQzjy1WbMFzdY=;
        b=IfnWFUry9n25DNauBTv+OpzMKbCNhFkUEq6YVhTkpp5Vx97bZSEcMLjrBj76OOVUv7
         aav0cWIv6NaKGRMENYRhBWk/M/G8Tt4OOOObDEGfmSoQBZ90F1xOGFYNwifw9uXBDI/l
         TNf8MqkJECG/8W8Hks5AOhdlQULeCRClf//bVH0/XspUTJXl3SawYRIHqYxCJpZ3xUlT
         VxZrescPPrBLecc9ojKEs8VWHbildiObTVVe/MGvLVQejv5xDxGoxf9gq79SrA2o4f73
         c4sbTOdARjmDJrWECkY1Z/BWQ2TFDbsFCbIjjjU5tC+mOLAJn1Nh7oRun9+CKAIp+cFD
         Z0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778433853; x=1779038653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPd2RlUj6wU/iDOi4CdTz2GJRj2DC/sQzjy1WbMFzdY=;
        b=nE/70BMsYKk64gP+lbmHKE6WI676dJqTfccwdZihPiwB4QfPcUYzubbrmOeu/51G0j
         AO0fOSIX7WRP8coZ0SB0IB4iejKkNyFTVo1egG2gEyIx6+S0bbb+BXcqudQafMraPPXZ
         SSZXgSn7fuBLfGwnkqDoUGFPhUD/xb+hQI9xYsXoUS7D4gAhYBAuaEfxhpmwXmUAOGy4
         Bgv7DX5cr8qdjZQZHMm+yhqLHsxjLOGBXzMvSsH2jPuOdRBW/kWcWp4UjG7az1ABa19N
         Xj7EmwVxvQ08B0FjN6EFvvCHDrVwax5wxgpvGTqKN69WaxnTaRSLLPd9Ir8rX0bAHOLY
         VI3g==
X-Gm-Message-State: AOJu0Yx72r8Mf2m1emXELTSPA5COcCC0PdHlKcq9e6T/pBM1vVFkejII
	9f9j8o+ySo2nM0ghtuSw9cTVpQF1VXIwMjsFeaAlOHA3SSrOg0cpSEc/CGZLyTyv948=
X-Gm-Gg: Acq92OH9dRbnVNIEzB6x5qhE77nPbX5lDkZZ8JOqp03hROGuSMJUfi9QBEs2hdk6yfQ
	lASxHuFXyxgErmYpz9tFYY/5B++MfqJaTYCPzEOxro5OrcmHUQD/t2ZyZdgpmXUXD4nuIQIVOHM
	7JPvCCh4NZ8UVWO/p3EbC8oh+PFh+p5UjN5fiq9SwNfutdaYvltVyjrC48yXJZFlOjF9yydjNr7
	RUcXxBF/+oa55hkLA0I83XBKE8UpxMzGst7mWOo/CyxY0kxUIZN6qBWUhleCbGwM5eudagjyTPq
	M/7owiR8wV9zsAp9LUWEPpALIvNFXmP0O5pIebJzHESS38WdM6hRV1BDoSqA9OtkCmnQsduaF8n
	ObkMywabTVJHoMUlrqdShoY9d0arwPdE0Zw6C7LVrLmA8Q6ccTF3qJALWrdr8vCH+NM3HDFCkIX
	UUNBHYB01+t/L14rek0EgTni4+xV1Tno9CEmDnQSiaoyGkhie8oFAqHEFgFzptgRNJk+jeF0Nrj
	5HvXYWr4bmdig==
X-Received: by 2002:a17:90b:1808:b0:366:33a6:9921 with SMTP id 98e67ed59e1d1-367d468c7f1mr6736115a91.4.1778433853216;
        Sun, 10 May 2026 10:24:13 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.96.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625f126sm5681323a91.3.2026.05.10.10.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:24:12 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v3] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Sun, 10 May 2026 17:24:05 +0000
Message-Id: <20260510172405.72408-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260510162912.67381-1-mokshpanicker.7@gmail.com>
References: <20260510162912.67381-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 40167505664
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61033-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
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


