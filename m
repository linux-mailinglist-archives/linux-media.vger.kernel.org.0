Return-Path: <linux-media+bounces-55698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFp4Gg4qtGkQiQAAu9opvQ
	(envelope-from <linux-media+bounces-55698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:15:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9D285B8C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4699307944C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D773A759A;
	Fri, 13 Mar 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u4DD+QV4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E53A4523;
	Fri, 13 Mar 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413652; cv=none; b=mXxIuBC9eR/SYblwsLdyVEN+ULxghrf05fzeg4YLDD28NMa1oNzMSa4jBNz1AMko4hjd01HutYP3w8RyvFFfqfMFDfnkYNPgnLOPTf4O8eDDXwiwFzNEwI/kz99ideR0MBr+zCJgW4iM3JQ+NHhK/kfQwWKb5q7GzqzrEnBkRw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413652; c=relaxed/simple;
	bh=E6AiUIAxIWfClFBdApDMzqhP2EVm2gqzRa0y4vYhwpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LAeMkCTXjvgxBAH2STXXP+Rli0hB2DCJrVLoxgbvrRKeL54Z1zKO2a42YVeIOqaqdf1Hhon+UOkAMWgNsKIyq0ojalVuSLkMRgl7K70bd+HREFkLMLlVxIx6tELfFEJJm44ZeMeZ22XygQ7Vl7QPBPvOCXNQqkT+QggH8o2gMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u4DD+QV4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.122.93])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 945D4E70;
	Fri, 13 Mar 2026 15:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773413579;
	bh=E6AiUIAxIWfClFBdApDMzqhP2EVm2gqzRa0y4vYhwpI=;
	h=From:Subject:Date:To:Cc:From;
	b=u4DD+QV4b1tCBWtAeAI7tH0/hrxW+QFiS7CqvfwnLKCFW/Glh5xRXE6cR3P9GhomH
	 NsmBRbmAPxwtzdaGRHyZkMFBHOCCXBfXmqhk+8Q7GML8FFxGQ+oxDXDvZGnU310sjM
	 FwDUb4GjImUFxJ/ZNSHli2RAoMxVCjTrS2SjzoW0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/6] media: mali-c55: Fix ISP reset and blocks bypass
Date: Fri, 13 Mar 2026 15:53:56 +0100
Message-Id: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQltGkC/22NwQrCMBBEf6Xs2ZVsamrx5H9ID0mz2gXbSCJBK
 fl3Y8Gbl4E3w8yskDgKJzg1K0TOkiQsFfSugXGyy41RfGXQSneqJcLZ3gVHY/AqL06Yj6jQeKe
 tOrDtqYfafETe0lq8DJUnSc8Q39tJpq/722v/7mWqoqlXxmlnqHNn8WxTWFyw0e/HMMNQSvkAd
 a85kL0AAAA=
X-Change-ID: 20260311-mali-c55-fixes-v7-0-5db2a04ea818
To: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <Nayden.Kanchev@arm.com>, 
 Konstantin Babin <Konstantin.Babin@arm.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=E6AiUIAxIWfClFBdApDMzqhP2EVm2gqzRa0y4vYhwpI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBptCUO8qWoB/l5M/+kQh+BZmAJO6/UZcg0mpMwo
 6ndwdC6jBqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabQlDgAKCRByNAaPFqFW
 PBuJD/wIBdBp4olVMz3ZXb2T9pR0V258HeENssphlLByl8Kjhy4f3zd5imtKSfzSsMTfMSNZwl3
 oHsc34hFeJH/BgMKnAmi86Jhnzuuc1P+Z5b5Hnwdw4PZJMI2GrkgbyERckVjf7HkJ4PAZaKk21F
 ejUKcH4nceEkkAQCzM3CrLZn9Ujs6GIJxeFSeWyhSiRZIj9viFAuhPu54K4wvsgkbIWVWXXYpS3
 x8jSlAxl8ARfCltg7jSsY5aFpkKgLhDZUwDpcioHw+BTyRcmk0Ap/U8sUpBiOdPoEqh5Xrwukii
 l8F3KyTCxlCjlfAxcDpH2pvgNSeErjhVdY6MMm+4lQXhbpN9cyWpx9S0o7zntDwoYxjcwBzFwbR
 d4HpQNZ3Sxmrargl5Sn9cP7EeoUidRwZ3uGp0OucJZ6ioKVsdeTPwLv48jh0XAmfNpQZ2lgutQj
 GM34hGleCtTVHUmX6KBh1U6C5OpF+bOj9zK6hjPnQ49P4z7FGaumQoKm+hwKn3Z1SR9UllS227A
 UDXc9NzNxArVIaMXVrzx98AwqvXuh8fj1tT+Ec97VdURZela+CNEzijkTBLkP+nDytPZkVyGAja
 mP/j6J6WsvQwLZrs8+n/trY+Pxu9wsE1zDANjGJOylYzCZT5ogcNMCgr4oFS68xfAoVmNd/300j
 1oMmJA6BOA3JplA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55698-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 87F9D285B8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ISP is initialized in two different points (s_stream and probe).
This cause two consecutive start streaming to use settings from the
previous one.

Also, not all the blocks that userspace can configure are properly
reset.

Fix that and also bypass a few ISP blocks which if not bypassed might
interfere with the image processing.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
Changes in v2:
- Collect tags and fix a wrong "Fixes:" tag
- Link to v1: https://lore.kernel.org/r/20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com

---
Daniel Scally (1):
      media: mali-c55: Fix Iridix bypass macros

Jacopo Mondi (5):
      media: mali-c55: Fix wrong comment of ISP block types
      media: mali-c55: Initialize the ISP in enable_streams()
      media: mali-c55: Fully reset the ISP configuration
      media: mali-c55: Bypass the Iridix Tonemap engine
      media: mali-c55: Bypass Purple Fringe Correction

 .../media/platform/arm/mali-c55/mali-c55-common.h  |   2 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  35 ------
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  37 +-----
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 134 ++++++++++++++++++++-
 .../platform/arm/mali-c55/mali-c55-registers.h     |   4 +-
 5 files changed, 140 insertions(+), 72 deletions(-)
---
base-commit: f6390408a846aacc2171c17d88b062e202d84e86
change-id: 20260311-mali-c55-fixes-v7-0-5db2a04ea818

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


