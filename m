Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49231226F
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 21:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfEBTNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 15:13:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:21537 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbfEBTNY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 15:13:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 May 2019 12:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; 
   d="scan'208";a="154234027"
Received: from maru.jf.intel.com ([10.54.51.75])
  by FMSMGA003.fm.intel.com with ESMTP; 02 May 2019 12:13:23 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 4/7] media: aspeed: remove IRQF_SHARED flag
Date:   Thu,  2 May 2019 12:13:14 -0700
Message-Id: <20190502191317.29698-5-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video Engine has a dedicated interrupt line so this driver doesn't
need to use IRQF_SHARED flag so remove it. Also, it'd be good for
following what Thomas recommended in the IRQF_ONESHOT support
patch like below:

"Note that for now IRQF_ONESHOT cannot be used with IRQF_SHARED to
avoid complex accounting mechanisms."

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/media/platform/aspeed-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index e1bdafeed007..d88e8d238c49 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1616,8 +1616,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 	}
 
 	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
-				       IRQF_ONESHOT | IRQF_SHARED, DEVICE_NAME,
-				       video);
+				       IRQF_ONESHOT, DEVICE_NAME, video);
 	if (rc < 0) {
 		dev_err(dev, "Unable to request IRQ %d\n", irq);
 		return rc;
-- 
2.21.0

