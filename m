Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC103109FF0
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 15:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfKZOJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 09:09:45 -0500
Received: from www.linuxtv.org ([130.149.80.248]:53092 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbfKZOJp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 09:09:45 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iZbXB-0064oH-LE; Tue, 26 Nov 2019 14:09:41 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iZbXx-0007gQ-8k; Tue, 26 Nov 2019 14:10:29 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.5-rc1] media updates
Date:   Tue, 26 Nov 2019 14:10:29 +0000
Message-Id: <20191126141029.29493-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126150635.18ef45a9@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60396/
Build log: https://builder.linuxtv.org/job/patchwork/26584/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20191126150635.18ef45a9@kernel.org

gpg: Signature made Tue 26 Nov 2019 02:00:24 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-i2c-mt9m001-make-array-init_regs-static-makes-.patch doesn't apply:
Applying patch patches/0001-media-i2c-mt9m001-make-array-init_regs-static-makes-.patch
patching file drivers/media/i2c/mt9m001.c
Hunk #1 FAILED at 167.
1 out of 1 hunk FAILED -- rejects in file drivers/media/i2c/mt9m001.c
Patch patches/0001-media-i2c-mt9m001-make-array-init_regs-static-makes-.patch can be reverse-applied

