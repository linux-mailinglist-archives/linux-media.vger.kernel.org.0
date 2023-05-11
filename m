Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9DA6FEB92
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 08:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjEKGOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 02:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236759AbjEKGOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 02:14:53 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA2219AB
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 23:14:52 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pwzZj-001TBw-0E; Thu, 11 May 2023 06:14:51 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pwzZg-00DYXz-J0; Thu, 11 May 2023 06:14:48 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.4-rc2] media fixes (#91758)
Date:   Thu, 11 May 2023 06:14:48 +0000
Message-Id: <20230511061448.3231017-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511070103.263505ba@sal.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230511070103.263505ba@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/305313/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230511070103.263505ba@sal.lan

gpg: Signature made Thu 11 May 2023 05:56:24 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-rcar-vin-Gen3-can-not-scale-NV12.patch doesn't apply:
Applying patch patches/0001-media-rcar-vin-Gen3-can-not-scale-NV12.patch
patching file drivers/media/platform/renesas/rcar-vin/rcar-dma.c
Hunk #1 FAILED at 1312.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/renesas/rcar-vin/rcar-dma.c
Patch patches/0001-media-rcar-vin-Gen3-can-not-scale-NV12.patch can be reverse-applied

