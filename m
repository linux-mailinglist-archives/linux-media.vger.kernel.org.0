Return-Path: <linux-media+bounces-65401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nuWAHjGFOWrvugcAu9opvQ
	(envelope-from <linux-media+bounces-65401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:55:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC16B1EDB
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:55:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cWMUdoOc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65401-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65401-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5F43054F6A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBCC35200B;
	Mon, 22 Jun 2026 18:49:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79E346E5D
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:49:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154156; cv=none; b=q/wJm2hwXa1X9NTfAxXsHYrLMA441Mkn38Jv058uaMKrFY3NunFwgzoiEay274OZyEXCZUPvlmeABxM4SyC7VMbw0G/T+g/bE2BiXjUoAxwiGkiPtrlffaqlEVrCNsHp2VJzHyxpECOm0UhV0aZbTnakDDqWEhepjTuyWe5c6i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154156; c=relaxed/simple;
	bh=1OJ+icYvEUWlm8+gkxpBRGkF6MURV1kBnpa24faYVyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ww3/IFfUvPytR/xm119fDKnIQ9zl36YVrYizjPpQHF6m8g6fYwzgW5uFGvV2nOZFA/+uBSplY4+l/wVQb4Y9E52GATv+T6cXJSq5WG/GJ23mpoWRjJG3ktP3qanQrlZbptvm7fGli14VtyxXXEOxpXDPi7y1PFfv7J11FUW0YD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWMUdoOc; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so1944490a91.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154152; x=1782758952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyiROYORTtKO75BwiwBGsAV70dzUHKAaS+4RZHI8OfY=;
        b=cWMUdoOcAd38/ybyZmdyyFS+wKolNGLNwpiKICgTksJQn9OwBc8V8Ck10E/LjMSiMU
         sHS4n9VnM5W2CQr5ZUV2eIspaau/ltoBIISYl9a+G2rmVhXBiHtVBcFcC8LmwFo+E1QO
         m7/GivdYIV698x1hc8KR9HbeNf3HP9GlM5YM/nvFSuaE2e+J9mGivPghsEXy/4gTvAIf
         CC4ZWyXe4/2jGJFTvgKUxG19cEqq+Q8P3xuBUytM8yLmE/W8Ht/MUGDkcaXhMUzXUqKb
         nfkE/hyA3+4qTSCbmf2jqVty/cQ6bsDPoy8t4XGs3GoWB6hI+a0awKvtkQM8OWHYlwDv
         43VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154152; x=1782758952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EyiROYORTtKO75BwiwBGsAV70dzUHKAaS+4RZHI8OfY=;
        b=Xd5xRdaUJw6M06UCwPhVX5s1IW/x/G1y9zpjGrEwfqBvcmvB02zYqA74oaRwDzW6+D
         peKVQ0GmL7ClBJ85zPvITr9g+KljnO+sEBxb9PcB8arm0Vf5mXhFtanH9bp83+ziumvR
         15++PXnlLpygxluoLunkUsJjCvU64Zuo58a2r3Mo9/ouHQwozylAhD6kdgxdvQtgNgue
         0U/o8dHraULgsAN4rrERB9Jpb+ht05Hc8wFIwNzcyHfypC+4qXoF8nVbpLmIamRMkU02
         FOu7nFzV1ufRtY9wJRJVMySEGEq9YSwWS6r8yC/SCwdxHILlzJGDpDqFiI5mvN/tQB9Z
         EFiA==
X-Forwarded-Encrypted: i=1; AHgh+RqHV4tvvZfKNxM1EbrsHPxCQsNG2gstl3M/yTEYVVCiwugUPB8ofQguon+WUzwQ5hBt/i4IrVmgzclNvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykizi6gA67Poiv+IBSKjPAqUM9qa+KqCiyq1QNRpGx8tlKfdjW
	zzs8PvyG8K1aVwlAlsBG20A2FFErFuBESXMpUBNTjfCkVdDtfodT08V3
X-Gm-Gg: AfdE7clEPLaygfl3WY/styf/YfQayk6M3e0wlVPfYfMoBK+phuY3DV2loDE9FKj1wLb
	9DdoLSsURX/ThRjQmuDE2UegxHNGeP09WOtuShYpd63eLcl2tldrqOhgcI736bnRBTiZjD5sI2W
	apaSr+e2MiuaaGtz+VJWGMDKevoYkvH0veuovoLBj4YACnuBHbCDppLKUXNTiBmTSMOMnhvR+MV
	WWB2UeH0z1PhrdD4FQGEKnvF44xBkMOUez4OXUiWxyeoSnY2nIjybYwnHoTNgezcPqL7Ltk8VKo
	UaNRE+nqmyxh82GHFOL6FYdyZtInt6/9hUvuDYF1IcAodA/dFEJuqNztt0qXCcEAv1MlBFGWv0Y
	2+/n4GkjDm+LzO0zflYiGgjhCPaVja/IkxTzrrlZ4bNg5rsFXAy+uyg+FAw/oO1AhPsPCNtbRsT
	INm9bjn+P6hMdUrJ4xggnskmnUvpvKN38fahyb2l1ThpB2b439NoM8
X-Received: by 2002:a17:90b:4985:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-37d4e438e09mr10719512a91.16.1782154152143;
        Mon, 22 Jun 2026 11:49:12 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm7780517a91.7.2026.06.22.11.49.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:49:11 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	birenpandya@gmail.com
Subject: [PATCH v2 5/5] media: i2c: saa7115: Add missing media_entity_cleanup()
Date: Tue, 23 Jun 2026 00:18:46 +0530
Message-ID: <20260622184840.66226-12-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622184840.66226-7-birenpandya@gmail.com>
References: <20260622184840.66226-7-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65401-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2AC16B1EDB

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/saa7115.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 48d6730d9271..64adfff3001b 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1867,6 +1867,7 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1925,6 +1926,7 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.50.1 (Apple Git-155)


