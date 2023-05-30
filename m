Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47826715A05
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 11:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbjE3J0S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 05:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjE3JZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 05:25:53 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0959A10C1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 02:24:46 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q3va5-00C5TB-4B; Tue, 30 May 2023 09:23:53 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q3va2-00AhQL-Eo; Tue, 30 May 2023 09:23:50 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR 6.4] V4L2 fixes for 6.4 (#92225)
Date:   Tue, 30 May 2023 09:23:49 +0000
Message-Id: <20230530092350.2550155-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZHW/IN2KTMwtWaFA@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZHW/IN2KTMwtWaFA@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/310681/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/ZHW/IN2KTMwtWaFA@valkosipuli.retiisi.eu

gpg: Signature made Tue 30 May 2023 09:03:11 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-v4l2-mc-Drop-subdev-check-in-v4l2_create_fwnod.patch doesn't apply:
Applying patch patches/0001-media-v4l2-mc-Drop-subdev-check-in-v4l2_create_fwnod.patch
patching file drivers/media/v4l2-core/v4l2-mc.c
Hunk #1 FAILED at 314.
1 out of 1 hunk FAILED -- rejects in file drivers/media/v4l2-core/v4l2-mc.c
Patch patches/0001-media-v4l2-mc-Drop-subdev-check-in-v4l2_create_fwnod.patch can be reverse-applied

