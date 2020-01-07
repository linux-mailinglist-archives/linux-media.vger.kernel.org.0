Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDA16131D0E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 02:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgAGBOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 20:14:22 -0500
Received: from mga12.intel.com ([192.55.52.136]:60822 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbgAGBOW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 20:14:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jan 2020 17:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; 
   d="scan'208";a="216992316"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2020 17:14:21 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video Engine support
Date:   Mon,  6 Jan 2020 17:15:02 -0800
Message-Id: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AST2600 has Video Engine so add the compatible string into the
document.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 Documentation/devicetree/bindings/media/aspeed-video.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
index ce2894506e1f..d2ca32512272 100644
--- a/Documentation/devicetree/bindings/media/aspeed-video.txt
+++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
@@ -1,11 +1,12 @@
 * Device tree bindings for Aspeed Video Engine
 
-The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs can
+The Video Engine (VE) embedded in the Aspeed AST2400/2500/2600 SOCs can
 capture and compress video data from digital or analog sources.
 
 Required properties:
  - compatible:		"aspeed,ast2400-video-engine" or
-			"aspeed,ast2500-video-engine"
+			"aspeed,ast2500-video-engine" or
+			"aspeed,ast2600-video-engine"
  - reg:			contains the offset and length of the VE memory region
  - clocks:		clock specifiers for the syscon clocks associated with
 			the VE (ordering must match the clock-names property)
-- 
2.17.1

