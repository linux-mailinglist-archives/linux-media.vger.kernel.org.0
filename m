Return-Path: <linux-media+bounces-65536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aKKBKk3CO2pVcQgAu9opvQ
	(envelope-from <linux-media+bounces-65536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:41:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4A6BDB8A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:41:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=BeHMjuH1;
	dkim=pass header.d=mess.org header.s=2020 header.b=Z8JhZ71e;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65536-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65536-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC7BE307FA9C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51C739D3FD;
	Wed, 24 Jun 2026 11:39:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FD377ED2;
	Wed, 24 Jun 2026 11:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301190; cv=none; b=gI2IavHWWjVC1OEMERnYcMxTD/CmcHoksA8skwsYDsRMhidzGfASJtl0UFxakE80e1IkolAEl0oqHe2h2cnAaRfUo/xxV8i6mwGyxmD7I1aD1h2Hh8IrnAROZcCysgI/OUpK9Kj9SiYDRpkPSnE+EBIbAJIHt10TrgEtDWC3MHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301190; c=relaxed/simple;
	bh=MYk4fHbvLorHBrpr4x5XpPxgbJ5pAUDuxK8HB97OLyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIXoSWAU8/H/kxtkHRzutz5w/ujv4x1ykaEBtDfHQhD8YlC14zdBoAieOBOzSkUHfljRsyHyB8V7dDLE4CeM1EqG3HiJmRDMQ/E0zIydr4QD6uYwWptg3Mipo3srDrP+7zt2qGqYiYpXHgeq0EthnTq2P8+e1bRzJTmklDa5xX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BeHMjuH1; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Z8JhZ71e; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301181; bh=MYk4fHbvLorHBrpr4x5XpPxgbJ5pAUDuxK8HB97OLyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BeHMjuH1oJ2MwzpLK60C6xG4nnyHpgWKQoggW51Uf/DNRhosmMRxvnU2+DrDTw8QM
	 6hFrL9ELgCc2r7widxPb5lJ9bSpjOoYM7QBjB56uoomny+gCziI2lhOoh2mKypHggI
	 1B+YckcKwCQKg2pXNRTDMIe8FrJKiYli7hYtefXz/gEUxocKcf+vgMcG5Yz2NuqvEx
	 5YRrwe/3Q2Tl2BAglJW9eOr1T0W+O+IT7xiUprOT6h97pjKKOOBGPPrUwbRI7yQHzv
	 JwRBiG+hoFxepWnWh7sFcl4SaDn64fayj3Si1iVFnO8TQVMROa498dBHKY43jJX30F
	 qLg8pCr/xVgrQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 9EC7042536; Wed, 24 Jun 2026 12:39:41 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301180; bh=MYk4fHbvLorHBrpr4x5XpPxgbJ5pAUDuxK8HB97OLyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8JhZ71ezghf90sk5lecbWgu/86PT/yQZjrVxQZOUDixBenZ9AC8dUkJZU1wu4iCq
	 tcn63SAv5rd0m60XN0N8dSzInQ90KLs1hBowNhXLlBqFtbfgHDsYtzM6ldyxBvd+u8
	 6/5rbvGZE7mU9yWJWbFH3Ichej50ah18Oeb/y4MsUwMGOx4F/BLvOlQXzvOOjIimwy
	 2AJQhm/ZD4vWjmGYsAM0L1aPmHujyewO5taByqZOU/LH/RJTYf090dX4nfVpQjJBYk
	 6Uc+He5tT8vzZV7vEl6di9h7qk9m99BUwjWUsz4EoAAtOlURpxd9fRNvQNlqOSQ9o4
	 zLcuR1eKSfc6w==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 7378F42528;
	Wed, 24 Jun 2026 12:39:40 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
Date: Wed, 24 Jun 2026 12:39:19 +0100
Message-ID: <40ef63edc7535e346fd992bb15db04acf77da1f8.1782300922.git.sean@mess.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65536-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:jarod@redhat.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mess.org:dkim,mess.org:email,mess.org:mid,mess.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DE4A6BDB8A

Since commit af86ce79f020 ("[media] remove the old RC_MAP_HAUPPAUGE_NEW
RC map"), the RC_MAP_HAUPPAUGE_NEW define is no longer used.

Fixes: af86ce79f020 ("[media] remove the old RC_MAP_HAUPPAUGE_NEW RC map")
Signed-off-by: Sean Young <sean@mess.org>
---
 include/media/rc-map.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 950d702aee3b..d95ed3e96de2 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -262,7 +262,6 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_GENIUS_TVGO_A11MCE        "rc-genius-tvgo-a11mce"
 #define RC_MAP_GOTVIEW7135               "rc-gotview7135"
 #define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
-#define RC_MAP_HAUPPAUGE_NEW             "rc-hauppauge"
 #define RC_MAP_HISI_POPLAR               "rc-hisi-poplar"
 #define RC_MAP_HISI_TV_DEMO              "rc-hisi-tv-demo"
 #define RC_MAP_IMON_MCE                  "rc-imon-mce"
-- 
2.54.0


