Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80ED761C42
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 16:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjGYOuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 10:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjGYOuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 10:50:21 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5401116
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 07:50:20 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOIpW-004aJv-8r; Tue, 25 Jul 2023 14:16:02 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOIpT-00ECCm-0n;
        Tue, 25 Jul 2023 14:16:00 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.6] Separate V4L2 async sub-devices from connections (#93401)
Date:   Tue, 25 Jul 2023 14:15:58 +0000
Message-Id: <20230725141558.3383499-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZL+nx1/qYE2FggwD@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZL+nx1/qYE2FggwD@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/325108/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/ZL+nx1/qYE2FggwD@valkosipuli.retiisi.eu

gpg: Signature made Tue 25 Jul 2023 10:39:03 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0017-media-v4l-async-Clean-up-list-heads-and-entries.patch doesn't apply:
Applying patch patches/0017-media-v4l-async-Clean-up-list-heads-and-entries.patch
can't find file to patch at input line 30
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 0ef45acbe7e5bf5af0b8df524cc05971268a4001 Mon Sep 17 00:00:00 2001
|From: Sakari Ailus <sakari.ailus@linux.intel.com>
|Date: Wed, 22 Feb 2023 13:02:39 +0200
|Subject: media: v4l: async: Clean up list heads and entries
|MIME-Version: 1.0
|Content-Type: text/plain; charset=UTF-8
|Content-Transfer-Encoding: 8bit
|
|The naming of list heads and list entries is confusing as they're named
|similarly. Use _list for list head and _entry for list entries.
|
|Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
|Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
|Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
|Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
|Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
|---
| drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
| drivers/media/platform/xilinx/xilinx-vipp.c   |  6 +--
| drivers/media/v4l2-core/v4l2-async.c          | 54 +++++++++----------
| drivers/staging/media/tegra-video/vi.c        |  4 +-
| include/media/v4l2-async.h                    | 22 ++++----
| include/media/v4l2-subdev.h                   |  4 +-
| 6 files changed, 46 insertions(+), 46 deletions(-)
|
|diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
|index 34984a7474ed..78248cb343ce 100644
|--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
|+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
patching file drivers/media/platform/xilinx/xilinx-vipp.c
patching file drivers/media/v4l2-core/v4l2-async.c
patching file drivers/staging/media/tegra-video/vi.c
patching file include/media/v4l2-async.h
patching file include/media/v4l2-subdev.h
Patch patches/0017-media-v4l-async-Clean-up-list-heads-and-entries.patch does not apply (enforce with -f)

