Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C243B5F3B
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 15:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhF1Nmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 09:42:42 -0400
Received: from www.linuxtv.org ([130.149.80.248]:59236 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230154AbhF1Nmm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 09:42:42 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lxrUl-002aDM-8w; Mon, 28 Jun 2021 13:40:15 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lxrZH-0001JA-Tw; Mon, 28 Jun 2021 13:44:56 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.14-rc1] media updates (#75463)
Date:   Mon, 28 Jun 2021 13:44:55 +0000
Message-Id: <20210628134455.4987-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628153005.1416aadf@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210628153005.1416aadf@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/119251/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20210628153005.1416aadf@coco.lan

gpg: Signature made Mon 28 Jun 2021 01:19:49 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-staging-media-rkvdec-fix-pm_runtime_get_sync-usage-c.patch doesn't apply:
Applying patch patches/0001-staging-media-rkvdec-fix-pm_runtime_get_sync-usage-c.patch
patching file drivers/staging/media/rkvdec/rkvdec.c
Hunk #1 FAILED at 658.
1 out of 1 hunk FAILED -- rejects in file drivers/staging/media/rkvdec/rkvdec.c
Patch patches/0001-staging-media-rkvdec-fix-pm_runtime_get_sync-usage-c.patch can be reverse-applied

