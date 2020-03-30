Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9660A197827
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 11:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgC3J6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 05:58:36 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55428 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728259AbgC3J6g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 05:58:36 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jIr9G-00GMlp-CI; Mon, 30 Mar 2020 09:56:02 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jIrDL-00019g-7z; Mon, 30 Mar 2020 10:00:15 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.7-rc1] media updates (#62688)
Date:   Mon, 30 Mar 2020 10:00:15 +0000
Message-Id: <20200330100015.4399-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200330114824.46773eee@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/62688/
Build log: https://builder.linuxtv.org/job/patchwork/44549/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20200330114824.46773eee@coco.lan

gpg: Signature made Mon 30 Mar 2020 09:39:57 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-Fix-Kconfig-indentation.patch doesn't apply:
Applying patch patches/0001-media-Fix-Kconfig-indentation.patch
patching file drivers/media/Kconfig
Hunk #1 FAILED at 208.
1 out of 1 hunk FAILED -- rejects in file drivers/media/Kconfig
patching file drivers/media/platform/Kconfig
Hunk #1 FAILED at 610.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/Kconfig
patching file drivers/media/platform/exynos4-is/Kconfig
Hunk #1 FAILED at 13.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/exynos4-is/Kconfig
patching file drivers/media/radio/si470x/Kconfig
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file drivers/media/radio/si470x/Kconfig
Patch patches/0001-media-Fix-Kconfig-indentation.patch can be reverse-applied

