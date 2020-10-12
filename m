Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB50628B434
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 13:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388361AbgJLL4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 07:56:12 -0400
Received: from www.linuxtv.org ([130.149.80.248]:35202 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388255AbgJLL4M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 07:56:12 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kRwKS-00EpZj-8M; Mon, 12 Oct 2020 11:49:24 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kRwTq-0007Hp-Ip; Mon, 12 Oct 2020 11:59:06 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.10-rc1] media updates (#67960)
Date:   Mon, 12 Oct 2020 11:59:06 +0000
Message-Id: <20201012115906.27968-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012134139.0d58f5d7@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201012134139.0d58f5d7@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/72237/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20201012134139.0d58f5d7@coco.lan

gpg: Signature made Mon 12 Oct 2020 11:18:46 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-v4l2-subdev-Introduce-get-set-_mbus_config-pad.patch doesn't apply:
Applying patch patches/0001-media-v4l2-subdev-Introduce-get-set-_mbus_config-pad.patch
patching file drivers/media/v4l2-core/v4l2-subdev.c
Hunk #1 succeeded at 323 with fuzz 1 (offset 14 lines).
Hunk #2 FAILED at 335.
1 out of 2 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-subdev.c
patching file include/media/v4l2-subdev.h
Hunk #1 FAILED at 670.
Hunk #2 FAILED at 710.
2 out of 2 hunks FAILED -- rejects in file include/media/v4l2-subdev.h
Patch patches/0001-media-v4l2-subdev-Introduce-get-set-_mbus_config-pad.patch can be reverse-applied

