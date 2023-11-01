Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 500577DE039
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 12:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjKALR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 07:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjKALR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 07:17:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BB9109
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698837471; x=1730373471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UbvdVco70BomaDynNCTguHATM41fF1TvrTstgrRdepI=;
  b=B+ki+dspduP92Cy1ncZbPJp0ZQRJTxs51TR9Pw9tqkkvS6ag6YDm5UXn
   l5YDy5vg1aNTLJlUZwRO89WJPq5Gci5be8bjB1JY3z9wq7nu1uVVdP3Ih
   RKT3U6Fn1e4QDDMfarY8dY6PNttzOdDPs6oQgKWA86bqTx9/p+mHAKR5M
   KtYI0XBwGXw2DHsJWWts31bM8bddcqC7JXp7TsL0ATOJduiwFv68kKFcV
   fPt94jpAHHnFcc8WU48fdc69wAgEl//0SRFflOnFWMhNhXW9a+OIgMqg+
   /czxSF+Els2NHWNaLpBqyFT3iF5lj13fiBuAryQPTmjphmITUtSsI3OYz
   g==;
X-IronPort-AV: E=Sophos;i="6.03,268,1694728800"; 
   d="scan'208";a="33759011"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Nov 2023 12:17:49 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 223EE28007F;
        Wed,  1 Nov 2023 12:17:49 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/2] v4l2-cci: little-endian registers
Date:   Wed,  1 Nov 2023 12:17:45 +0100
Message-Id: <20231101111747.252072-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

after the discussions at [1] and [2], this series adds proper support for
little-endian encoded registers.
Patch 1 adds the infrastructure and patch 2 fixes imx290 driver.
As v6.6 was released with imx290 broken, both should be added to stable. But
I'm not sure if adding a Fixes tag to Patch 1 is correct, because it adds a
new feature patch 2 requires. Any suggestion is welcomed.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-media/20231030173637.GA2977515@gnbcxd0016.gnb.st.com/
[2] https://lore.kernel.org/linux-media/ZUIuNDTJAN_fz3q6@kekkonen.localdomain/

Alexander Stein (2):
  media: v4l2-cci: Add support for little-endian encoded registers
  media: i2c: imx290: Properly encode registers as little-endian

 drivers/media/i2c/imx290.c         | 42 +++++++++++++++---------------
 drivers/media/v4l2-core/v4l2-cci.c | 22 +++++++++++++---
 include/media/v4l2-cci.h           |  5 ++++
 3 files changed, 44 insertions(+), 25 deletions(-)

-- 
2.34.1

