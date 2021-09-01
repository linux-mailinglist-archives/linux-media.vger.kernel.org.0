Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A3B3FD4BC
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 09:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242682AbhIAHtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 03:49:40 -0400
Received: from www.linuxtv.org ([130.149.80.248]:38122 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242622AbhIAHtk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 03:49:40 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mLKzC-008KKt-Oz; Wed, 01 Sep 2021 07:48:42 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mLKzA-00FKCE-7V; Wed, 01 Sep 2021 07:48:40 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.15-rc1] media updates (#76720)
Date:   Wed,  1 Sep 2021 07:48:40 +0000
Message-Id: <20210901074840.3652508-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901094428.441b12c5@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210901094428.441b12c5@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/135549/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20210901094428.441b12c5@coco.lan

gpg: Signature made Wed 01 Sep 2021 07:28:08 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-dvbsky-add-support-for-MyGica-T230C2_LITE-and-.patch doesn't apply:
Applying patch patches/0001-media-dvbsky-add-support-for-MyGica-T230C2_LITE-and-.patch
patching file drivers/media/usb/dvb-usb-v2/dvbsky.c
Hunk #1 FAILED at 541.
Hunk #2 FAILED at 577.
Hunk #3 FAILED at 789.
3 out of 3 hunks FAILED -- rejects in file drivers/media/usb/dvb-usb-v2/dvbsky.c
patching file include/media/dvb-usb-ids.h
Hunk #1 FAILED at 394.
1 out of 1 hunk FAILED -- rejects in file include/media/dvb-usb-ids.h
Patch patches/0001-media-dvbsky-add-support-for-MyGica-T230C2_LITE-and-.patch can be reverse-applied

