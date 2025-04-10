Return-Path: <linux-media+bounces-29870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCFA83A01
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 654553A2161
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7B02046AF;
	Thu, 10 Apr 2025 06:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B7WavQWr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08520409F;
	Thu, 10 Apr 2025 06:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268229; cv=none; b=Yb1kJt/eHRO3X6CNDj3Aty9f9MEIsXAuPk5ANaPrWBLQnG5GMwK0unalS1uQ0GIYK50Ca+DnKv8DEAKRljVxGkodgJRk1x7LLsle5JfPodVGc+6MpKNBS2WcBfyg5A3TAviGkFxlqBrufPwSCaauqXAT+2Tt2MR9El/07KZ1PlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268229; c=relaxed/simple;
	bh=nfZ/qaCPBRBC+1jXUho0dbH11syiIaVwTmwsgMbqKN4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G3FtJk+92ElaV2WqM2kIayN/PjcCQkPVZD4IQj7XWIVeesz21U0xJFcbr4xq4yRX20bz1e7SzwHFT6pnU77B2xh3J1/VSJyq10Rf4Jkfegda6oPdAemCHW8pKpMDuRTP2viapvPBOVxvm1wDdetwzryrYbroebrRvTi8kRUZtio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B7WavQWr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D3BF352;
	Thu, 10 Apr 2025 08:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744267654;
	bh=nfZ/qaCPBRBC+1jXUho0dbH11syiIaVwTmwsgMbqKN4=;
	h=From:Subject:Date:To:Cc:From;
	b=B7WavQWry6UOc91+kOpcy0Jex2kmF8oQYe4gwHn1e50RhqLKl6lMyj1k7nemN5aTL
	 G2Ey4Gc4w8lrSbDXip3e6RcG02tD9XxHfDlhIjkrot+a+0DQm73OBrIqZd1CX6lbLV
	 Nto8GO06wcVoEH2ZxFs4XSuR8J22IAw+0ZKui160=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/6] media: ti, cdns: Multiple pixel support and misc
 fixes
Date: Thu, 10 Apr 2025 12:18:58 +0530
Message-Id: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpp92cC/1WMQQ6CMBREr0L+2pq2SIiuvAchpvwO8hdS0hqiI
 b27lbhx+Wby3kYJUZDoUm0UsUqSMBewh4p4cvMdSnxhsto2ujYntcQw4DbKC0m10OC65nYEqBh
 LxH4UoesLT5KeIb73+Gq+669j/zurUVo17JvhDMOj46t4uBTmIbjojxwe1OecP+BadtatAAAA
X-Change-ID: 20250314-probe_fixes-7e0ec33c7fee
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1935;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=nfZ/qaCPBRBC+1jXUho0dbH11syiIaVwTmwsgMbqKN4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn92n3h1WpxYc5U+5o8ZhWdDvQsy/67YALCVx+Q
 LKcf5r7SrOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/dp9wAKCRBD3pH5JJpx
 RedBEADMoVa6NazGysA+dKxVB4RPurD9DkKRcUp7xqEWs3YyTp1DtvP3blvpD7rdZz+YAQQeyOL
 4BFroN+n9O8Y5pDEnheys4FxlGz9ct21Z5Kc0Tq7eDGSnGGyihkxW96qZP6K5XcBjVyc8JvPb5u
 pYHJyEDGefZsoCoTjZahgO74VFf1XzqvxM888C0Rv3pnv2RkHNXdksxaw9/0LLMpC9tVEj8iE/N
 r+X4IpUufMkIkzxzcDxaMdRUO+f0ntj07LLmj3jkWcl8ejq+A7kOhg3/d8pE0bvvtjBv/Key/M3
 GYJU5Vzgq6TjzvFkGqSAHcrqIETdpytMAUBNUgkFBGE3jaSXO8TT2n2TqK10doWZB0PLyltMGh8
 CkRJvKXDne8j//bgajYiFDltgoeTq9Z2kp4/SzIsCK6lgt4gbahHpS0i8yLvWLop9zokV7QoJwZ
 4IbZGfCv94oaD7boTem5yImIvK6DuGUxHlXX6NAThzvJXbHboXFKWbl8hkwXfY/WAMZT/75yqQP
 yAdBjMSBMCdyPbb/K/zSELcsxpLoyE22mgKgG1dB24ymebd04TfyD0QT3Q4dkneKAZoQayiRNYD
 4xul3H9s/E6xHbtvgBtkWbFCXg5VM0vhNalziO1EcouRsbpKWvjcgO1+Zr9qVnzvXDGjOgcXLO0
 NE3DJdQRpY7cm4A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

The first four patches in this series are miscellaneous fixes and
improvements in the Cadence and TI CSI-RX drivers around probing, fwnode
and link creation.

The last two patches add support for transmitting multiple pixels per
clock on the internal bus between Cadence CSI-RX bridge and TI CSI-RX
wrapper. As this internal bus is 32-bit wide, the maximum number of
pixels that can be transmitted per cycle depend upon the format's bit
width. Secondly, the downstream element must support unpacking of
multiple pixels.

Thus we export a module function that can be used by the downstream
driver to negotiate the pixels per cycle on the output pixel stream of
the Cadence bridge.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Rebase on v6.15-rc1
- Fix lkp warnings in PATCH 5/6 missing header for FIELD_PREP
- Add R-By tags from Devarsh and Changhuang
- Link to v1: https://lore.kernel.org/r/20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com

---
Jai Luthra (6):
      media: ti: j721e-csi2rx: Use devm_of_platform_populate
      media: ti: j721e-csi2rx: Use fwnode_get_named_child_node
      media: ti: j721e-csi2rx: Fix source subdev link creation
      media: cadence: csi2rx: Implement get_fwnode_pad op
      media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
      media: ti: j721e-csi2rx: Support multiple pixels per clock

 drivers/media/platform/cadence/cdns-csi2rx.c       | 76 +++++++++++++++++-----
 drivers/media/platform/cadence/cdns-csi2rx.h       | 19 ++++++
 drivers/media/platform/ti/Kconfig                  |  3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 66 ++++++++++++++-----
 4 files changed, 129 insertions(+), 35 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250314-probe_fixes-7e0ec33c7fee

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


