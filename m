Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2902C5F51BA
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 11:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiJEJ20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 05:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJEJ2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 05:28:24 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C5D5AC67
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 02:28:22 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1og0hP-00D5CF-Lg; Wed, 05 Oct 2022 09:28:19 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1og0hN-0056Df-1u; Wed, 05 Oct 2022 09:28:17 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.1-rc1] media updates (#86503)
Date:   Wed,  5 Oct 2022 09:28:16 +0000
Message-Id: <20221005092816.1215501-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005102323.4f751c1a@sal.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20221005102323.4f751c1a@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/244474/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20221005102323.4f751c1a@sal.lan

gpg: Signature made Wed 05 Oct 2022 09:07:58 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-v4l2-ctrls-allocate-space-for-arrays.patch doesn't apply:
Applying patch patches/0001-media-v4l2-ctrls-allocate-space-for-arrays.patch
patching file drivers/media/v4l2-core/v4l2-ctrls-api.c
Hunk #1 FAILED at 105.
Hunk #2 FAILED at 115.
2 out of 2 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ctrls-api.c
patching file drivers/media/v4l2-core/v4l2-ctrls-core.c
Hunk #1 FAILED at 1135.
Hunk #2 FAILED at 1151.
Hunk #3 FAILED at 1252.
Hunk #4 FAILED at 1584.
Hunk #5 FAILED at 1632.
Hunk #6 FAILED at 1651.
Hunk #7 FAILED at 1664.
7 out of 7 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ctrls-core.c
patching file include/media/v4l2-ctrls.h
Hunk #1 FAILED at 203.
Hunk #2 FAILED at 227.
Hunk #3 FAILED at 291.
3 out of 3 hunks FAILED -- rejects in file include/media/v4l2-ctrls.h
Patch patches/0001-media-v4l2-ctrls-allocate-space-for-arrays.patch can be reverse-applied

