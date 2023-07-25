Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9C276194D
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 15:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbjGYNHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 09:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjGYNHJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 09:07:09 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66CB19A2
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 06:07:06 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOHkn-004Z60-Bi; Tue, 25 Jul 2023 13:07:05 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOHkl-00DMiF-0c;
        Tue, 25 Jul 2023 13:07:03 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.5-rc4] media fixes (#93381)
Date:   Tue, 25 Jul 2023 13:07:02 +0000
Message-Id: <20230725130702.3185562-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724121150.1d55ce6b@coco.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230724121150.1d55ce6b@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/325108/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230724121150.1d55ce6b@coco.lan

gpg: Signature made Mon 24 Jul 2023 10:06:33 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-tc358746-Address-compiler-warnings.patch doesn't apply:
Applying patch patches/0001-media-tc358746-Address-compiler-warnings.patch
patching file drivers/media/i2c/tc358746.c
Hunk #1 FAILED at 813.
1 out of 1 hunk FAILED -- rejects in file drivers/media/i2c/tc358746.c
Patch patches/0001-media-tc358746-Address-compiler-warnings.patch can be reverse-applied

