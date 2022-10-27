Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42CB60FF40
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 19:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235512AbiJ0RXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 13:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235810AbiJ0RXJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 13:23:09 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC381A403F
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 10:23:08 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oo6ax-00Ey8R-1H; Thu, 27 Oct 2022 17:23:07 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oo6au-009zrf-9Z; Thu, 27 Oct 2022 17:23:04 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.1-rc3] media fixes (#86978)
Date:   Thu, 27 Oct 2022 17:23:04 +0000
Message-Id: <20221027172304.2382713-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027181714.3d12aba5@sal.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20221027181714.3d12aba5@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/250862/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20221027181714.3d12aba5@sal.lan

gpg: Signature made Thu 27 Oct 2022 09:05:51 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-vivid-s_fbuf-add-more-sanity-checks.patch doesn't apply:
Applying patch patches/0001-media-vivid-s_fbuf-add-more-sanity-checks.patch
patching file drivers/media/test-drivers/vivid/vivid-core.c
Hunk #1 succeeded at 361 with fuzz 1 (offset 22 lines).
patching file drivers/media/test-drivers/vivid/vivid-core.h
Hunk #1 succeeded at 615 with fuzz 2 (offset 2 lines).
patching file drivers/media/test-drivers/vivid/vivid-vid-cap.c
Hunk #1 FAILED at 1276.
1 out of 1 hunk FAILED -- rejects in file drivers/media/test-drivers/vivid/vivid-vid-cap.c
Patch patches/0001-media-vivid-s_fbuf-add-more-sanity-checks.patch can be reverse-applied

