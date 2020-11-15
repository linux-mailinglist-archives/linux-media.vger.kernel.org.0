Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48CF2B3706
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 18:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbgKORKK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Nov 2020 12:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:38782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726727AbgKORKJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Nov 2020 12:10:09 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 002F9241A3;
        Sun, 15 Nov 2020 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605460209;
        bh=aEUp0B6gKWhexMWTFrPQ6syXXhv4DwFr18aY9X2Sbr4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V3qmWys4GJ+55sDezEl4qwyS2jtjIpQxwkjiulc5KFvkI+vJCfm4rOLTN9AT5rm0A
         JEbL/6hsbV5Rrd/6V9E5W4GCWcH05U1/mPxqBpjyu7Z4AaaGQdcFhlqtd4pdo+gZcR
         5Q7MEWczSaK2Z4Rh4Qha8JOyb67INOYvrXzJIX/U=
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
Subject: [RFC 3/3] media: atomisp: do not select COMMON_CLK to fix builds
Date:   Sun, 15 Nov 2020 18:09:50 +0100
Message-Id: <20201115170950.304460-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201115170950.304460-1-krzk@kernel.org>
References: <20201115170950.304460-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

COMMON_CLK is a user-selectable option with its own dependencies.  The
most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
should not select COMMON_CLK because they will create a dependency cycle
and build failures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/staging/media/atomisp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 37577bb72998..742edb261d85 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -2,9 +2,9 @@
 menuconfig INTEL_ATOMISP
 	bool "Enable support to Intel Atom ISP camera drivers"
 	depends on X86 && EFI && PCI && ACPI
+	depends on COMMON_CLK
 	select IOSF_MBI
 	select MEDIA_CONTROLLER
-	select COMMON_CLK
 	help
 	  Enable support for the Intel ISP2 camera interfaces and MIPI
 	  sensor drivers.
-- 
2.25.1

