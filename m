Return-Path: <linux-media+bounces-7194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A00987E822
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 12:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7FE1F24056
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 11:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70AA3612C;
	Mon, 18 Mar 2024 11:08:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFC636114;
	Mon, 18 Mar 2024 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710760138; cv=none; b=oOEAC9Rk5czi7w2Gk+qFT4r8OmXb9+3To9qIw0cGe8H4c3nZhmWCpvSUPah4SbxOcnAlSnDjWqjtNNLFXqLj7WCuyevhhscMXBEvOBkO5/9PWEzHTTFZi0zy/gxubSSCQXkHO4C+jTRm2NEuYjl6pN89n/ROKUsXKjb7pHE8hHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710760138; c=relaxed/simple;
	bh=1qp1+iIIl0oIp7/VnYGFV/kG/8O0XqPFjYk9KOA3cR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T2ejr5OEI60fPLJMSw2y/ewsEMcrKnsxtaq6qM0BPS3hs7iSayhRbKzW3vaTzBElCUWMPy2Y0K20C4DB/HySkNqs0C1u/VBkgJYEglSHlLB/eh4gRu7keEozym6pT61wDegZ3hq3eUk3a3fKErTq5ldAaxThHmkI9UTojyclCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198188828"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 18 Mar 2024 20:08:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2EBED4253BE5;
	Mon, 18 Mar 2024 20:08:44 +0900 (JST)
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
Subject: [PATCH v3 0/3] Add clk_poll_disable_unprepare()
Date: Mon, 18 Mar 2024 11:08:39 +0000
Message-Id: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently documentation related to disabling of clock do not state
it is synchronous or asynchronous clock gating. So, make it clear it is
driver dependent.

The clk_disable_unprepare() doesn't guarantee that a clock is gated after
the execution as it is driver dependent. The Renesas and most of the other
platforms don't wait until clock is stopped because of performance reason.
But these platforms wait while turning on the clock.

The normal case for shutting down the clock is unbind/close/suspend or
error paths in the driver. Not waiting for the shutting down the clock
will improve the suspend time.

But on RZ/G2L Camera Data Receiving Unit (CRU) IP, initially the vclk is
on. Before enabling link reception, we need to wait for vclk to be off
and after enabling reception, we need to turn the vlck on. Special cases
like this requires a sync API for clock gating.

Add clk_poll_disable_unprepare() to poll the clock gate operation that
guarantees gating of clk after the execution.

v2->v3:
 * Added WARN_ON(enable count non-zero) and return an error code (-EBUSY),
   if the user is not the sole user of the clock and the enable count is
   non-zero.
 * Returned an error if there's no is_enabled() callback.
RFC->v2:
 * Updated cover letter description and header.
 * Created patch#1 for updating existing documentation.
 * Renamed clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
 * Redesigned to make use of __clk_is_enabled() to poll the clock gating.

Biju Das (3):
  clk: Update API documentation related to clock disable
  clk: Add clk_poll_disable_unprepare()
  media: platform: rzg2l-cru: rzg2l-video: Use
    clk_poll_disable_unprepare()

 drivers/clk/clk.c                             | 32 +++++++++++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  5 +-
 include/linux/clk-provider.h                  |  3 +-
 include/linux/clk.h                           | 49 ++++++++++++++++++-
 4 files changed, 85 insertions(+), 4 deletions(-)

-- 
2.25.1


