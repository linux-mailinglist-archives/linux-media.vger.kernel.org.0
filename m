Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABAF5650D4D
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 15:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbiLSOcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 09:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbiLSOb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 09:31:59 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376A7BCE
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 06:31:11 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEV2NP075614;
        Mon, 19 Dec 2022 08:31:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671460262;
        bh=sTlKZyIOwsCQI5rs3nmC1whlAqWRhh42QaAyjM0zSDo=;
        h=From:To:CC:Subject:Date;
        b=DOdQnGufpvk99DfV4yGzq+02api8QsSQAF2HRkjmbwcGn9ie4gTCIgYVVFptpPi2D
         lNr22KnPyMqARV8EEx58Y4uO900OFPODa0dFFa2SdR30dBIB13THfQZAUySckFDYWv
         N2m6CshanE1S2q8VVMCVptgW0lJ8vJbAYutezTEU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BJEV2Jc089975
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Dec 2022 08:31:02 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 19
 Dec 2022 08:31:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 19 Dec 2022 08:31:02 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BJEV14p000477;
        Mon, 19 Dec 2022 08:31:01 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v2 0/3] media: ov5640: Fix power up sequence delays 
Date:   Mon, 19 Dec 2022 20:00:53 +0530
Message-ID: <20221219143056.4070-1-j-luthra@ti.com>
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

This series fixes the power-up sequence delays to support some 15-pin FFC 
compatible OV5640 modules.

Without appropriate delays after both gpio and register-based powerdown and 
reset the sensor SCCB was not very stable, and probe would sometimes fail 
at check_chip_id.

Changes in v2:
- Rename ov5640_reset to ov5640_powerup_sequence to match datasheet
- Remove the check for reset_gpio so that appropriate delays are honored when 
using only the pwdn_gpio
- Remove redundant call to ov5640_power
- Add 5ms delay after SW PWUP used in ov5640_set_stream_dvp()

Jai Luthra (1):
  media: ov5640: Handle delays when no reset_gpio set

Nishanth Menon (2):
  media: ov5640: Honor RESETB to SMBUS time t4 in init_setting
  media: ov5640: Honor power on time in init_setting

 drivers/media/i2c/ov5640.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

-- 
2.17.1

