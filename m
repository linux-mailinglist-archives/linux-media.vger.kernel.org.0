Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 424E0B24DE
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 20:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388854AbfIMSLI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 14:11:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:60772 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387802AbfIMSLI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 14:11:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 11:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,501,1559545200"; 
   d="scan'208";a="210442620"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2019 11:11:06 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next v2 0/2] media: aspeed: refine mode detection flow
Date:   Fri, 13 Sep 2019 11:11:03 -0700
Message-Id: <20190913181105.11836-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series refines mode detection flow by fixing and refining of
hsync/vsync polarity setting register handling. Please review this change.

Thanks,
-Jae

Changes since v1:
 * Updated commit message.

Jae Hyun Yoo (2):
  media: aspeed: refine hsync/vsync polarity setting logic
  media: aspeed: set hsync and vsync polarities to normal before
    starting mode detection

 drivers/media/platform/aspeed-video.c | 45 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 22 deletions(-)

-- 
2.23.0

