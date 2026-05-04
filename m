Return-Path: <linux-media+bounces-60313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL4IF8zD+GlQ0gIAu9opvQ
	(envelope-from <linux-media+bounces-60313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:05:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B514C122D
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34B87306631F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 16:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134003AA4F8;
	Mon,  4 May 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRSK16Wh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D23E0C4F
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910498; cv=none; b=DdmmkijwsKdWqyjVpLrvyWypXp5Xpd4MHKtBTUbaPRYwiIuBibbiWnJK8moqKu1XKUriKeLslqulY9NNFWpbC3lC15YX74zNqhZS8HecRjItYmn8OLjg3CCCLOK12MnXnxRvItCEiXKTbqTyofkJYxQYcMiq2E2poTKoS8+jpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910498; c=relaxed/simple;
	bh=SLd8xZteUfffi/wojP3Izh8/sRF72dRzeHEQpbOpVsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P8GVSXs+3OPkjP+VrGFqC2iS+qTGzO2XjN3SG54PUXvfJgjmX8iz62+yrvL1u4AVLJOZ4jfbLBwisAC5pXEv2Uud0itcQzWu9Dt6tEpQCHWyIM163U4dhHeol8HdYRLSSg+I7+OY3aK8SOZh4rcWJMvQ5IkGRibda4AohE4ulBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRSK16Wh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so26483845e9.3
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777910495; x=1778515295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9X7Vr/mpTplhTL0yhhZcGzpkMyfI2Zlu4go35nPg7k=;
        b=IRSK16WhJYGYkNELCwzEpXJQx6dsIJLEbPBFGZWY3lFNT+HLdTWe8qBkRXr6DtYx+8
         /NXELqD0QRVXenqmj4NikQpmq4sz4U97ZtjU6L02aQ2cDlBq5Ia6clkl8HciOXud2bPB
         xM7emv6QYs+rWEWvBrsyb/3DAFEMN34TzrxrxC9dJDw7ImMtSk1FIfGEH1ioktjpErrw
         zgtCbzPj6pZPTT6a+IMJxq3piGVP9kWggmCv363LRPSbLmBuJqx2+x2otaCUsNc0oNR0
         3FAfxBptwpID5PpzXFwJeNv8zi2HdZVZ3mmrQmkYl+/NMZ3QV8jS9Cf6Pc1Pra/IX6cP
         6/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910495; x=1778515295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9X7Vr/mpTplhTL0yhhZcGzpkMyfI2Zlu4go35nPg7k=;
        b=IqW4uTqYK6AqkISpto2GUS7x/9qFiJtAQRZ9K4eciJVThnG4m74mRFzR2ooWyhiJuY
         coqpdGw2xLeRnTdHVu+uWKENeCD8vD1ukI2Q9FiRRmwI7p+1fli58GwBK2EN4M0xm+m1
         /WdKXdw1cpNKXUB3bPaKkiQskKNCHZl9+75ImpvSGAMayI1goeWtrd31xYYahK5Nkge5
         5nzeFlgVc4NJHhxYKJ9mBjg8dm2gtmeOQO50fB+M4aIk38escllnAeDxOuBqKrLaFD2X
         XaGmUvt3gYPb3DsyzpWG+yn1md9zyM9/C8k3Naz8DjcsKOJ3RlnU2OCvV9uKwpTCjlus
         Hhbg==
X-Forwarded-Encrypted: i=1; AFNElJ+NG83eGGT9EO0fSClweZ9nNCMUM3GnqjEFszhBNePbJTz9SteG3abTftn1e9QxrF8B+QUSjg6a0co4Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDKLuhyNW+GWyMcst8MtM04xRUM1zSzqvED9y64yv0u0NzLtF
	BVovWRfFQR/sNbnLkuLYTs8luV7JD0zRYaegOf3Mv/tAFDIWIYmJsceT
X-Gm-Gg: AeBDieuN04XacowuvmuXEn435s8PaapUS7SaW5fIX0elO2/DrDN5iosy+tovWOHY1Zp
	uBzG8D91n4tJ7XzFbPWUle/qFI/X39uWzOQOQGEWEf0brwf3RMWWG77+gJmcOtNnBxi5YE3+7sV
	x6FWJIcdX/fz+Qmj+oQL6OU+a2IS4ZpvhcC3g0bKxfumXewyAHMNlYZHDoWMx2jXP2gNPAG/S4/
	QwRUGvXRxS6hnMn3ijnQPDUfo5r/QeJdF/La7iZ17HKqrkLOiciMNEmBiDBBSK266TIzpNG5SbT
	Hz/4fL9j6p/M9CRBgLROanHAXTUSirWWeUSr06iXyaJmgeMK9fAENtySiTtg+/yJdz4mBZV32GI
	lBroXJFWKmtJrntAOcvBEIGwRLbq6OxjxHsxwLRIpaZ3Ln3Se/J0CSgjy4P2RrxwLHMvCANnIq9
	d9mKGjHNqJIl2hX8t50Ml8MuUOZmFZCnJD
X-Received: by 2002:a05:600c:a316:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48a986711d3mr122214465e9.25.1777910495174;
        Mon, 04 May 2026 09:01:35 -0700 (PDT)
Received: from avt74j0.. ([2a02:8109:8617:d700:a1d:902c:85c8:d272])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee6ee5sm107813605e9.8.2026.05.04.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:01:34 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] Fix: correct typo in alvium_set_ctrl_auto_exposure
Date: Mon,  4 May 2026 18:01:10 +0200
Message-ID: <20260504160114.282024-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D9B514C122D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,avnet.eu,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60313-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

write value for auto-exposure into register REG_BCRM_EXPOSURE_AUTO_RW
instead of wrong register REG_BCRM_WHITE_BALANCE_AUTO_RW.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 955b7072a560..b62b45a4f2fc 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1290,7 +1290,7 @@ static int alvium_set_ctrl_auto_exposure(struct alvium_dev *alvium, bool on)
 	struct device *dev = &alvium->i2c_client->dev;
 	int ret;
 
-	ret = alvium_write_hshake(alvium, REG_BCRM_WHITE_BALANCE_AUTO_RW,
+	ret = alvium_write_hshake(alvium, REG_BCRM_EXPOSURE_AUTO_RW,
 				  on ? 0x02 : 0x00);
 	if (ret) {
 		dev_err(dev, "Fail to set autoexposure reg\n");
-- 
2.43.0


