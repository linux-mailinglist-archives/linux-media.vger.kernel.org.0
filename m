Return-Path: <linux-media+bounces-28572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C5A6BE78
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8345189C62A
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4991E5729;
	Fri, 21 Mar 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wHxzzEEA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95FE35948;
	Fri, 21 Mar 2025 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571945; cv=none; b=so361eq6QE2Z5hdaF4dOHgxuFKWb6ZgDAyKbiwSCc9bRs1HDEX+Bd+OkO5SiqQM0/0emEEmgEGdBJGs6/fms/++2JIRYeLd0m5ZxqGJF2AYiElAcIxpk1XFJ9ycjyJh7HCPBZHq3AEMX80YOQpm+avM44qEC0Q8peS841USIhDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571945; c=relaxed/simple;
	bh=B/Hm18KdQ0S7Ha1rJ5Cn8qq7cOEUuZFoLjvfcf2oD4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yw02fsyf3yOv/Xo7iLzsCKYzpG06P732qN/lkboE4v4i8j9JI5aQDXqzB47BjJr04pj4Tb6xl6bHRPVZ9ITXnS49REhvxhxN9JusUnm6I8wA8PMdHneFg2IfwGeo+rhUd49lOnmzWVnCgejR9vcausUCj5NPy62TBYd0vVuWXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wHxzzEEA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.109] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D2F92C5;
	Fri, 21 Mar 2025 16:43:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742571837;
	bh=B/Hm18KdQ0S7Ha1rJ5Cn8qq7cOEUuZFoLjvfcf2oD4o=;
	h=From:Subject:Date:To:Cc:From;
	b=wHxzzEEAT2cHaQiz2Ll/2FVfX8f+Omu6kYSjYwP0ZCwiBSwuGy0t9G8IjugFCiIbm
	 1VZVzFPgePkMlZC6q1cJZv3xhSR2YoN9VIjR7Y9Y42YakmWTmgOn880/9jhtAem3jf
	 K29J0aMUzEkpUcbs5gmJtZ4jOKOrcXiCzP/ToHc4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v6 0/7] media: renesas: vsp1: Add support for IIF
Date: Fri, 21 Mar 2025 16:45:32 +0100
Message-Id: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyJ3WcC/3XOwU7EIBDG8VfZcBbDDNB2PPkexgOFqeVg2YAhm
 k3fXboXNtEevwm/f7iJwjlyES+Xm8hcY4lpa2N4ugi/uu2DZQxtC1RoFaCW1awyxkU6CMENRnm
 yQbTX18xL/L6X3t7bXmP5SvnnHq5wXP82Kkglx9mwRSLStLzGwK6kbU4uh2efPsWRqtg5oukcG
 1daWdYeFsZwwnXnGsbOdeODdm6eaMLZqhNuHvnUuWkcFAfjDXgge8LtI6fO7fF5B8rYIYyE/h+
 +7/svpzsJQaEBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=B/Hm18KdQ0S7Ha1rJ5Cn8qq7cOEUuZFoLjvfcf2oD4o=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn3YmkUPcLSDCn8ROwBnZkmJmdq1/mM9MW8yozn
 1oYfUh2k/GJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ92JpAAKCRByNAaPFqFW
 PH2VEAC45zxeEcc4qPkZnpvycUhYPBO04OcE31oNtrvxo+8ms7I/CLA32HV2C/+0af2seJDY1S5
 Vw5+HVpwMBbT8XMtKGE3utrjeJnFUZnyoFUfZbUcRoYBbKuBmb2ufdqq7dLRBXu1/Natfop8JJv
 iGw4n947ChG3T2VO5RDEJ88hZ1QAcvCQCtdIfY2iVMHxnxztIwoVq37NQyTPbvQhXS1PgbCGljJ
 bokG9Vp5ScUsP9vST+5RlilToJIO0jAT9EBfKH02ycKP6FJI8FBTM9cU48G4WQa6Em4jEFaCZya
 9rxFmCH482Ey8DCG16DyIpfZ5fElYbE5mTQydpkqnoTAwOsx1movpq0wJp9s+j8kiSPpK04j5aA
 UiDVnzGZoWg7gi9G7QYnzFwSMJVaQO9OuT5M0UpnKVQjfe4FHqomXO+ybMpMTKCrb0hIEjj8KOu
 4FvDOvQIoQl53FYLl4qTamORliGO5UEOLtwm279sliSFxwOamsXdiGunfN6PtvAsN68r6obnsmS
 DbkRJacGH29F2MiMdiSkMjuW79AnIEdiaIwZhbOcOmuEQeWTByFN9ANODi+FovnENr3N7rAyTI/
 wCL5+wcoiH1VMR4qz5+Sjcb3MZZ7lkUUOnWIs6r+BEb4n/bdo9fv398Fd/6SZyHdksqmeikP0AJ
 EMTatdNbv1XrwZw==
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
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |  16 ++-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   |  91 ++++++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h   |   4 +
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  31 ++++--
 15 files changed, 379 insertions(+), 24 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250123-v4h-iif-a1dda640c95d

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


