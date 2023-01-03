Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF5B65BFDC
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 13:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjACM2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 07:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbjACM1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 07:27:49 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8E9B49E
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 04:27:48 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303CRe2Z107326;
        Tue, 3 Jan 2023 06:27:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1672748860;
        bh=SwRiD4792uWkQSxTAAgm2BiS/Xl+c3YxhOhTuACYV6Q=;
        h=From:To:CC:Subject:Date;
        b=M2JC4Opn2+RClafPTTbiyggkWscRgaSA0TTJpFi53sCcA6j9yXBd6NAk9TF400w6c
         czfU2zVofSf35NtAKZgAGGtPR6NrtbIn50D6vNo5qCD8RIunrSP680lpS8iLo9S8JK
         I7ynYaM0NoZxAA0WbtqN6ozCDctgnVXwYpN7YB78=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303CReQb004488
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Jan 2023 06:27:40 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 06:27:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 06:27:39 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303CRc4B002368;
        Tue, 3 Jan 2023 06:27:39 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
        Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v4 0/2]  media: ov5640: Fix power up sequence delays
Date:   Tue, 3 Jan 2023 17:57:34 +0530
Message-ID: <20230103122736.18479-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series fixes the power-up sequence delays to support some 15-pin 
FFC compatible OV5640 modules.

Without appropriate delays after both gpio and register-based powerdown 
and reset the sensor SCCB was not very stable, and probe would sometimes 
fail at check_chip_id.

Changes in v4:
- Swap order of patches [1/3] and [2/3]
- Drop patch [3/3] as SW powerup does not have same timing constraints
- Move soft powerdown from the register table to powerup_sequence() 
  along with soft reset

v3: https://lore.kernel.org/all/20221227173634.5752-1-j-luthra@ti.com/

Jai Luthra (2):
  media: ov5640: Fix soft reset sequence and timings
  media: ov5640: Handle delays when no reset_gpio set

 drivers/media/i2c/ov5640.c | 55 +++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 16 deletions(-)

-- 
2.17.1

