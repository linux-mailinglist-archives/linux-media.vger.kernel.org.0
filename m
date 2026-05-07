Return-Path: <linux-media+bounces-60701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIrhEnX3+2l9JQAAu9opvQ
	(envelope-from <linux-media+bounces-60701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 04:22:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3534E23D8
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 04:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 711E3300BBAD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 02:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7CA29D29F;
	Thu,  7 May 2026 02:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXL7iKDB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D81F3BA2
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120560; cv=none; b=WBJaaHFKatYt9YjFlNAnd8NMdSTaAmry6NYV0bVbzjEZFFlNRVCssEct1YeicIl9A/2ubBSu/IHzHMgfTZNlDZXmoC7AoRwoI3qtbULS4fF4Y4pR19bON81L267f+riIAss3YUl+PFCIooXP1+/hDT0Ds2V5L4FfpnGi/275jS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120560; c=relaxed/simple;
	bh=8nxz7b6pzvptsxQavYhry6DOMizBSXb5xpuCPsJbSSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e6GxPu0HbCdqdZAikTAylCIhejWudrB6FmIhiwdr29uhCyOTqsgEHg+xX1gwvCYUZeid4D3VGffhpdjVgqK03sEhe7tEnQOXahyWrByaapfBgf25OOwPzoWn+OV7ZKMZ+Lj3xmzej6QWky6fEUkDpEiatQTh/s34NXSDtWFYifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXL7iKDB; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2f68f3b075fso693501eec.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 19:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778120558; x=1778725358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hU7xl+fV6UprDQvL7p9kbzsKjs2HsXfsZSPYvXWsgDY=;
        b=IXL7iKDB0VAln7oWx9BLx6gCL21FmnOvj7eQR6XPlj3nyBHQuwSe+52UA466qVx1vQ
         wLetNoPHSaA30Mc9W4zmK5nItVtIKTbevmgGUkZjJRpXb+RxWoqegMg/694FiClchc6K
         gywBiBoFbwTd41QaiQpmPjane4TLda0B/W0M3ATCCyhq89juDsGkzV+aVcJSOom5lV1e
         yUyP05FV0RP2TW/bjLK7WFjx1QschSK+2lq1R7D8GniksQA1ABI+n3lhnAOzlFeL4E1s
         036SoEG+S494w46wTb7b0WFUyjCcMI5xzCYmptNcGPjSYutvP6915FKSrhXMlZ+Zv51J
         2Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778120558; x=1778725358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU7xl+fV6UprDQvL7p9kbzsKjs2HsXfsZSPYvXWsgDY=;
        b=PN3zt8+7lrSMktQiX08w7PExt51xn56q7wp6WxrY2oyf2/IJwsYsThUkeQWMpMjFaX
         lElL9cx2QmjQds3BbCvm9RZPDFGyoh3IPxaiOoCfVim/Hx3+skx4s6em2SDdGwKND+QK
         u3VXz8QCxNZBQSqO30TMbBMgedvq3nyVCh/RiV81Yef1O7nKbAoHxkTaZ1oRjNn5XmnI
         ICJTCfYyj9dpFjDpPr34FX/RKgTikebSZvP0WYUp2g8yyaXmBECelJ+87jZT6dOW1Mk8
         sWjkVhERg5sJ+eA1nm/uGr/oTHQilGOP7D+/ThDdGenXgzKGEx3k4LCAbcjrU7rY8Sdt
         FM4w==
X-Forwarded-Encrypted: i=1; AFNElJ+3WvD1VeXSikIOMGjXByYCB3roZwWpcIC5YI1MwX562OIaTPsqU1SzvSM0DGR26AKDOnQU/sGHpop2qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK2GzGu59YAjmjSEza3fjMT2i/36H4gueVLzEMWo1TnY0/zJm4
	wEE8KMngAH5Qt6x9ZJKkHpoJQ5kSsoqeDdDqV+T8RPxqCdTD1bnevKGH
X-Gm-Gg: AeBDievMTLBmiFlucYfF2UJhsME2w1f6VU4Waqc+6w4RPy+9qQyPh7JUomWqNCg/E3E
	9E0l1uapYwZpcZsIqhe5f/JO1zSFEldMgxu8NBBuJQNdYaZM2UYh5dThz9qUcq5x3SYXo4xNb9m
	Ld5YBm5YhfR2HfSR20IiAiHFiLphRBAa7R1I1lPA4rZNAjz5xvfXHWxN7wnD8yd2toqcX9Ad+LN
	OAqRUx0lymlTBEYDebsz2qB+GJ81keAWSACBPZd5CDotCcvyUm9PBjpfWfKwNRq3YHMV3bGlgmf
	AaZ44oEVm7lWuaIlkQk0thNNz4ebKkkfzla9sdlQiJ8o+5J8YcaNx/P1BBJ8qOqww7H9lvmz3GX
	ZWCwpv5BWZr7diXUAVK7sRil7k0QQ4ZOFkLIhUx3LyOUgGk04EuFXCPQb7Z8nmXJhMq3779O7+c
	+grrb6Odwzd2bYl62xAU6N+608cA9rUoaXCxp1k1cF5BhCB2L+ExhZSlWzUw2WnjAZxwg4lpnoh
	fKJ
X-Received: by 2002:a05:7300:7492:b0:2c5:ed1b:ca9 with SMTP id 5a478bee46e88-2f548e95b2fmr3359388eec.1.1778120557733;
        Wed, 06 May 2026 19:22:37 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6658192eec.26.2026.05.06.19.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:22:37 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	digetx@gmail.com,
	hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Thu,  7 May 2026 02:22:12 +0000
Message-Id: <20260507022213.29290-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC3534E23D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,linaro.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60701-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Changes in v3:
- Add Fixes tag and Cc: stable@vger.kernel.org as suggested by Luca Ceresoli.
- Add Reviewed-by: Luca Ceresoli.

Changes in v2:
- Follow Hans Verkuil's suggestion to use WARN_ON_ONCE()
  and return the first available format (index 0) as a safe fallback.

Hungyu Lin (1):
  media: tegra-video: vi: fix invalid u32 return value in format lookup

 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


