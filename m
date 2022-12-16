Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009DD64E987
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 11:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiLPKgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 05:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiLPKf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 05:35:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75BE2E6B4
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 02:35:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p684D-0005Wg-6Z; Fri, 16 Dec 2022 11:35:49 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p684B-004tvR-9J; Fri, 16 Dec 2022 11:35:48 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p684A-00FGGn-V3; Fri, 16 Dec 2022 11:35:46 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/3] TC358746 coverity fixes
Date:   Fri, 16 Dec 2022 11:35:42 +0100
Message-Id: <20221216103545.3620670-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this small series addresses the issues found by the chromium
coverity-bot. It is based on
git://linuxtv.org/sailus/media_tree.git:master.

Regards,
  Marco

Marco Felsch (3):
  media: i2c: tc358746: fix missing return assignment
  media: i2c: tc358746: fix ignoring read error in g_register callback
  media: i2c: tc358746: fix possible endianness issue

 drivers/media/i2c/tc358746.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.30.2

