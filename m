Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A224FC726
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 00:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237896AbiDKWCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Apr 2022 18:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350371AbiDKWBx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Apr 2022 18:01:53 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE7BBC5
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 14:59:36 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ne24M-00E88T-Sy; Mon, 11 Apr 2022 21:59:34 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ne24K-006yVi-1d; Mon, 11 Apr 2022 21:59:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.18-rc2] media fixes (#82368)
Date:   Mon, 11 Apr 2022 21:59:31 +0000
Message-Id: <20220411215931.1662524-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411233714.448cdc01@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20220411233714.448cdc01@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/198882/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20220411233714.448cdc01@coco.lan

gpg: Signature made Mon 11 Apr 2022 09:33:48 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [unknown]
gpg:                 aka "[jpeg image of size 3594]" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F909 AE68 FC11 DF09 C175  5C00 085F 3EBD 8EE4 E115


Build aborted due to a fatal error:
FAILED: patch patch patches/0002-media-platform-imx-mipi-csis-Add-dependency-on-VIDEO.patch doesn't apply:
Applying patch patches/0002-media-platform-imx-mipi-csis-Add-dependency-on-VIDEO.patch
patching file drivers/media/platform/nxp/Kconfig
Hunk #1 FAILED at 7.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/nxp/Kconfig
Patch patches/0002-media-platform-imx-mipi-csis-Add-dependency-on-VIDEO.patch can be reverse-applied

