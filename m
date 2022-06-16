Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93EAB54DEA3
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 12:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359335AbiFPKH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 06:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiFPKH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 06:07:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEBA1AF05
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 03:07:57 -0700 (PDT)
Received: from mail.ideasonboard.com (unknown [217.155.82.121])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98AAD415;
        Thu, 16 Jun 2022 12:07:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655374074;
        bh=Mzen0aA42tYANY31KF+qcg2DHrL4hAtIH/rCZr8PBVg=;
        h=From:To:Cc:Subject:Date:From;
        b=Cn8Y98OYhx326NhkomDnkepdedeGGC4j2NuYe7vfpPE6G885/tlzY80YgjTNn/iKt
         QhF/MmgZTnYxr49tA1cXNX6QVhWPDoCnsV3/S/ycxUXSlu4e99JUcPcOjQJuPHnoTL
         KKhHrQVxq5PvnEo2LGVueLaRGKURFaqstRaA10E0=
From:   Daniel Oakley <daniel.oakley@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Daniel Oakley <daniel.oakley@ideasonboard.com>
Subject: [PATCH 0/3] Vimc code readability improvements
Date:   Thu, 16 Jun 2022 11:07:44 +0100
Message-Id: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches are supposed to be applied on top of the not yet merged
vimc ancillary patch (65b957cb0a926ee178100f4af8fea0e516fc7604).

While the vimc ancillary lens patch series was being reviewed, it was made
apparent that there were a few issues with the vimc code clarity:
 - The data link entity names were unclear, leading to a possible confusion
   with len and lens, e.g. vimc_len_type refers to the lens.
 - Raw index numbers in the VIMC_DATA_LINK declarations made understanding
   that code hard.

This patch series aims to solve these problems.


Link to lens patch review:
https://lore.kernel.org/r/165037056336.2548121.16870543641391713634@Monstersaurus

Daniel Oakley (3):
  media: vimc: expand the names of vimc entity types
  media: vimc: enumerate data link entities for clarity
  media: vimc: use data link entities enum to index the ent_config array

 .../media/test-drivers/vimc/vimc-capture.c    | 270 ++++++------
 drivers/media/test-drivers/vimc/vimc-common.h |  10 +-
 drivers/media/test-drivers/vimc/vimc-core.c   |  80 ++--
 .../media/test-drivers/vimc/vimc-debayer.c    | 393 +++++++++---------
 drivers/media/test-drivers/vimc/vimc-lens.c   |  82 ++--
 drivers/media/test-drivers/vimc/vimc-scaler.c | 216 +++++-----
 drivers/media/test-drivers/vimc/vimc-sensor.c | 307 +++++++-------
 7 files changed, 691 insertions(+), 667 deletions(-)


base-commit: 65b957cb0a926ee178100f4af8fea0e516fc7604
-- 
2.36.1

