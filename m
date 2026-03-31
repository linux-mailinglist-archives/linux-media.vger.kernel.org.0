Return-Path: <linux-media+bounces-57763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDPHGEajy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:34:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B50673680E1
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E2D330214D8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4EE3EE1CE;
	Tue, 31 Mar 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PN8ae3zG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E031A9F9F;
	Tue, 31 Mar 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952877; cv=none; b=Rb+WkLINbQrihOf78ewrVmiAyF/f+xNqn2LUrGeeiKe9Q/GFuUU3LK1Nui4eVca11opj24NPTzzJuQ4aG2FxZtm5/RefqUwDcF9Hjdw+x9cd/IpnrAxsLEvF6x1pzIWgphiKEA7RZOii4y2RXhXFKZBTY+w5I6aKknMl5SGJoOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952877; c=relaxed/simple;
	bh=Mxz0Gz5pn0tPT5emL6vlGmtQyftfB/OXYW26yLMT5OE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JBzRrEZxL2Fj8E+dmfvqHXlXtLwhf6CJAX4xzVK11mX+fa+ZXcHPQl7qALGK0oOKN8N9fhmjq8QRil8qU1uHf8ikESe4CtqOLuh/zcLQk4kYY0zuQHKtgnQBaExTTotiOEoETWAMQbeBY7wgCv1wzNNh+bmilkFuGRYXqbn32wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PN8ae3zG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4106A98;
	Tue, 31 Mar 2026 12:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952792;
	bh=Mxz0Gz5pn0tPT5emL6vlGmtQyftfB/OXYW26yLMT5OE=;
	h=From:Subject:Date:To:Cc:From;
	b=PN8ae3zGN61sg4txGigY2gLIqq6lbdiD1xUjzROqU+vELdc2HzI2tYT0jY+HP1x60
	 BXgFUbEdgSAwx6Lo2qI81HT/vjFuMZ30VT1dA1g1dBLQ/2oY4kUhmTkVplkcOPKoIF
	 FgUkLDzAAKBhj/0wIm5wXdI/A+37YIXdyglJLtDA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 00/15] media: rzg2l-cru: Rework slot programming for
 V2H/G3E
Date: Tue, 31 Mar 2026 12:27:30 +0200
Message-Id: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKhy2kC/13MSQrCQBCF4atIrS3pIYO48h6SRQ8VU4hpqdaoh
 NzdNuDG5f/gfTNkEqYMh80MQhNnTmMJs91AGNx4JuRYGowyjbKmQV9hkAcKPZNc0DvrW218aHU
 N5XMT6vm1eqeu9MD5nuS98pP+rj+p/ZMmjQoLFlVlVV/b/ZEjuZxGn5zEXUhX6JZl+QB4jHeys
 QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Mxz0Gz5pn0tPT5emL6vlGmtQyftfB/OXYW26yLMT5OE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GneV/R621dx1O6K7N3f+ggPTGy/4Q4QyrdW
 WNDsF0JDR+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhpwAKCRByNAaPFqFW
 PAx/EACCMc0neBghFzLYQhA49FPD5DG88MeOn/SbQhJk1smnV0fccwaYbqwEuJT7xYL7WhBOelf
 Sz8YUmeS75r5Gbv7CvZObZDXZrPynEKnIcC68mDvQANn6Cn2Al0DJMAYcaSZPUOFZLpYW42xisL
 0nL+5T6+gwcKPZJ4p4pS296xZKeCmFxJD+ZzlcDA1BhzR9n3mZy2oMCIM/evNlKgAr1NfqTVgO7
 ++MqFYQFlYh9nIEqrdT66JcPuF7QJu8uH9NwdkdeaVsFBei92LipmWjg2hehYYvGXiKXkwxWRrj
 byLIaIFaoD/UenQOEJ8PirtaYhBS5oI0almJ4spIAZvDXznjxMee1YZfBc7opns/DbSfKJn2afe
 ecKBkXT3C3xSKTDDmw8he8fx5WHMFlBSFOwg5g5xf85Y+Rh71lz5S+NgoQ1j7a6f6S/6jaNUlFj
 iHK5DleqFSsfjH0dRMfHQpj2p7lQ2dJX0a84gHJaCH+Qh/7wspv48hgtgq4QN6QRHtlKs+Xk/Xt
 IR7D6bFitFb5xSn6v2JxxQ9zcB9gamVadOSEnVjpvz/5THrxbu1LCsdTlO6hN4RGbld2QI6CdXA
 2qmlN60+HWrhhLovXOxpNTksWULIWzuMHAbWVu/OUSkPm89o/3TSMaPWWJxJfAonQkkLJWWbj23
 Bd0OYPWC/leq99Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57763-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: B50673680E1
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
Changes in v2:
- Add tags
- Remove now unused macros for FrameStart interrupt handling
- Do not include cleanup.h
- Add a patch to remove dev_dbg() from irq handlers
- Move lockdep assertions to later in the series
- Minor cosmetics
- Link to v1: https://lore.kernel.org/r/20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com

---
Daniel Scally (1):
      media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()

Jacopo Mondi (12):
      media: rzg2l-cru: Modernize locking usage with guards
      media: rzg2l-cru: Use proper guard() in irq handler
      media: rzg2l-cru: Remove locking from start/stop routines
      media: rzg2l-cru: Do not use irqsave when not needed
      media: rzg2l-cru: Remove wrong locking comment
      media: rz2gl-cru: Introduce a spinlock for hw operations
      media: rzg2l-cru: Split hw locking from buffers
      media: rzg2l-cru: Manually track active slot number
      media: rz2gl-cru: Return pending buffers in order
      media: rzg2l-cru: Remove the 'state' variable
      media: rzg2l-cru: Remove debug printouts from irq
      media: rzg2l-cru: Simplify irq return value handling

Tommaso Merciai (2):
      media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
      media: rzg2l-cru: Use only frame end interrupts

 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   4 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  29 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 326 ++++++++-------------
 3 files changed, 137 insertions(+), 222 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260326-b4-cru-rework-ba3b712bc715

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


