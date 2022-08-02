Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32113587E71
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 16:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbiHBOzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 10:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237329AbiHBOzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 10:55:37 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8FE1EC42
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 07:55:36 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oItJ0-000mui-NO; Tue, 02 Aug 2022 14:55:34 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oItIx-005OAx-Ay; Tue, 02 Aug 2022 14:55:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.20-rc1] media updates (#85227)
Date:   Tue,  2 Aug 2022 14:55:30 +0000
Message-Id: <20220802145530.1284523-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802164658.4e533a24@coco.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20220802164658.4e533a24@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/230155/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20220802164658.4e533a24@coco.lan

gpg: Signature made Tue 02 Aug 2022 02:27:42 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-imx-jpeg-Don-t-fill-the-description-field-in-s.patch doesn't apply:
Applying patch patches/0001-media-imx-jpeg-Don-t-fill-the-description-field-in-s.patch
patching file drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
Hunk #1 FAILED at 389.
Hunk #2 FAILED at 1646.
2 out of 2 hunks FAILED -- rejects in file drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
Patch patches/0001-media-imx-jpeg-Don-t-fill-the-description-field-in-s.patch can be reverse-applied

