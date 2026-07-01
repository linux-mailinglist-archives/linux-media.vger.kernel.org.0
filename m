Return-Path: <linux-media+bounces-66200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ucqtJgf+RGqu4goAu9opvQ
	(envelope-from <linux-media+bounces-66200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:46:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB706ECF3B
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:46:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="nyL+5NF/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66200-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66200-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E85D302EEB1
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A74B480DD3;
	Wed,  1 Jul 2026 11:45:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C5F480977
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 11:45:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906345; cv=none; b=fqAQH4MZgPE4nzTde467DO+2Gylqc4gNkfdw2YXIYz7Wzeq/cDS5NkvCKB9HbksY48X7aRhcIsao8SK6eZrwycfQ7SEu879Yuvb6MpVglxAtbX+5y3lbsd85pmwhKaKtZ5GvVrG/XHPewBQV51E9C/lspJiSZQP8qmRVqZSoc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906345; c=relaxed/simple;
	bh=Z4IOO7ZsfxNZwdgMwUFeB0c004Jd0L5cGT8SVFWvo5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yh6wKNYFAl6cfmQotBjxkO7OLx5Ydeun2MnNCA7tZKJQryG8GX3vP8g/V8NWWvyqjOybfOf/caWMtuna36psjYi4MPWH0RXAgVmbwAdCTg5xlboKiuByjFcDPU3fFa5vF0PLMweCDOGY/nIDmLDbuBboMdQQZ3xtYUweYluOBtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyL+5NF/; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37d55e8d3e3so318987a91.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782906344; x=1783511144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkrp/nl+DXAxDEgj38SKWxdi9ULvDXZAIWkhJFmjLHw=;
        b=nyL+5NF/qVBw5mp8Xh9MoxiVyqwTqJ/PXfP7zN+IIIbtwxOMI2e/zh4Dc2psecWaQH
         yV7UOhotKf95nnVIT+k6i2piAQizaudPiAF81XQtQr08rQ/rR/hUzQ3DJa/HpXKeoLFG
         BvDWMwuSrFQgVKDm7ZrxfV37xJUFYyvxWWTKV4Syxd4QnbzN6rB9oJP6WFDSjpuNRarj
         gsDeHmmxCi+evcNZcqxmN82qNPIHyZm65QzzXsff3TtntI7p2chdQiCHhmY9XDc5NxvC
         GlmcpUwMQhck7v1GB1OHEP98PvevffpE5UElYbMnC64i1z/IV7kHWTj9P/56210rtozV
         0UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906344; x=1783511144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkrp/nl+DXAxDEgj38SKWxdi9ULvDXZAIWkhJFmjLHw=;
        b=NIyD1ZVtO1YaLUfGuKwXEJUgjQaA0yZQRaz4HUugtG+NXHX24dKI45/8eGJaaJjKci
         sKo81Zb0UcLBDUBYYW9ydsVOvzJOXsprmaP/aScB5nJ0tbwkm/l8fzdq24qyGqlB1+dV
         W/5eP4CxHG9dSYPFt5NJ+kYB+JgpUzwUtxNx1lUMoAKC7nS+nN6CMBYA53PKkMQyF968
         lSMVAsmdzbNA6xDY3RbijCrH07K9dYVTv0EWyyXXlwowUxbWJkJtySwtsuwHCORG97G8
         zmKiYHg0+SanEl27AELP9digq/kXncTHybKB9X6/th4z4fJ+zR+daI1/NCq3DbR79UjD
         upYA==
X-Gm-Message-State: AOJu0YxxL22qTMWHN/0Vkk9WfeB+m7z035bwg/a30/pRbsVhLOeWf2dG
	Mhw47mtafZJ/WNB2xyIXvLa6umJzJmnRR8R5ILObyjRfiQdhjTx+eoI1
X-Gm-Gg: AfdE7clatYnAme0AVjdvyPjO9FI+FkbAZDp8aRkj0YJTMmPKcGuE19Zyj/ut3kZpBF4
	ZAz63DCQ6Pzy2tzKPzfYdEe8x17sXIsm3lgw31ozF84Dhm/RsW6REWXfsXf6V88X/RDQtPyujN3
	hGgS+W+NeGQf+ERAvbNDDYIrBtzZbMvRjj9tsat+NSaeNMphkdtlEryIl1JR8WPWNgxXo71zI26
	pf+9GTuUU+Zl7TTzVa3EPy5mYUnNTD1Irt3wHO5EsgI4ZcuWSc7/6AYH8FQ4hvn9Z/dFOtz4lfX
	vUHU5jxlCjJrKx86xbI/HnDzNEsz/Ycz/zq+QIYvbJ8JwcOFXcGhMStKLf18obZwXyJryM+bSwK
	Ubyiu/JFz4/sXzjYpMPetO3XSKT66EtuUjkcQ6CoKzoA2yQdm1fmawjzc4fSLiMQYcTx3/Bkj2e
	pq45vrQjcvQ55aAVXDnfYv3QFHFDSCxn2ECYtS2AR+Fx/XMN77bTky5GSo21DdZwEQvyB7XnBLS
	7z5HA==
X-Received: by 2002:a17:90b:1dcc:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-380aa1d454cmr1081753a91.12.1782906343600;
        Wed, 01 Jul 2026 04:45:43 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095e830ddsm1710645a91.13.2026.07.01.04.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:45:42 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: s2255: bound JPEG frame size before copying into the buffer
Date: Wed,  1 Jul 2026 20:45:36 +0900
Message-ID: <20260701114536.1045484-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66200-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sammiee5311@gmail.com,m:stable@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sammiee5311@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sammiee5311@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CB706ECF3B

s2255_fillbuff() memcpy()s vc->jpg_size bytes of a captured JPEG/MJPEG
frame into the vb2 plane.  vc->jpg_size is taken verbatim from the
S2255_MARKER_FRAME header the device sends (pdword[4] in save_frame())
and, unlike the frame payload length just above it, is never bounded:

	payload = le32_to_cpu(pdword[3]);
	if (payload > vc->req_image_size)	/* payload is checked ... */
		return -EINVAL;
	vc->pkt_size = payload;
	vc->jpg_size = le32_to_cpu(pdword[4]);	/* ... jpg_size is not */

A malicious or malfunctioning device can therefore report a jpg_size
larger than the destination vb2 plane, and the memcpy() writes past it.
jpg_size is a signed int, so a value with the top bit set also turns
into a huge length.

Reject a frame whose jpg_size is negative or exceeds the plane size
before copying it.

Fixes: 38f993ad8b1f ("V4L/DVB (8125): This driver adds support for the Sensoray 2255 devices.")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/media/usb/s2255/s2255drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 0b8182edf8e4..b34061ffe662 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -617,6 +617,12 @@ static void s2255_fillbuff(struct s2255_vc *vc,
 			break;
 		case V4L2_PIX_FMT_JPEG:
 		case V4L2_PIX_FMT_MJPEG:
+			if (jpgsize < 0 ||
+			    jpgsize > vb2_plane_size(&buf->vb.vb2_buf, 0)) {
+				dprintk(dev, 1, "bad JPEG frame size %d\n",
+					jpgsize);
+				break;
+			}
 			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, jpgsize);
 			memcpy(vbuf, tmpbuf, jpgsize);
 			break;
-- 
2.43.0


