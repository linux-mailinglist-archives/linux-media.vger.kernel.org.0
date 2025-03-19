Return-Path: <linux-media+bounces-28471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B25A68BB1
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D49165DF4
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680B5254844;
	Wed, 19 Mar 2025 11:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tOpfNvWp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB351E1E11;
	Wed, 19 Mar 2025 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383707; cv=none; b=CUX9Eko6TcUsdOZ/Zs+fC+IpWJWkYB+phwVwLz0FX8egSqMHkCC0ttqU17jTYnfsg9fmZUiR14ZzS5J0/vh46BDzU4UW2YG/nKys+74XkZCfvz9T/nk1UZ/eKi1IKRpOqTK9pJo3YHmlR/RFCRjaR5NRdg9k/s69B56i1NGXbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383707; c=relaxed/simple;
	bh=4l1nbqfl/Z9DhYcOlNvzUWzMTbQcHY2vNoLRdgdG+4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nPM0p8zVMGQgM/VzT9iM3TW0y6PGOrKK3AY9VgN5/unnLDcqW3oU5TtDnc/cpZ2kQsgeqgvnNoa5w6aVAf/+ta3uJSssN/amUQGWAJIhX8IzfX02jRazzNSXxyhEnwFkOY3eW4TOsuIiWYaVaLRKD40AztrwA+mAaoclh9eLU7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tOpfNvWp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AD3A22F;
	Wed, 19 Mar 2025 12:26:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742383601;
	bh=4l1nbqfl/Z9DhYcOlNvzUWzMTbQcHY2vNoLRdgdG+4s=;
	h=From:Subject:Date:To:Cc:From;
	b=tOpfNvWpbzvgy+TkteDCJ5GVOpYC5YBwKRbbshC1e6Lq5KRZKocVo7e2CQuOQOcNe
	 4P6Ztis5+b52TunXyYDadXPlgFMtcgrs4q1FHV4z+VLfp7D8/2yhZgk9Ssj3g4V7to
	 Ifn1z7KFQMxCdGbEzvD0oh+awXWYTpOAQUvK0nkY=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v5 0/7] media: renesas: vsp1: Add support for IIF
Date: Wed, 19 Mar 2025 12:28:13 +0100
Message-Id: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE2q2mcC/3XMQY4CIRCF4asY1oOhCtDGlfcws6Ch2q7FNAYMc
 WL67oNumERdvkp9/10UykxFHDZ3kaly4bS0Yb82Isx+OZPk2LZAhVYBalnNLJkn6SFGvzMqOBt
 F+75kmvj2LJ2+2565XFP+fYYrPK6vjQpSyf1oyKJzTrvpyJF8ScuYfI7bkH7EI1Wxc0TTOTaut
 LKkA0yE8QPXnWvYd64b32nvx8ENOFr1gZv/fOjcNA6KogkGAjj7hq/r+gefZRLDYgEAAA==
X-Change-ID: 20250123-v4h-iif-a1dda640c95d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=4l1nbqfl/Z9DhYcOlNvzUWzMTbQcHY2vNoLRdgdG+4s=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2qpW1t1vB9zbqRF4InUzz1fOCeQRAg4QUd2G7
 B/eYQUDP1CJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9qqVgAKCRByNAaPFqFW
 PK6pD/9X0mgdk7XVGgK+Lw7Zo1AjtVYC5Yl1p31QOliNXnIZaoUwTSZglodoCR1BeDfX25hpKKT
 ShDSdYo1NzfpVSkvU7c+zM58TC/jK/E/cQg7LUwpmMrJeK8zmIRVwbtNvu/m7o3CXjRENpnje3E
 E9nNwlZxsqY93K1mizRKwujiCG8LwdoJzIo/+WWGRwDN/oHdlxoPCl2yoSdOk/F6bIiGV+wGfbp
 UBtCLh5QuWgt0popXhpZn6B1GxSb+xdP43V/qKtg152mx2jFB3BtJg1qCUeRYucDwrloNESlspB
 jOWNcj6A/ZiT+Z1knDDgsQxnARmDQvbGM4FpXi/qHZz4goUnXq/8whvsTatiGB3QT6nWdgRNxv6
 NtYdr91ioxIVD8aAiTPGNF1mCxnLxp/4kMg19/TMrnBYkvKq17orWZctCHJnAH4o2cVOgQ6Seb8
 u08NIjh56CAWL2G48lmxQ1s6oGcGh65GITE0qkZmCmZa2elgeo/EZxzTSujcC0CVHJTXYO81ywm
 gQqwEt9wMzJuJgyje3Taoke57KGXlm19M1Unl0lszdOx4TBypVZp9pOGijwQ4KdjoAYPxO0F8Mf
 bAGaTxKIv8kv6jhf6qi6O5ihipj8x70zvsIrv34Rda2bBn5e1rx0qZoREGtWxHV7+dcrGLmgBgD
 RHiaLFWoFHhKxhA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The IIF (ISP InterFace) is a VSP2 function that reads data from
external memory using two RPF instances and feed it to the ISP.

The IIF support is modeled in the vsp1 driver as a new, simple,
entity type.

IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
interfacing. To prepare to support VSPX, support IIF first by
introducing a new entity and by adjusting the RPF/WPF drivers to
operate correctly when an IIF is present.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v5:
- Drop additional empty line 5/6
- Link to v4: https://lore.kernel.org/r/20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com

Changes in v4:
- Fix SWAP bits for RAW10, RAW12 and RAW16
- Link to v3: https://lore.kernel.org/r/20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com

Changes in v3:
- Drop 2/6 from v2
- Add 5/7 to prepare for a new implementation of 6/7
- Individual changelog per patch
- Add 7/7
- Link to v2: https://lore.kernel.org/r/20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com

Changes in v2:
- Collect tags
- Address review comments from Laurent, a lot of tiny changes here and
  there but no major redesign worth an entry in the patchset changelog

---
Jacopo Mondi (7):
      media: vsp1: Add support IIF ISP Interface
      media: vsp1: dl: Use singleshot DL for VSPX
      media: vsp1: rwpf: Break out format handling
      media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
      media: vsp1: rwpf: Initialize image formats
      media: vsp1: rwpf: Support operations with IIF
      media: vsp1: pipe: Add RAW Bayer formats mapping

 drivers/media/platform/renesas/vsp1/Makefile      |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1.h        |   3 +
 drivers/media/platform/renesas/vsp1/vsp1_dl.c     |   7 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  11 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 121 ++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  26 +++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |  73 ++++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |  18 +++-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   |  91 ++++++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h   |   4 +
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  31 ++++--
 15 files changed, 380 insertions(+), 25 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250123-v4h-iif-a1dda640c95d

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


