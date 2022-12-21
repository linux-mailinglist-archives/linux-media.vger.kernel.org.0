Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950D965307C
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 12:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234470AbiLUL5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 06:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiLUL5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 06:57:36 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C6B1C93F
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 03:57:35 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1p7xj2-001vSr-Nk; Wed, 21 Dec 2022 11:57:32 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1p7xiy-003C3y-Rv; Wed, 21 Dec 2022 11:57:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.2-rc1] media fixes (#88410)
Date:   Wed, 21 Dec 2022 11:57:28 +0000
Message-Id: <20221221115728.761308-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221221112350.6b046362@sal.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20221221112350.6b046362@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/266441/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20221221112350.6b046362@sal.lan

gpg: Signature made Wed 21 Dec 2022 11:20:18 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0002-media-sun6i-csi-bridge-Error-out-on-invalid-port-to-.patch doesn't apply:
Applying patch patches/0002-media-sun6i-csi-bridge-Error-out-on-invalid-port-to-.patch
patching file drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
Hunk #1 FAILED at 663.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
Patch patches/0002-media-sun6i-csi-bridge-Error-out-on-invalid-port-to-.patch can be reverse-applied

