Return-Path: <linux-media+bounces-40192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75135B2B29F
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 22:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148EF1BA2D55
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 20:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35473263F3C;
	Mon, 18 Aug 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CYDs611F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF983451A4;
	Mon, 18 Aug 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549742; cv=none; b=AdVo/kaoVC6emSOFhLvrFPeEGD7LTG8MeADuCxlD7DOWzxJU9PXnHskKaHuqqqWJ4jEteMhGACaL52qQ1wtjK7poab8ID0RQx3sRuqMMNdi8XCq/WQj7IYNMWgPxv+1wSf70Coz9FYUcn+zXV77NDROyiYUSYLra1n8Gk5smYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549742; c=relaxed/simple;
	bh=OXxtMVQVk+Z/GYSkhRsFPMgwnbFGXIz2anODCU92sYo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aGy5vcZ4q6epYNKeZuylb75ZVOtC5CJmyKMEoxQEgPMu4aUDz4rUky6VypdhIA9MTo22wYZdqxD+IiPIdm3o2bqagfKWL5ZCboF0YSJwdy3medsvU1c1qu9CxRsI7UOe35JPVcbaIV7NHIT8W2Ij+1/IAQms9YGCxx8bgD1B5lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CYDs611F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D397C64;
	Mon, 18 Aug 2025 22:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755549678;
	bh=OXxtMVQVk+Z/GYSkhRsFPMgwnbFGXIz2anODCU92sYo=;
	h=From:Subject:Date:To:Cc:From;
	b=CYDs611F0srggIAMukGJitClAyvRfxy4q/4QNwZ0h4XMyEfYKvTuzRK/yb/kpEAx7
	 BeLeslrXFQg/i/dLu2DC4ZBSJ32TnAWEoD0583d6S9wtNqyWZzzMYgfM0QN2EkgBz1
	 oy1sBU53d2EX7YYrY1Xs/774thl/oTRC4Rm/Hhi0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v3 0/2] media: pci: Fix invalid access to file *
Date: Mon, 18 Aug 2025 22:39:35 +0200
Message-Id: <20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIiPo2gC/33MTQ6CMBCG4auQWVvTHyjgynsYF6WdyiRKTWsaD
 OHuFtbqZpJ3ku9ZIGEkTHCqFoiYKVGYSqhDBXY00w0ZudIguWx4Jzpm53JyfZfMj6xFY7Toe+8
 cQpk8I3qad+5yLT1SeoX43vUstu8PKAvGmfYoGtVqPlg8k0OTwjQEE93RhgdsXpb/DFkM5Rtls
 ZZKa/XFWNf1A0BjxjDzAAAA
X-Change-ID: 20250818-cx18-v4l2-fh-7eaa6199fdde
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=OXxtMVQVk+Z/GYSkhRsFPMgwnbFGXIz2anODCU92sYo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoo5AlVqOdpRTiI1zCHhrH7rA3ZmQa/+Zp7BD7f
 tURcWUg1vCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKOQJQAKCRByNAaPFqFW
 PGVRD/0es6wI+NkeZOHfoNDLfY5solkVXLMPdfSiZB7ixB1n3Iw8daPfhWgXOh0j/uZhz+azihq
 W/tv/r57p6xXxYCRk2sng9kQt3zB84BeUjcSLTuqDkL5M802vQAZYwv//NF/0aRkKw5K4mII/Pe
 fDFMMFDoJPCLhuBAGSbtJzFLJ95h47co7h2c4kN4aDny6eEVmomSodBHmTy8bzCOPrBR2f1r1jl
 CiC2D8LV1i4wqejAI4l5c0+wTdPByggVye8b4F4bSneRhCKNTB6YzE2y1spTd/ti+X/W1azw4ye
 W+0kPWA0xh8EONL6GPqXs1+R0ORniOGge0RPhzpQjssHSDGUunYpNzSDaKUwc3YljXh0GfmJ4XS
 tpARM4UJcn/oPX5YsvkMPaWHDWqUH6mY6yEQU7S+DU8GUWRvPrcq/W/AILkWOQ6P9XV+3j11qTJ
 dY1FGpRHZmoMYokPIcsZ7ehpaHEPs/BNgA8Le1ahcdmVeaQzvJDH+ewk4TD+Rpg0iRb2yZb+D6r
 tQcuWL+VrGtmmv7/FNbeJcbQPl7IyhSBaEaZvKtAQ51x2BkGzWObR9K4rr37hkV5QJXKOGkoAZH
 EFhmA6NLHtg3XnNsWLbwI8D39BU33ElijkvL80odD+z+eJ1RR+5sv812f5gtAHimss1e99Y34kl
 QYRMOaD2pBLZIWw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Since commits
7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")

All the ioctl handlers access their private data structures
from file *

The ivtv and cx18 drivers call the ioctl handlers from their
DVB layer without a valid file *, causing invalid memory access.

The issue has been reported by smatch in
"[bug report] media: cx18: Access v4l2_fh from file"

Fix this by providing wrappers for the ioctl handlers to be
used by the DVB layer that do not require a valid file *.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v3:
- Change helpers to accept the type they're going to operate on instead
  of using the open_id wrapper type as suggested by Laurent
- Link to v2: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com

Changes in v2:
- Add Cc: stable@vger.kernel.org per-patch

---
Jacopo Mondi (2):
      media: cx18: Fix invalid access to file *
      media: ivtv: Fix invalid access to file *

 drivers/media/pci/cx18/cx18-driver.c |  9 +++------
 drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
 drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
 drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
 drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
 drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
 6 files changed, 52 insertions(+), 34 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


