Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F116E649A90
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 10:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbiLLJBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 04:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiLLJBi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 04:01:38 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835A26317
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 01:01:37 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1p4ego-008bV0-F8; Mon, 12 Dec 2022 09:01:34 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1p4egl-00BRkW-LU; Mon, 12 Dec 2022 09:01:31 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.2-rc1] media updates (#88179)
Date:   Mon, 12 Dec 2022 09:01:31 +0000
Message-Id: <20221212090131.2728230-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221212084920.756bfd7b@sal.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20221212084920.756bfd7b@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/263825/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20221212084920.756bfd7b@sal.lan

gpg: Signature made Mon 12 Dec 2022 08:17:06 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-imx-jpeg-Remove-unnecessary-memset-after-dma_a.patch doesn't apply:
Applying patch patches/0001-media-imx-jpeg-Remove-unnecessary-memset-after-dma_a.patch
patching file drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
Hunk #1 FAILED at 519.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
Patch patches/0001-media-imx-jpeg-Remove-unnecessary-memset-after-dma_a.patch can be reverse-applied

