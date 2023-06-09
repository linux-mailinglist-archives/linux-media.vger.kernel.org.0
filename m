Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058AB729836
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 13:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237713AbjFILa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 07:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238387AbjFILa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 07:30:27 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21AB730ED
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 04:30:16 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7aJq-0005Ma-My; Fri, 09 Jun 2023 11:30:14 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7aJo-00B1Aw-5u; Fri, 09 Jun 2023 11:30:12 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.4-rc5] media fixes (#92326)
Date:   Fri,  9 Jun 2023 11:30:12 +0000
Message-Id: <20230609113012.2626080-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230604140137.1f160782@sal.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230604140137.1f160782@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/313144/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230604140137.1f160782@sal.lan

gpg: Signature made Sun 04 Jun 2023 12:50:48 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-verisilicon-Additional-fix-for-the-crash-when-.patch doesn't apply:
Applying patch patches/0001-media-verisilicon-Additional-fix-for-the-crash-when-.patch
patching file drivers/media/platform/verisilicon/hantro_v4l2.c
Hunk #1 FAILED at 397.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/verisilicon/hantro_v4l2.c
Patch patches/0001-media-verisilicon-Additional-fix-for-the-crash-when-.patch can be reverse-applied

