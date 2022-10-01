Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E505F1A08
	for <lists+linux-media@lfdr.de>; Sat,  1 Oct 2022 07:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiJAFgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Oct 2022 01:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJAFgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Oct 2022 01:36:44 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A35518F92E
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 22:36:41 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oeVB1-004yqP-6C; Sat, 01 Oct 2022 05:36:39 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oeVAy-00A1U5-Er; Sat, 01 Oct 2022 05:36:36 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.0] media fixes (#86466)
Date:   Sat,  1 Oct 2022 05:36:36 +0000
Message-Id: <20221001053636.2388939-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221001071245.6720babc@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20221001071245.6720babc@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/243275/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20221001071245.6720babc@coco.lan

gpg: Signature made Sat 01 Oct 2022 05:08:37 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0003-media-v4l2-ioctl.c-fix-incorrect-error-path.patch doesn't apply:
Applying patch patches/0003-media-v4l2-ioctl.c-fix-incorrect-error-path.patch
patching file drivers/media/v4l2-core/v4l2-ioctl.c
Hunk #1 FAILED at 2872.
Hunk #2 FAILED at 3367.
Hunk #3 FAILED at 3377.
Hunk #4 succeeded at 3401 with fuzz 2 (offset 6 lines).
Hunk #5 FAILED at 3416.
4 out of 5 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ioctl.c
Patch patches/0003-media-v4l2-ioctl.c-fix-incorrect-error-path.patch can be reverse-applied

