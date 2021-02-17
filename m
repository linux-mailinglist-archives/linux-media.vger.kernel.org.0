Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FD031DBB7
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 15:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbhBQOvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 09:51:47 -0500
Received: from www.linuxtv.org ([130.149.80.248]:41466 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233016AbhBQOvq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 09:51:46 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lCOAS-00DX1r-P7; Wed, 17 Feb 2021 14:51:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lCOE7-0000IE-WF; Wed, 17 Feb 2021 14:54:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.12-rc1] media updates (#71607)
Date:   Wed, 17 Feb 2021 14:54:51 +0000
Message-Id: <20210217145451.1085-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217154040.46145543@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210217154040.46145543@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/90653/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20210217154040.46145543@coco.lan

gpg: Signature made Wed 17 Feb 2021 02:27:46 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-ti-vpe-cal-Create-subdev-for-CAMERARX.patch doesn't apply:
Applying patch patches/0001-media-ti-vpe-cal-Create-subdev-for-CAMERARX.patch
patching file drivers/media/platform/ti-vpe/cal-camerarx.c
Hunk #1 FAILED at 533.
Hunk #2 FAILED at 582.
Hunk #3 FAILED at 596.
Hunk #4 FAILED at 632.
Hunk #5 FAILED at 644.
5 out of 5 hunks FAILED -- rejects in file drivers/media/platform/ti-vpe/cal-camerarx.c
patching file drivers/media/platform/ti-vpe/cal-video.c
Hunk #1 succeeded at 682 (offset -127 lines).
patching file drivers/media/platform/ti-vpe/cal.c
Hunk #1 FAILED at 421.
Hunk #2 succeeded at 653 with fuzz 2 (offset 222 lines).
Hunk #3 succeeded at 1041 with fuzz 2 (offset 225 lines).
Hunk #4 FAILED at 840.
Hunk #5 FAILED at 872.
3 out of 5 hunks FAILED -- rejects in file drivers/media/platform/ti-vpe/cal.c
patching file drivers/media/platform/ti-vpe/cal.h
Hunk #1 FAILED at 24.
Hunk #2 FAILED at 33.
Hunk #3 FAILED at 108.
3 out of 3 hunks FAILED -- rejects in file drivers/media/platform/ti-vpe/cal.h
Patch patches/0001-media-ti-vpe-cal-Create-subdev-for-CAMERARX.patch does not apply (enforce with -f)

