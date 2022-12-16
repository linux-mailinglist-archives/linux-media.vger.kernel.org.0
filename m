Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E58764EC3A
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 14:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiLPNoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 08:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiLPNod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 08:44:33 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F6420BED
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 05:44:31 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BGDiL4K068584;
        Fri, 16 Dec 2022 07:44:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671198261;
        bh=VlX+ee264CEIvgo1d5SM5o+No5aD46wE4Bqixt/lWLA=;
        h=From:To:CC:Subject:Date;
        b=mSGNC/XzlQv1NCns+IUL+jZ4eQA+w4O7Nw3b3Uzqu9MQGDYOJw8EANFgnbIeMDHbm
         S3X2dDvhl8azGvK70kObUwu/5lmRCkGBVlV7lGPgnuh9rhye7RHDuKSpqfJ07vCoFr
         llVn99psEkKJWbkYgqfSzDJfcezRwKDYnrHZ/fEA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BGDiLFx131019
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 16 Dec 2022 07:44:21 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 16
 Dec 2022 07:44:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 16 Dec 2022 07:44:20 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BGDiJKB071211;
        Fri, 16 Dec 2022 07:44:20 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, Jai Luthra <j-luthra@ti.com>
Subject: [PATCH 0/3] media: ov5640: Fix power up sequence delays
Date:   Fri, 16 Dec 2022 19:14:06 +0530
Message-ID: <20221216134409.6868-1-j-luthra@ti.com>
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

Jai Luthra (1):
  media: ov5640: Handle delays when no reset_gpio set

Nishanth Menon (2):
  media: ov5640: Honor RESETB to SMBUS time t4 in init_setting
  media: ov5640: Honor power on time in init_setting

 drivers/media/i2c/ov5640.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.17.1

