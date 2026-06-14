Return-Path: <linux-media+bounces-64848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lNcdDSAPL2p07gQAu9opvQ
	(envelope-from <linux-media+bounces-64848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 810016822A2
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Lm7C19HY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64848-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64848-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93AB33009F95
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3904C31F982;
	Sun, 14 Jun 2026 20:29:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5FB67E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468950; cv=none; b=DGXP0WLzS77045I07NfdT1aQ1TZNN4V1FZnn62NurCt1zFB2n7cj1GD8fxi4n0yn0+xeJVnIrEirdse47HWvZugYN0b6pQcmnQrBwevS9HWrHTVDs9G3p6ea0jKHapqvxjuLLdAy77Cgxj8ZJJ1Z7sTYCT5njL9FAfgOTAmjnCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468950; c=relaxed/simple;
	bh=UWqmPBb9lYmUHte5jzGL4bwmzok/E1L2sfK+HjXsU80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAJjPgqyea0HxSQp/LrKd3zl0CRQVK+7kWmw5Ts3Jowh0ugkbbleZ6x2OLI5sHmF7sLyCbp8kOnp34jQwktQPPAeqp/aPSfGxLXIzGMEVyq5lniuYcWU6rWKa8iKvuRZVk4XMLfbzvvUbqltn/LIalL2O9O3uQxFhQ2lGdhthwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm7C19HY; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so1168978a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468949; x=1782073749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywqQuCxykmaaSjgy3GzHJjbLWrbgi091EGla2oDbBMo=;
        b=Lm7C19HYhhllzCo8SMQwlLE3mIPtw5URjNlBfuyRprUP86Q2BLV6KAy1cYuIIyix6W
         3G0mXMtbZy4CVOLTu4g7dXT7iVgz/7nvmetqUNtY1s0mx7YxU5eN6o/5oxcudcOsQ73y
         CmiDm67U2G3RWzMUS8eMlcx+zdSqPPSAgQ9hXelkVhVWOmEQtlIW+jNrXlCYj4LD+DNn
         b5GKgh6bAW6B5VCVO+56JNRAVBCl8ff6sQ6KegJrtkgXntKUiLL4uhVUfmPuSiLn1z11
         y6RJ5B2kL++jonCch5aVfiqKEp1maSLxpq0EybfRepklVy4kz2xrjwaVnYb515RBv/KQ
         kOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468949; x=1782073749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ywqQuCxykmaaSjgy3GzHJjbLWrbgi091EGla2oDbBMo=;
        b=jB6uI1PI9GwS7OeVDswFwBe0CqYvTyhlE3C4SekAWjysjF4BOu0B4SutLc5yvveLkQ
         j3Gbl5ggxTHfCQTftmQOjnZt+5MYD/Ouy3ntqcF/lnncIUbYidOM/gvPu3P3ku9QMdYT
         PfFG004JZ3RdgWUaz+AT1oZqivP1Uuz1jTIGKcA339qlpzQ3s1Mxylf8PgbU7pMyjAlT
         /XjLFVhwWLqqVwrYrwcGgAHVB3Iq82U0qBdVOYqfeuTSKY4lKa6q+Y37bcrrEwvHvm3v
         uaMOuUCv5pxN9cIdasvAd89Yvz3ZMAJNSePgj0a56at+ZYtcYErHhyEXhEkzizpgYNoU
         MvuA==
X-Gm-Message-State: AOJu0YwO9SdLqZv5GOS5S42RWJRxwVbMvdNAc51dDS6U64tnLlfXpD5j
	OEuDqgcQrGvHAvVhFP0Gg/jWJ+tLaHHNjPtAlDJjpPbfu/GyCDuMqIE5NMyZ9dOO
X-Gm-Gg: Acq92OFlLrZt4M7UCg0bbuqq0U/u84fu/qtw/b7/y5PYeeK5wMqhsus5H0NkunyCrbX
	ECQJX2NHl47kwCiPAH1ol+a5hyELDYFDjQj2JuDhvh5iFqrA8BvE7hc2dQXsER/HhJcwBKbHLZc
	z4hpt4ru1qtmJsTT5fkJLVaL7ndEhzFE4FBdWPV9ODKogfrxH7wwYGHEv9K/ASuu7xTyZNVPAhJ
	Qp10A/TyF6Yiry93wMJU71AalVl2sDymMHRdmIbF8murdWmH5uT8YFZ0oMGB7p4F/emfGKlVRTV
	8DbY9ZozV2Xb/MLi6xCN2aSy7+vpU24Mch3pwkMYz/56p/4PXPbUFzfMTxFnUf2AlADvmV9joid
	3cEu4jXuee3oeU2sa8/rqK0IEpkY0u5Upv9vOgU97kmaGleJvqeUrw0i5auZO1279eWTYRyV85g
	h3Ox/Fw34fZZR9///WNJ0KedSBjgrnMDQe3bxflGyJt6EvkqHUxVTj
X-Received: by 2002:a17:90b:4f48:b0:379:1f28:cdc2 with SMTP id 98e67ed59e1d1-37a034f50e3mr11678185a91.13.1781468949119;
        Sun, 14 Jun 2026 13:29:09 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:08 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Subject: [PATCH v3 05/22] media: i2c: saa7115: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:05 +0530
Message-ID: <20260614202835.11977-6-birenpandya@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,realtek.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64848-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:visitorckw@gmail.com,m:eleanor.lin@realtek.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 810016822A2

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

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


