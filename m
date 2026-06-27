Return-Path: <linux-media+bounces-65806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YyjhH13eP2qeZwkAu9opvQ
	(envelope-from <linux-media+bounces-65806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 16:29:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE666D216D
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 16:29:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=FZf7mb26;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65806-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65806-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE697301C95A
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 14:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314483B14CC;
	Sat, 27 Jun 2026 14:29:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035138886D;
	Sat, 27 Jun 2026 14:29:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570586; cv=none; b=WouejFMucDSn/n7dm5UBRZJWKXRNse1WIbQWnFgH+znHl9VotWsQH+SciLa+x3bQb45HW2GOxbdFGvSmj/R1zKdZ+S4At8mJwhoNcaMx7lHNvYh7FADQOcdfqNBsyOuxDcTK0kmBtSmUHacV9FPeGQLiNX/pn1d5CHwDh8eMsok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570586; c=relaxed/simple;
	bh=CbFG+wA6nI2eKrstUB4THGj4xzz+4zGpdKDblbL3HWU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uN5Uf5M1Zcxr5zV74Hken64vUT0bXLxUEb+uLC2CV6NRKde2243ZKdtWOo5ebmoYzceSsXoh64FkssqTI1LRTm4GLxENewZh2EOXkGQ9pJVbAZl2efpmb/565/aD1bqzRe+j153WQsqrJzpYqLyNdaG6BI5+NmLnnSFt0d5GO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FZf7mb26; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8579756D;
	Sat, 27 Jun 2026 16:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782570541;
	bh=CbFG+wA6nI2eKrstUB4THGj4xzz+4zGpdKDblbL3HWU=;
	h=From:Subject:Date:To:Cc:From;
	b=FZf7mb26P7/obNSxWt9qasgnZ9JqMj7uptZWGajliHGEDheELKUPSClO78vTNB9n6
	 GoZxJOddJ6YRXag75/NiLrhIr4QloLH5dg/gcaTbG4evJkqq1LQGcpMvqZtzOXPSwH
	 e2nefZVKsi+aHipeeF/7d1H+dVQaS/Y3Mz53QGD4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v3 0/4] media: mali-c55: Add support for CCM and Gamma
Date: Sat, 27 Jun 2026 16:29:12 +0200
Message-Id: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjeP2oC/4WP0WrDMAxFfyX4eRqOvThxnvYfow+yrbSGOulsL
 7SU/vvU5HFjAyF0BTr36i4K5UhFjM1dZFpjicvMQr80wp9wPhLEwFooqYw0rYGE5wi+68D7BEd
 MCcFLhTJMnZ3sIPjwkmmK1w36cWB9iqUu+bZ5rO1z+ydubUFC279NxBUI9XvkXpbZLZjDq1+Se
 FJX9T9JMUlOVpNF2wU7/EJ67IEzfX7x83VPLRKVgtvzY7M7qB7oWmku0Z0JSsVaYNXM185I6Zw
 KbnA/+Ux3WAh4TrGOjTTemaHHrtWKzR/f/FNvhIEBAAA=
X-Change-ID: 20260616-mali-c55-ccm-gamma-c02a0df59f98
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=CbFG+wA6nI2eKrstUB4THGj4xzz+4zGpdKDblbL3HWU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP95UCwVQA29qV3KrhVRCghNqIuUbgmTGn1Slb
 2sP1nDtRg6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/eVAAKCRByNAaPFqFW
 PM04D/0fNoiKlFrHfgKpR1hXrK1+9eDF2Bfp5hRIvNs+cBMeNvwVPGGdQ1cesrMBazT1pePdbGF
 BjOVORJ5Kp3C5VNAR5cCJNkQDhjibXgQzlvjms4FRBVOq07pPBAD7ch+RhVnl9sSW/0CCc6EROB
 a2uI7cyAXp3lHqJzRIjPYZbPZiecOL8YeM3lDIp2i07xbDq2QXZvz6LOrgxEqCkGJCx5Uf6ULXb
 xk/CZXQJSa/21pddh6NMbMTgJcN9YQTn5R6Ql4KQaCIQpVCwV/XhKj2RM1jISzVy87b/x3VIay0
 netwNx31hj8s5u1d4b7KQ4Dp3WXwZVu1bsEQN4Uc7EfFdgU02t3PHOdoJ8A/K8QQUvnpR4dIxZJ
 ZL9pET874Vqq3RYqEuxpO/mjNUZpyXviDavB/gP0Hf8iB/nGhNKfe2N8hjUyqeU7rVxYPzl/UZr
 tCBbIED3fj5J8/dRfA/4ppqGHa3nPUqRhHGdEGj9cK4h436VUhJiNbZLvYvx/iBcfDI7d+0f4zi
 5J3qkFUX/i1LUMAodjo2z9zE81DMr1mHrjTBEP+Ue8NOsNgauWJN1lyhynKG9eaQSgrmDiJhOhZ
 NrteznzZ+sBaBIMzzPJq+iZsabaZ8fNva8cvO/awGiDnS28QRM2dstkyj4BCxtxoUJjYETiYcqp
 0pp7+DLZsdeN1ZQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-65806-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAE666D216D

Add support for Ccm and Gamma to the Mali-C55 ISP by defining the
corresponding blocks in the uAPI and implementing their handling in
the driver.

v3 implements validation of CCM and Gamma parameters using the new
block_validate() callback from v4l2-isp.

I kept the two patches unsquashed, to discuss if it is worth validating
the fields or we should rely on masking before writing to registers.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v3:
- Address review comments from Linus and Vincenzo (changelog per patch)
- Rebase on top of
  "[PATCH v3 0/6] media: v4l2-isp: Add support for extensible statistics"
  https://patchwork.linuxtv.org/project/linux-media/list/?series=26929
  to perform per-block validation
- Add 2 patches for validating CCM and Gamma parameters
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com

Changes in v2:
- remove unused 'rgb_enable' in gamma uapi
- address checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com

---
Jacopo Mondi (4):
      media: mali-c55: Add support for CCM
      media: mali-c55: Implement CCM block validation
      media: mali-c55: Add support for RGB Gamma
      media: mali-c55: Implement Gamma block validation

 .../media/platform/arm/mali-c55/mali-c55-params.c  | 197 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  13 +-
 include/uapi/linux/media/arm/mali-c55-config.h     |  84 ++++++++-
 3 files changed, 289 insertions(+), 5 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260616-mali-c55-ccm-gamma-c02a0df59f98
prerequisite-message-id: 20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com
prerequisite-patch-id: 2939dff7f477209138725aa8d86318d6580f4ea3
prerequisite-patch-id: f77370d8fc480b2e972a773f7d56f33ff1995eef
prerequisite-patch-id: bd3b231bc86129d25fca4ae34408a61db43bf883
prerequisite-patch-id: e44f05055f4bc9dc93ae6bd25af80c64f5ce627a
prerequisite-patch-id: a5f27213eba078f7ed5420d90df3ecd45151219e
prerequisite-patch-id: 9b2fbe610fb17689030c6da6c529f7db91b86d9c

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


