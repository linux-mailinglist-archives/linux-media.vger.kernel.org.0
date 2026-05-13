Return-Path: <linux-media+bounces-61556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wINYE2oPBWrvRwIAu9opvQ
	(envelope-from <linux-media+bounces-61556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:55:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EE553C28F
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F38B3026C1A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073933CDBAB;
	Wed, 13 May 2026 23:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZP4Czmp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ECC3CDBBB
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 23:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778716513; cv=none; b=ltEtu9mw1KM5B1cSk7jC7S/xyjUEgwYiIhBleKbPpWBN7Y0wF0yEpp5nMm5kREpKm+kjjYCtXLBepjHYTeknNu6eCoD85vcVYrNYmzWseADPeexF9TUis+pfVEoR/YS18vGUPZ9pVlOSoMzay4udrQXaTagF/OhYiv7ELupGNdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778716513; c=relaxed/simple;
	bh=bv9X9C6ybvBXVMAO8U6jO4EDYmS8S3AlJGFSYWl4PTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eCxy1FunbkUDLb0jUBHXPF0pEU7kLlakUf7YYTLLzo1kY7RXgsdj8zc30zKpvzYbyhphqMEW8/kzAp5ynU7vQKAc5EC8DLSbJpq8ltTn+F0xd+sF8EizmFMdwRFkI4wTLws6xgnl+Od7NH/CW09orQEguYwdSPCvtk/25ouQG9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZP4Czmp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so67709795ad.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 16:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778716511; x=1779321311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=QZP4Czmprg+70LeIkefWK8KJ5Rdl6A1DwNAoyLmv3EToSjYjw8Sg0hdmdJt0APToKg
         EXkjRg0RHTYngAyRGpHfCeGh/9a3St4gllnyRCXaqB0IvleYy3Vp1+D/vvZeoWl/iph7
         uovK2IyZvJX/8jvdy+zqk57LM0/cx0wT21Gnl7rQ5g7runHVvskfcOC+K2CqIHHnzJOD
         mWhTX8Bl49UhzjANBh34PkrYvXi68uIwj+JQtCwK1qYgbS/57YOR1JnLZKSjAqzqLUfX
         t5NvCnx6jA8sBSc3u6fRXTb70hSULx2aq1l055uqNGtqR7slNNYHEBcWs3YUsT2YHeYD
         r+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778716511; x=1779321311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=ILhi5wj8m4M/4nrw28SZr6Lh0PcH9Ej/JqI1DR+nF4ZNPhhHE76Fgn+ZjGI0Iw2Pbk
         1RulPvpZJp7BGUgG05VpTTFhfHwXGDrLh9OFs+TijF4WXbAKoYRabamBNZAu92+0MXm/
         K47p+4iwE5BddsZOWYeGwXtxlYdBt2xPXJIVCxfqa1ymyCStKuFxYIgLpIWEnq7oCLNh
         ifL+mFWJLVfX2pSRxloa5zOT9508Jg7va686316jIT5HBmIxckGrG1ZkGRBqIlm1T7Iq
         sLmTNhSuQKfzB+h6phRd4H7P0TrUsDx6rXbza4d6tqmtX/ikdmdaJ9eJ0t0qGW3QIxbh
         wydA==
X-Gm-Message-State: AOJu0YzqQ4dBqHWVF1xDzGEW8yTPnI1R6JoGnb7cEogdqkRyu82qAiMm
	v3MKCcthyGEm4uJy7L621EQfDG82bb29WHnirq7Zj6kI5TrdgBYG9Fkfi4j3PlFS
X-Gm-Gg: Acq92OEWvXaqvmOWCz9DEe9R3IkS2p7SmHJCJuNzb39XoLg8IhZ7diBXbuGIlpVc/N3
	avwR+1nXmzehwjcgXLcbOKp15JEPfHr9fPAzq33tV1DKAIPqiR7vsuNeterUHXBCsKX4An09Kie
	NCss40wcRDcWpa9lb7w1y3j9m+9ZgrLlEZmpJzS5uMtO+zbj2jIz1WN5B1CI4rgxM0Hq+wUPrOI
	dKnJtKTKA0H9cVj5pao/E4aqgFvbj8d6h3EJ1oVl1GXkqM76ydX+IEuf4BMxOYmC4CV7nV5AjN4
	bHFn53WRTVLD0tJv1uuRK2jpJXrIajoEOQC5lu34ZolT5tYEQyusQjbUGMDPJ6iK6D70J9WLzx5
	coFdBenpR8wv5J/wvUluUCHbuONaOXS5RkZlxLG0ITzM/X1vwOfvmukUFmYtcY5jz++cUZTdbR1
	t//LYMhdAoSK5xaW1u1gky7N8YUkk2qHNWWb4JmFNqoRfz0meEj9JbJtEyLmHUjWtrLTpdmZBZ4
	c78FT5L7aBRfkkZ
X-Received: by 2002:a17:903:198c:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bd276e9861mr67196905ad.31.1778716511277;
        Wed, 13 May 2026 16:55:11 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.102.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d235e04sm3739355ad.80.2026.05.13.16.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:55:10 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Moksh Panicker <mokshpanicker.7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Wed, 13 May 2026 23:55:02 +0000
Message-Id: <20260513235502.9312-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B1EE553C28F
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
	TAGGED_FROM(0.00)[bounces-61556-lists,linux-media=lfdr.de];
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


