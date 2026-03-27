Return-Path: <linux-media+bounces-57289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aANyDg28xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:19:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E1348340
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CCA430763E2
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CE537757C;
	Fri, 27 Mar 2026 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q08zsj8J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3D34107A;
	Fri, 27 Mar 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631440; cv=none; b=Su28bJcEa3cXx6Ms/Pwc4Yv8NJvvgFZ8DT/zapPIw/MBBe2WFl8mXGmPzhIzEPlWL4FDaVoe1AovXue4TMnvp8Cmqfu60FpP8EGw3MT7kECXgNQzv80m92WfAuG/YoSpj6RWTyMmqsw6Oukh9hC5Rhm4OPhwUUk61e9DSq1Zv60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631440; c=relaxed/simple;
	bh=I0Fe6R9aZANzFW2MXqhySfLHgdmw2At0tLxMgznYH+8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hloOwPtHIt7BSzG+lrXHOndwTMvvNA+RjT7d20rNcF9VWO7Grrm5HUXhe/jWcEtKcLt3qjDREFc5kkgrnr9aFZX6MHTsnTKxu0zjKd67IqInwRH7sO5aqvbUzhHeRJBskl2aIkD0U+qH4EOVvYdZ6yXl2Xl3WWyRGk7eONZMJbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q08zsj8J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22850225;
	Fri, 27 Mar 2026 18:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631356;
	bh=I0Fe6R9aZANzFW2MXqhySfLHgdmw2At0tLxMgznYH+8=;
	h=From:Subject:Date:To:Cc:From;
	b=q08zsj8JZympvZmjLgAdaNL1Nmxh6JpQrhKJNupaJxmN8kfnbRzgQHE9xzU+Iv9Nt
	 Co1M0qPO4h3fD7Q2jRRPaKlDTnFWmWP7TEO/U5U8MS0xzsqAoFgb/EWhB2Ib2Bxzox
	 6U0Q5a5rVsDkZ0O3PIcTtIK4UcX3b3pDGTMyqa7Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 00/14] media: rzg2l-cru: Rework slot programming for
 V2H/G3E
Date: Fri, 27 Mar 2026 18:10:05 +0100
Message-Id: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO25xmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3SQT3eSiUt2i1PL8omzdpETjJHNDo6Rkc0NTJaCegqLUtMwKsHn
 RsbW1ABWZbyBfAAAA
X-Change-ID: 20260326-b4-cru-rework-ba3b712bc715
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
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=I0Fe6R9aZANzFW2MXqhySfLHgdmw2At0tLxMgznYH+8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroJnfJQ1OTkptkEXd3yRYKC5ul7oMQG9B9la
 hYdg/CvDmWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CQAKCRByNAaPFqFW
 PA4qEADCKTp5JrRQOxzSpYyf51NvHYMgi8IsLpggPeEfcmBdsXUD9IVBqhb2GGe0CdYwZAvuTUh
 1YlyHmbDJtfWot+qZ3syPEjzrjzTuXUe0rGUdN2M5CQji9ExrO3dTejXH3XtkSjN3sbtULzNe4/
 LxZHDs82A61JTsvBDOGMfZ0pRZXvVhbX3WX34vLolSfyPjQBiAYnaf0dYJyZjp+Kr33YK616d9j
 M2rMd/oC9ZjJ2X2+uW6KBge2fsoJPPNOTrnqr6zKt0LXSlZOsbu3qMlkWrPVWsfxWnm2JruDJAB
 U39KwVsC0PWCIOsDpF1X4Yl6taNDctY598S4Cy++s1k7UHtfJZGr82LWa0249XMq7BNpoUOm4+K
 2zy+1EbG01okVQk41a66fnMZD8DaAolBhXjWYY5ihVh3PjqnO1Hpoh3fuLOwbDg0m0AP7y1kM4c
 3+wbnlPPwIaouYFnLOhCPaMVtR47Bh+vS1d4BRENLKycD4eduljTmPM6DjUR9ppXBedswGV8BPp
 1CINAGSLL4fV5P+D+n5lmEFUGBR9+QPEN+KCYKj/cB3eQzyI+ggAw70yW+ADP8Y6GJCiuB0C5lD
 HUb9JqQFbQEyyRP0bZe6zUQLHVzcs6pQ+WZr7fzYQnt7wNisiAYs7OJHtC+sPKGiUlPlmGNf8zq
 LZPGg0RS2vRhGiw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57289-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: AE7E1348340
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series starts by collecting a patch sent from Dan in the past
which improves the HW slot programming on V2H(P) to avoid losing frames
under heavy system load conditions.

Tommaso also sent a series a few months ago for the CRU from which I
collected the first two patches.

Around it, I've reworked a bit the locking in the driver which is a bit
coarse and causes lost of frames under heavy system load conditions.

Along with these, bit of drive-by cometic changes here and there to
modernize the driver code.

I've tested on V2H(P) but I've also modified the G2L IRQ handler, so if
anyone could test on G2L and G3E it would be great!

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Daniel Scally (1):
      media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()

Jacopo Mondi (11):
      media: rzg2l-cru: Modernize spin_lock usage with cleanup.h
      media: rzg2l-cru: Use proper guard() in irq handler
      media: rzg2l-cru: Remove locking from start/stop routines
      media: rzg2l-cru: Do not use irqsave when not needed
      media: rzg2l-cru: Remove wrong locking comment
      media: rz2gl-cru: Introduce a spinlock for hw operations
      media: rzg2l-cru: Split hw locking from buffers
      media: rzg2l-cru: Manually track active slot number
      media: rz2gl-cru: Return pending buffers in order
      media: rzg2l-cru: Remove the 'state' variable
      media: rzg2l-cru: Simplify irq return value handling

Tommaso Merciai (2):
      media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
      media: rzg2l-cru: Use only frame end interrupts

 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   2 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  28 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 328 ++++++++-------------
 3 files changed, 140 insertions(+), 218 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260326-b4-cru-rework-ba3b712bc715

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


