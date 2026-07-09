Return-Path: <linux-media+bounces-67127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BgYtOOVpT2ougQIAu9opvQ
	(envelope-from <linux-media+bounces-67127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:29:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3B72EF41
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:29:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FzQ5qhgJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67127-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67127-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B89693057756
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC66405C5A;
	Thu,  9 Jul 2026 09:18:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894E33FD12A
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 09:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588720; cv=none; b=W6G2LMpQEJtlh83LvZbSKndvSswaHiNEqi5KiwvX9S9zZnexL1OXFd9szvytU2+++K+TnIxrKfFUsRxSOOrkVfNlQtw1i2CbjC6Vzl2/5KcdRvQoUEUBbJLsR3OpFlA6UJeAGFhJqa0MPeccUyUu+qI3vMa/es2/h+argzlcWIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588720; c=relaxed/simple;
	bh=fomlgJtN7/DM/6e6tsm3A1Z5+yYizONNR/sGauOKjvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9Rx58SB4zysEFDS6eAyeFKbi9sJ5z5QoDS93oPWjOa0qC1vwKeXuL9qtsuDFLR3XRk9n+Mh8pjujvFpH/TL2V4P8NOKqXNSNmaVHvyaUg5Bp/F/CtXThJ96ftFNvsUaJVJ7143q3rmlmAzxpijWt8btiODmQnEABYWHbevc5RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzQ5qhgJ; arc=none smtp.client-ip=209.85.215.180
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so1509983a12.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783588716; x=1784193516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBE3Wy8IbVvVmFetXIyFuvkOVDnb/jlrhawxTziiV74=;
        b=FzQ5qhgJyAJa48dNR2TFZNjx6n/2SUbcB0Hhq6VTsZG+tynROCmK5k57BQHVEv6zKh
         xySEgDZgzMHaeZFU4D4FRAmHiUbpWaLyZ4vMxBqorHSRXDl7krahxu0Tg/JU2eHxGhN/
         c/ZeguO3nvg3LiBYu9zrFJN5YAfMhvopGUfazZG4fwINMh3YtjwW3AUdVbbT/A+6GdBE
         WxfTG2AntTP31a/OSqU+o7MjkvD1geyP4rwVNCFBX6q5+OJJiA+/9IL6xTFwaHGeHl2o
         3mNbhp6Dh0HREMXNU9Q+I1hSyFTQv17Gj4ZH840sOPdwMgdyF1KdYZij+fRc9y7KQOwK
         SR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588716; x=1784193516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBE3Wy8IbVvVmFetXIyFuvkOVDnb/jlrhawxTziiV74=;
        b=GL1206fG9mhXf1ZGbqxlM+ulBQx/2w1RY/zLTCsr0lzDxS0sivwMJk5dsfKYhMxP7G
         slnTmeZbd4Ks7MhQrN/F6BlA0QlxVhdcquMSWOMiCFtC+GKu6rIFO88/QBXbJ9HzrCav
         qVWFbJrTShd42D156aCr3OuWUvic5FK1nkG9hHfgTI7DPE2xpsxXS8XvLDsyc9SFihE/
         j8eMVQKZJdcdZ++YWA5+EeE+WpbcBJaFCrJqcyQ9YmO8e5/VfmYuuhjboEeDMiytUrM3
         7+eCA6eXVEll9A9l+8egmKem2MzK4UQw5AThZPeRTnhzg20XkNBzPt5Sfd3VyE0WJp4V
         xkEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDb1Q5qUHg3zpSqqrw4sE0w4//I0xu5mcX2ycyzVshWuBf8uXPIo/58lr65DCRfgXhaUtcf6wE5Mxvug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMi45ixMEpvSju1K+tN3Vyk8eisv2AdaDxLPHEuzEXRa5NEByw
	tke4Ya/+4Fu/EnarXzIz52QdEpgPseouxuQyBe8mEMY9o5HnKxM6Mps3
X-Gm-Gg: AfdE7cnjQyATkDkwmNE3yzZKAb+MMbqC+NL7iHjFWhj44mCjmX5QbiDqd/ViWCBP49p
	fzE9SCCapkk3u6TZrq/oMPWyWgZyf5o5HMr/ShWaKm/SNsw6hnmoAgoctNbaaROgVyzj1dlQSp4
	qeKAYdw9vqNDoRBAiPoKDuzZgjRt4F/XKCWrQ3i9nwriLdr+3sffHkeQdAkmQpqU3HjYofE1Scv
	UngvJ/brvG7Nh64R8QRVqcMlOXiIk43hV1OCw+xR3hAqhdAC9Qk44m6z7xkp/XyVaSDOkhLq+nB
	d6jSkW8SQgoZVHDNEiKui+qVg/TmwS8TcjH9OSgTIaUJJOxSqMzOKYZtJh35oTngP366cP3rptJ
	oK572bnhIQ3V0Mxh9eylnVJggSPrIFEMCVNa0GwkgQ5R8Ki8AdauSMQTlltCK7jupNSpoNEGwoc
	OmhPPkka4gIj6wb2MGYFACOHPCyeHtTWNX1AjFANESb7I=
X-Received: by 2002:a05:6a20:d495:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3c0bcf162edmr8106101637.14.1783588716037;
        Thu, 09 Jul 2026 02:18:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm29682728c88.5.2026.07.09.02.18.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 02:18:35 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jacopo.mondi+renesas@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v6 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Thu,  9 Jul 2026 14:48:17 +0530
Message-ID: <20260709091813.67081-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709091813.67081-6-birenpandya@gmail.com>
References: <20260709091813.67081-6-birenpandya@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67127-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43B3B72EF41

The probe error path and remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init() to prevent memory leaks.

Add a dedicated error_entity label so the cleanup is only invoked when
media_entity_pads_init() has actually succeeded. This ensures that the
teardown logic properly mirrors initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba8..5bae8eb0ee19b 100644
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


