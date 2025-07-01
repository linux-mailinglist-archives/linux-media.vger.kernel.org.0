Return-Path: <linux-media+bounces-36401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97670AEF509
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E21D7A9CB5
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282A4270EA3;
	Tue,  1 Jul 2025 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xrsbw8Xj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3E2701B3
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365663; cv=none; b=j/2olReUr3Nc8WMXcnU/o2rruLZArtZgPEbrPSWfDhRlR/kXNXR56IwwJwR8qPVKVnW6B8NtjW2QFFLyRapjE2nVJMIaA2lWzpISM48Xax//n9YZbSDq8+QEn3N2qSLIvn+odsHNBeo4UIXAkhp2uwa3llgD8F7T6qgn4dkD+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365663; c=relaxed/simple;
	bh=L8RmNqqe8sALAOESoDL8ZZ+hvlO/oFpwPzDUSHT2dMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMQ/GN5KX87F4E7aApIVcyTXKEUojRKKqs0uBCV+/aYi7YxrWVWseHaM3wZTnuHyd6DBBrW2Poqvjx4KOh2T2wn4qkz1inH+zjRcvEptnktbD3DGCay5UoV9qck40Lnc2AYsl1ZnDUOlchqjOpVhfLBuPtJCqt9qNeiNIZMg6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xrsbw8Xj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58BEE7E0;
	Tue,  1 Jul 2025 12:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751365637;
	bh=L8RmNqqe8sALAOESoDL8ZZ+hvlO/oFpwPzDUSHT2dMs=;
	h=Date:From:To:Cc:Subject:From;
	b=Xrsbw8XjiOprzQBJ8b5+iHMPTh6iGRgbeTvJbuC5UGb1pbeCD8YdzEG6BOS1XMgkK
	 vI8Q8X6AR4oFr3TdP1MZDj3FgqnJXyzou166nCEKdclJ7iTpX6DbEnlcM7214i2vZO
	 FDpq8hprCoq3c8K4H7ruflmRPNHuyVSdPulSzURw=
Date: Tue, 1 Jul 2025 12:27:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, sakari.ailus@iki.fi, 
	kieran bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	mchehab@kernel.org
Subject: [GIT PULL FOR v6.17] RaspberryPi PiSP BackEnd updates
Message-ID: <zcjfvh6kc5xfbtquurpz6yrelzqg2xtdl6w7yviiqsjp2bdheg@dndt26jobkpf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Hans, Mauro,

Updates for the RaspberryPi PiSP backend

Media CI pipeline at
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1461458

Thanks
  j

---

The following changes since commit 35392e855abf7d02ad3b061cbc75c7c7c37f0577:

  media: i2c: max96714: Drop check on number of active routes (2025-06-30 09:06:21 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/pispbe-for-v6.17

for you to fetch changes up to c53d3e974d78afd41f284e15d3dcc6beae14ef7c:

  media: pisp_be: Use clamp() and define max sizes (2025-07-01 11:40:45 +0200)

----------------------------------------------------------------
RaspberryPi PiSP Back End updates for v6.17

Updates for the PiSP BackEnd ISP driver
- Fix pm runtime underrun
- Rework job scheduling to reduce time spent in IRQ
- Minor changes

The PR has been validated by Media CI at
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1461446

----------------------------------------------------------------
Jacopo Mondi (5):
      media: pisp_be: Drop reference to non-existing function
      media: pisp_be: Remove config validation from schedule()
      media: pisp_be: Split jobs creation and scheduling
      media: pisp_be: Fix pm_runtime underrun in probe
      media: pisp_be: Use clamp() and define max sizes

 drivers/media/platform/raspberrypi/pisp_be/Kconfig    |   1 +
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c  | 207 +++++++++++++++++++++--------------------
 include/uapi/linux/media/raspberrypi/pisp_be_config.h |   9 +-
 3 files changed, 110 insertions(+), 107 deletions(-)


