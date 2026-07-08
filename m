Return-Path: <linux-media+bounces-66941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o55qLJe9TWqp9gEAu9opvQ
	(envelope-from <linux-media+bounces-66941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 05:01:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F062D721476
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 05:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=V2jOQb4A;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66941-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66941-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2C673037681
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 03:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC1A2EF67A;
	Wed,  8 Jul 2026 03:01:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673726ADC
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 03:01:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479672; cv=none; b=rOuYky3C/VwnPFuqQ5W4YOpusgZ9aRE4mPbx2+/6DcBt3/ttlPjEQLispOpyaGImgcO7LunKKduq3vpxUUZV3pyOFQad61K1+H3+Q5Yw7bq4SPX3Eklfk5nFkqEu4vkpp4gnfAypra/NYq9i8BeLit+Rl9Etlj18t/0Bn/0FnbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479672; c=relaxed/simple;
	bh=VKG0fHtaz2MoeV9fGd2CuAjRWCPMEW1Vc3Ik3p2CJKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6wyQRONObe/yi1zKyBaFTTNelItGCZo1MnLTgxxAv4pANihFypNGiHaDAygY/wwR5Qgs1MDU69fYq9sW28ORwIuD0zv/sEFQriNYl/myUjJqKVskPc46SwopHPncaowsqQvrgJJvvf6sisxCWTn0fBDYh6wKhNIB63OX6cNNe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2jOQb4A; arc=none smtp.client-ip=209.85.210.170
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845ea8924fdso216635b3a.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 20:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479670; x=1784084470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5Evy01tQDIqVQWukUVL9gcWVIRN5XA4EuJ7AugDxIE=;
        b=V2jOQb4Ahh/G+WVd4uOJZXqMf0/Wz5MiCwnU8w5jmCrmiVoIEFBkwwwkF+ORtolkm4
         A0UuU4YdAfcvJ9WnCpJElTC96co8r1FPUAOOCUkna+tZJdsSDKwLWxzyHTwKsMJdI3VZ
         DmyJ6m+KDBTJIVpZvVP9vdIm4WBe8MNBSzJDzd0agtLXf40wOlyzNFKc3jW5DQojpEUA
         bA8Wcf0uj5shtZeyqgHQhhpf9DwQkpwtBF1Z0Nr6pteLR1oClYQRjLgtIy/HKJPrN+VW
         G2RO1XtqRktJyxvwwOYqmtUpqagz8kPgX4h9nvCM2ByK5Q6v7xIw3pckJgzxC2qAomo4
         16CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479670; x=1784084470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5Evy01tQDIqVQWukUVL9gcWVIRN5XA4EuJ7AugDxIE=;
        b=m1qD/bc2ObRq4AvoM/Y4asFjWPRdMjAHS5GBLHOiEaQ0XUEIuc4EQ4+Qr+PnIjvycH
         Irzl6UFbUSynFdcxajutyQoMwfyoqvfcttF2xKXa1b4Rj+N8QBU59Laog6btyaGdAC55
         ascg+/N9Q4nJunK3BR92cABS82F1aQQVGbm4IwBz9de7cij3Rqb8sHH+OYHIX6e8acuJ
         FBvzZ5AmGlDJEfLIemWZyoaFAGO5xofFy1lLYiPuX0hNN4ZmHROxASdtA5TUKoWhii4t
         hmLfeqRsmzsxGk4cdMd5CJaRGsiOnOaeIzwqgzt1xb/OkW9gVuFuT/x3D49zkGaBK1MP
         NwUw==
X-Forwarded-Encrypted: i=1; AHgh+RoXxkKZneOmkTCTWTFKEqndRb9m2WQ9H7U+LJie1GrrOUkWXzlZ/wyFopDpYlRP0ogfxsRgnXZDj5rmVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySWu+TgwiwYiJS2dbfjABHLh0+R19nHLop59BvV0AgIBWv/3a5
	4gwALfut1ovqSY/Rddy1951mNzz1FiU37ABmdqz8pcYzAxtmWyZYH28E
X-Gm-Gg: AfdE7cm1BghBNLNMN2eTIZjo5MqL9mL0YcnzL+1tbziGByqX/EoRi1vDCwo5Vgr4kPY
	iO5UVQMH7LPQSjVxrqeId6RQhk6DFsOEfTFE8BZDLoCOInZeagXqKWnoTOT9ulh5fzhBWob8hH4
	eDMMP+JhYna+Z7ZoNPQrZ5YomRmij+vuYH94IlJ5f4JWXqHp69L4hD280hNreHEWV19VKxYqNFt
	lNaJnb5tcDOy+b4SGhBXWvPxuxOWUCcgbMzsxMEO7T5yBHc+gVdlLWBCSZvEJ606X/pzuXCAwUJ
	H0aE5lY1P8Xx5gW1i6+stKjlZDCeXdYG87P/8o6o3BOQxPzIr99dGF8hH4yxW+9tbiNpYnAa7j2
	03Np73BN1viaHA6hWbnaJ7GUzDxI8Wal2UWDtNoeeEJrtSnSykusJVfSfYDLgrvy3vkrFB0NxeI
	UTpVgqzVPWNwJEBNCIp39VVxOsjzBBcnIv
X-Received: by 2002:a05:6a00:8c4:b0:848:2f6e:e52f with SMTP id d2e1a72fcca58-84843031caamr789080b3a.67.1783479670311;
        Tue, 07 Jul 2026 20:01:10 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1b95:b995:f60c:5c67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b60571sm6307030b3a.9.2026.07.07.20.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:01:09 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: kamil@wypas.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v4] media: cec: Serialize exclusive follower delivery
Date: Wed,  8 Jul 2026 11:01:02 +0800
Message-ID: <20260708030102.2569926-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	FREEMAIL_CC(0.00)[wypas.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66941-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:kamil@wypas.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F062D721476

cec_receive_notify() reads the exclusive follower pointer without the
adapter lock. Serialize the no-follower check and message delivery
against mode changes and release.

Fixes: 9881fe0ca187 ("[media] cec: add HDMI CEC framework (adapter)")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v4:
- Wrap the commit message to satisfy checkpatch.
- Add Fixes tag.
- Resend as a standalone patch. The previous submission accidentally
  used a batch-generated "[PATCH v3 26/44]" subject.

 drivers/media/cec/core/cec-adap.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index a90cb84a4b4d0..b616ed382c0e7 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -2219,9 +2219,13 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 		 * Unprocessed messages are aborted if userspace isn't doing
 		 * any processing either.
 		 */
+		mutex_lock(&adap->lock);
 		if (!is_broadcast && !is_reply && !adap->follower_cnt &&
-		    !adap->cec_follower && msg->msg[1] != CEC_MSG_FEATURE_ABORT)
+		    !adap->cec_follower && msg->msg[1] != CEC_MSG_FEATURE_ABORT) {
+			mutex_unlock(&adap->lock);
 			return cec_feature_abort(adap, msg);
+		}
+		mutex_unlock(&adap->lock);
 		break;
 	}
 
@@ -2234,10 +2238,12 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 	 * Send to the exclusive follower if there is one, otherwise send
 	 * to all followers.
 	 */
+	mutex_lock(&adap->lock);
 	if (adap->cec_follower)
 		cec_queue_msg_fh(adap->cec_follower, msg);
 	else
 		cec_queue_msg_followers(adap, msg);
+	mutex_unlock(&adap->lock);
 	return 0;
 }
 
-- 
2.51.0


