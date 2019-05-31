Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9504F3170A
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 00:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfEaWQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 18:16:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:36048 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbfEaWQC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 18:16:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 15:15:56 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2019 15:15:55 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 00/10] Improve stability and add bug fixes of Aspeed video engine driver
Date:   Fri, 31 May 2019 15:15:38 -0700
Message-Id: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
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

Changes since v2:
- Corrected re-allocation logic of source buffer.
- Removed an incorrect patch from this series (10/11 in v2).
- Added more details into the silicon bug workaround fix comment.

Changes since v1:
- Removed spinlock handling code from 0001 patch.
- Added 4 more patches.
Jae Hyun Yoo (10):
  media: aspeed: fix a kernel warning on clk control
  media: aspeed: refine clock control logic
  media: aspeed: change irq to threaded irq
  media: aspeed: remove IRQF_SHARED flag
  media: aspeed: reduce noisy log printing outs
  media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
  media: aspeed: refine interrupt handling logic
  media: aspeed: remove source buffer allocation before mode detection
  media: aspeed: use different delays for triggering VE H/W reset
  media: aspeed: add a workaround to fix a silicon bug

 drivers/media/platform/aspeed-video.c | 156 ++++++++++++++------------
 1 file changed, 86 insertions(+), 70 deletions(-)

-- 
2.21.0

