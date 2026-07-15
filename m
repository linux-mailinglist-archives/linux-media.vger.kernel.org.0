Return-Path: <linux-media+bounces-67609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IBCBMVQBV2rvEAEAu9opvQ
	(envelope-from <linux-media+bounces-67609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:41:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9B975A5A7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:41:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="eM4XG/Dd";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67609-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67609-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6019830EAEEB
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6E13A963D;
	Wed, 15 Jul 2026 03:38:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6EF3B27E2
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:38:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086724; cv=none; b=neYeUNqCEAIvbijCB/0JDKKNE1GAq2YdPgR561GMM993I5Lf5b/5cOdm8gzxE1gtHYB6CQmqtZC8qLg2kda+aL67LyATmRAcQ2KbxL/CaW6S6GTp7gHGRtkY0mGHPqA/VXlHd7BnirrcS8jqO3MhZWnTYuBzrtIFHZvRxh5s2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086724; c=relaxed/simple;
	bh=kTxcJHE6iVe6RfB49bXDbrA6ICjAjhcYetRvA3pBtHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igRBwMHJavVmBQzeihbji23naAcjahHFK2JPbqu6AeuE+8ZeJ5mV++LxZAWcv3oVNH28Cdzkq9VybRle035nBOEiMTW59LOfgmQZ4US/3W4atrKH30AHXkI79efVwQAxcR5rxdpFn6DIBQbEAAAV7o9svBlmkk/++dwSFC3RFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM4XG/Dd; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8487b7b4066so4921078b3a.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784086711; x=1784691511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctC2FHVouwwXy6nRKJZij8fpoFOJxlyQsKFiZ9amI48=;
        b=eM4XG/DdGe7oHi5H9Hm0gIE3o1of1KlMBb91W+35xPJgGJyBbCz5oVEl0ulZhEQAFh
         36kX+UBv0VM5ccgbw7XbbYKqyNCPL6FDba2ZMApJX63fk/BOQ7KQ8RPuguiNf72tZZqq
         sQr4WTTf2aK7aA0kGkaoQNZ2H6MVEy/Ykfwk/J+rBHKIW6TaWsLHjlGK23k2om19L+vT
         K6cF9Xcuz/CWBIEJN4ud+O4SFlPvygOPtgyIk2t7pnpMryii0gu4mRMzBwnT5Nil1wwR
         MZLw+OT/+Et9l73Zso4bI+cpYBjCOmPvVUnHTThe0NzdV3ggzEMhOuZyTrsZaO91ed+d
         +eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086711; x=1784691511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ctC2FHVouwwXy6nRKJZij8fpoFOJxlyQsKFiZ9amI48=;
        b=SNjYxgAvPG40wjcc9piXavJR3M9fMMk9y9P7U3zG37YnF88mTu6AflyCrLnJgfapq3
         NYMua8qj0qOjsQMR9AxrDiqbG93UG2kBh0LFt5X1kw0b5+APC0MQTqHCdF1ja8+rcRo4
         r1uapxRKj5Tu51F7O1zUaXANU67WRX8wWar+jDkzFsXUoCu53JKE/0i24zmGsYanb8FW
         xk4JcSmIpGwufl5T5VV+u0CsNWXWicl9EvxmEiKTiRJXJvGSKFaAj9Vf7x/9kOonESNH
         ZTPxBGjv7gbSLLr1ARy22AH6KMTPi8iDqsKhxk0OyhYSiDrNnwo9XYqi28Pc1iwrZJS7
         lgjw==
X-Forwarded-Encrypted: i=1; AHgh+RplqSZ6Mha3xv/dVxKdg102+gknDsCdov5ou/lnBXuCMriBffE0ewJ1P0VBB2lHZRCBjVFa4TX6a3Z02Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9wmKCBsyH1J8XbJ8E2Br0p1Urm8HKmuNvxYFED5sdzLujMgwC
	QQJiK5ZKFtqWkGrsD9M/Tq1ZQPfSmcKPIiIscnr6RF+irOPjulCdhzwX
X-Gm-Gg: AfdE7clSJfJChqFCMtxPG2yFRmnQLUzPMye/kVbxaUR6ZWB1qYJc82+W0NwGiGtn84/
	kei/ExBM4edQAiDA2wHPopYc5yDmtNXjCyf+mDxARvPwUZ2Ob1Vf494p3jq3HXFLvSfqJ8BQLHQ
	2zxk9Ma2+L92INxinSy4yOGhlaUkn0iBk6oqMqmf7yLO9dckPO+o3e633bZTLV/IxQpHxvcZ+58
	MOHTY4Yi+KS71xdzzsgMrYY987kM01Wod/C+qmDPxgy55l5KwgVrMWVHYCEE0Hf3mEvfyh1f08U
	9YrWXyDJ9VbtcAw5WdMkTRYLcW4A6s5DKWVQ0qz0UI+YUoNesm37XAxA7ucFOKZrjSJghiU0fFH
	1IsMFQ4XGwSeDUuKrWa6Se8pDLmP8d8yndJM01dCbrS6PItP90E2HxNMCqth/ZiOuFRZJkZFpxS
	Q4qZI99HBclrgjAJjiDGvY9svKXZBI6Pq4bBkVZPJHbKc=
X-Received: by 2002:a05:6a21:101:b0:3c0:cb82:508c with SMTP id adf61e73a8af0-3c36c371b85mr1287451637.49.1784086710623;
        Tue, 14 Jul 2026 20:38:30 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm91977889eec.19.2026.07.14.20.38.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 20:38:30 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: mchehab@kernel.org,
	jacopo+renesas@jmondi.org,
	kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 1/5] media: i2c: cx25840-core: Add missing media_entity_cleanup()
Date: Wed, 15 Jul 2026 09:08:20 +0530
Message-ID: <20260715033818.10967-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715033818.10967-7-birenpandya@gmail.com>
References: <20260715033818.10967-7-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67609-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F9B975A5A7

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 69d5cc648c0f..a3d7473854a3 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3962,6 +3962,7 @@ static int cx25840_probe(struct i2c_client *client)
 		int err = state->hdl.error;
 
 		v4l2_ctrl_handler_free(&state->hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	if (!is_cx2583x(state))
@@ -3986,6 +3987,7 @@ static void cx25840_remove(struct i2c_client *client)
 	cx25840_ir_remove(sd);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-- 
2.50.1 (Apple Git-155)


