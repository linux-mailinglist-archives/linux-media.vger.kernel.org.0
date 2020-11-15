Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46E22B36FF
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 18:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbgKORKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Nov 2020 12:10:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726727AbgKORKC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Nov 2020 12:10:02 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12A4124198;
        Sun, 15 Nov 2020 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605460202;
        bh=nLQvhMPRPmn8OBYUS7haupcAM25cdbBYOxtHEx0ld1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U84DhcaoqGc5ScNqf/gUzmoe3lK2x7woUgZ2YR83LVYwL4il15/VjE1A83CrMWzD4
         EqboYDLGRo+lHGcZ3VILVGxtMrtg4zqXdQ27FuDOoXg9eoSw7rFg7+xX2HLG+NpCGp
         Nf5csY7BoO+zqJ+LnWl6v2gXW/c48MlQgjuFwbAk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with HAVE_LEGACY_CLK
Date:   Sun, 15 Nov 2020 18:09:48 +0100
Message-Id: <20201115170950.304460-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201115170950.304460-1-krzk@kernel.org>
References: <20201115170950.304460-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

COMMON_CLK even though is a user-selectable symbol, is still selected by
multiple other config options.  COMMON_CLK should not be used when
legacy clocks are provided by architecture, so it correctly depends on
!HAVE_LEGACY_CLK.

However it is possible to create a config which selects both COMMON_CLK
(by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads to
compile errors (MIPS architecture):

    drivers/clk/clk.c:855:6: error: redefinition of ‘clk_unprepare’
    In file included from drivers/clk/clk.c:9:
    include/linux/clk.h:263:20: note: previous definition of ‘clk_unprepare’ was here

The definitions clk_bulk_prepare() (and unprepare) already have proper
surrounding #ifdef so add them also for clk_prepare()/clk_unprepare().

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f83dac54ed85..f4f68c7c2fb5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -841,6 +841,7 @@ static void clk_core_unprepare_lock(struct clk_core *core)
 	clk_prepare_unlock();
 }
 
+#ifdef CONFIG_HAVE_CLK_PREPARE
 /**
  * clk_unprepare - undo preparation of a clock source
  * @clk: the clk being unprepared
@@ -860,6 +861,7 @@ void clk_unprepare(struct clk *clk)
 	clk_core_unprepare_lock(clk->core);
 }
 EXPORT_SYMBOL_GPL(clk_unprepare);
+#endif
 
 static int clk_core_prepare(struct clk_core *core)
 {
@@ -921,6 +923,7 @@ static int clk_core_prepare_lock(struct clk_core *core)
 	return ret;
 }
 
+#ifdef CONFIG_HAVE_CLK_PREPARE
 /**
  * clk_prepare - prepare a clock source
  * @clk: the clk being prepared
@@ -941,6 +944,7 @@ int clk_prepare(struct clk *clk)
 	return clk_core_prepare_lock(clk->core);
 }
 EXPORT_SYMBOL_GPL(clk_prepare);
+#endif /* CONFIG_HAVE_CLK_PREPARE */
 
 static void clk_core_disable(struct clk_core *core)
 {
-- 
2.25.1

