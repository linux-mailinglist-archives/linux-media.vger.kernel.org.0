Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA336315A4
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 19:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKTSXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 13:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKTSXq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 13:23:46 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0959C10
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 10:23:44 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C02CD100068; Sun, 20 Nov 2022 18:23:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1668968622; bh=dmvGPoZtpwZQiV9hGKdaLJfjVQg2VfwL5A6b2+/xMoM=;
        h=Date:From:To:Subject:From;
        b=CPcg0dZJEDD1yIi65Ieak7rnkJKH2UnGnyfpCBD2TGi7AwN3eP8Xxpz/c9OAeR9i7
         K9whcJ9dq1hQmEX78NSAYihE3bz42emvFeJBCuQ29utglVX3QxX8oVAdQ6j9JyMibt
         PWvrlDo/9EfnA/3Mwo7U3PMgV30gUBShCIgzj9NJL4pgBuU8MlG10UpClNHJfXKwbq
         iEg5OGWKNuMmqiINm5VdBcdvft/Y4z4ndPVwqOPLfwQGofVBYOJF4QkfNaDKgg5G6m
         KYUrpb2humzoqlvzA9tKChnlUkwfZsjUzy0ARz6MIExQ8Gdsms16xUkTl0bydtNL/f
         0d8tXMxMYZhFw==
Date:   Sun, 20 Nov 2022 18:23:42 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.2] rc fixes
Message-ID: <Y3pwrsn8vEho86nA@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit a7bab6f8b73fe15a6181673149734a2756845dae:

  Merge tag 'br-v6.2e' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-11-15 11:55:54 +0000)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.2a

for you to fetch changes up to 10b62658475377a85508e4310c9940de4f628b86:

  media: imon: fix a race condition in send_packet() (2022-11-20 18:01:18 +0000)

----------------------------------------------------------------
v6.2a

----------------------------------------------------------------
Gautam Menghani (1):
      media: imon: fix a race condition in send_packet()

Wei Yongjun (1):
      media: ir-spi: silence no spi_device_id warnings

 drivers/media/rc/imon.c   | 6 +++---
 drivers/media/rc/ir-spi.c | 7 +++++++
 2 files changed, 10 insertions(+), 3 deletions(-)
