Return-Path: <linux-media+bounces-28407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242FA67281
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8254717DE82
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33BA209F5D;
	Tue, 18 Mar 2025 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lnAtj/+k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424C20A5C5;
	Tue, 18 Mar 2025 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296947; cv=none; b=o6P8sUe2oVlfAiW85KhNy/XdAoSELZOAuuU0apbBjsZvKvcDnEmA2JcQDib3pQXxfEVLh21Xkmsk3AyH645C6a5V8HMOc3pa2TLNMzFGj0/wRqaMT8Yeb6XzggB3sEXOffOlnCsDFeyMrcO6jP0TM2JbYFx3rfC2XPOTq18e5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296947; c=relaxed/simple;
	bh=nVNeBKkZnXVe3jpNVLayL/Iwz8IvL/M5neyQbJu48YI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZYKTcxcjhOAI07TI/Maqe1zS2OJWNF0KyPFRLQXz12iRBNty3oL2oNMkDY4xCF9mpr2lktwIWyZa0/aRtbRantIbt9FmnKiPPtnfat9wchPvXdFc7CRysUaXMJzrpWPhQ7qzHMdihFHbnKh6WgENgux04eiQYcdLChxoI+t/hcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lnAtj/+k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5387D778;
	Tue, 18 Mar 2025 12:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296837;
	bh=nVNeBKkZnXVe3jpNVLayL/Iwz8IvL/M5neyQbJu48YI=;
	h=From:Subject:Date:To:Cc:From;
	b=lnAtj/+kcH7mIFFwuwj3SWu8FKmVZLzjXOhpW+8fiU1LpbPGhnrtIgorN1mJR9xX7
	 gn2uTHtXdsw51oKI/mBaqmAIsMHp9mn5AVyQVziA6yG77w4II5DujepwBIoUwM/q/d
	 87YZIjDrA9Sim62fDV9O7rw4OLVr5V58+p6adnVU=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v4 0/7] media: renesas: vsp1: Add support for IIF
Date: Tue, 18 Mar 2025 12:21:19 +0100
Message-Id: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9X2WcC/3XMsQ7CIBDG8VdpmMXAAW1x8j2MAy1Xe4PFgCGap
 u8u7dJBHb/L/f4zSxgJEztVM4uYKVGYytCHivWjm27IyZfNQIAREhTPeuREA3fSe1dr0VvjWfl
 +RBzotZUu17JHSs8Q31s4y/X63ciSC950Gg1Ya5UdzuTRpTB1wUV/7MOdrakMOwfQO4fChRIGV
 S8HBP+Hq50r2excFV4r57rWttAZ8YMvy/IBcqwd0yMBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=nVNeBKkZnXVe3jpNVLayL/Iwz8IvL/M5neyQbJu48YI=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2VdpsxTjOZ1EsEnNAEaN7Rl+a7tW/EVRqMgXO
 FtRgPG3jE2JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9lXaQAKCRByNAaPFqFW
 PLGdEACpBq1Ss3wng7XAv65hiIZk3ZhnR5inS5eRaRQJduZC7pik+py9EvXu/ddCF5tZbLneoLk
 VdH0Yvt9U8PoG/SJlVIIYrZez178jhoXi/iDl1K/eDj32zsoj8mCBXJyRyi6yfuUArTKpDaYcbA
 DpKW6aO+xB5P0+tOgMc2x5jC9DVRJb6rRwnGNZ1z/L5q9NL3NUmLrvyIYccTGdqE1pmsqPSkwnw
 Q3iEo/R9WAqMPGhkr3bdrKm4g9LPfdG0Uk9t0hnEFr7DwWPHFe4YVE49Wfq7/kOY9kWSF3ae343
 LBUwkh9HfHkfGliBzxWFqe+twPZjq3TBDH+VUWi8zKJojf9e2k2PLxH/irPw7dYmoo5pG12r5ga
 sa6LSwkhbgqO7FNe3FvhY5bGmMQueszNdQiAlUPjefqcDlQbEKAfKRMP8nzwfcdDxpEA+2koTrr
 8GpTU2+37I4n/EzdSuApMZigptl2/R3bjuGu1CUlGb970PQd+dGdfVzUNEQCzLDkURW+9m4WLyZ
 v3lIAMloeqxw323VV7ayiLkRQTJqcmK7WmGUwdgdtGg4bW91N6Ca2TKpUa3v20D50C3uExrkShl
 hbyCa7nY8Xu1lOgwwBL84pJgKA2bS6anbYStGe84A2+925WvdZxTeg13rqNr/CTeUYjBDzzEpym
 SqeLTKXYCdk3y2w==
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


