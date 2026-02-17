Return-Path: <linux-media+bounces-52964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BaXJjIplGlTAQIAu9opvQ
	(envelope-from <linux-media+bounces-52964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:39:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDCF14A0AF
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECE693014565
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAB72E4257;
	Tue, 17 Feb 2026 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jibuP7ks"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7143EBF07;
	Tue, 17 Feb 2026 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317543; cv=none; b=fzyzYE6hAG2nTVHktoBY0JVh5SJm39tubQdShNCQwRML+tf048T2rz7Tp/R90+pBkARwbJ4quV+gpB2Oh1Vtx8OrLsCKDMlxM74yrvWtwKbM9etTMV59ksk8bMxNpLvNE0qntulX0KBvOockqWa2ryGZIP2NqfEz9/6UNpbkezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317543; c=relaxed/simple;
	bh=exhSgUFtZMTRx9j/vXlyrYm7QIhr8ZxBf8WFdG7BkyE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jCCFszToGlLTzhkLbf+adAXwvRTpVoYpo89jZ5szng79ei6yC3C1R9/MYqGj5QDzRlxzr2fC6gA53wxgKMQTfNuTnvMX1GGVBl7Rm2KIwamH/R6l2wYFUdRDT8RgB53E7v3g5+ZXNgrGs71+tuO11MdTwUN5IoM7MfTb2fopxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jibuP7ks; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9508AC19421;
	Tue, 17 Feb 2026 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771317542;
	bh=exhSgUFtZMTRx9j/vXlyrYm7QIhr8ZxBf8WFdG7BkyE=;
	h=From:Subject:Date:To:Cc:From;
	b=jibuP7ksnqs/JMjLG7TpTgDWIwks9HpzpKDAr9cx3aP+GI/mYLsq80b+9xquUEN26
	 zSsR+5jpTpFJo6+LUart2upqIGiL1ViVNfjAj/odJM4K0XUB8kTZ1nJHEvMJUHLVgQ
	 MvQ/NIBDNqJzurzYVi9lQPbA033iAhl/bLhmh2m1Dc1pvafcBDTNxBvmdiEpwg1Vyw
	 UPs33n5y9nAoLgQsE6NMqJzB/L94KsjStbSwJWvKCFTUTV2JNsHeiiNlscwq2zkmx5
	 VaMo28vPRwM5n7htED3a2Gm5VsW9+bz+rW80dCsrNVbok/3pjPUnD45qTcUnMttJEt
	 fbEjsHlT/lMCQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v6 0/2] media: Fix CSI2 RGB vs BGR pixel order
Date: Tue, 17 Feb 2026 09:38:56 +0100
Message-Id: <20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Oy2rDMBCF4VcJWldhRjfLWeU9Sha6jG3R1i5SM
 AnB71450Itxl2fQ96MHK5QTFXY6PFimOZU0jXWYlwMLgxt74inWzQQIDQYFDyVx32eee8+9lU1
 rIQB4yar4zNSl27P2eql7SOU65fszPuN6/b8zIwceg3USWkTb2fMb5ZHej1Pu2RqaxS+uL7ZYV
 EwmGI8QEBTssPyLmy2WFQMqrRv00jm1w+oHI6DcYlWx1uS8CM6Zttth/Y0NCGi3WK/fblwnQzQ
 hkjlnioO7HsP0wS7LsnwBfzPklJsBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2778; i=mripard@redhat.com;
 h=from:subject:message-id; bh=exhSgUFtZMTRx9j/vXlyrYm7QIhr8ZxBf8WFdG7BkyE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlTNJUc6l6d3JPfxbtEj8nS/omc/MqH7ZzblgvXWS/Ti
 F9+/Xt3x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIt1TGhhnRdzgPiAW1/Hpj
 uzvrqn/iVi6OtuKapA2f3A8FSBc+f+ry4JdJ08uUfBabCV4anKv0GGt4g37/8+Up6qsTuiK25Pn
 sE6r31kieSDQuC+iXa6pruWjoWaEo58phFt2r/zPvVsyhNAA=
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52964-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: BCDCF14A0AF
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

 .../userspace-api/media/v4l/subdev-formats.rst     | 19 ++++++----
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 43 +++++++++++++++++-----
 2 files changed, 45 insertions(+), 17 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20250612-csi-bgr-rgb-b837980c00b3

Best regards,
-- 
Maxime Ripard <mripard@redhat.com>


