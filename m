Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C901F7FAB
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2020 01:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgFLX2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 19:28:03 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55276 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgFLX2D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 19:28:03 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jjt1i-00ASTz-Pa; Fri, 12 Jun 2020 23:23:58 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jjt7l-0000dr-2P; Fri, 12 Jun 2020 23:30:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.8-rc1] media updates (#64488)
Date:   Fri, 12 Jun 2020 23:30:12 +0000
Message-Id: <20200612233012.2426-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200613012615.31969e39@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64488/
Build log: https://builder.linuxtv.org/job/patchwork/55143/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20200613012615.31969e39@coco.lan

gpg: Signature made Fri 12 Jun 2020 11:13:47 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-atomisp-fix-pipeline-initialization-code.patch doesn't apply:
Applying patch patches/0001-media-atomisp-fix-pipeline-initialization-code.patch
patching file drivers/staging/media/atomisp/pci/sh_css.c
Hunk #1 FAILED at 3716.
Hunk #2 FAILED at 6117.
Hunk #3 FAILED at 6187.
Hunk #4 FAILED at 6251.
Hunk #5 FAILED at 6269.
Hunk #6 FAILED at 6301.
6 out of 6 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/sh_css.c
Patch patches/0001-media-atomisp-fix-pipeline-initialization-code.patch does not apply (enforce with -f)

