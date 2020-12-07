Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C9B2D163D
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 17:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgLGQel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 11:34:41 -0500
Received: from mga12.intel.com ([192.55.52.136]:51450 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727787AbgLGQek (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 11:34:40 -0500
IronPort-SDR: QZJBdVm4QQdZzng+D4Haj/djl9+en+uOxh0UsT1GK1KyOsnYEiohQLyXWpE/QQRUiwgUcChmMb
 1Q26I/lxxGVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="152970118"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="152970118"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 08:32:54 -0800
IronPort-SDR: coNPy9GHDOkBDjLa82uh0mCydYyGFT5e8cF+5+dl1vrR0E0dThdvnumCB4Bqn+s9sGK+PF5jeU
 pPgSyaGEQxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="317246201"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 08:32:53 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 0/2] Fix kernel panic issues caused by AST2500 Video Engine
Date:   Mon,  7 Dec 2020 08:42:38 -0800
Message-Id: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video engine uses eclk and vclk for its clock sources and its reset
control is coupled with eclk so the current clock enabling sequence works
like below.

 Enable eclk
 De-assert Video Engine reset
 10ms delay
 Enable vclk

It introduces improper reset on the Video Engine hardware and eventually
the hardware generates unexpected DMA memory transfers that can corrupt
memory region in random and sporadic patterns. This issue is observed
very rarely on some specific AST2500 SoCs but it causes a critical
kernel panic with making a various shape of signature so it's extremely
hard to debug. Moreover, the issue is observed even when the video
engine is not actively used because udevd turns on the video engine
hardware for a short time to make a query in every boot.

To fix this issue, this commit changes the clock handling logic to make
the reset de-assertion triggered after enabling both eclk and vclk. Also,
it adds clk_unprepare call for a case when probe fails.

In case of AST2600, the video engine reset setting should be coupled with
eclk to match it with the setting for previous Aspeed SoCs which is defined
in clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
driver. Also, reset bit 6 is defined as 'Video Engine' reset in datasheet
so it should be de-asserted when eclk is enabled. This commit fixes the
setting too.

Please review this patch series.

Jae Hyun Yoo (2):
  clk: ast2600: fix reset settings for eclk and vclk
  media: aspeed: fix clock handling logic

 drivers/clk/clk-ast2600.c             | 4 ++--
 drivers/media/platform/aspeed-video.c | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.17.1

