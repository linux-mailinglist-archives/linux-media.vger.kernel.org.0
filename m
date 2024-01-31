Return-Path: <linux-media+bounces-4515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E955E8443C3
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 17:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4760CB28404
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 16:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD5912AAC5;
	Wed, 31 Jan 2024 16:09:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484E469D05;
	Wed, 31 Jan 2024 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717398; cv=none; b=Yh8Qw9S7PbTFd8ohvFwAj1ZlUJbS/vJbRLwvnHkBr2Aj+3DyahPTaWKHa+0H7hj8g8Rj6f4Nx912JnTX78pzURhFgNtVYLMKlkXFtEa3BKoOJFwnPjOF4Jc0mkYfpLOyXHSb0nRSfc5ENdM24/sA6nRACz85zkIePC84Ai2Vne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717398; c=relaxed/simple;
	bh=MwIxIYeYpTcB9h848/ZPazREWf6wyNf1jMcp3F1E58s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YJmdn++CZqdWbdi5+4GhwRTcVRzl1bjY8mAeWgFNZy/t8JagfkVhedOXimrWcHgWv15pXt2NdoP4FzfE/OTkaYs4ZgxuJeDCMGFPWWk0uaw3A31Q9Tckx/2SRYq47wcwDmNXvoUp5YHYa/axU2HVF/V7V0zh2D3P0ZuO0bFoxSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,231,1701097200"; 
   d="scan'208";a="192402235"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Feb 2024 01:09:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 926864007129;
	Thu,  1 Feb 2024 01:09:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Russell King <linux@armlinux.org.uk>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 0/3] Add clk_disable_unprepare_sync()
Date: Wed, 31 Jan 2024 16:09:44 +0000
Message-Id: <20240131160947.96171-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently clk_disable() is not synchronous. Consumers just
gate the clock, but it doesn't check actually the clock is
gated.

On RZ/G2L SMARC EVK before starting link reception we need to
make sure the video clock is off, then start reception and
turn video clock back to on.

Introduce clk_disable_unprepare_sync() to synchronize
the clock gate operation.

Note:
 patch#3 depend upon [1]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240130164115.116613-5-biju.das.jz@bp.renesas.com/

Biju Das (3):
  clk: Add clk_disable_unprepare_sync()
  clk: renesas: rzg2l: Add disable_sync() callback
  media: platform: rzg2l-cru: rzg2l-video: Use
    clk_disable_unprepare_sync()

 drivers/clk/clk.c                             | 36 ++++++++++++++-----
 drivers/clk/renesas/rzg2l-cpg.c               | 23 ++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  2 +-
 include/linux/clk-provider.h                  |  4 +++
 include/linux/clk.h                           | 25 +++++++++++++
 5 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.25.1


