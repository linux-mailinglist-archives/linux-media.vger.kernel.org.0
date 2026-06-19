Return-Path: <linux-media+bounces-65279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kIjtMHkzNWpsogYAu9opvQ
	(envelope-from <linux-media+bounces-65279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:18:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5970D6A5A44
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:18:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WsYSsAWq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65279-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65279-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 373203016D14
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592722F9DA1;
	Fri, 19 Jun 2026 12:17:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F417E37AA61
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 12:17:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871474; cv=none; b=JvdCWxQs29+o1O9gdjnJtw+GOqda7/nRfRaUc8cT+UU6RyX4DmEpzeTxrqtIwvPxlD1jkCjHi+qkoA2Rv9+vGr5LFWdmnllM5WAYeety5WhXiJ5qo9+XXzgGQhCUcsnZErqoL/bWd5NyFbhWLAAguuyuzFoNrn29nx87dlJkLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871474; c=relaxed/simple;
	bh=GVSZyfqnVIB82/XtHTfnb6P2LwzIjzrV2CIDsXlQgyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbQNax8CjnZIZkef0nLG2EbEhoSRUQHsoEWi+4ohqpNCP4C2B7liw7+wjCqphvP2/V2SdYekaeBaZi+kwiHf91lxI6fK/rsUMynLp7hRjaWol5KFSfMAcWBav1NeLv1Ce/tKtu7gfiNP29t0AGD7RbgNOaNuS4+kViWnoX8gUzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsYSsAWq; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84229481d44so999321b3a.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781871463; x=1782476263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IytphARiJ/y1+fNZ/OOC7wIYzilTqKlQTXBX98RoHcQ=;
        b=WsYSsAWqYVynlWNlLBkjRJrBFbb7mctya1EURSu9krywdgwebGjrRQGNg9BLOTU3O/
         hkmcr+Bg5QtMO5MsXv6LTmuKpRIxE5GnPFe1hLBw24SC2VGhAHQP6i8AyIksc57bCaQD
         XzVpzE2qKUGY6IwuR/rfgMe69vK7xbdQZt2iOaX0864hSxZ+oypRSj/ubEJDECsM2Ur7
         3KOLwMrePh9L7qw7p5TlLU0kjZ8swn7q80zPTIxXUPomUerkXNpVRS7REg7vQVbndycE
         kKyVbiI9+xPM18G2Y4UvkCxJY8er5EtAQXWlft4O0hLCqQEnu/cRD43P3zyl3cFxm8YV
         xb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871463; x=1782476263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IytphARiJ/y1+fNZ/OOC7wIYzilTqKlQTXBX98RoHcQ=;
        b=ejVw+y9kBV6y8jE/p3dQUkYDseTcrqGJqdbZma07WZAwluQkTZN0opQ4HklTSQoTab
         NNqlz2euLNoMGeCKfEuCKoU2PZB4Tx7bJ3r/o40zl9SHetx8/OQ5V2BwGxQFO5ObXPLs
         hCfSVv3D88hICBI91UVTOuQw6PQlJYpM6Jhib0TBGLYIiwNIrCR3o9h7KSg4oPOic7aB
         y51kLJ5BjFzzhnE+Q5VVgGcAMrQBBaUZIvJkkDucXwMP0uOyMX5UDs9HTz8+0V8S/tdL
         zz6xXbOChTkPr3WowvFNXZAtdGLZ5WzfTyxSMeNsQETtzGtL8iYPpEDXxITFZyK/rVq4
         6QFA==
X-Gm-Message-State: AOJu0YzJ4NxU2DJDCpxZkcSaZQVyhhQWlcd8/K0yaMPoGkmNmOJWUVix
	KpKK0jAZbYwj0nIZiwEXXO/lXovm7jqz2MkYfDEfaYWYA6MfVNc14AOmRw+F69TH
X-Gm-Gg: AfdE7cmjiXkzg5nh4dZMF6RwXaATFh7eF138wzeHMPiBaJMx/HybMR5NYos0Bt3h2A6
	pwAE3sOl/ub6f6D4bPHqhVGfH1Dl+XA+HjFtJ7B91hJezoqkPLfEDbhE6nmh5M/DLrZN/PW7HHU
	cAgPMDwebtXUnFjPeHrrzH/YGnj3N5wnSOVaoUiOko6AoUMoPDMi8jiImBYHhvmiUuHIKuGwROm
	J9XNKY1n27i3cbAYa3dUqN/A1fvkgNsRn3AaIigrCwrxiQs4BgatMtCmm3Frh8st/ac44ArXWMt
	bDCZ3MJt7upbklBoK5rMhanGMVbMWZt+AiaxShtXQDXkM0H5aG5tSUVlV6OnxqGPaYPu6ZGBvGE
	Fm1ep4tQ3AuF1ltW0S9M8iWs1W1PgRdcv4G7+AnvEGgBolaX9OweK2WYyBmdNhmqfWgA7xj3ZS2
	cU33jAHXSZNzLHfKhcPfUxmMk3upNtsnrOGkmn2mSwvQ==
X-Received: by 2002:a05:6a00:23c7:b0:845:377e:d42 with SMTP id d2e1a72fcca58-8455077c678mr3623333b3a.4.1781871462930;
        Fri, 19 Jun 2026 05:17:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382586fsm2296986b3a.43.2026.06.19.05.17.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 05:17:42 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 17:47:32 +0530
Message-ID: <20260619121729.24899-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619121729.24899-5-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
 <20260619121729.24899-5-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65279-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5970D6A5A44

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


