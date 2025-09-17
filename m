Return-Path: <linux-media+bounces-42661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D96B7C589
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 13:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C85281BC1DD5
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 11:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1512EACE9;
	Wed, 17 Sep 2025 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKj9dePT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7D24A06A;
	Wed, 17 Sep 2025 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107785; cv=none; b=VeMzSA7bukF15Eqg1udZXFk8N9Nem4hIXakvR/2/aIakj+dn1UKChyTPvSXBWCTuILadm40RiZM8rfd9ZA/JHV0D7dJBB3J0feKAbnP2lbuwwM4pnfwjokpIuo5t7NvBLdLwrRhKYTLrWY3MAMPInVKevFqAT8zJ3BvPcBvXUQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107785; c=relaxed/simple;
	bh=prHt7Eb/mhJNLzswgIW0XpvAJakVlhf54ya6rcp9eig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t8O1wfrybW8QOMTzW4c7Znmf33JyXlsWyIa6hpvH2Nq5UIfzLho3on6Fj+Lx1GmQWN+kYKCA6czTHb4kPO/c1xj0FLw1Ufzntfh9RpGq4RnP+7JL2Qgls9+xPWjW9TPWxmqYeSWJx3Z/uOAisPmLZzqLN3VCBZTwPSOGuN4L7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKj9dePT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EB7C4CEF0;
	Wed, 17 Sep 2025 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758107785;
	bh=prHt7Eb/mhJNLzswgIW0XpvAJakVlhf54ya6rcp9eig=;
	h=From:Subject:Date:To:Cc:From;
	b=lKj9dePTkV7wPm1FUHucF2M4ZuEEun/kJOR2nOQxl+yxZ8mjv3toWILLUiDrHHPq1
	 R+aLkHaI5rGxgVYiijQbEFEZsglQdzgKnuJff0wUuKTluCXENRhBtS9kdAdz8y1p/K
	 MUmxevQyJRMGLxbmQ4b+RBCsizbVgfjNqP1hz0gUkYdZmthT2ORRPr5hpyWRdovqzt
	 A2wkCq2ULYzPKZbFCoBOh0wO/sWLveSmyas3NQobHtOpTuoJgRI1j+3qBFrjj5Z3SG
	 ZFlzU1u/3EvNoNMN+aT/qzTj1ZR8iMydD8Xyr8jfN2doFD0oWFp0Y3qKopK1lju1tJ
	 1ylwHEIFA49kg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 0/4] media: Fix CSI2 RGB vs BGR pixel order
Date: Wed, 17 Sep 2025 13:16:10 +0200
Message-Id: <20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqYymgC/22MQQrCMBBFr1KydmSSaE1deQ9x0aTTNCitTCQoJ
 Xc37UYKLt/nvzeLSBwoinM1C6YUYpjGAnpXCTe0oycIXWGhUB2xlgpcDGA9A3sL1uhTY9AhWi2
 K8WTqw3utXW+FhxBfE3/WeJLL+r+TJCB0zrQaGylNby534pEe+4m9WEJJ/eTy2MqqyFS72kp0E
 g+4kXPOX2SBYAvkAAAA
X-Change-ID: 20250612-csi-bgr-rgb-b837980c00b3
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2465; i=mripard@kernel.org;
 h=from:subject:message-id; bh=prHt7Eb/mhJNLzswgIW0XpvAJakVlhf54ya6rcp9eig=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnZtT5Hl+/Kv3YxYMCYguPGSprZi1Z8mux2P3ne1dfO
 XPkvZSwY8dUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYiJcSY8Ncxe5DE9587X0R
 vWrX9qPtQrpb1jAzstofezzZfsHLX0/KjSs2fdQ5bD9Ra+73jdcbzTYwNlyU38ch+CEjYd/j6/K
 +Lpc6GL793r7rH3vLsx9fRGy51gUpa8g2eLpLyR0IejXn8MOf/gA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

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
Maxime Ripard (4):
      media: uapi: Clarify MBUS color component order for serial buses
      media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
      media: tc358743: Fix the RGB MBUS format
      media: gc2145: Fix the RGB MBUS format

 .../userspace-api/media/v4l/subdev-formats.rst     | 51 ++++++++++++++++++---
 drivers/media/i2c/gc2145.c                         | 24 +++++++++-
 drivers/media/i2c/tc358743.c                       | 53 ++++++++++++++++++----
 include/uapi/linux/media-bus-format.h              |  3 +-
 4 files changed, 113 insertions(+), 18 deletions(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250612-csi-bgr-rgb-b837980c00b3

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


