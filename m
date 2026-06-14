Return-Path: <linux-media+bounces-64846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vN+QAhIPL2py7gQAu9opvQ
	(envelope-from <linux-media+bounces-64846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22668229A
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h+7iC9mQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64846-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64846-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD6EA3009CFA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621BB31E84F;
	Sun, 14 Jun 2026 20:28:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7634B67E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:28:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468937; cv=none; b=XoTtdZDsnmL9CUH8QedS8le7GxILyemUkY2glFjqWuJcg9e5LPuMPuXICbiC7/kSf2LmBSPq678Dl4ivPgKqK6kKin++yKJ+rf5XCDxyhbhK/9h3ZOR9sD1uMles7brgPjhtjM+v9eLAEy+n6DnY6aFodMKxs9t4LcMPPLJHKdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468937; c=relaxed/simple;
	bh=/bJsLoWCdPKFWO2yXF59OTcCR9iBe2ZCAer13InhKEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tm1FMYHZecHdrogDy3FpGX4yptnvomIZ5MNS9X9cgePp7EYVRkecccaQrRVbtJC68OWc53qdaP+WmBfEWwOT9LNJWjg1zQwHc2oZEc6bngDsGkH3kf/ERaZ6ssSr1Bz2UYz6RHuR7n/ypA1Yq2fGgR/3V3W3rPQcaydUlrs7Uyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+7iC9mQ; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso2210488a91.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468936; x=1782073736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9PgnXeogz6Rgu6OO1LTN8h5DeE9zNp79XgO8N3hk/A=;
        b=h+7iC9mQtePW0x5qqhGoebnOwiwiepeRn0CwiJGuDIHNhPJMi+XNmXFHCbwasvcppA
         P52XjF81NuU+j3KWIQjRjJWMm7mCwaQMuaQyko/5OkY5BA3+Gz0+/Vx9/EoZziSCkVM1
         G0MjWM/ck8aAwWQgJf8DhB787Q+NR92rT9wZmq8pKGQUkOdmdr+xNsdiDSdmQ9JJ+msD
         b/TSCexiwWa1jAUo8qpVm7fyh9aZgKtk9NAGNRLYfmGbSwCy74gAnjK1jPoVDr+Xe1OO
         srQwP1Kt75PC//jADQHA9DC0SNQiu5rI1DJXbiIwjdsrR/Iq5Q+y7L3Bb0DccPTiuiO7
         fHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468936; x=1782073736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9PgnXeogz6Rgu6OO1LTN8h5DeE9zNp79XgO8N3hk/A=;
        b=obPlXVfr8CDUHxjSg19OSpNkqAna+3eiMM6qaSJSCWx538/Zf4KisWzDiVT9da5e7+
         lsSZp9aHIGjlxmICJA8JT7Ne9OZwb2ynHa1GW3ptCDoq82ETkt1mNHwczu1nMl/z0FCw
         sl1ZsrFvUt/zXoKLYfGIxL8TaWjeD2j8WF9lbpI7AC84QOdjzpZYdFeAT4O5Crnc2EA7
         LvoXrp0+P0ezA6urZ30KelKIx6Wiq6dfcuDCUEIJbsfS5ASy+AsUoLl+5JwM4dvL9ZUN
         I02OQHhNeuok49JJt1WLLHZjUVRCy3wP+WLEL7xnsxQNOzT3rnQJK+EfTzrjYwaMOiDP
         u2oQ==
X-Gm-Message-State: AOJu0YyeOL+0xXHOUw043Q6CY/ehoa87VZ8ViN1iyfusbFDPVYGmC2OM
	7BbbLBfNA3aqP+2nZkAXxfm+J9MDH/xLTtxZOaZ5rxbPEgOF+nKvOmVeXRHMqJsZ
X-Gm-Gg: Acq92OGLXjYC2lII7LDbEd19ZNq5Ul78dV2jl5MxitRnqo2RG7PftjLUAgg5Pa2RCBi
	L8hz/usUx2gDiKmQllktzdzFAp3y/Wi4T8670EyEI0YOKQJ0Nc5Z6+KhvDjOvhWntKrb6I81pzs
	jxlyxJoPw3fZJKO0Or7+FAkZAxaoSAD31VFQKk/RA+LpzwjiOGLwxdQoa1G4HKmqQyH2M9s7oNO
	zALKzxn79FWlgQg39uIIv08J4Dh3sKqaqKSAWieEW266BfOBq9Nm89StkPr4I6CCj1FMsesRAYB
	aUbjbKMzI+teeQMp+Yq9aWZlXKSYpYmDHhKyWWoAOVbEjuhdQM+n3LZ0o/yrIpgOSDHv9h8q+HQ
	0koaWICRXLxHONAUt1SZVizm3f0ypCy7pcxIK2AgJVLE8TqODODbpi8ITwesrdvD5Jz1Ozi8chb
	kSld17tWQp7jTQ4gJoF++RANxt6SSI4qXzJkXKYzY0xTIGv62j/l02
X-Received: by 2002:a17:90a:d006:b0:36a:8ce7:b879 with SMTP id 98e67ed59e1d1-37a018486cdmr10988318a91.5.1781468936231;
        Sun, 14 Jun 2026 13:28:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.28.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:28:55 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 03/22] media: i2c: msp3400-driver: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:03 +0530
Message-ID: <20260614202835.11977-4-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64846-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
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
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F22668229A

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


