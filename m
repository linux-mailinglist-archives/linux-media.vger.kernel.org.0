Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0A02D942D
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 09:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406789AbgLNI32 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 03:29:28 -0500
Received: from www.linuxtv.org ([130.149.80.248]:41454 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgLNI31 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 03:29:27 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kojDq-002AB5-LG; Mon, 14 Dec 2020 08:28:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kojH4-00062H-Ht; Mon, 14 Dec 2020 08:32:06 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.11-rc1] media updates (#70010)
Date:   Mon, 14 Dec 2020 08:32:06 +0000
Message-Id: <20201214083206.23160-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214092132.63215862@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201214092132.63215862@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/81268/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20201214092132.63215862@coco.lan

gpg: Signature made Mon 14 Dec 2020 08:12:40 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-v4l2-prepare-compat-ioctl-rework.patch doesn't apply:
Applying patch patches/0001-media-v4l2-prepare-compat-ioctl-rework.patch
patching file drivers/media/v4l2-core/v4l2-compat-ioctl32.c
Hunk #1 succeeded at 1222 with fuzz 2 (offset -192 lines).
patching file drivers/media/v4l2-core/v4l2-ioctl.c
Hunk #1 FAILED at 8.
Hunk #2 FAILED at 3104.
Hunk #3 FAILED at 3119.
Hunk #4 FAILED at 3236.
Hunk #5 FAILED at 3274.
Hunk #6 FAILED at 3297.
Hunk #7 FAILED at 3318.
Hunk #8 FAILED at 3330.
8 out of 8 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ioctl.c
patching file include/media/v4l2-ioctl.h
Hunk #1 succeeded at 696 with fuzz 2 (offset 10 lines).
Patch patches/0001-media-v4l2-prepare-compat-ioctl-rework.patch does not apply (enforce with -f)

