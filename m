Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273B7482644
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 02:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbiAABrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Dec 2021 20:47:33 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54066 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231833AbiAABrc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Dec 2021 20:47:32 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1n3TUZ-008f5n-3b; Sat, 01 Jan 2022 01:47:31 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1n3TUU-005Uyf-Uk; Sat, 01 Jan 2022 01:47:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.17-rc1] New year's media updates (#79714)
Date:   Sat,  1 Jan 2022 01:47:26 +0000
Message-Id: <20220101014726.1310671-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220101024250.39c9b5b6@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20220101024250.39c9b5b6@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/170357/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20220101024250.39c9b5b6@coco.lan

gpg: Signature made Sat 01 Jan 2022 01:13:23 AM UTC
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
FAILED: patch patch patches/0001-media-admin-guide-add-stm32-dma2d-description.patch doesn't apply:
Applying patch patches/0001-media-admin-guide-add-stm32-dma2d-description.patch
patching file Documentation/admin-guide/media/platform-cardlist.rst
Hunk #1 FAILED at 60.
1 out of 1 hunk FAILED -- rejects in file Documentation/admin-guide/media/platform-cardlist.rst
Patch patches/0001-media-admin-guide-add-stm32-dma2d-description.patch can be reverse-applied

