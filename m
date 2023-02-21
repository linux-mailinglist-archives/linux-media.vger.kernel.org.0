Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0501069E5A1
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 18:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbjBURL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 12:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234595AbjBURLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 12:11:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AA12E82B
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 09:11:11 -0800 (PST)
Received: from uno.homenet.telecomitalia.it (host-87-16-53-160.retail.telecomitalia.it [87.16.53.160])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D76519;
        Tue, 21 Feb 2023 18:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676999469;
        bh=fixNGXMNDBJAIrxie2ZtjcvyzhqMIPmZpiiJmAEEh/s=;
        h=From:To:Cc:Subject:Date:From;
        b=ATeVXzokqX8V9MYLSZuexLAu/EAaKrPpOFgf8PWiMfUaJOVS3d9X1ReHG/r/OLC45
         6MEwoNbQfMHGgltzycQRWxCKBjTdbx7FNfdQiXQMYJ3g9WVVv8e4ht//hT+7oxH2Ej
         1zEHKC3PcDcf3Ga3+pztXjeiA5hKSMubQN/M//gQ=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 0/2]  media: i2c: ov5647: Add test pattern support
Date:   Tue, 21 Feb 2023 18:10:46 +0100
Message-Id: <20230221171048.203042-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A small series that upports commit 7da051cfc67 ("media: i2c: ov5647: Add test
pattern control") from the Renesas 6.1 BSP.

While at there, add small patch to make the i2c read transactions safer by
ensuring the bus is locked.

v1->v2:
- Remove "Input Data" test pattern
- Better check the i2c_transfer() return value

Jacopo Mondi (1):
  media: i2c: ov5647: Use bus-locked i2c_transfer()

Valentine Barshak (1):
  media: i2c: ov5647: Add test pattern control

 drivers/media/i2c/ov5647.c | 56 +++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 13 deletions(-)

--
2.39.0

