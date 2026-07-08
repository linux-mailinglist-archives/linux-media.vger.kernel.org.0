Return-Path: <linux-media+bounces-67058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0cxtJDaETmpbOQIAu9opvQ
	(envelope-from <linux-media+bounces-67058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 19:09:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B30729074
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 19:09:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jsEIKxTI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67058-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67058-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E386B300D4FA
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 17:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A0C37C107;
	Wed,  8 Jul 2026 17:09:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7C377009
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 17:08:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530541; cv=none; b=l9/taoiphnal+EZgTex+q6qMbyr+WnOMfDQhqWHOjZcqGN9YYGMrqn3LdrJ7Lv+COhN+XmknWC7d5lO/2gnGQ/AYyR9ukPCsbacELZlsGgQU/u6dr6fGs7jdflme9gWK4hjHNpDmihH5jyDwj3Mq1VLYUw8rgiWs6sLEc48ENmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530541; c=relaxed/simple;
	bh=y63ibAfHhnDr1Nb6JXOTDq6pLbKYjiGMy0A0OM/Ki28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBZsYz43JQuhCga5eL5Wss2EOjXKGsRXUVUyZXktT7lOa3TmmSXwU0x+zD+q8T8jWd78ZW4mL0uVlBVPnpOguJsO01yFcyPwtBGzBzsWRtpURhSMTS42XPE2WeONKiBPWuiCCgIL1WHCVTzSzLHZ/mcOEccaDdlzlrDXZTuKls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsEIKxTI; arc=none smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c998fd549a8so646360a12.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530538; x=1784135338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md8EBppxz0EdBnJSTmOs+nL5kWFSgGuR0a6y3m6iXcY=;
        b=jsEIKxTIzHd9UzrlOcaTD4grkq56mokb51cwuFciJVNYLGmBp8y5xPfctVUtHTWfs4
         CUQ4n+sJb2jZO9KHiTGmlRGvaSRwQRyn32ECwcCI/E6ILwwjbmyBGP18QAqVYkQrsDQZ
         TFbsXcvFtwr2NuIzmAHtqUppHXpAaAPhuVBsZErzF2ZOk1/GOElnpAb/f73X7Nog2Tjl
         z40ON3nPstQY409rplKusrhbS5vUI5tQ+t3IATOzM93l4zdqxwW8vGqEW1PJFNCdwrK5
         iJXQFwSOXENOMiF0VsZZareXptnuKhZRo0kEf1SPfuQwReFhQKn1Myzz5Ov84SC6ut/P
         tMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530538; x=1784135338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=md8EBppxz0EdBnJSTmOs+nL5kWFSgGuR0a6y3m6iXcY=;
        b=BwYVmq9qDj79dhooN5qoEmWWC35ChI9K3gWf+E3x8dTBE/vDfTds3jAUvcXuO34xxg
         sa4LAF84yurXUy5Ec2K1eRDoMIf+lXMbKB+LwKCJeEPv+xaLoivi6WS4MydXvrLOwT27
         1z6RN4ypsQ2GklNU4tS1ZRBRPmWl0F2PnbS0z22jQByDdhN0u5nbEJN0Q91ZVVv8Ha9X
         ciR62flIH882ryeG7s+v+cvkG6pSOOnD+SqYUQDdoL7bqkgdWAcVVxKw4uufeehiVhmW
         oOD7i6qbnFFc0xg3lSmTnk06Jl02/CEwp7EdWkYEJQou/QSWqfAUAD6Mk5pgTAE3RW4b
         pcCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6hOhe7d10Mcauag77ZmGzWO41WB0Ho8SRDvy3C3tI1n4RYUfnqcoyb8QWRlncAHurF3KDYMETzo0Mdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NhPx4xjjTRe3Pc10kfsxPYpPykaY0C8wc/+nj70JXWyQEUrx
	vghnuPpzOKmI7Q0j4oMtJGCBCcsEQQNfFZus4Lc0ui0ydcUKnBXW3FgU
X-Gm-Gg: AfdE7cn88f45nDExG8IuFbdfAA8MDmE4imqRJj2gdT1CE54YGsHqsi3dnj+tNpidCLx
	RtlUYQG3P+QCshoS9LKPPVyVr0IiPuojWXsCiuFPX64CnikcDReDe1/3i2HxCUo2B+NotlyFAhm
	lZhoIJAv2aoz3m7F2QpzeUce1YrdBL5fK33qYhv2rUuBRL5jTKwsbQGHGtU/hRXlKhf2v9Xfxb0
	wZt8mtt+1h3/+tiBYo8Vq7ercAH7fhWIme+mP3QRNAehKzvFf3D27KKQ8Y4CqXQ4/YwD2Olk81M
	TG6PGBmO99xwcnbMrXUf9kC8V9P3ureBYAfk1JZc6inf3ifb0ijLE9kMkiCH6Ik4jPr8KCgM2BF
	N1SXBfga1mqwtcmh/A5RByDPA1J4MtLhREdBWxO1eqL8IxqPN+Yq7zaygOMo4Aea5mvR6WUsqsk
	OVGW2LCwHwCZEUOwpnudfjcN42q3hUxBZD6Ln1uIEJGaI=
X-Received: by 2002:a05:6a20:939a:b0:3bd:1db1:380c with SMTP id adf61e73a8af0-3c0bd06fe1fmr4009155637.34.1783530537702;
        Wed, 08 Jul 2026 10:08:57 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.08.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:08:57 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v5 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:45 +0530
Message-ID: <20260708170843.55076-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708170843.55076-6-birenpandya@gmail.com>
References: <20260708170843.55076-6-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67058-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75B30729074

The probe error paths and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb1..f9c818b0faf7e 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


