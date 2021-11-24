Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC8F45CD27
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245176AbhKXT1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:27:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:57728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242493AbhKXT1p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:27:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3008760F45;
        Wed, 24 Nov 2021 19:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781875;
        bh=ubDVyjX2Vo52C6T2PtSywkFN1CZ0+cdakXsmN5iY0Mg=;
        h=From:To:Cc:Subject:Date:From;
        b=sbxkrw9Ih+aIhGSCa1xNAxISTcAj6Mn4RkIAjiHlb3HG/GI1asqhVfloeA07ESdBJ
         os5bD3+4S2LKaNHyqPaRCOicPRA6KEcbgQBtkLdLIiqSytU4402AmZKArQvGncsj9g
         2EBMlfEBTo/L3L5AiYLfz9rNQebg6dnxlFg+y6qUAoQE+4gbYI2ELcHDKEGNlLDD2c
         J0XPU77wVC3FgzyAotHXnP9xfQI162k0a6eBMpEBEI2/r3F9M+OFOZZYmj01OGs0XG
         Nh5nI70qWrpDfffcqarDAQ86dM449x0X0yvuPjHsvPUfOv09O+JoZYttsmkwRlI48y
         216ihFDsukr8w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vaibhav Hiremath <hvaibhav@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Dominic Curran <dcurran@ti.com>,
        David Cohen <dacohen@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] media: omap3isp: fix out-of-range warning
Date:   Wed, 24 Nov 2021 20:24:15 +0100
Message-Id: <20211124192430.74541-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

clang points out that the 8-bit height/width values never exceed
the range of that type when building with 'make W=1 LLVM=1':

drivers/media/platform/omap3isp/isph3a_af.c:173:6: error: result of comparison of constant 256 with expression of type '__u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (IS_OUT_OF_BOUNDS(paxel_cfg->height, OMAP3ISP_AF_PAXEL_HEIGHT_MIN,
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/omap3isp/isph3a_af.c:24:33: note: expanded from macro 'IS_OUT_OF_BOUNDS'
        (((value) < (min)) || ((value) > (max)))
                               ~~~~~~~ ^ ~~~~~
drivers/media/platform/omap3isp/isph3a_af.c:179:6: error: result of comparison of constant 256 with expression of type '__u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (IS_OUT_OF_BOUNDS(paxel_cfg->width, OMAP3ISP_AF_PAXEL_WIDTH_MIN,
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/omap3isp/isph3a_af.c:24:33: note: expanded from macro 'IS_OUT_OF_BOUNDS'
        (((value) < (min)) || ((value) > (max)))
                               ~~~~~~~ ^ ~~~~~

Add a cast to 32-bit to avoid the warning. Checking just the lower bounds
would be sufficient as well, but it seems more consistent to use
the IS_OUT_OF_BOUNDS() check for all members.

Fixes: 68e342b3068c ("[media] omap3isp: Statistics")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/omap3isp/isph3a_af.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isph3a_af.c b/drivers/media/platform/omap3isp/isph3a_af.c
index a65cfdfa9637..c544d9c812b0 100644
--- a/drivers/media/platform/omap3isp/isph3a_af.c
+++ b/drivers/media/platform/omap3isp/isph3a_af.c
@@ -170,13 +170,13 @@ static int h3a_af_validate_params(struct ispstat *af, void *new_conf)
 			     OMAP3ISP_AF_PAXEL_VERTICAL_COUNT_MAX))
 		return -EINVAL;
 
-	if (IS_OUT_OF_BOUNDS(paxel_cfg->height, OMAP3ISP_AF_PAXEL_HEIGHT_MIN,
+	if (IS_OUT_OF_BOUNDS((u32)paxel_cfg->height, OMAP3ISP_AF_PAXEL_HEIGHT_MIN,
 			     OMAP3ISP_AF_PAXEL_HEIGHT_MAX) ||
 	    paxel_cfg->height % 2)
 		return -EINVAL;
 
 	/* Check width */
-	if (IS_OUT_OF_BOUNDS(paxel_cfg->width, OMAP3ISP_AF_PAXEL_WIDTH_MIN,
+	if (IS_OUT_OF_BOUNDS((u32)paxel_cfg->width, OMAP3ISP_AF_PAXEL_WIDTH_MIN,
 			     OMAP3ISP_AF_PAXEL_WIDTH_MAX) ||
 	    paxel_cfg->width % 2)
 		return -EINVAL;
-- 
2.29.2

