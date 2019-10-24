Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949FBE3231
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 14:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439684AbfJXMXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 08:23:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:19211 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbfJXMXH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 08:23:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 05:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="188573403"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Oct 2019 05:23:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A9FC51CB; Thu, 24 Oct 2019 15:23:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] [media] bt819: Reduce amount of F* words in the world
Date:   Thu, 24 Oct 2019 15:23:04 +0300
Message-Id: <20191024122304.15736-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace F* word with something less offensive.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/bt819.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/bt819.c b/drivers/media/i2c/bt819.c
index 43336175c7d9..73bc50c919d7 100644
--- a/drivers/media/i2c/bt819.c
+++ b/drivers/media/i2c/bt819.c
@@ -157,7 +157,7 @@ static int bt819_init(struct v4l2_subdev *sd)
 		0x12, 0x04,	/* 0x12 Output Format */
 		0x13, 0x20,	/* 0x13 Vertical Scaling msb 0x00
 					   chroma comb OFF, line drop scaling, interlace scaling
-					   BUG? Why does turning the chroma comb on fuck up color?
+					   BUG? Why does turning the chroma comb on screw up color?
 					   Bug in the bt819 stepping on my board?
 					*/
 		0x14, 0x00,	/* 0x14 Vertical Scaling lsb */
-- 
2.23.0

