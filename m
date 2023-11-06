Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C027E1E74
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 11:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjKFKep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 05:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbjKFKek (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 05:34:40 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C6F184
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 02:34:35 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qzwwD-000izh-Og; Mon, 06 Nov 2023 10:34:33 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qzwwB-00BEtJ-1m;
        Mon, 06 Nov 2023 10:34:31 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.7-rc1] media updates (#96691)
Date:   Mon,  6 Nov 2023 10:34:30 +0000
Message-Id: <20231106103431.2678840-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106112531.717e897b@coco.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20231106112531.717e897b@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/354727/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20231106112531.717e897b@coco.lan

gpg: Signature made Sat 04 Nov 2023 05:48:45 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-qcom-camss-Fix-pm_domain_on-sequence-in-probe.patch doesn't apply:
Applying patch patches/0001-media-qcom-camss-Fix-pm_domain_on-sequence-in-probe.patch
patching file drivers/media/platform/qcom/camss/camss.c
Hunk #1 succeeded at 1628 with fuzz 2 (offset 9 lines).
Hunk #2 FAILED at 1684.
1 out of 2 hunks FAILED -- rejects in file drivers/media/platform/qcom/camss/camss.c
Patch patches/0001-media-qcom-camss-Fix-pm_domain_on-sequence-in-probe.patch does not apply (enforce with -f)

