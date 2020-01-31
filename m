Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D47014F045
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2020 16:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbgAaP7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jan 2020 10:59:00 -0500
Received: from www.linuxtv.org ([130.149.80.248]:40720 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729030AbgAaP7A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jan 2020 10:59:00 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ixYfu-00ELYn-EE; Fri, 31 Jan 2020 15:57:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ixYiL-0006oG-2B; Fri, 31 Jan 2020 16:00:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.6-rc1] media updates
Date:   Fri, 31 Jan 2020 16:00:13 +0000
Message-Id: <20200131160013.26135-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131164922.7b105df7@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61385/
Build log: https://builder.linuxtv.org/job/patchwork/36092/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20200131164922.7b105df7@kernel.org

gpg: Signature made Fri 31 Jan 2020 03:36:33 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-dt-bindings-media-cal-update-binding-to-use-sy.patch doesn't apply:
Applying patch patches/0001-media-dt-bindings-media-cal-update-binding-to-use-sy.patch
can't find file to patch at input line 21
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 8f2b841a00b50766794a7426f22258c77f29b21d Mon Sep 17 00:00:00 2001
|From: Benoit Parrot <bparrot@ti.com>
|Date: Tue, 12 Nov 2019 15:53:28 +0100
|Subject: media: dt-bindings: media: cal: update binding to use syscon
|
|Update Device Tree bindings for the CAL driver to use syscon to access
|the phy config register instead of trying to map it directly.
|
|Signed-off-by: Benoit Parrot <bparrot@ti.com>
|Reviewed-by: Rob Herring <robh@kernel.org>
|Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
|Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
|---
| Documentation/devicetree/bindings/media/ti-cal.txt | 14 +++++++++-----
| 1 file changed, 9 insertions(+), 5 deletions(-)
|
|diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
|index ae9b52f37576..93096d924786 100644
|--- a/Documentation/devicetree/bindings/media/ti-cal.txt
|+++ b/Documentation/devicetree/bindings/media/ti-cal.txt
--------------------------
No file to patch.  Skipping patch.
2 out of 2 hunks ignored
Patch patches/0001-media-dt-bindings-media-cal-update-binding-to-use-sy.patch does not apply (enforce with -f)

