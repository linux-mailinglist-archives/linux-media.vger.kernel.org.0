Return-Path: <linux-media+bounces-10092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A048B1782
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18921F2425F
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B4C16F27A;
	Wed, 24 Apr 2024 23:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O3ToapZz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E708C1E86F
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003074; cv=none; b=joiRtJzS+uNsU8NJwMHIUrSncxmJIvmK8e0d2lWuyhELtnuI9553JP5xv/vjoL/rE0rDYyS1S+W7ZgOJulMXhIM8TOLGF7dhAHP/nNOXkBTHOVpHgxz4CwIrAhXkKu/fVD7gbAsnFOogxVfa3HGdsn3Xg9KLGcQyXHpwq3Rh/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003074; c=relaxed/simple;
	bh=Z4mtQWcwYgXxjrDSdYqdBOo/2SR7cQ0ZfuXlmTpsI/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gnLLzOYdO3Z2hGo68t5bRAdQbxrj0NoOTR7no4/bsri/r1PzZylmIRw3adm5nvZFN4DyNYEShz6TigtSpDUmrssJ9WCT1YejXNulzCCpHgELN/u9A/kf6ybeJIOBrRWf+93aQFGjzvt9vbf+mpNLDo+9BJMhZIZQc8kUu0E6h5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O3ToapZz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86E02B1;
	Thu, 25 Apr 2024 01:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003017;
	bh=Z4mtQWcwYgXxjrDSdYqdBOo/2SR7cQ0ZfuXlmTpsI/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=O3ToapZzUEvffisijJzZmfYmAni8yVCj8jKsfo/R0Jmeyi0yYHRaGbrWjInLCwMxu
	 rDnfxRNiG/ylnOH4ylZU6XanAem30zdCZO2xK/+9vfknTKDC0NY+z0TXRaFvqhWSPV
	 mJPDypRn0ZL/HUjTCTesUqdDxdFW6euI0CN3l+L4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 0/9] media: vimc improvements
Date: Thu, 25 Apr 2024 02:57:32 +0300
Message-ID: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series cleans up and improves the vimc driver, with the end
goal of converting it to the V4L2 subdev active state API. The goal of
this exercise is to make the API used by a virtual test driver, to
increase test coverage.

The series starts with 4 random cleanups, to avoid unnecessary
iterations (1/9), constify structures (2/9 and 3/9) and rename a
weirdly-named enum (4/9). Patch 5/9 then centralizes the subdev
internal_ops initialization to prepare for the switch to the active
state API. The remaining patches (6/9 to 9/9) convert the vimc entities
to the new API one by one.

The result has been tested using the libcamera unit tests, which make
extensive use of the vimc driver, as well as with v4l2-compliance. The
latter reports 4 errors, but they occur already with the latest stage
master branch.

Laurent Pinchart (9):
  media: vimc: Don't iterate over single pad
  media: vimc: Constify vimc_ent_type structures
  media: vimc: Constify the ent_config array
  media: vimc: scaler: Rename vic_sca_pad enum to vimc_scaler_pad
  media: vimc: Centralize subdev internal_ops initialization
  media: vimc: Initialize subdev active state
  media: vimc: sensor: Use subdev active state
  media: vimc: debayer: Use subdev active state
  media: vimc: scaler: Use subdev active state

 .../media/test-drivers/vimc/vimc-capture.c    |   2 +-
 drivers/media/test-drivers/vimc/vimc-common.c |  25 ++-
 drivers/media/test-drivers/vimc/vimc-common.h |  14 +-
 drivers/media/test-drivers/vimc/vimc-core.c   |   2 +-
 .../media/test-drivers/vimc/vimc-debayer.c    | 197 ++++++++----------
 drivers/media/test-drivers/vimc/vimc-lens.c   |   5 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c | 134 +++++-------
 drivers/media/test-drivers/vimc/vimc-sensor.c | 125 +++++------
 8 files changed, 236 insertions(+), 268 deletions(-)


base-commit: e42a204f0519a2540f1507ac2798be2aeaa76bee
-- 
Regards,

Laurent Pinchart


