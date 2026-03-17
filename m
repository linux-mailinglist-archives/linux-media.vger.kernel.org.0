Return-Path: <linux-media+bounces-56113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP6LAj+TuWk5KQIAu9opvQ
	(envelope-from <linux-media+bounces-56113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:45:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CC2B0179
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D1EE322188A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E78037A4B8;
	Tue, 17 Mar 2026 17:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnmpP+lW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E81374E73
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768127; cv=none; b=RZS2OLXIovlYvWvzXDVWjqWZtwY1sdNbmDBh2c+XEvt9jerbil86N8U4gLjv6xrsU+LRe1UDZOXgzjVGC4i0ywS+QF+j8hdOUOn5H0HusCyYkdBT/zZDEw77OIAaEmxoU7W1L/m/46TakFWgr32fKf0xCVdAw8+Oh1Kma68jV0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768127; c=relaxed/simple;
	bh=5fbdFUXVV+cKT7Grp0jiBr2mRY8i+YGcR4bReK6++V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwVJQATGNCFDuVK3vHJNIAeKXp/bdxd6fgtd0wbjKP5FDojvwcjsEw3JbPU7WtH+uI60QXYCUzxa282gqzPVDKetYesdeTNDtNcyPA2dQTOmy/HeQW9+1zyCaRfvRJq/hZvToWHL++Yl4JTFCYeU/XYqMnos8XnYvEv0e0jS92c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnmpP+lW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b04e6a989eso22727085ad.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768126; x=1774372926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYn015pT4R/PGnVg6K8bkUFTi/0ATFS6CFR2gbnSwSM=;
        b=ZnmpP+lWjHtbOknrinXpU9y0pQOYP/zSNOA/Hs37TQOvj4wxSaLKkAc6Um/OsoIrib
         WvaHJyRp4Wk2TReaC76sx6TBHzzheJIQBBBPvtwo2cowIWVov3IfRwM82LoS5OuOyWK/
         OdZitT/c4X/c2dJtAyCJhnPOK77wZJBA+sYW8pAltHKG9D2WN9tWClElXl+9B9JWqwLH
         uDtO+5/KyJLN6kzB7WupB0Qhzo9LxI5hQPVU7AL6gysUkMzpiVE8R9rjcd0msIKzAAPP
         TaBuzCj7KlvFj20vY37ktyiT4tXT0nM0YpRRdm/AhIfBHMRrp66p06cfCEGHTd12mLph
         emiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768126; x=1774372926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wYn015pT4R/PGnVg6K8bkUFTi/0ATFS6CFR2gbnSwSM=;
        b=C611N7VNHFR2bZD2c46YQAxlWHHETL5dzlRtKsXO8EIkFTtvm6904SFvOu4efnk0I9
         sQYTCUQpwsfW/DPAJG8obCW3o2bIoQg6XCiuWLNqLlLNyr9wFht8a2Nr8Qpjk3vJTiX1
         S+0NFWRMvs336XS4Vr5ED0dDO4N77MgKsOIuN7r5SlabcnlZGeRYxNVCV10i2TTQduxI
         kzxrGDJD+TglWjqeNdCWw+aXKfP9ZrwMLLudSEbm59WyNAUTIhe4gT1Aqv5ub0ZNnVC0
         GIlvbAdROX9fMzr/9+Vf1JBK4jmh8pBj6qRyCxU0pT6z06mlaf6OBoJPk+A+0+tvPkuj
         hmEQ==
X-Gm-Message-State: AOJu0YzRx1+dES+xlihigZV96r8MTEmp3A1FnMcVB+rWH9Q+t3njfnsl
	591WS/7lbp359mm0RFCf7LNaqiiUvjyJx2LDLQjNzpQBpth8xb8JUpxO
X-Gm-Gg: ATEYQzwQOsiZFE0EjbTNr3H7lFw4YgnsCV7sCq6XvVcoaLfqFGblVk5Wjrln7yWpgep
	+qe9cGN0qOQlwiQd6W1RtOlDMYd0ipaC1QlgniYD63nzxMOQqDBLeyMEq1c0/lWnj8ntyb86PCO
	KbzvkYnalhnJymujpDTNgge1T184zMavFN8Sxzb2cBQmqymj9XflNgW/PzTURUcJ780QXP++u4Q
	RsZkfjsOfJ32IaNteuyehRyYGoK4Ma4vcd2O3zD+sxhpPWeaiKa4OKtDS6w9WXZUj0x1PafnkpN
	tyhnzd5XzPfdS40d5kPpTX4i2uDn3HDbfBB89j7ea38dOPIguWEmvkjQEmmYLbGgN+/xA0BEjqx
	PkRghutkg3+rCrfc9w24xdzR7OXQq9zuCaAUBizrYgJN/+Qc4c58IXasn+XxMy4g4VhNQ+UMqlh
	1yfhu55VrAbi1w6IA1D6JPIDpEZcOarG0yOQs7
X-Received: by 2002:a17:903:8d0:b0:2b0:6cb5:c6c5 with SMTP id d9443c01a7336-2b06e40be78mr2851655ad.49.1773768125745;
        Tue, 17 Mar 2026 10:22:05 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e608a66sm934825ad.61.2026.03.17.10.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:22:05 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 18 Mar 2026 01:21:55 +0800
Subject: [PATCH 3/3] media: ti: vpe: Fix the error code of devm_kzalloc()
 in vip_probe_slice()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-vip-v1-3-5fdcdbd01829@gmail.com>
References: <20260318-vip-v1-0-5fdcdbd01829@gmail.com>
In-Reply-To: <20260318-vip-v1-0-5fdcdbd01829@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773768115; l=1683;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=5fbdFUXVV+cKT7Grp0jiBr2mRY8i+YGcR4bReK6++V4=;
 b=DmY0TFp4htY9o1eDrRrpaEV6cj59v6ve1wRvqGCt+xM81s9P11k/VrAG4dp9rvjTRcSbaRzU0
 VDUQkFQZNcwDzaehshoTbZLxaZ5hSrraYu3/gkYNutExL9V8xyILXSD
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56113-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A4CC2B0179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In vip_probe_slice(), the error check for devm_kzalloc() incorrectly
uses PTR_ERR_OR_ZERO() which returns 0 for NULL pointer.

Return -ENOMEM for devm_kzalloc() failure.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index f0354b52048e..aec9dbd1320a 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3490,7 +3490,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 
 	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
 	if (!parser)
-		return PTR_ERR_OR_ZERO(parser);
+		return -ENOMEM;
 
 	parser->base = dev->base + (slice ? VIP_SLICE1_PARSER : VIP_SLICE0_PARSER);
 	if (IS_ERR(parser->base))
@@ -3502,7 +3502,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 	dev->sc_assigned = VIP_NOT_ASSIGNED;
 	sc = devm_kzalloc(&pdev->dev, sizeof(*dev->sc), GFP_KERNEL);
 	if (!sc)
-		return PTR_ERR_OR_ZERO(sc);
+		return -ENOMEM;
 
 	sc->base = dev->base + (slice ? VIP_SLICE1_SC : VIP_SLICE0_SC);
 	if (IS_ERR(sc->base))
@@ -3514,7 +3514,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 	dev->csc_assigned = VIP_NOT_ASSIGNED;
 	csc = devm_kzalloc(&pdev->dev, sizeof(*dev->csc), GFP_KERNEL);
 	if (!csc)
-		return PTR_ERR_OR_ZERO(csc);
+		return -ENOMEM;
 
 	csc->base = dev->base + (slice ? VIP_SLICE1_CSC : VIP_SLICE0_CSC);
 	if (IS_ERR(csc->base))

-- 
2.43.0


