Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAB4656D73
	for <lists+linux-media@lfdr.de>; Tue, 27 Dec 2022 18:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbiL0Rg7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Dec 2022 12:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiL0Rg6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Dec 2022 12:36:58 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016132652
        for <linux-media@vger.kernel.org>; Tue, 27 Dec 2022 09:36:56 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BRHakCT120155;
        Tue, 27 Dec 2022 11:36:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1672162606;
        bh=Ksv2Y7JWzYcpvzpatK53HMBKmCjn7ejdmg7Y9165404=;
        h=From:To:CC:Subject:Date;
        b=eA9rzp2uCuLzd3bQii/B21GZFO4HGp+q4r+ZyRSjN1jOOsOFveyNJ36t6KfKlf7xf
         pGNYap5XBj8jizjR/SUyNSREqGBxwroHzQJpVpPK7QE06alVS4HrQ/9YsaVTlC/C2Y
         tdt/F9NG9g2L4goygPkvO2sZ7ldpfW0nJCbI3Hco=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BRHakO8007909
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Dec 2022 11:36:46 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 27
 Dec 2022 11:36:45 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 27 Dec 2022 11:36:45 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BRHaiE8086662;
        Tue, 27 Dec 2022 11:36:45 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
        Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v3 0/3] media: ov5640: Fix power up sequence delays
Date:   Tue, 27 Dec 2022 23:06:31 +0530
Message-ID: <20221227173634.5752-1-j-luthra@ti.com>
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

Changes in v3:
- Move register-based reset to the common powerup_sequence function
- Only add 5ms delay for PWUP not for PWDN in ov5640_set_stream_dvp

v2: https://lore.kernel.org/all/20221219143056.4070-1-j-luthra@ti.com/

Jai Luthra (2):
  media: ov5640: Handle delays when no reset_gpio set
  media: ov5640: Fix soft reset sequence and timings

Nishanth Menon (1):
  media: ov5640: Honor power on time in init_setting

 drivers/media/i2c/ov5640.c | 68 +++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 20 deletions(-)

-- 
2.17.1

