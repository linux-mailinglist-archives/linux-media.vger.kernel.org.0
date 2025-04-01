Return-Path: <linux-media+bounces-29155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47BA77D8E
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 024AA7A4A93
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFCB204C0A;
	Tue,  1 Apr 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wfGcb9EW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3138189F56;
	Tue,  1 Apr 2025 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517342; cv=none; b=lAWTLwX7gvL/6a2pN4fA4KTS8jAG04x+B4ZUkgzP7raaao6jSkNvCGDHhD7T7KAaUgWhmLnv4yONm/Ypjq0K8cuwHVzDrKKTXxn96UiwNs0kGGH3sRW67IsJXs2PFwPZXcaBYNx8M4LUhyFrzk0RBq5q3Qe/A3zcahPE0sRz0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517342; c=relaxed/simple;
	bh=1/8ZCtjaM+7YnLlEr/r3k4a0f7jCQQwIrTsQcIWIFfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pGicnVWgNDwJlUEj2cT3uY4GsbKm61XnIwYk5IUWXRdLZ8fHUTF03R5U7d3XNRHMJ0Jxbqe2x5EA5yNKHW8D+M4Tq2okNzJWltWyGdvRdvUgvhm4xw+4XIFJ7KoBpvm/lhspwvsaFlwitNc8ihOof5lQCycWEBLRGmnY8GPUVN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wfGcb9EW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.101] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 260A66F9;
	Tue,  1 Apr 2025 16:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743517218;
	bh=1/8ZCtjaM+7YnLlEr/r3k4a0f7jCQQwIrTsQcIWIFfY=;
	h=From:Subject:Date:To:Cc:From;
	b=wfGcb9EWGGtLR7aUghuWNN/KGRp6dKVvAK1MD1MjBcaVavLeHGkHbgBh5erGzjvMX
	 qYcCgX1iW9i2/4HU6xVdnYTzX1r5HfBVEAuIwJ5A5lSgO3VP03r12zx4RC56XLHsJ/
	 gEivRkE9KxmxldfwCTq9+80+fvUV7D7I9CIR6N8M=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v7 0/5] media: renesas: vsp1: Add support for VSPX and IIF
Date: Tue, 01 Apr 2025 16:22:00 +0200
Message-Id: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIj262cC/3XOTW7DIBCG4atErEs1M/zYdNV7RF1gGNcsaiK7Q
 o0i3704Gyy1Xn4jnlc8xMpL4lW8XR5i4ZLWlOc6upeLCJOfP1mmWLcgIANIShY9yZRG6TFGbzU
 EZ6Kor28Lj+nnWbp+1D2l9Tsv92e44H792ygoQXaDZkPOOeXG9xTZr3kesl/ia8hfYk8VapxIN
 06VgwLDKuDIFE+4alxh17iq3Crvh971NBg44frI+8Z15QgcddAY0JkTbo7cNW72z3sEbWzsHIU
 Tbg+csHFbubLIDrQCsv4fvm3bL6i6rh3gAQAA
X-Change-ID: 20250123-v4h-iif-a1dda640c95d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3354;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=1/8ZCtjaM+7YnLlEr/r3k4a0f7jCQQwIrTsQcIWIFfY=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn6/aRVBofGrmoV2ZA1kEaCKZW7XS+/fTPRuxoj
 DOyfuiJPOaJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ+v2kQAKCRByNAaPFqFW
 PD/JD/9l28mhEdzcD0fMZ6MXXY02w4Q1tmKlcLEV74VPs1iZlM48+nRqm1xW2mDosYxTGPSEqrT
 P9SDTPhUfue6XmSikF42bnv9Njr4ZTiMzeK82dqor8s76U99h1vBhuBYTqc9vtUP93rQ3+60xAD
 tnWE1oXbmGxsbqqzyaQ2S+jzhHpnDk3mq0WL9IW3a4/IgNyW4GMj2QZIWWdFfOfg+/gCn4rG943
 ZOnCS26XepjmIJ5nQLvO4ftb+U9YDzI1HCgxGPdpvawLW6ar+dIi8SqoI03E1I1OemvJEj6xzyJ
 bJdckWXSheKT/wQ4m3pK6PsGsv7QTQFQqT1d4nZYs435GuR7CzrNmXwfoc0s7fFvLZF5BsTtPv5
 I6owlfcv5WxmRzJcOXjYQm4P3Cga09Mhk5VuVCa9boszlbrK8vYPibjG+wbKAPIu/idUO0pZZfc
 vAfwFJn5HPS/A2xdG8N02SDJ21uiPbCr9j2voOdYCuLMqaCY0pgBPb3xZJBGuf/pkkVEf/gWnzQ
 NU8nRt7OiGRhVyN+gYH2Yc2LU3QWYV1nWfHyYFO7tjSHWb7gIdzv5l94a8EP648M6xhpKbDvnG0
 EV0jycRQqsF5PhCO/Icz1ftuH4OjfqaIQnvsCn/aSn4iSglUM9iggqbt1uToq1V3fVU3E0s0Ya0
 s9IZSLETBqMnBRw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The VSPX is a VSP2 function that reads data from
external memory using two RPF instances and feed it to the ISP.

The VSPX includes an IIF unit (ISP InterFace) modeled in the vsp1 driver
as a new, simple, entity type.

IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
interfacing. To prepare to support VSPX, support IIF first by
introducing a new entity and by adjusting the RPF/WPF drivers to
operate correctly when an IIF is present.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v7:
- Include VSPX driver in the series
- Use existing VSP1 formats and remove patches extending formats on RPF
- Rework VSPX driver to split jobs creation and scheduling in two
  different API entry points
- Fix VSPX stride using the user provided bytesperline and using the
  buffer size for ConfigDMA buffers
- Link to v6: https://lore.kernel.org/r/20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com

Changes in v6:
- Little cosmetic change as suggested by Laurent
- Collect tags
- Link to v5: https://lore.kernel.org/r/20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com

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
Jacopo Mondi (5):
      media: vsp1: Add support IIF ISP Interface
      media: vsp1: dl: Use singleshot DL for VSPX
      media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
      media: vsp1: rwpf: Support operations with IIF
      media: vsp1: Add VSPX support

 drivers/media/platform/renesas/vsp1/Makefile      |   3 +-
 drivers/media/platform/renesas/vsp1/vsp1.h        |   4 +
 drivers/media/platform/renesas/vsp1/vsp1_dl.c     |   7 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  24 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 +
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 121 +++++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  29 ++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   9 +
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |   9 +-
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c   | 604 ++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_vspx.h   |  86 +++
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  24 +-
 include/media/vsp1.h                              |  73 +++
 16 files changed, 991 insertions(+), 13 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250123-v4h-iif-a1dda640c95d

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


