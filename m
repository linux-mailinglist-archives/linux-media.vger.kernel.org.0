Return-Path: <linux-media+bounces-57296-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K/GG5q8xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57296-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:21:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9C3483A8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E23C230FF9E6
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC8C3F23A2;
	Fri, 27 Mar 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IpRr5tol"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5233EE1F3;
	Fri, 27 Mar 2026 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631452; cv=none; b=hvKCfcCGg9Dm484TdS6ukBACE/mZOb2JAaKP8KNnbxMCScWuWTeD2GFfBZ9+wTA4VpHiGJGN77UlY6GwHX2cgzrN1+QT4fRUueHFyUzJbPhnPvghepADuT/+HUV0VT88JSnu1sObaFraRdwWEOQ2FGT33f0Lv9ZuM4m8uorQaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631452; c=relaxed/simple;
	bh=ejjY5o1THUXOBdpXj5+JhlFmYEiZ/OKeAoYKCJGVMOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZJ8UMKd2yTX9KGSAhM+NdhTg8VlmM1VXyRVNZKg1o7gV08J4Uep9cSAmyHiHbvsfOy/ycV2oLm/rqzsElal86UIj26O+MNCVztWN9TQHzxcFlQKsgsJiePfUyztg8ManK6aP05BH0S3ZwwfOnCog2fk+q2FPNC7zmcKbAu3Kg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IpRr5tol; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C0A53054;
	Fri, 27 Mar 2026 18:09:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631360;
	bh=ejjY5o1THUXOBdpXj5+JhlFmYEiZ/OKeAoYKCJGVMOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IpRr5tolisKmPnH2gZXNcxW4+2xxqeeZRn9QzK7hSUnzMjITViY6kuKvhm6V3wEJD
	 MhdMS+xBTV5OHN44/dxk7sZLWhwsOgjxJ8LTtqzVtxljGVI6rEf6/kpnS4B2byVVs/
	 KZnqU2vz/MMR5PBKGMKKu6VumVU84BwJIXAp75tU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:12 +0100
Subject: [PATCH 07/14] media: rzg2l-cru: Remove wrong locking comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-7-3b7d0430f538@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Zb+8YHkGzFZu7MeDtgqkgA+gLo6zhgam9aT6SMy13jA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroKppn8BIOCxux9kNo5ftNZgqJDnWxgVRmah
 pbMS29IDhuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CgAKCRByNAaPFqFW
 PGivD/4zoGv8B1Lm5yV/7Ekhbo354c1WNiz8NE2O7u8tQVlLuOofJgS+HCEDxCFhaOnZOdF3i4K
 nNwgf4B21znsSHQkRDyV4w9e0vsBSXCPkE7gGGflgwpdazNivl5Ph25/iWLPUi/kzcE6tA/JHOi
 8+FJ9h8sFLadWT4m9ITkakq8ztChCKjWpxdThpGr7hF6avitUV3Q68Vuihl9Soe8SnZI7hsuKYG
 VdiIuxYaNnklPCs5xpV4tzJ7GQcE2e9jBZZGn3HfvB+FH2wHy4omXzzcq3Hn2hkAEGtMtyhjaV4
 wstNZUh5RD+0vlF7R9Ov9hpfktuzfMjh2jEvNPqC2WsKpbwzwXw9t/1694g7oti1sbDiuqhf9SC
 wMcm0+6Jgm1sgTHEHW2miZAueuasK83tsAhXfPcxBja4+ak8yVIBISI8w8RJ5Logde32s4CeZ6M
 fDMhCT8yud9fKEeDCduT4iwS8nYQuoMTBERJwsoqgP6F9Nr2y2rA0RNqn2Hb9BODN7U3/r3+GYF
 qjREZHKiV1rmg+u08qDs8l+8s6w3n9R2oWYR3JzeW9PdwGXqpfiO6PplPIdegJSXckWW9Q3J6tS
 dGYrR0Neo2CyTIWvmqFLC9e/sUFfHK928pAmtSFFwnvR9y3SSDg3oFPu1u986mKUQprbhjBd1Qn
 aaH6OAO46UtzMNA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57296-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: E4B9C3483A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

A function documented as "need to hold qlock before calling" actually
takes the lock itself.

Drop the comment and prepare to replace it with proper annotations where
appropriate.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 2e94788c3a13..27079c17a54c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -106,7 +106,6 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
 	 __rzg2l_cru_read_constant(cru, offset) : \
 	 __rzg2l_cru_read(cru, offset))
 
-/* Need to hold qlock before calling */
 static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 				  enum vb2_buffer_state state)
 {

-- 
2.53.0


