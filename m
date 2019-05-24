Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34952A17F
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 01:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfEXXR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 19:17:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:23059 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbfEXXR1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 19:17:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 May 2019 16:17:27 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
  by orsmga007.jf.intel.com with ESMTP; 24 May 2019 16:17:27 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2 00/11] Improve stability and add bug fixes of Aspeed video engine driver
Date:   Fri, 24 May 2019 16:17:14 -0700
Message-Id: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series improves stability of Aspeed video engine driver by fixing
clock control and irq handling logic in the driver. Also, it adds a couple of
bug fixes and a workaroud for a silicon bug.

Changes since v1:
- Removed spinlock handling code from 0001 patch.
- Added 4 more patches.

Jae Hyun Yoo (11):
  media: aspeed: fix a kernel warning on clk control
  media: aspeed: refine clock control logic
  media: aspeed: change irq to threaded irq
  media: aspeed: remove IRQF_SHARED flag
  media: aspeed: reduce noisy log printing outs
  media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
  media: aspeed: refine interrupt handling logic
  media: aspeed: remove source buffer allocation before mode detection
  media: aspeed: use different delays for triggering VE H/W reset
  media: aspeed: fix an incorrect timeout checking in mode detection
  media: aspeed: add a workaround to fix a silicon bug

 drivers/media/platform/aspeed-video.c | 140 +++++++++++++++-----------
 1 file changed, 80 insertions(+), 60 deletions(-)

-- 
2.21.0

