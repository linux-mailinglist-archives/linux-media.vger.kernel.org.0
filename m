Return-Path: <linux-media+bounces-60194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHzzIDtj92mZgwIAu9opvQ
	(envelope-from <linux-media+bounces-60194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:01:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0A84B6261
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A81D3004D32
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFA72BEC2A;
	Sun,  3 May 2026 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2z5xCZp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA361E5B88
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777820472; cv=none; b=uDqXglYHYorBLGbl9HJY8tL3hv7PtOBi7NrMXY6dYvkII8D1sAdFUdocStooHUXC67arXo/bZDjL+TuvCW02rXhUuCCt7N5a2r9lZh2V2NLE6fluoDmQnIdD/0wkYD7ODApZoM+Z+Lpwvcs2GNlgqQ7hMDX9mD/tt3mzBwXvLPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777820472; c=relaxed/simple;
	bh=5V7sowEBAW/MmZpxWjMjlubJ9iiDob6wYsOok5AvsRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxn+H/HpJR7Gy1A9EbLroKBQ4qQIM/2Q6NT72cV1xLBZ2ahsrgY//K5caY4OAUOInMA4LudAk6fG9QEOyeYsdRrtlAt6Q0HdQbjDyn15YHpOVvi963JKYE9qSwC+fT5XvmNcmJDe/Mlyw4qsjFN4wQeX2asKXHBC4OHuqyYMczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2z5xCZp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so388225b3a.3
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777820471; x=1778425271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=r2z5xCZpwHQMHXSbGEYE3WcmcL6zWHVXOIS7XHs5T4iFufwRxjyrt+pOnrOqmpFl3c
         Mcl4ayg4yYBS3C2R3YFSRZMgsw7955kSuMEvycGovhVFqQkwfAMt8wrNI465jS/ksLJ4
         OsKCuM9CA5/RkAWZjoqJ8lAD5ZJKT52UJvkc1UFNWQWq2y3fpxZ9Fb3KTxO2bUHFxEeQ
         oeCJydiqFkK3Tx02HKfEdwc8wxsoyifczHJoAVzilxVxRuAtOZgppzc3qH/9v0sc4le4
         JKbZdwM+fL26GcaS/ykheS/37BZpXKt/Wl3PSp5SvA6UIvZv69rlXEdBOzdIAAPLHjrf
         l2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777820471; x=1778425271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=Ro/TDn+2e7VBC/BhOC3G4+//RgF7GDcuIEy+xZAfU/TiV79+mfXhSkAAg6caCUUB2c
         3O0qydL8ACk/KS0XbfV6iybO8plRGWwSz+e6qgVRRxlnHOt27HfHcsE45pmbBKVYHtFS
         IdOB3qvas/hVMxWjHqaaCeJBulKkH4Pe+FPZIs/xv8iT9RwULbq0+HcY4z2lW2UVuWhm
         mWouamedYARuCN2sm/xDfotzQjG1H/DpONdpSbK02AEvW2fyXiunC//1ryK9nj2Zodh6
         rpBaVlxI2y/aKFKyUBqA+c7ePnoo79BuVGXTi4lYsy2onudqA4aWa350A9Q9kxNZdtoM
         9zwg==
X-Forwarded-Encrypted: i=1; AFNElJ9mYqSz+IkOivbyH1mdw+ilJ7ScNMCLYD4dUDzzyQJJxbUxVqMZNQPs0za+cg5l1MCNj//iJ8I7Tn4+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVpO1oTpP8+Hi0Sq+whKiM2Od9tNS/RcgFGAHV28pjhTE9gPiZ
	l0ICQXFZoIB81eW9UeFDHexmbjS+lBx1Oyhu3cITBxlq4MAxZ5JkJTGU
X-Gm-Gg: AeBDieue9YbXUjD2Of6DFVtUCh40sl+VAQGxnFrb17wfI5grluOY66UU9gI/zU16TfG
	rawKjIw00OmJYJj5RWjGQRw1IV3mLbDj9MiV/0wFpd2dFO3p2vHIYUm2ELQDB6puRMvGCfh2dVb
	KaLZCTRCvzhAjdTov5eKfX8AGs/0Used4Xf/SFjn3lCpXu9zwj5/n77e8xb1NHUhvKDaocd0yHu
	Pd0+SOUYvPpgduRZeXVH2gRm5PUaqyYPbFjjpUlzMfkrB3W0bU7Kpv8wv7qxhhoTNHRJCMp+mJd
	8zsm21X2ilbYgJ9p7dXUFiW3iNnHcCw44LfUAqQ0S0hAEpQ4WsLNn1gXtpbg2iGfjpKrtKsc+aK
	c6GBxcm8wUBj1Y02ksV5f7QkcRFAqMPtPYiAFhjfZla1kZ0ayJnVImCNZzybUzkKoefNx+ZnJG3
	FgtC6MHJFiAFYMQ1EwIHOb8N/p+KxEIrATKBNPtnGqmEqPtfOnrHwHrAHbPB3JUGify/Ul+hvfa
	IVEd1mJY4QtVCg5tfZy9WbNiMSKeTkV9Q==
X-Received: by 2002:aa7:8b48:0:b0:835:6bdf:c886 with SMTP id d2e1a72fcca58-8356bdfd657mr1415743b3a.7.1777820470787;
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582dc36sm9699387b3a.6.2026.05.03.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: imx: remove unnecessary out-of-memory error message
Date: Sun,  3 May 2026 20:30:26 +0530
Message-ID: <20260503150027.107173-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2D0A84B6261
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60194-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checkpatch.pl:url]

Remove dev_err() call after dma_alloc_coherent() failure.

checkpatch.pl reports this as an unnecessary out-of-memory
message because failure is already conveyed by returning
-ENOMEM, and the current message does not provide additional
useful debugging information.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1b5af8945e6b..85b63993ef28 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -589,10 +589,8 @@ int imx_media_alloc_dma_buf(struct device *dev,
 	buf->len = PAGE_ALIGN(size);
 	buf->virt = dma_alloc_coherent(dev, buf->len, &buf->phys,
 				       GFP_DMA | GFP_KERNEL);
-	if (!buf->virt) {
-		dev_err(dev, "%s: failed\n", __func__);
+	if (!buf->virt)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
2.43.0


