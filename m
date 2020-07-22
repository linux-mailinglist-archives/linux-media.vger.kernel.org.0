Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4567D229A8A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 16:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732663AbgGVOta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 10:49:30 -0400
Received: from www.linuxtv.org ([130.149.80.248]:34212 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729642AbgGVOt3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 10:49:29 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jyFyp-008kGf-O8; Wed, 22 Jul 2020 14:44:23 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jyG64-0003lp-9U; Wed, 22 Jul 2020 14:51:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.8-rc7] media fixes (#20200722155727)
Date:   Wed, 22 Jul 2020 14:51:52 +0000
Message-Id: <20200722145152.14452-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722155727.06ab1692@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200722155727.06ab1692@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/60838/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20200722155727.06ab1692@coco.lan

gpg: Signature made Mon 20 Jul 2020 01:02:01 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0038-Revert-media-atomisp-keep-the-ISP-powered-on-when-se.patch doesn't apply:
Applying patch patches/0038-Revert-media-atomisp-keep-the-ISP-powered-on-when-se.patch
patching file drivers/staging/media/atomisp/pci/atomisp_v4l2.c
Hunk #1 FAILED at 766.
1 out of 1 hunk FAILED -- rejects in file drivers/staging/media/atomisp/pci/atomisp_v4l2.c
Patch patches/0038-Revert-media-atomisp-keep-the-ISP-powered-on-when-se.patch does not apply (enforce with -f)

