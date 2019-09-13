Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAAFB24E0
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 20:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388909AbfIMSLK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 14:11:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:60772 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387802AbfIMSLJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 14:11:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 11:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,501,1559545200"; 
   d="scan'208";a="210442629"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2019 11:11:09 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next v2 2/2] media: aspeed: set hsync and vsync polarities to normal before starting mode detection
Date:   Fri, 13 Sep 2019 11:11:05 -0700
Message-Id: <20190913181105.11836-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913181105.11836-1-jae.hyun.yoo@linux.intel.com>
References: <20190913181105.11836-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sometimes it detects a weird resolution such as 1024x287 when the
actual resolution is 1024x768. To resolve such an issue, this
commit adds clearing for hsync and vsync polarity register bits
at the beginning of the first mode detection. This is recommended
in the datasheet.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v1:
 None

 drivers/media/platform/aspeed-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 8f77079da55a..929b3a5b8849 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -740,6 +740,8 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 		}
 
 		set_bit(VIDEO_RES_DETECT, &video->flags);
+		aspeed_video_update(video, VE_CTRL,
+				    VE_CTRL_VSYNC_POL | VE_CTRL_HSYNC_POL, 0);
 		aspeed_video_enable_mode_detect(video);
 
 		rc = wait_event_interruptible_timeout(video->wait,
-- 
2.23.0

