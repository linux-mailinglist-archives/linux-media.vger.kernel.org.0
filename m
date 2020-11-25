Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9062C3AC8
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 09:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgKYITo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 03:19:44 -0500
Received: from www.linuxtv.org ([130.149.80.248]:44404 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgKYITo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 03:19:44 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1khq1f-009HIx-2C; Wed, 25 Nov 2020 08:19:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1khq4l-0002sY-Te; Wed, 25 Nov 2020 08:22:56 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.10-rc6] media fixes (#69337)
Date:   Wed, 25 Nov 2020 08:22:55 +0000
Message-Id: <20201125082255.11025-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201125090758.131b3448@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201125090758.131b3448@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/78538/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20201125090758.131b3448@coco.lan

gpg: Signature made Wed 25 Nov 2020 08:00:03 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0003-media-media-platform-marvell-ccic-fix-warnings-when-.patch doesn't apply:
Applying patch patches/0003-media-media-platform-marvell-ccic-fix-warnings-when-.patch
patching file drivers/media/platform/marvell-ccic/mmp-driver.c
Hunk #1 FAILED at 307.
1 out of 2 hunks FAILED -- rejects in file drivers/media/platform/marvell-ccic/mmp-driver.c
Patch patches/0003-media-media-platform-marvell-ccic-fix-warnings-when-.patch does not apply (enforce with -f)

