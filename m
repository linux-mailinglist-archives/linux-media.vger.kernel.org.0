Return-Path: <linux-media+bounces-42274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082EB52CCA
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76A061C2073B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13F72E8E08;
	Thu, 11 Sep 2025 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMYDc+VO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE12E8B7E;
	Thu, 11 Sep 2025 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582140; cv=none; b=KFIddrW54ppwj/HwpzPtBw+8oY7rJONS8beV45bPCJGmqnzHlKBgWCLELCgTsa1yANAJQ6w7EJdGFss1b8tjYw5dGFCdZ0kRJta7l2q6mJxgNeA+Kh7rOtvkcaLmwqoVJZvcPbskF9CSBuIWklaxI349snId2kXTP1yU+QIHyfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582140; c=relaxed/simple;
	bh=pCPPPsZYdU74v3FYubISp3QrtK5BY86yBDwpXjYkFok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=th7SOAuqkF6VQyUhT8V742h56q+Vfr5QKHQ+uvcybHS2tFtpRXMquX4HC1lHvtyFP8WYj95XONLG4hPGeV35HKpO+RUjKa0r1wv7E+yqwlRlpyBluN/EvWXVxnPN2+obyt+apIzEjVTuO7IV8keI5owfLqeH7+LDhOnhILNoYJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMYDc+VO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EEBC4CEF7;
	Thu, 11 Sep 2025 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757582138;
	bh=pCPPPsZYdU74v3FYubISp3QrtK5BY86yBDwpXjYkFok=;
	h=From:Subject:Date:To:Cc:From;
	b=HMYDc+VOC2Qahy4MdXnOnLFS21GFxNjhB/6H4EIdRm6KaCIgCBzNUVzgpCEQI3LhQ
	 f3zD6tN9HwAnrDWCZb8vEW3wJyuC0s7Unq1HIvPqO5M79G32feqWF/+67hkEkitEvK
	 Irzh2UU9iWfqpElF2aWr6HLJt/5HtXs5Z/TDL/c7+9OPLSa9mK6++V9aT2oSRnWQUh
	 xrF43nd93J07VRrwYYlcw/qmUZ6IO5rMybZzHTkJ2gZiZC3hiRkUVmNzOr7/HPYS0d
	 c/MaGSu7S+HompUXDebzOs5SUrOJbEW+IMikLydyk8EwHMqul3MpFsOai5mqilbioR
	 Ij1PZJrfB35Rw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/4] media: Fix CSI2 RGB vs BGR pixel order
Date: Thu, 11 Sep 2025 11:15:31 +0200
Message-Id: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOTwmgC/23MQQ6CMBCF4auQWTtmWqIWV97DsKBlKBMNkKkhG
 tK7W1m7/F/yvg0Sq3CCa7WB8ipJ5qmEPVQQxm6KjNKXBkv2RGdjMSRBHxU1evSuvjSOApGvoTw
 W5UHeu3ZvS4+SXrN+dnw1v/W/sxok7IPramqMcYO7PVgnfh5njdDmnL8MV5pYpwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pCPPPsZYdU74v3FYubISp3QrtK5BY86yBDwpXjYkFok=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmHJptanrx48svm149z1rhk27m/nCMY1MTgWC126VF5Q
 9Gz7zyTO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEvj1gbHj+xa729yLfG27/
 Hm/rtJC5LH19YvRJochdBhOj9A4G7f75ca6W4ZWayvXrpKsFX31Jes7Y8GpTxj6L8kWv7zRwvFF
 ckcH7PvgD9+2kxIYtNy5mrH8d/o9H4VSnf8I7jQe5l0vfX1IrAAA=
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

 .../userspace-api/media/v4l/subdev-formats.rst     | 51 +++++++++++++++++++---
 drivers/media/i2c/gc2145.c                         | 23 +++++++++-
 drivers/media/i2c/tc358743.c                       | 51 ++++++++++++++++++----
 include/uapi/linux/media-bus-format.h              |  3 +-
 4 files changed, 110 insertions(+), 18 deletions(-)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250612-csi-bgr-rgb-b837980c00b3

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


