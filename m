Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E016C78FD37
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 14:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349434AbjIAM3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 08:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349456AbjIAM3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 08:29:16 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD2810CC
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 05:29:12 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qc3Gw-00Bg1J-AL; Fri, 01 Sep 2023 12:29:10 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qc3Gt-008Q7Q-1A;
        Fri, 01 Sep 2023 12:29:07 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.6-rc1] media updates (#94387)
Date:   Fri,  1 Sep 2023 12:29:05 +0000
Message-Id: <20230901122906.2007015-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901142147.096c1b57@sal.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230901142147.096c1b57@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/335881/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230901142147.096c1b57@sal.lan

gpg: Signature made Fri 01 Sep 2023 11:43:29 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-rc-meson-ir-sort-Meson-IR-Controller-register-.patch doesn't apply:
Applying patch patches/0001-media-rc-meson-ir-sort-Meson-IR-Controller-register-.patch
patching file drivers/media/rc/meson-ir.c
Hunk #1 FAILED at 19.
1 out of 1 hunk FAILED -- rejects in file drivers/media/rc/meson-ir.c
Patch patches/0001-media-rc-meson-ir-sort-Meson-IR-Controller-register-.patch does not apply (enforce with -f)

