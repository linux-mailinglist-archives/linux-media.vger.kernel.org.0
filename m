Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0195C12269
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 21:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfEBTNU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 15:13:20 -0400
Received: from mga06.intel.com ([134.134.136.31]:21537 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbfEBTNU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 15:13:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 May 2019 12:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; 
   d="scan'208";a="154234018"
Received: from maru.jf.intel.com ([10.54.51.75])
  by FMSMGA003.fm.intel.com with ESMTP; 02 May 2019 12:13:19 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 0/7] Improve stability of Aspeed video engine driver
Date:   Thu,  2 May 2019 12:13:10 -0700
Message-Id: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series improves stability of Aspeed video engine driver by fixing
clock control and irq handling logic in the driver.

This series should be applied on top of:
https://www.spinics.net/lists/linux-media/msg150193.html

Jae Hyun Yoo (7):
  media: aspeed: fix a kernel warning on clk control
  media: aspeed: refine clock control logic
  media: aspeed: change irq to threaded irq
  media: aspeed: remove IRQF_SHARED flag
  media: aspeed: reduce noisy log printing outs
  media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
  media: aspeed: refine interrupt handling logic

 drivers/media/platform/aspeed-video.c | 103 ++++++++++++++++++--------
 1 file changed, 73 insertions(+), 30 deletions(-)

-- 
2.21.0

