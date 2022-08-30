Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1DC5A67F6
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 18:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiH3QPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 12:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiH3QPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 12:15:38 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E24E56B96
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 09:15:36 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oT3tn-005mWe-AV; Tue, 30 Aug 2022 16:15:35 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oT3ti-000wT5-77; Tue, 30 Aug 2022 16:15:30 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.1] Misc fixes to NXP, TI and Xilinx platform drivers (#85686)
Date:   Tue, 30 Aug 2022 16:15:30 +0000
Message-Id: <20220830161530.224364-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Ywuln1xotTNAvKCD@pendragon.ideasonboard.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Ywuln1xotTNAvKCD@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/234342/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/Ywuln1xotTNAvKCD@pendragon.ideasonboard.com

gpg: Signature made Sun 28 Aug 2022 05:27:01 PM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key


Build aborted due to a fatal error:
FAILED: patch patch patches/0002-media-platform-ti-Fix-typo-the-the-in-comment.patch doesn't apply:
Applying patch patches/0002-media-platform-ti-Fix-typo-the-the-in-comment.patch
patching file drivers/media/platform/ti/davinci/vpbe.c
Hunk #1 FAILED at 280.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/ti/davinci/vpbe.c
patching file drivers/media/platform/ti/omap3isp/isp.c
Hunk #1 FAILED at 1528.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/ti/omap3isp/isp.c
Patch patches/0002-media-platform-ti-Fix-typo-the-the-in-comment.patch can be reverse-applied

