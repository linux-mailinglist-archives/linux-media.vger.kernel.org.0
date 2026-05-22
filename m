Return-Path: <linux-media+bounces-62600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HezHJhCEGrpVQYAu9opvQ
	(envelope-from <linux-media+bounces-62600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:48:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234B5B3380
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A55D3034E17
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486E63E8C7D;
	Fri, 22 May 2026 11:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWssBRmm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D693E8C78
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450102; cv=none; b=rHrIIzno6v6fz7rf0FKOn2XzRpRBS0b9LZipwHCLKNljv5YJM4Qv1l1778t2W+tTyJ07p1MgeLZeEeDji3C7ox9XBQzM1e48ddkDidLU246c9pNKI2MRhwwg2ru9OC1Pb8EpbVpya/xKJuqEihwC3eFAxkhiQUDZMNZGAmA/X1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450102; c=relaxed/simple;
	bh=QGCJSc/hM+CCI4f3tlSfKgMRO24LyJy3VZoJVPTLxRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1lN4HaUT3IBAV4K+7r/92t15yzsQLzlGWa+eP4JaAmv5/AYkR+dHdlUvoI6A3FvkQjbPPbghEBXUfxcA85SjCItUXx/3IoWeSXRUB0c2V98xvVX4eiEsw+hPye0vZ3UN0ehJ1OxJXaKLiRayu8nWxuwDnkiIPwZHvWS04FD+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWssBRmm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso63466795e9.2
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779450097; x=1780054897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2TMFx2C84CNw6ZGhbusL23JF13GLCgldEn++NfjB5go=;
        b=hWssBRmmxEMpTXgtiVZcM6ws7oc/Qoicz8QnUw466crC9R6rnUNMdx78+r41XJ5u9I
         Cr7CyLWlhYVc5Qm2COEjhL37PQd/W7XJdFgfmQ6TUEK8TpUrI3tzDukgB4H4ogoHaPJO
         5HYO0rZm5WU+fKGyRR0LJ9iHAmeuNeHg0chjA1iebcZPU/y4huip36521xGJidigVVkE
         UjIHn31KPc8MEUh9oo4P4CsrarTHa+p0C0LO9D3QkfaZUc8n8iodGmdI5SlsBkaOhiDL
         5aGj9bxNGnCF4YVd8D1jzUIXrpuGhFee755iUVnOZxICnU1hY0fTwFJ5vQW90Celcvqf
         KNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779450097; x=1780054897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TMFx2C84CNw6ZGhbusL23JF13GLCgldEn++NfjB5go=;
        b=bSZrNZSzcMR6w1YwruqFEyQX0iMIDDX4FkQZ7Dvng2rdu51MvPNy7kS7xVoe5fqNAp
         8jUH8ooS4R+nJup2I3xer+zLnPtrZ3wSNxRJrbCtFD6Kd8l2fs5/JH3MdHjof4oVx1LL
         hWko/wGvVu9BxRrMc0BfgeJzdV5qUXkirP4ljO/3QJOndB7T8I527jUBx5NQU3WK05DT
         l5wE/esZCQVta18hUEdoWOAvHzekiROnYLRn2TUhXKXPEtMtw92FczA/V3LbmIE8arGW
         6VBGBqP68MWD3VW9KoeBZykgsUFFrS1Y3+wpkJ0MzvZKEQt0MmbzgCnsSQlPydfNCHAL
         YRnw==
X-Forwarded-Encrypted: i=1; AFNElJ9m8/qi7kvOl59NodDa2Emh2yznFR4YlXiwMskDPBqa/SiFzxFa1UHotbSuYpsna//Ssc5HIbKot3wxyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUijDKM/dxhlDt77uKaWgbr0u4sbdKbX2Cuq+33oxtXcxNR0qF
	sm0ZNoPVLeRP3IbADTV7OrjwDlGVIhSPbK2788iCULMenStgCKcqdIi7
X-Gm-Gg: Acq92OFg8FercJnGxwBbSf17grWvq4f5KojUqwl1SyKlOv+tX1T6ELghkv77ONJ2PaR
	PKzNWr4Gp5IesPn0Qdb6Hpq+1/QPzdqZJrqkEx2PPdjl2DJO3pPo0WSUU0Z+sIJr/0fRf2lUH0I
	sh3sXTYaNCMFNpzhTQvAc20bcmac3v/zpEyeMJJCvByMFNGlwq1NUiLjNXOGcjIo7tzxkOdSHF1
	81KloO+QjnprUVCP1cQV4dmV/d0iZ1ofOmihMYHKljrlgeZoHV/kBLKU6+gvlWMWjkN3V0xxQkI
	Wh/Sgv1pdKcYL8Yqe5A6TnwdP1dp73FD1wOgBOwuVKEC3eP6TERSJlaiz4vMDrMBHHsJ3BH6OWf
	96R69a/UPpStavakyY124Smx3CGdH1JTGXMI5zORXttZVJQXInVl0FzUmq8uCJvZemhHobLziYs
	oJBpUMn6dgH3ArA6IVBlFYeIHy+a42bO42
X-Received: by 2002:a05:600c:a402:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-490426b4da5mr33197565e9.15.1779450097315;
        Fri, 22 May 2026 04:41:37 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:39b8:ffd7:c1db:f5d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d64eb1sm4512322f8f.32.2026.05.22.04.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:41:36 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	stable@vger.kernel.org,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: i2c: alvium: Fix: Correct name of register in alvium_set_ctrl_auto_exposure
Date: Fri, 22 May 2026 13:41:12 +0200
Message-ID: <20260522114119.1576701-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-62600-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1234B5B3380
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Write value for auto-exposure into correct register REG_BCRM_EXPOSURE_AUTO_RW
instead of wrong register REG_BCRM_WHITE_BALANCE_AUTO_RW.

Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
Cc: stable@vger.kernel.org
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


