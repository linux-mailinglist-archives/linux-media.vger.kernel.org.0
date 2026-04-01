Return-Path: <linux-media+bounces-57898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OPoOaxjzWkHdAYAu9opvQ
	(envelope-from <linux-media+bounces-57898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:27:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296537F429
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5607A303D89A
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 18:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A4231AAB8;
	Wed,  1 Apr 2026 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhJAqazr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1048313E34
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068073; cv=none; b=jTSWrDY0qsP/g4vn7vhr+cZiHaB2UNTU3NhBAW3GZbijGEpBtLd6vlt10lhyMLS4BvPa6AdUe2og1rB8tm1BCInSiKw4XW8+29T4gWUvBMsmyX26ihMsWsfFyON4rMxkQ1w/VCCtkogavZPnJpZyiYXPryrqpR5YL5O0K08oPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068073; c=relaxed/simple;
	bh=Wzd9yo4AR3q/bEQHOAqDuRGKyI1bsyadGOujiuTXV4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGCW14Si0QyST3bnMmO/sYOUc8nX8O1yx/yhy2l49A/WNgrCQN+kEaCnJKgyOyPN8fZDt8/h8kgCJg7Wz8iDDQyxI2/RpoHrzbG04I8fQEMpoOqMH3xYSLKXPbILoM+mK832MYwu+vqYomi6dRNKTROowfEY4paypZ9Q3rS2Yfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhJAqazr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1E0C4CEF7;
	Wed,  1 Apr 2026 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775068073;
	bh=Wzd9yo4AR3q/bEQHOAqDuRGKyI1bsyadGOujiuTXV4w=;
	h=From:To:Cc:Subject:Date:From;
	b=jhJAqazrBPfVQMB6xr11dQm+AS0PLCdN4LzEsWTRd3Wt7um+pkuTmw8EH3KPzScPH
	 7Ie14ucji8LnCTNvzVDy8J+yZvjkrRGVPDpVkU4VhVz4VTGH5Nw4MBxcvy8weBRJmo
	 eX36K8NtfdTgIHkQk6oUGXDs0UzZqQy96pCmI2UkuewT+bK+QLq31fVmlWuxOpuF7X
	 U/hjn7NpDn7XtCcSY+goFrhm2xv6hvYau7zzzpyQQBy0b9/fU+Wm6MATGe17pNmfFe
	 FGlCWmVtGXlRPSHue2a8U1dHTCL0majF92/VsjcVZcW5w+HHIlTFR45RJyjd+9b671
	 esKNtBSWxDirA==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 7.1] Please pull platform-qcom-7.1-camss
Date: Wed,  1 Apr 2026 19:27:38 +0100
Message-ID: <20260401182741.94768-1-bod@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-57898-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 6296537F429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 4fbeef21f5387234111b5d52924e77757626faa5:

  Revert "media: cx231xx: add USB ID 2040:8360 for Hauppauge WinTV-HVR-935" (2026-03-26 22:27:24 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git platform-qcom-7.1-camss

for you to fetch changes up to 0b40dd8d059c77d7384c12591012fc1c22c89b74:

  media: qcom: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290 (2026-04-01 16:33:37 +0100)

----------------------------------------------------------------
This tag contains:

- Fixes for sa8755p IRQ offset, clock config and missing clocks
- Format string fix
- New SoC sm6350
- Test Pattern Generator - TPG support for modern platforms
- PIX updates and BPL alignment fixes
- Add Loic as Reviewer

----------------------------------------------------------------
Arnd Bergmann (1):
      media: qcom: camss: avoid format string warning

Loic Poulain (5):
      MAINTAINERS: add myself as a CAMSS patch reviewer
      media: qcom: camss: Add debug message to camss-video format check
      media: qcom: camss: Add per-format BPL alignment helper
      media: qcom: camss: Use proper BPL alignment helper and non-power-of-two rounding
      media: qcom: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290

Luca Weiss (2):
      dt-bindings: media: camss: Add qcom,sm6350-camss
      media: qcom: camss: Add SM6350 support

Wenmeng Liu (7):
      media: qcom: camss: Fix csid IRQ offset for sa8775p
      media: qcom: camss: Fix csid clock configuration for sa8775p
      media: qcom: camss: Add missing clocks for VFE lite on sa8775p
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets
      media: qcom: camss: vfe: fix PIX subdev naming on VFE lite

 .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++
 MAINTAINERS                                        |   3 +-
 drivers/media/platform/qcom/camss/Makefile         |  12 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  20 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 +++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  11 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-format.c   |  14 +
 drivers/media/platform/qcom/camss/camss-format.h   |   1 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 231 +++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 519 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 118 +++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  31 +-
 drivers/media/platform/qcom/camss/camss-video.c    |  19 +-
 drivers/media/platform/qcom/camss/camss.c          | 513 ++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h          |   6 +
 19 files changed, 2075 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-tpg-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-tpg.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-tpg.h

