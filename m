Return-Path: <linux-media+bounces-61557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ13KfoPBWrvRwIAu9opvQ
	(envelope-from <linux-media+bounces-61557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:57:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670C53C2D8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8707302769E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231623CDBCF;
	Wed, 13 May 2026 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2awVYt9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F6392811
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 23:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778716657; cv=none; b=tr1ZfNZtyDcV/S/4rvZ3whhaMO/tydhB+LRF9sUQowtDhHuwK453p4ekVw6155PAB/vPlVJ84rxAhMkbjQL6Hqk9hCXtZVwW0ZFinAknNmbhhccJwSu9BOJng16VxNR3x43kz0AiE5eqgQGil3ZKvHGhGRDpw+Joe1+Ok0/EfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778716657; c=relaxed/simple;
	bh=bv9X9C6ybvBXVMAO8U6jO4EDYmS8S3AlJGFSYWl4PTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O5s6gH4/htq7oOEgF1r4vFwuME+J8rNvyUrcr/diuBywqJwJN8po+DJcJ1non8jQRCL8IIKSKOoGPz1ld215mo3401ya0FzuJ2Y+UVMN2a1L2FhNovppXFJrGZlDlD1XJR8zMFrEbL2NZfpa9xim3gMPXbARyvtkLbrS3kpoMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2awVYt9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-362e50b4641so4706384a91.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778716655; x=1779321455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=s2awVYt9NDzOeDjCZNowgJoB/WLvU09uPGBtWjpQyl/r9Y14ODqJ0IjYSzHN3xmfeX
         gW5S7bB3QDaDD2HqC4Bdp82QVswkvvE8qKuU7PeyCuixO8QTSXM/SzRICd/QHp1DxPMJ
         byGrDo9eBB5jqhvTbyMSHYlVxmcS06Vpop5ws0/dg5dNrSYTKqD9cSi70jGYQNaXEBgD
         F7pJFZ3V/mbgHqXit8Bhy6iYgtLaN+xvGE6qSOLORVk868SrHVmE8n2pcuBQPd/Vb4s4
         hlf8AksoVaHU/zerqOu6lOoO7s+qBHcOiN1F5ViNsq/pK22JL+j3V6HRad5gmGyOvofz
         9ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778716655; x=1779321455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=Eay0TagOAdT43urPckJyPiqUegfVEVV0u6Hzy8i/cTVuYJ7hgSUDumdYEoMnwE1XWB
         QeI+KgecBy5fBaY24Tn2EHMpErdXAgGBia2Fiq3j/fuG6ytugwfoAGRC8EPorGU3OwsL
         WXmNvrJdUp22eMDvdA/FOFQ7soeKzucF8A257yisCxPdI140qtZZSHy1smzOrJAwWVft
         WcO991pFnxd5R4QpAj0q5S3jPvxJ/+S8CyDR5ZgpBqSEc+IX2LOfY35O1XtN064VNCkY
         5xc5eu4FCSW2+Be1/c+aNPzC0UZAZOHs7ifAAWge7OYrimMVOQkB03qSyRS5s5NohX4q
         Z3UA==
X-Gm-Message-State: AOJu0YzmZV6hyRphmLhXVfzhSNYqnoacIHTlMxjMNLZrbN0YaC96Qd01
	J+ozyFvxddTyO/17DSvk05k/p0dRQuaH7wnDcznaWTKFFFYwhIgPeyBqNeZ7CPaO
X-Gm-Gg: Acq92OEqE4PS7yyoKyoSUAWJMCY++xE5i0K9fIYKAxKMzXQ7OF7sWsp9+PnWx2oouI4
	y7I+0vDI5kQ3J9McHmmQFwsRjDbkmCfrH8Te2i3ZSPPEceFqMEzlr5mGxmly6WzlYbdY73WIQz4
	0AnHte6fm0YdBla1Pqtc9egXXYLDbX8lSjw5mcO9oH/ynV0nptWoh5VAtPzCWkms5FMa8xNZXbC
	22Z2HeQHLFr14FRUfRJSlczrRLz6RJ9mo8EcxkqjKNUKdWUJREWruKP87ON9QQ5qZYQqEKqK3Pk
	SLIZwSSJdIiGtLMwCMYWQ/F95HzgjJKuTsRKfD2SexmgXGWzNTsGe644QRuaeMdOnzXccKguB4B
	lAOd/kuEsMOgAMfcy5WJpY4bIFWE0ciBDSWax24Z3pJUppsx+Hhl+Q4r1n/LgH0SQAtaYdIzt9a
	H05K2M7xytdjqPEDmxHWluv62eazpCMXLkIg2PuzZSyXm8stBalb/etpAVYESjOBDqE+QOHDbd0
	3V+CA==
X-Received: by 2002:a17:90b:3901:b0:35f:bd51:cf60 with SMTP id 98e67ed59e1d1-368f398c165mr5568015a91.1.1778716655509;
        Wed, 13 May 2026 16:57:35 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.102.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692e72c059sm425936a91.5.2026.05.13.16.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:57:34 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Moksh Panicker <mokshpanicker.7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Wed, 13 May 2026 23:57:27 +0000
Message-Id: <20260513235727.9451-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0670C53C2D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61557-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Cc: stable@vger.kernel.org
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


