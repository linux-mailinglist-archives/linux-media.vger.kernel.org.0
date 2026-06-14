Return-Path: <linux-media+bounces-64809-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ldV7GaTdLmoJ5QQAu9opvQ
	(envelope-from <linux-media+bounces-64809-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 029406819CB
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=koXF9ifU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64809-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64809-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7089230191AB
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7B2395AFA;
	Sun, 14 Jun 2026 16:56:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D42F7AD2
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:56:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456213; cv=none; b=WbQdYq/6lGFeWV4dTFvVMkBp9twfC65DfjzNEn3aOt+CDkSqVHqloUJl6NaY1ZwPWVGDiBIyjbTUgLlyhWlAjpF3NggGDsKfWE4WuAv0De1Q7cPQEkEjczBcbiXLRZ5m9jXTyFrTS4/UAQ64Q0L5S811nK4nUp3iohXZejFNlvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456213; c=relaxed/simple;
	bh=/bJsLoWCdPKFWO2yXF59OTcCR9iBe2ZCAer13InhKEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQ/2+rUushbmC5z4JD/RrZetF718F+Cd4We63tTjj6SQ56LDMHlKoL0/9BuxH5kWWCxNCj6i9mcjwIK0FdeJLgvOWBYvp89ErweDo2iIfRxIUYb4sxpTX8jvo21X5Cug7MAyD23d2TcXCLloOVGjSAioRMF+kCndZs9yJsvNm14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koXF9ifU; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0aa420401so18313395ad.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456211; x=1782061011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9PgnXeogz6Rgu6OO1LTN8h5DeE9zNp79XgO8N3hk/A=;
        b=koXF9ifU3+zFqfNolfaWJZ3eyUoTDBbx341/cA+hIUSFcqHA36FkO0+vjrF36RhCp9
         AZgbALrW+K1CsqqYmFDyIGDdxiHZnEx2auqCJf4gOmSrWq4nKg9W5pfa41F6X4pKk1vU
         oIvEInbuxWB1jtSpdgiozbFm5UDdGYTaqUOnJzweuihhjYd0Iohkx/fZMg4UdT56RwdQ
         GdiOE7csSaDxOAYXcfubLg8pjrPBxM5t9oySUlDUNfEjUhHfOZt0QCaUEZx1iZVh/eJF
         ZouYi4EA108lvqHPemalkzRn58rspJxAuTq6W1GdpuN6ta3IbOa4QI+ASRwoufg1BSlp
         PCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456211; x=1782061011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9PgnXeogz6Rgu6OO1LTN8h5DeE9zNp79XgO8N3hk/A=;
        b=GMHzdH9QZPW2BSfxvXuYl5c5UqcqeGE2CSM0l9y97zCgePxTfNaPHRAq8AAYHKliU/
         G46jz5kvzXlSZaFk4xbAkFqTtAEFMNTF3LVfI6yro3UECi4dwEsy8NgvstZ6npPMPXTL
         NdWsg7L84Ts8hIxgAB6HPrQhrGW6X4Z/0xz7+kCUKICZLz1ZUEAaSOBOspyVla/24v4f
         9m609iJ4Hc4AjoAbNgoffq2TA+lFRE/7F+ehep+uRaVyyOaB0sbLil1B9BFDDNdNfxoh
         S/BlWGPnshWCf8H6q0Qf40XGKl8UYlgtUeHyrZFY0Q6Tv9AHPUWaSiZDnLvcPImw9hgd
         bHAQ==
X-Gm-Message-State: AOJu0YwuFm7Yf73g4d2LCSmPbnA0V2Mi+tMHa/R/E/ZEaQ3KSU3BSJCo
	ZevUGhidUY+P7arL+z0vnRg2/u64pF63Pj1fsNtj/988gsAluTJpzNZZuxqBweqw
X-Gm-Gg: Acq92OHSRPeTzagbrXGj5/Hk+G9J9uijJnOZ6d3WecHs6VS/7rJwj6yuFlYzBXH791A
	+Jk//Xe1Z8PQ1wSRtwjgbY+oLO/8YJgHEu9hxyQWObQ4FylnUOhYw3gjuyDNNRfWBwhd0jG3y93
	ahMHuMn5u9m9bTykL4PoRnTBlgkPa/0yQAvVEOc7eygVXSs64EUPkV5s6M0pY4e1kQksR+19EHb
	7kf3EGgxtDAT0Z+OPSE1nNj8JwnhSfAMRbBCBbPjEykAJC6izuNoraUo3nN9q3wUUkSMWnqbYGR
	qcVCmDkZcIXZhiFJi0vZzQdgV8Eh7N+HepUK2C7wdgZPGhESjjJjIdXyxGQTsq+F8CG1hqYrKVh
	/ug2k/ix3n33T/ZSf63D+8CdV3OclIWbi8mc9TAKYZ3oYKJDhBwoVVkHs7R/VWUeDKi748SpWE4
	UuumvoClPilPxwKn3qkkLP7D4bS8mspS6ZBg4OaaY+Sm6D5DTzZNBUUIk2U7HyuvA=
X-Received: by 2002:a17:902:c404:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c412c30b6amr123734735ad.27.1781456211218;
        Sun, 14 Jun 2026 09:56:51 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.56.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:56:50 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/22] media: i2c: msp3400-driver: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:40 +0530
Message-ID: <20260614165630.3896-4-birenpandya@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64809-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 029406819CB

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..d977a6039e6c 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -812,6 +812,7 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 
@@ -865,6 +866,7 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&state->sd.entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)


