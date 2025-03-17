Return-Path: <linux-media+bounces-28354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0CA64D7A
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36CD16CB1C
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E0E238D22;
	Mon, 17 Mar 2025 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dFLmILtl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922B727701;
	Mon, 17 Mar 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212656; cv=none; b=a1WhYl+NSCVhMBi2E51Thlu3MxBtpdOvkbEskb91Ktnkd+9rFHrzG06cmZoZBGJq19l1io5nSAqnkzQoXD1EyJuuDraEYf1HV+5TjmaVgnhdpVq/Na6NNiPfkR5DQ9/PrXNgAxat9ExcE3wWxKQiHB7yzgOe8xjh39R57Hqr33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212656; c=relaxed/simple;
	bh=z8b37/ozlxCy9LGufC0RgsM7ahUEIvaOS1x0SlLXgpw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nh/z6veciZSjZhY1yJzVA1gjsjIPvmiy1LrA4MpqlK3kLOl//6ImfZ2BrjHpWfd43BnPYkSIhH9H7eUOys165ka9XcB01hink0zmXEQoRqWcj1zuF2f+yLgODHapWMViaJEZfJxv3HF3zJgL1SH96Ppdvfb9nkaCzqfBZ5iamRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dFLmILtl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DE1C1E6;
	Mon, 17 Mar 2025 12:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742212545;
	bh=z8b37/ozlxCy9LGufC0RgsM7ahUEIvaOS1x0SlLXgpw=;
	h=From:Subject:Date:To:Cc:From;
	b=dFLmILtlym5CzmEHWiP6ORGcr68umHBMZ8Rtf25Hf7fbpmR574I9sL4IOfKoJ5Np0
	 PfLIrRBQf24l0iDirg/QtSt74mqWOh3Ell/sRJMpEeqG/xSYt13DDVOvBr/E0ebyK1
	 7JIzgbpYNwr3IyYSXDd41OaBDMK1Pa6T6AVbUs5k=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v3 0/7] media: renesas: vsp1: Add support for IIF
Date: Mon, 17 Mar 2025 12:56:38 +0100
Message-Id: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYN2GcC/22MsQ7CIBRFf6VhFgMP0ODU/zAOFB72DRYDhmia/
 ru0Swcdz809Z2YFM2Fhl25mGSsVSlMDdeiYH910R06hMQMBRkhQvOqRE0XuZAjupIW3JrD2fma
 M9N5K11vjkcor5c8WrnJdfxtVcsHPg0YD1lplY08BXUnTkFwOR58ebE1V2HUAvevQdKGEQeVlR
 Ah/9GVZvqJxrDnkAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=z8b37/ozlxCy9LGufC0RgsM7ahUEIvaOS1x0SlLXgpw=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2A4kvHLiP0SeRK7KtuPYkF2LAVf95I1VioXin
 ISdL2dST8CJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9gOJAAKCRByNAaPFqFW
 PLERD/485+LrY+OWH2foy6WTald4yhalbZn45m7vkozcaXdbD2gzDUS8OUZlpQuG99Dq7S2Fdlx
 8aEbdbFw+MH2YhS+kWxzE2KDC9Zqt1Y41fEbWMC+tE1vmF9a2SNyRs5UHJJWEmDhxTGmcXwrf9I
 zp2gqm8aAymJVzuPzdF3/CJCi6P/4aXffDU9gLqDG1tQLtiaeaPdk4aRumunJWXveiZP3kvD617
 P+ZkjHBEBBt8w/cHIA6hicdHJzt92ppu/1CSvMFdlkAR21tYXD2mGRJkzHaYihrsEH8u2WURHOY
 0x3OEXy5FCkf7Evm7dSDzjLwR2kQb6hdEuvEslGCkuizYPvikdbXD0JzdbZRycdHt/mqgJiSSFl
 aSKbWVdUYzRmwKaDVwFTbME3Cz8d3Cea0fqKfFyExvQUZAwVT14N2vCOfRpSP6GHsf7avLMWi18
 JcVZVG3t4NmDULmvQ9WbTrMcrqsdKc7mynL2EFRyZEuBrXLLfdoLf2NwNBzqSMovB/1igM1o4BI
 mgPW/ISuQ0gFk0iWeJpeFxJvqhO3oV8BzRFQe8nclbprrNZGnl0kQisggXMF4F/E2OolkpJ7FGl
 N49P3vsVawEYnjtPeKzbE1sRVrIYOmzwH1T+wNO21p89lOIQoNwqpJIzwZ9BQrZ2htxbrYRvkb2
 7Qo+0lf7kV5AlvA==
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
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   |  92 ++++++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h   |   4 +
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  31 ++++--
 15 files changed, 381 insertions(+), 25 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250123-v4h-iif-a1dda640c95d

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


