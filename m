Return-Path: <linux-media+bounces-65535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I3IbGQrCO2pDcQgAu9opvQ
	(envelope-from <linux-media+bounces-65535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:39:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D402C6BDB6C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:39:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b="LO/oQ7cm";
	dkim=pass header.d=mess.org header.s=2020 header.b=PutdFb6N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65535-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65535-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B967C301C900
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474C8391E44;
	Wed, 24 Jun 2026 11:39:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712BC364953;
	Wed, 24 Jun 2026 11:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301189; cv=none; b=SajZWNf7RaKm2amkJWB+fJ5YNB5CF6v5Oi/UcdnIaU/1NjayM9pJFB+1xvWvKxRYnMLDsDizvYs6GtggYVKzRGMaGbKQd7apAcP8uApEOkoQLJLQ9dw2Zg1FVNSZdFnQJhi0kSqW+U/KD2rGVg0kJMxzXH6mniK2JLX3frAwpIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301189; c=relaxed/simple;
	bh=naeXkC6ZiEfNY9VotF5Ab8qSw9RmIj0JSxCpcDWtMyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGZHSqnNSMbJ6aTTDnHx+XtV6b0U2Xd5F1TEfesm0gLskcraspxQmNZtp7dj6Mv0DiUpodfR5ZnmD8ewgc9uBMD/5f7gkfbNjPm6O1CZatdi7GKKNv5IaRukJvzUtmKbmVXr9GoGp1nlHacRd2GmfxsQU0K8bPouU4NjcZM/yQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=LO/oQ7cm; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=PutdFb6N; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301180; bh=naeXkC6ZiEfNY9VotF5Ab8qSw9RmIj0JSxCpcDWtMyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LO/oQ7cmzpLzfaIPSRpuc8QyQ6qWLmIGV32Qcu0NhJXOHjgBQUri1HNv+t4Ey58hZ
	 3Um4Di4dOMLLLgq7HBbAyFpUwmSmiwWRl5V6h+mei4BDqIJPG8gRpFgDKG9Q6mpUcR
	 pzmyK7TAFaKxNtVUBnDl0FHdX0RH0oIHnFWo12p1TiWmuow0s+t1Zt/E+dbrYmr4DN
	 oB8RZE9IUsbbbopS6NjfhifZXYxA07yrv5haUDx8z0jYv3sWumf9shtVnrbHQvkp/f
	 6l+d8VROEuS5eu2AP4S5YV2D97CAvb6Nqh75ReTFOqwrlXGdTPRmdzOXau1pKjpml3
	 art37ZUp3cPPA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 5613341CD1; Wed, 24 Jun 2026 12:39:40 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301179; bh=naeXkC6ZiEfNY9VotF5Ab8qSw9RmIj0JSxCpcDWtMyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PutdFb6N+fcl+pJgkwgMFoDUZEs06sqSkZag4Cvf6Nb1cuinAWKwIvVSo5R1HCsux
	 wqA//QOc1qH5Y95im6CwCu+s1mwU3B5fkcoiRiyN218wNp4PRr15oi5Z3BzXBUUywF
	 AhI31gNMc/9QK0QiTF2AlHBI99ypPcxVSs4wxExri5zGl0HGBTtPABc1Nf3u1I9ysJ
	 3LWrsEJt/1pBNqQxIYtkfqoqoWG0DysE7U4+ihREeiamNmx1bJmeALgQa51mppeM9+
	 uDlGxMy1cxLdKJ0Cy1QC3xz8iI35cpgVBfBiwh3Lqb174x93JHjp6tu5bQJ1Yenay+
	 fkCSKjU0evJZQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6660E41567;
	Wed, 24 Jun 2026 12:39:39 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
Date: Wed, 24 Jun 2026 12:39:17 +0100
Message-ID: <376b2d69de66ad1acd8459ceef5e94b5f2c78d5c.1782300922.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782300922.git.sean@mess.org>
References: <cover.1782300922.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65535-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:jarod@redhat.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mess.org:dkim,mess.org:email,mess.org:mid,mess.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D402C6BDB6C

Since commit 206241069ecf ("[media] rc/keymaps: Remove the obsolete
rc-rc5-tv keymap"), the rc-rc5-tv keymap is no longer in the tree.

Fixes: 206241069ecf ("[media] rc/keymaps: Remove the obsolete rc-rc5-tv keymap")
Signed-off-by: Sean Young <sean@mess.org>
---
 include/media/rc-map.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index d90e4611b066..950d702aee3b 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -309,7 +309,6 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_PROTEUS_2309              "rc-proteus-2309"
 #define RC_MAP_PURPLETV                  "rc-purpletv"
 #define RC_MAP_PV951                     "rc-pv951"
-#define RC_MAP_RC5_TV                    "rc-rc5-tv"
 #define RC_MAP_RC6_MCE                   "rc-rc6-mce"
 #define RC_MAP_REAL_AUDIO_220_32_KEYS    "rc-real-audio-220-32-keys"
 #define RC_MAP_REDDO                     "rc-reddo"
-- 
2.54.0


