Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F24530AD1
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 10:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiEWHdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 03:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiEWHcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 03:32:41 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55389B44
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 00:32:18 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nt2Y4-006Uk6-MJ; Mon, 23 May 2022 07:32:16 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nt2Y1-009XcB-Lg; Mon, 23 May 2022 07:32:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.19-rc1] media updates (#83481)
Date:   Mon, 23 May 2022 07:32:13 +0000
Message-Id: <20220523073213.2274121-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220523091255.058e306d@coco.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20220523091255.058e306d@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/209976/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20220523091255.058e306d@coco.lan

gpg: Signature made Mon 23 May 2022 07:00:00 AM UTC
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
FAILED: patch patch patches/0001-media-dvb-usb-ids.h-sort-entries.patch doesn't apply:
Applying patch patches/0001-media-dvb-usb-ids.h-sort-entries.patch
patching file include/media/dvb-usb-ids.h
Hunk #1 FAILED at 11.
Hunk #2 FAILED at 95.
2 out of 2 hunks FAILED -- rejects in file include/media/dvb-usb-ids.h
Patch patches/0001-media-dvb-usb-ids.h-sort-entries.patch does not apply (enforce with -f)

