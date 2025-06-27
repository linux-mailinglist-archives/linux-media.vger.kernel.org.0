Return-Path: <linux-media+bounces-36055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C92AEAC28
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01214A7982
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3837081A;
	Fri, 27 Jun 2025 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ki1VJ7Dt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C33FF1;
	Fri, 27 Jun 2025 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986416; cv=none; b=hzBtEv+L1cVZ3xDyzL+snXxoWN/gYa1P7LlHz90VkjZUNQIgmmxnjZPmU9QWw+5v73rW1hb/QQcdBX/ZOiijtqPkX8zmGFAnCqJ5DwsMLGTqTcuYdCI1iRcnsHRN1s4M7McRwxULsHPPewDTGYcECdX3njf0sO05Z+ows0TugDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986416; c=relaxed/simple;
	bh=wtlsORu13UCAA4aV7x/B2uSQ50GX6pj6+sSkEpKa1TM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ODoLf1ybepJA4k+H3AuSnVIP16IbFyH6FWB6O2AzQtAh2zuSXuv4ErlKGt6rn7WbpucZlDlO77CXc/WOylYRJ/7TdOJkO7qdnJLI3Pc7SlIFTasVAg2X7HhDhQcsawyowQcTN/laUlwjzuIrvoCBB7bI7QwVWHAd95W/mPPLc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ki1VJ7Dt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D712173B;
	Fri, 27 Jun 2025 03:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750986393;
	bh=wtlsORu13UCAA4aV7x/B2uSQ50GX6pj6+sSkEpKa1TM=;
	h=From:Subject:Date:To:Cc:From;
	b=Ki1VJ7DtJ71esov07rQp6bb4tM+e12UGJvwoHHnaAN1z8vZTI7Quc8goDBmfKvrRg
	 ONH2vYYi+cnIg98y3qFvt4SmIsFaId44NSKcChGYKQwVKrqWh3FYReISjuXBCko6vv
	 sGFB+DQ7IbSq1Jiq1tiAjAvMf1oEZNqHmZAXiLnA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/6] media: ti, cdns: Multiple pixel support and misc
 fixes
Date: Thu, 26 Jun 2025 18:06:05 -0700
Message-Id: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3uXWgC/23MSwrCMBSF4a1IxkbyaK06ch8iktyc2gxsSiJBK
 d27aRGk4PDcy/+NLCF6JHbajCwi++RDX4bebhh1pr+De1c2U0LVQsuKDzFY3Fr/QuINBEhralq
 AlWKIWB4luFzL7nx6hvhe8Czn69dRaydLLnhNrrZHSGoNnb2DSaG3wUS3o/BgM5fVj6ikWBOqE
 AchLe0BW+o/xDRNH5kRDELwAAAA
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
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=wtlsORu13UCAA4aV7x/B2uSQ50GX6pj6+sSkEpKa1TM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoXe6hWQJ6jYOA37I5J0UnWz/F8NO3Y25xnwov4
 Nnyb2immHOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaF3uoQAKCRBD3pH5JJpx
 RcZkD/9wGtGcziYqXfycZy/jAKSKqVpv0PtHQ4l0TeAKdFLrUgl/GUQzn+y+qYJI51PKthd2sOS
 hB1rIqffi4bg+c4nrs6ngdj/jDLXaBMVW4ZMSw20f6npDJWLlF7IEm0icKu3rGafOwvpsi6TZo2
 I6SlCYQN/iD48fc9OOGjDoIWhwlkHrSBLeK1gup0bQ+uJz6m6k6ONAclTdRTMpcrDIty8/6FCNZ
 07zlGfddvyXAZ9dB3FhyYZXszWXgKIqsKqEegZ5LxdSc5A5BrCTg9TfJgYZhqrgnyE19cVlU4hH
 LAE3Wu//h9uF68uNR4wPlTUXg4NsTcGaSih/xiNETINNMcAJJWw+81y971SddTrvgEQ+3Wrg/b/
 If3C34+irMuX6e/BkeswkkdeuNHz0l8Z043p/AagpOAtsLRqtyNKoTaC4pmB+UUYlo7pmSFFZ4o
 MngB4aZoT2RSYpf5hAMhNmN6s1Wt3QLuxMGNN4JEwIyKcA465rez7YRas8AJ3Lcfaj9wk+d1wva
 YILvWU5sMtLwfEPjSwZn4Pj/uhkkYq0kf0AIO9iFsjf6mSNLU9MAxVroYjRcn5cPq15oqN8U0Oy
 /q3kwfreGetm0xy/Bm/w0plIK856BQXxpA7t9/z9t9zLWIl4maU6ohD0M1fJHzFa5oPzLyEDHdC
 a+UTOEnJjUBNFNQ==
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
Changes in v3:
- Move cdns-csi2rx header to include/media
- Export symbol from cdns-csi2rx.c to be used only through
  the j721e-csi2rx.c module namespace
- Other minor fixes suggested by Sakari
- Add Abhilash's T-by tags
- Link to v2: https://lore.kernel.org/r/20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com

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

 MAINTAINERS                                        |  1 +
 drivers/media/platform/cadence/cdns-csi2rx.c       | 74 ++++++++++++++++------
 drivers/media/platform/ti/Kconfig                  |  3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 65 ++++++++++++++-----
 include/media/cadence/cdns-csi2rx.h                | 19 ++++++
 5 files changed, 127 insertions(+), 35 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250314-probe_fixes-7e0ec33c7fee

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


