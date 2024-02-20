Return-Path: <linux-media+bounces-5487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DCF85B963
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 11:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D85D1F21DE9
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 10:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBC6657CA;
	Tue, 20 Feb 2024 10:43:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAE762178;
	Tue, 20 Feb 2024 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708425832; cv=none; b=prpszjHAdsBKwUNPDePVDKJJCTTn3SrzElNM9nQbnB9lBpvUs0nvrlQjgMeV3bteBhRHuqb86129YvVnbhLyIC+bWyn8iLXArIJiFcbsTpjKUGCfepsiaCd9Gf29E4K1UEHx+//vbQv/9xTOKeSgsgyjM8RQ/Yem63JQC0XX07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708425832; c=relaxed/simple;
	bh=gJNDcnnI5rP7McNDysSXsx8zm9W44QaG4sKI/u39w2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r5KfhBMM9qVg6oz0vIRU+IC9cLA0yo4F5RwPAc0oCBRQawONWeKEy0KFpqfmjQdh7EY4xZCax74O3CqycK7+D5b7kLZcnB/bVP8ImimFNc0KHw11LZtqxLtApu6Ngr70nxb8shjBSLxv9O/mBJgq5TJHRiLP8Z5vjPwbN/XInh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="198515560"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Feb 2024 19:43:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.246])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B40E24001942;
	Tue, 20 Feb 2024 19:43:38 +0900 (JST)
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
Subject: [PATCH v2 0/3] Add clk_poll_disable_unprepare()
Date: Tue, 20 Feb 2024 10:43:33 +0000
Message-Id: <20240220104336.260194-1-biju.das.jz@bp.renesas.com>
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

 drivers/clk/clk.c                             | 26 +++++++++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  5 +-
 include/linux/clk-provider.h                  |  3 +-
 include/linux/clk.h                           | 49 ++++++++++++++++++-
 4 files changed, 79 insertions(+), 4 deletions(-)

-- 
2.25.1


