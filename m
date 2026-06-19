Return-Path: <linux-media+bounces-65267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UpUbJsUYNWrXmwYAu9opvQ
	(envelope-from <linux-media+bounces-65267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:24:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360D6A5328
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:24:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ClCAL03k;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65267-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65267-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 028F93050C92
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CF7372EC6;
	Fri, 19 Jun 2026 10:23:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426EB3655C2
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:23:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864593; cv=none; b=jnyqWvRwA9aBun5lpsRXosZMASw10pqzZ1WQQ0wFDE4not/EP1NjwMU7jh4E1h55RgAWXzc1ru+DE7yLEA2uf1HIFEmSsd+7bD7YgUf4wBh+wg7PXAUFZYvIK49t/YcenNBeJBgxQNlOixS8c0six6cc68g1N4x3nm2xm1ak5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864593; c=relaxed/simple;
	bh=GVSZyfqnVIB82/XtHTfnb6P2LwzIjzrV2CIDsXlQgyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+EbMND+flq20q0UZd6pQhhdcsLi2mWmU8sQCuls4oBstlxgLuO8pBm9YyridzhPeSozAQTmFK7BRcOATjick3UVsXUWv1RK8Cw5MSfW4JW6XRcvUIyHeN3Jo4Yy5HrzvPr+XWprpEGvZPfTpZ7JCMlJHIJtg5WmiXG9w4mtU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClCAL03k; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6ec0af575so11930465ad.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781864589; x=1782469389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IytphARiJ/y1+fNZ/OOC7wIYzilTqKlQTXBX98RoHcQ=;
        b=ClCAL03kp1kJemeZ1WZ6ENSLhvOhh7mTF7Z2fdbftkHtEJOkKZ/PIjxGBgwpW9sgdr
         yjTe6+9f3HoxM/81CIlI8ktHfXtJ09dO0jexuoqp/IHYevlzh96TGzAQeDZLii1+0RSl
         O/wiet/13/UE3Kxi0q/97boh3NBk0zHm500Kcr79fymYd8OBCUHB+3Wivc+dApR6O7bN
         H+1PoEzwyzsF58bHnpMb9NAjvidWAtFGkW+cOuLwwFD2ddR92w11/YIjc8M1OXowzqz8
         BfTW+dezFbXOGfQer0Q8LrBhfQ0Ng6aYEVfp9BJNi+pVRUBw7GwQPPxK+RjjTUDgAnhN
         UXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864589; x=1782469389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IytphARiJ/y1+fNZ/OOC7wIYzilTqKlQTXBX98RoHcQ=;
        b=IlN+H7WhbDCCTOJ1XXxbHB/sMeqFD+7IrHTB3hc8up1StTQJKVgfClkfPGKWk3MjgI
         XlLJggJWPyl0jBIIKzFk2SfGQBiS5QPeZvprl8JFLSU/m2CUtYLBdy/sUBiM6uo7C839
         1ACbkwC6HFk48dUIM1RvIJmnZfO5O28Mgo2w37UUMQlLzjlWgR03M9MNzqS4O9vuNljy
         aPuEh48EGNFxooYn8ZqJsnObkj0fImm1fby3MXi1shOzKg8V40KXLifFP236G0v3nwCg
         QtnIAkfdl7PFQNQju2xV3l9meWkRLYnvTXYVpOQ3Io5D+K9+BpQ2xR9ox+JbvYmfiNwM
         Fh5A==
X-Gm-Message-State: AOJu0Yw2xGFoYn35mGlXWlT04TeFlOfLKzstc88lX32ewwJoR6wZXDwD
	mrOdpDSy8Q2qzxQyAONII123LqX/kkRtP/6B8SeJFvZ0EtShvS6gP5/u4p/Y2Gxg
X-Gm-Gg: AfdE7cmv+UoM9D/sYofNX2CCbJy7maU76ZjRgmFCUEhngDFUi1DomxOYt5guDjOGKy3
	/jQE3+PYhxjB/8+SJqcm/fwZK3UUXld1oo9YJmho0Eg9NE4x8WSnm28UNnIaPCj/trI2SMPGpRc
	1qX276Gccv4ekDwuIFmz6+Dr84xpKP5zWFKS77aFGwYr/B44cmUyhdwl+vgwDfEd0L0jPcFAVz9
	Qw1fdxq09pF8MIySioCx9Ivg+RVhznb8nWvrfmQ02rVhs6oNe/P9UvxWXBgM3C2YMlIpNNgQVCm
	xjohpEG7rFEorctx6Or5AE2BTaFOJtEaa/wrQOoVDdNXizr4/KsfqPQbRdr6xM84MBqoyTNN+Kc
	g6fVFxMRiIAzKu0ShjHDIv9RHyxC4bzVOuvYtCkakZYHIy5/onVvkYfBI74+kZb+KncUzNcf7Sj
	88wzXTOC0QIbwrWU9k0wLkKeZoBT3DPDPhDwP4FGl8uw==
X-Received: by 2002:a17:902:f60f:b0:2c0:a3dd:4e76 with SMTP id d9443c01a7336-2c718f5e935mr36422185ad.28.1781864589288;
        Fri, 19 Jun 2026 03:23:09 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c24f73sm19486115ad.82.2026.06.19.03.23.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:23:08 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:52:45 +0530
Message-ID: <20260619102241.22887-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619102241.22887-6-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65267-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,kernel.org,glider.be];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3360D6A5328

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them and introduce an err_entity label
to ensure teardown logic properly inverses initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..5bae8eb0ee19 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	ret = rvin_create_controls(vin);
 	if (ret < 0)
-		goto err_id;
+		goto err_entity;
 
 	switch (vin->info->model) {
 	case RCAR_GEN3:
@@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 err_ctrl:
 	rvin_free_controls(vin);
+err_entity:
+	media_entity_cleanup(&vin->vdev.entity);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_group_put(vin);
 
 	rvin_free_controls(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	rvin_id_put(vin);
 
-- 
2.50.1 (Apple Git-155)


