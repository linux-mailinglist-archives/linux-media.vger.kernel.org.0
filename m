Return-Path: <linux-media+bounces-65622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8b6PLOLnPGrCuAgAu9opvQ
	(envelope-from <linux-media+bounces-65622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:33:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 703D56C3D72
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:33:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D9Uy7fNM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65622-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65622-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCB7E303B660
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B882E380FEB;
	Thu, 25 Jun 2026 08:33:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8E7375F9E
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 08:33:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376400; cv=none; b=k8yEgLBJJmOBMby9hf1e6OgGwxjQDZ2DDgtRzfNvUlnl7eoQFPYaU3zgB8cIil24EhygskHNbUcTChrAumXcUX/V6yyh85+3yvKUIfA97juL/630cvA3rILSt5gOPZRpz5Tw1vgT9T9m98KMBxVR2dVcrqX2Lsot4ElUS8339LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376400; c=relaxed/simple;
	bh=OhJBIZtPSl37iTCor/8pHea1pmiMgmwQ3W0MWlsm5UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDsipWV4MjSCydHcCgTkZv3cntGV/Iu7MFuMKSOCoaxBpBM8Yr0XbxdNGNGxVnSrlukBYg60t7A9jECHGwxd1/HJFMyCTOJqCFq4dXQc42pKreuyxQ6U33jxyiIbdk9IHk0fJzhb67t1Z5dCMaXc9Z0r+UuRw0ddaKrmDnawVVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9Uy7fNM; arc=none smtp.client-ip=209.85.208.170
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39ad4327810so144241fa.2
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376397; x=1782981197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=D9Uy7fNMFgSZ75zj7hu/L+1tDOnFwbt/PcKsjfseWVp2j8/vpA39If3IFgnT4G6NFI
         zo3+L7+xyUSBQmVUnXPuUYrz3zWikOCWL+o7GV83AbAlKd2Hn1go0c6Ko7LJ9C/kXmoy
         LcdUt1+EmRg1FkWDBXH8bwPJVHQEDJ049uD2Mqg2/fOM94Ppk2Znl5+L+2CubPfKv/FD
         Mln59zJZeJoBH6AYxGDnEKeRHObKyv3w8ycU9ElMS/WCRrUg4u8h4/2tdxJzH42h8xFe
         LRrffcy/SK7Ibl2tn1QplfyBlPwWrtUGjZ628YxT9SU7n+Jq/xy1UqpnPy09rNQJUnKr
         aN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376397; x=1782981197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=cw+RCRhX7Bp63KwqC9f9EEi0g5XJNDQf9UNM26KIEH4UeoKgRTxu3TQ5tXO9SsfSaG
         qhhVE5RaBwkNOhuchJDWQUnC4m/uZFuiFjh+gp02Ocs8tr90G+TmiZJlyiMRXpBMUwi0
         qBRR3L8hpypavcsms9cRvGx0AKwsyu3qLoyIf6RmufEE2iMEFZfzXFHJPZdg0bIZ3of+
         02YbpSi9xclDqkZojEqxprgTLyLhfW+3snG3MPe/Zdw7TdIc4gUthW+k5Eslrrov9ksY
         FRMpTRWW8D2zQ1DiT9YWv0Fa9nPhALAuuTecRkzy0Bb5nWtUsnRIg0YLG7BfATrfpNIu
         hRLg==
X-Gm-Message-State: AOJu0Yy+b3mfhkopw+B8j9KA0tN4H5Ya2yLk+d0KBImhUbY3sKvF+N+f
	7qE8in5F1ZTgAG+WHBB49x0FClDzDzheYEn7DQqkS18AdPCrMjRaQ+yW
X-Gm-Gg: AfdE7cmCmjT+FzHEoHlc+oMxWVshc+GKQI7/5t3BZiA2mGcN68/vNQ8TqXOGkUsT7r4
	GnPQexs5AKpEvH6SmOXydOJoH7JWSj3gWR+5Qf82kfWoTmXX/0/ffNuqMGuoNBfNVhc5pT7JYsc
	o2FekF22DuNJW717Lnl3PzzpQBP/jkqvnkuLasFbavHsALRK1G1cRk0Ih8V9heNHY4zLKUlOTjJ
	uC9ccLVeo+Qx9Jz+OJFWud0I2N5314p1GLG/eviTUaeK566SwVDyn09gYzKbZ3U31NhSIvp7YO8
	t+lkyNU90Bd9m+no+7VEnbiTnPjH8EyRHlDTwT+iz4OpXKovQtxDGw6wenelnReNpBQU+t4kEIX
	7QsH/3kMmEoLcBbEIV/8ezfhCqnf60nelfPrl4h5BOlKqehvIkkZjH14cnmJUmH7cg9LhrM8sk+
	txixZIMG0I6cJ6QXj3JyK/hhi47ME5jq0iww==
X-Received: by 2002:a05:651c:893:b0:399:83a4:4f2c with SMTP id 38308e7fff4ca-39acb635f41mr4003281fa.18.1782376397041;
        Thu, 25 Jun 2026 01:33:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b143fsm40327521fa.39.2026.06.25.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:33:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND] staging: media: tegra-video: vi: improve VI graph building logic
Date: Thu, 25 Jun 2026 11:33:01 +0300
Message-ID: <20260625083302.71651-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65622-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:gregkh@linuxfoundation.org,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,bootlin.com,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 703D56C3D72

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

---
Changes in v2:
- fixed use of NULL fw pointers in debug prints
---

Svyatoslav Ryhel (1):
  staging: media: tegra-video: vi: Improve media graph building logic

 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

-- 
2.51.0


