Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471E53073FD
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 11:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhA1KqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 05:46:04 -0500
Received: from www.linuxtv.org ([130.149.80.248]:55000 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhA1KqB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 05:46:01 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l54ne-0003ZM-GX; Thu, 28 Jan 2021 10:45:18 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l54rB-0005Yn-8i; Thu, 28 Jan 2021 10:48:57 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.11-rc6] media fixes (#71158)
Date:   Thu, 28 Jan 2021 10:48:57 +0000
Message-Id: <20210128104857.21332-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128112738.67242607@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210128112738.67242607@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/87749/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20210128112738.67242607@coco.lan

gpg: Signature made Thu 28 Jan 2021 10:07:28 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0005-media-v4l-common-Fix-naming-of-v4l2_get_link_rate.patch doesn't apply:
Applying patch patches/0005-media-v4l-common-Fix-naming-of-v4l2_get_link_rate.patch
can't find file to patch at input line 23
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 2984a99ff1c071c85dc09451c8adc859c22fbb96 Mon Sep 17 00:00:00 2001
|From: Sakari Ailus <sakari.ailus@linux.intel.com>
|Date: Thu, 17 Dec 2020 18:57:05 +0100
|Subject: media: v4l: common: Fix naming of v4l2_get_link_rate
|
|Rename v4l2_get_link_rate() as v4l2_get_link_freq(). What the function
|returns is the frequency of the link; rename it to reflect the name of the
|control where the information is obtained.
|
|Fixes: 1b888b3cebef ("media: v4l: Add a helper for obtaining the link frequency")
|Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
|Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
|---
| drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
| drivers/media/v4l2-core/v4l2-common.c    | 4 ++--
| include/media/v4l2-common.h              | 4 ++--
| 3 files changed, 5 insertions(+), 5 deletions(-)
|
|diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
|index 36e354ecf71e..6cada8a6e50c 100644
|--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
|+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
patching file drivers/media/v4l2-core/v4l2-common.c
patching file include/media/v4l2-common.h
Patch patches/0005-media-v4l-common-Fix-naming-of-v4l2_get_link_rate.patch does not apply (enforce with -f)

