Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A97747DC0
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 09:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjGEHDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 03:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjGEHCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 03:02:55 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF8018E
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 00:02:54 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qGwXM-00C6SN-D4; Wed, 05 Jul 2023 07:02:52 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qGwXK-001PzZ-0b;
        Wed, 05 Jul 2023 07:02:50 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.5-rc1] media updates (#92969)
Date:   Wed,  5 Jul 2023 07:02:48 +0000
Message-Id: <20230705070249.338232-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705085045.1feaaacc@coco.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230705085045.1feaaacc@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/320447/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230705085045.1feaaacc@coco.lan

gpg: Signature made Wed 05 Jul 2023 06:26:51 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-dvbdev-fix-most-coding-style-issues.patch doesn't apply:
Applying patch patches/0001-media-dvbdev-fix-most-coding-style-issues.patch
patching file drivers/media/dvb-core/dvbdev.c
Hunk #1 FAILED at 61.
Hunk #2 FAILED at 112.
Hunk #3 FAILED at 147.
Hunk #4 FAILED at 155.
Hunk #5 FAILED at 169.
Hunk #6 FAILED at 185.
Hunk #7 FAILED at 245.
Hunk #8 FAILED at 387.
Hunk #9 FAILED at 462.
Hunk #10 FAILED at 470.
Hunk #11 FAILED at 482.
Hunk #12 FAILED at 497.
Hunk #13 FAILED at 508.
Hunk #14 FAILED at 518.
Hunk #15 FAILED at 547.
Hunk #16 FAILED at 567.
Hunk #17 FAILED at 586.
Hunk #18 FAILED at 601.
Hunk #19 FAILED at 621.
Hunk #20 FAILED at 636.
Hunk #21 FAILED at 669.
Hunk #22 FAILED at 795.
Hunk #23 FAILED at 864.
Hunk #24 FAILED at 873.
Hunk #25 FAILED at 886.
Hunk #26 FAILED at 913.
Hunk #27 FAILED at 924.
Hunk #28 FAILED at 938.
Hunk #29 FAILED at 970.
Hunk #30 FAILED at 980.
Hunk #31 FAILED at 992.
Hunk #32 FAILED at 1080.
Hunk #33 FAILED at 1112.
Hunk #34 FAILED at 1122.
34 out of 34 hunks FAILED -- rejects in file drivers/media/dvb-core/dvbdev.c
Patch patches/0001-media-dvbdev-fix-most-coding-style-issues.patch can be reverse-applied

