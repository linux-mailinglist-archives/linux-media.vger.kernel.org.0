Return-Path: <linux-media+bounces-65399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mAnlArqDOWqUugcAu9opvQ
	(envelope-from <linux-media+bounces-65399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:49:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0466B1DD6
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZZTHm9pz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65399-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65399-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25C5F302629A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267DD348C46;
	Mon, 22 Jun 2026 18:49:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92693347BA7
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:49:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154147; cv=none; b=p21+pbhfgdS26V1amCn5lmLx61NcXl5Eb6a0OUUBd7EFvux4LOVjKEjrJYrqVNLhNLsG4+ISfRrU4xH8NUuX7yVPBPyPSXiGui80JlPLKPJZ+XYUmRHB8nzPdkgvffR3YCGj4JJSoU/gDqUtxOQBGClPPMsh1qGttAt5fVP+5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154147; c=relaxed/simple;
	bh=bRZRmeuak8UGKeftukzPu9pf5prdsKVf2Hg9qG80Lio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwwPUeL7TBsk01zYPpDnDir8ituKU09yvFdTG2r3Q3OOrGzu5jKgJ+IElCPmfIPDTyEufDP9Ju4g5dcFV8XFe/ydMWm1rZz9j/5K99xexC2x5Imof0g9KsFVF6A9NLU/13zq+3lpj7eYBHIOxfJnFU4aWOxt22ZHyYhWgerGoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZTHm9pz; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37cae998401so2149980a91.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154144; x=1782758944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4LF8M4ghb+YPtxRjEmX1qyfcwiqHlXNeKROLqcS8Yw=;
        b=ZZTHm9pzpXzUNX8fIVqEEGaMoVgaaYrS8WTDL7czx7Z9Y0lvozd7nNxvFmiIFtsHmI
         Ecb7GVcedUu8UBejC0Ze4lTeLzmozvXqSlaye58jZndpA009clvH2GlKR3XFIDnnjJv9
         p3XuI3tjcgiJuZc1PKABbUKa7pKcf6i654LJBwUplYIob5NUgAA/FNqnTC+g78UlUsMG
         KYtXt8/OjbfSPsFpZKU7iL77X+6lLsNjmq3o7U+NH7t6cK7M3jJUxHz7+W9P/kqsMAW4
         MBTcVE/mUiBm4Gf5Vm4w1hHnq7Rflh7f69kcE381kkPXNuugA1G3WYhOsRwV3TIluHea
         p32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154144; x=1782758944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I4LF8M4ghb+YPtxRjEmX1qyfcwiqHlXNeKROLqcS8Yw=;
        b=WPL7mmXkekQUkr+TILKwDrUzUeKMUa/Kd+oIB3uuSzLhU66znzu7+R3tIz4oXyRRx9
         +VaS2haW4OSlQG7Hnkv1MSqAVfnl0A2nJrYGLk/Cc+QD8MlGEx37uF7EgFJDFTEenuS6
         BZAHhfkLXZShutkiwBsGhn9kk54Ts9EiNqnxfx1/xMrCp9X7WBaxhmND+nXQYrmeOWVa
         va6WK8IIH2zmZ414EabNPBsJu39akiq2THtjaCz5itWzC0aOCF3VRiUJa5OceI5FI0Pa
         mOEkrO7iYRiE2lDXFFwDzexc91LRUFi55gdSdtH4quWHW5l+q3yKaH5cLcD5QfiuUzJ8
         gkTw==
X-Forwarded-Encrypted: i=1; AHgh+RowQXpdeWo39+E8QgfmFy9U5U2d0jRhb1VRGxyy8c1ixJtnxf8SgCc9RPrdkCj9oN4K4tTwuIlIZeOWrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7uKNCE8sl6NV1a+kOH7uCywHay0KsJivY9ELPNBb66Z60j7y9
	tg3ecpoupfrQsih4w3oT7BEFLIFxbDRNyfPw/WbWLEXyU6w1NyAj9WLf
X-Gm-Gg: AfdE7cksejtDaersT0cjYScR9kAkG37RzBNP4nscNCFEabdrzHCEjwrQZbg9haZTiAo
	+h3aOCXZ56Z/TPeiaOWHVvoT0O/fvG0X+ZQDLOmKB+ZlCCKHbaHPWEqD/9xFKqbegoSM31Zain8
	OAdnm3ZQsxfopYtDmk4sESPJofjqydhBYs81mxGhLrnD9PHTq2TiqUVCeVrn7P7hKZEguH85SL5
	tosLr8P0+rbuLgs+/Juid6Ig97A+vYPzyeoVWfLRMK0nEOQNrTaFT2/lPWOBL6psd/k/rE/4BX8
	h+FWcBQeMAqVic2ErfeAhGJaQNcCPBOVHB1uhcIqlvxujtTEWE/m1+8TyPYy9hheyz/enN5XFGQ
	0p4w9uEpUl9F7YkVyCFYA+1uJDBh74S0PRwC8OAzkhyyhy1jOOmD94EvaYIceWPdiauBmIFnxDG
	AYZ1IsHeXIAnEqHVgyBY5qU3ptedOtu3PBMYtf+kjE+w==
X-Received: by 2002:a17:90b:2687:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-37d16005c06mr14592066a91.5.1782154143209;
        Mon, 22 Jun 2026 11:49:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm7780517a91.7.2026.06.22.11.49.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:49:02 -0700 (PDT)
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
Subject: [PATCH v2 3/5] media: i2c: msp3400-driver: Add missing media_entity_cleanup()
Date: Tue, 23 Jun 2026 00:18:44 +0530
Message-ID: <20260622184840.66226-10-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65399-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB0466B1DD6

The remove function and the probe error path are missing calls to
media_entity_cleanup(). Add them.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..48c60050c5d7 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,6 +717,7 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+		media_entity_cleanup(&sd->entity);
 		return -ENODEV;
 	}
 
@@ -812,6 +813,7 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 
@@ -865,6 +867,7 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&state->sd.entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)


