Return-Path: <linux-media+bounces-64819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0H+9LabdLmoM5QQAu9opvQ
	(envelope-from <linux-media+bounces-64819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 695416819D0
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=m4EHuA2O;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64819-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64819-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DA85300AC30
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E757839A04A;
	Sun, 14 Jun 2026 16:57:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B52EEE88
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456262; cv=none; b=LH5sivSEvXlbKe6J7sqofdF4uUZKTO1+64vSrBdQ5xtV7rH6btgcxxe74xQErh50o/b96G9wzm4DJGOT80VOpCjM+3ng6sXNfQGY+R3DCMuTsCCWegKL2EPSoG7Yzbj97+S1pVy3KA4t0DBqgfiip4MYt7bNe9xeYRl1WvsNeGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456262; c=relaxed/simple;
	bh=6Laktboq2262c744ZG9t9B8zQMUZxifCkn6xuq80xNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFB+dy1M62ADGJu5EkfTjsxsRokAg59I2wqoUNCv3YTTsO8YY11O/mYI3XCqWJJoE4kcSp4jBz5LCHjeIhvYotFkOUxl0mJaMDIDncvWMZjRJp2F6rKHSstlVttBT5lNq68ffyISNrHCLgMnV87rHjo3t0xS5cnPlQcPGr17xuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4EHuA2O; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c2a68d01so16657905ad.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456261; x=1782061061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i56QTNEdn3sArmzFmdbWGCEchpMQKFb5yi2sMMCTsgk=;
        b=m4EHuA2OmAvqN14uWxPTFi0bnfCbZfMJg03fdovwY8wENW9e1nIVL1ZZyc0eonIHS/
         PO4JoYhjUaKsMeWaIpzckrcVMHDEoNd1I5EgpDMcoPzetxR+oFmvwMEKlwkEnPhXIBiE
         iNLVFmkGiEp5HlsxybSn9fPvBC9uvfHiKPHaiQmsOC7QmRARuQ3faUM9AIJwsCEW9t5N
         s15Z0qq3JJt9VBO51uLjG8jktM6KwDh9ZWb8qLaxJQeswZukR3byZa1KgxlNPggSIzKK
         iAAqEIw6jZBE7OKGaPFCnsMfIpgwthR+/PQ+dnlhajnbXE6IZRFnJSzTOSLb/E9fpGKw
         eWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456261; x=1782061061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i56QTNEdn3sArmzFmdbWGCEchpMQKFb5yi2sMMCTsgk=;
        b=L+UcWwXneVZrq/aF4qJ5CuhHQonwk5DAe8FpxRO6ytSMY/AeNRX5eGjZST64E74+x2
         r+67ZP5n+ztbMUVll+xwFJOrmFmt6TDqEwcIfmRioIflK4dosh9p/vO6nzlnISxP/Jek
         souIjvWf1PZtvP6bJ8Nl1X4RH9sHCTwtOCL78OdfjPM6X4MxFZh33e6GItXjSmJdhL9T
         iWJ0Qzg70LWOCUQaHlczU/vaKW7AXHXeojTIlRv3kkoDAg26SIZ/ubCy2Q/U1I8TeiO5
         JUFBoafSACgSuesbi0wMpY0CDTtXfYhLTmFlNpskhGKpVNHG3NXb+oJQW9CQDBQkz0SN
         13ow==
X-Gm-Message-State: AOJu0Yw/16I6iBqu3+pZo8kBgW2uC30B8UbTspD05H/ILQf34ctACJq+
	a23Hb9zAl8hGUv0V65zt8gYz7k1NcFJplPKSEvTxE2+EGPa2J/I725ehu6J3Fx2X
X-Gm-Gg: Acq92OEQ1pA/hLPh5g99vyv0oEWA61Cb1ibeCinmXX95hxjX31iZMGDxtrxYEFI7fFC
	jsqOYyODhwAJ9QJKZpGTF+gfmXSTa9YLZSMaggXU7MrxasInVU8xCDeh/lsR4BUOEw0Bv7TE1DI
	D1mgq8lI/5SHsHnGOz+89qlyYmNG2HOEb/o4nuR54nz2vqOqD6rh77v1L+vScoq/o1UlSJTXI7j
	aqoBNfAstKrWkuZzvtvoMZopIB3rKnQVg7SLbhprrEMAVVXXf1X0Rwd3zdAiAZjlOYhWQYkawOH
	CDLh4PBFgwwNDzAHvXGbNXBTc13ay6KgwXBp6sYJ2HVQ7INyQG0/awkl3oxxZc0P3F7gIUxx4ik
	Gl8nj2djVnGbmVtYD3hBS5GVIPdZlR8GX38krJVPnW/+4wZe0/V6cv0ezeligEU5/pHS4SoDTBz
	mk2tfmrOvnZ1XU/yRmAIgOxwQDAisq9IRbyaVKJP+1/6BzVaXqcRtsBWWTb9RM/U0=
X-Received: by 2002:a17:902:ef51:b0:2c1:2fd:47ea with SMTP id d9443c01a7336-2c40ff3977dmr127679115ad.4.1781456260792;
        Sun, 14 Jun 2026 09:57:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:40 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/22] media: platform: rzg2l-core: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:50 +0530
Message-ID: <20260614165630.3896-14-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,kernel.org,bp.renesas.com,glider.be,linux.intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64819-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert+renesas@glider.be,m:biju.das.jz@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 695416819D0

Fixes: 07fc05bd0a79 ("media: platform: Add Renesas RZ/G2L CRU driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..69b69d59a060 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -300,6 +300,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 
 	return ret;
 }
@@ -316,6 +317,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	mutex_destroy(&cru->mdev_lock);
 
 	rzg2l_cru_dma_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 }
 
 static const u16 rzg3e_cru_regs[] = {
-- 
2.50.1 (Apple Git-155)


