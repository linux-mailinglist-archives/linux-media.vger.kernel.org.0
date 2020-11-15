Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619AA2B36FC
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 18:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgKORJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Nov 2020 12:09:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:38394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726727AbgKORJ7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Nov 2020 12:09:59 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 959FA221F9;
        Sun, 15 Nov 2020 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605460198;
        bh=fee1rS1X9ukahSpmLtq+PGaQQ1AAS2rXNMd0fRThlYs=;
        h=From:To:Cc:Subject:Date:From;
        b=AnQeEgA9bNSfhvUCOS3w3bCa8X0kwOcYH0QB3FMsiNa2AEYHo4IWcCZgbVcUFzZEK
         Fyib85P/hVkKknFKsgPJdQ39r5/4wJ3jXrdYUjs0aKFiPaVvUMcB2bsoEJzhfwXQhY
         X7r4oFKQ7bcvRYg6550q2TciSAaeVEs90nDg9P10=
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
Subject: [PATCH 0/3] clk/sunxi/media: Fix builds with COMMON_CLK and HAVE_LEGACY_CLK
Date:   Sun, 15 Nov 2020 18:09:47 +0100
Message-Id: <20201115170950.304460-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Multiple configurations create unbuildable config by selecting
COMMON_CLK and HAVE_LEGACY_CLK.  The first simply should not be
selected.

The patches 2/3 and 3/3 address this specific problem.  I performed few
compile tests and I am still building other configurations, therefore
they were marked as RFC.

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  clk: fix redefinition of clk_prepare on MIPS with HAVE_LEGACY_CLK
  ARM: sunxi: do not select COMMON_CLK to fix builds
  media: atomisp: do not select COMMON_CLK to fix builds

 arch/arm/mach-sunxi/Kconfig           | 1 +
 drivers/clk/clk.c                     | 4 ++++
 drivers/staging/media/atomisp/Kconfig | 2 +-
 sound/soc/sunxi/Kconfig               | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1

