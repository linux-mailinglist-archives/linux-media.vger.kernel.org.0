Return-Path: <linux-media+bounces-54962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OlPJD7jrmmeJwIAu9opvQ
	(envelope-from <linux-media+bounces-54962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:11:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 962BE23B6B4
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CAEF9300E497
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4ACC3D7D8E;
	Mon,  9 Mar 2026 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwZBkyQM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351EA3D75A8;
	Mon,  9 Mar 2026 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068866; cv=none; b=p/XgnxOx1t4VHWv7CVK8ypli3CQjx7llYp6xRZIL5qsIiHc/gT/9z5AGqh7FNh5R0iMqV9dWzKo1YyvVuqP5J/z8nI2OvgVkIGdSzDadbX1VxNQn9Oyi3DEqO2L3iQHE8Abjx8634FQ1Vx1TyyO/wjJxSS5ILCTndIk207ZNAdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068866; c=relaxed/simple;
	bh=NUrRKpE5JsbLWVLVo7rNwTu+ORpe9Z+PtgTDKnWkZPA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rwAa9oeRwXMPAIueMkCkSLDgUpAIyDlClRuZTz278E36cXGRrFKzddGajeRF+BxJntCtWaZrEfnabe72xsvjtfFELlqWhec9OS7fsvRNBYHumMZSyQjCLNWCyABfV7/AfPjOTmRNEZXg5rlcjR7+8Fy6D9k55xCnGw2UZkhFolU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwZBkyQM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42ABC2BC86;
	Mon,  9 Mar 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773068866;
	bh=NUrRKpE5JsbLWVLVo7rNwTu+ORpe9Z+PtgTDKnWkZPA=;
	h=From:Subject:Date:To:Cc:From;
	b=nwZBkyQMOfRZn/AJAHlG40XzvreLNo4aU/kNhpHf033MC+5DdHN72G+SMBW1hEX7S
	 orFQ3AEmGmdM0qPOntYDpvFG92PcfQqP86xk3Bp9ARTHOFGD23YAvDVC0uqsI0RuTS
	 pvr4Or9m/lEItFHswagq2akLhrcWza1z4A2pGoZt7M6kOd/dSs24gM22QJ3X4R5aAm
	 qPGfjkt22tU64O1HWm7Iwq++bpsY6itTP+nrHFYnWr40wiyeRWMve1Ak2tBRYzj3Wk
	 fa36rWW7UthaBDBkHogc4jZXrwisGr6Z4Y83zDRNwP2MOlpObnsBrXL0+GBg0yh62F
	 XMW2CiNYxYBZg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v7 0/2] media: Fix CSI2 RGB vs BGR pixel order
Date: Mon, 09 Mar 2026 16:07:39 +0100
Message-Id: <20260309-csi-bgr-rgb-v7-0-fcee993b13d8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTU7DMBAF4KtUXuNq/DdOuuo9EAvbGScWkCC7i
 kBV7o5TBDSE5RvN9/SurFBOVNjpcGWZ5lTSNNZgHw4sDG7siaeuZiZBGkAheSiJ+z7z3HvuG2X
 bBgKAV6yKt0wxvd/aHp9qHlK5TPnjVj6L9fp/zyw48C40TkErRBOb8zPlkV6OU+7ZWjTLX1w/t
 lhWTBjQCwgCNOywusd2i1XFILQxVnjlnN5h/YMFCLXFumJjyHkZnMM27rD5xggS2i0262zrogo
 dho7wnKkb3OUYptcvjHf472xcZ6NGsBQjabnBy7J8AoxZ3nbYAQAA
X-Change-ID: 20250612-csi-bgr-rgb-b837980c00b3
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <mripard@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2988; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NUrRKpE5JsbLWVLVo7rNwTu+ORpe9Z+PtgTDKnWkZPA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnrHtkmO+/nnXnrRrB1qjLjw0dLvu1Yss9SPyVNbG3I7
 KiwL9GuHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAibPGMDf8SswO/nFD95Lgl
 qLzmXPG1wzUrllbpxK/3r9gaZP2zLe98n2T/Ht/y6kXy8xhePHdJZKxTjFXJWGX+pNry0RHZCH6
 ri7t3bXFULQwtX9uYeWvy7v62gMvrOB+I2Z88Mcv6J8f2L+UA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: 962BE23B6B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54962-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi,

Here's an(other [1]) attempt at fixing the current mess due to the
opposite meaning of what v4l2 and the MIPI-CSI2 spec call "RGB". By v4l2
nomenclature, the format CSI calls RGB is actually BGR.

Unfortunately, a handful of CSI transceivers report through RGB media
bus pixel code, which is then understood as V4L2_PIX_FMT_RGB24 by CSI
receivers.

This is made somewhat worse the fact that media bus codes have been made
mostly with parallel busses in mind, and thus the order of pixels wasn't
clearly defined anywhere.

So the v4l2 vs CSI mismatch was confusing (but there's nothing we can do
about it), but the doc didn't really make an attempt at clearing it up
either.

We did have a convention so far though, that about half the affected
drivers were following. 

This series improves the doc, adds the missing media bus codes, and
converts the transceiver drivers to the rightful media bus format.

We'll also need that series [2] from Laurent to fix all the affected
transceivers. 

Let me know what you think,
Maxime

1: https://lore.kernel.org/r/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org
2: https://lore.kernel.org/r/20250611181528.19542-1-laurent.pinchart@ideasonboard.com

---
Changes in v7:
- Added Laurent R-b
- Reworked comments and doc according to his review
- Rebased on latest next
- Link to v6: https://lore.kernel.org/r/20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com

Changes in v6:
- Reworked the backward compatibility condition
- Link to v5: https://lore.kernel.org/r/20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com

Changes in v5:
- Standardize on using RGB888_1X24 for RGB888 instead of BGR888
- Drop the BGR patch
- Drop the csi driver patches in favor of unicam
- Link to v4: https://lore.kernel.org/r/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org

Changes in v4:
- Rebased on 6.18-rc1
- Link to v3: https://lore.kernel.org/r/20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org

Changes in v3:
- Fix typos in commit messages
- use dev_warn_once for deprecation warnings
- Reintroduce dropped unsupported colorspace handling
- Remove unneeded fallthroughs
- Link to v2: https://lore.kernel.org/r/20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org

Changes in v2:
- Don't drop RGB, but treat it as deprecated instead.
- Rebase on 6.17-rc5
- Link to v1: https://lore.kernel.org/r/20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org

---
Maxime Ripard (2):
      media: uapi: Clarify MBUS color component order for serial buses
      media: bcm2835-unicam: Fix RGB format / mbus code association

 .../userspace-api/media/v4l/subdev-formats.rst     | 20 ++++++-----
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 41 +++++++++++++++++-----
 2 files changed, 44 insertions(+), 17 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20250612-csi-bgr-rgb-b837980c00b3

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


