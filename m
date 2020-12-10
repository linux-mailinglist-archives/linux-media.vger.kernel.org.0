Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9992D594D
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389476AbgLJLeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 06:34:05 -0500
Received: from www.linuxtv.org ([130.149.80.248]:47818 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389474AbgLJLdu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 06:33:50 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1knKBz-00DWr1-5c; Thu, 10 Dec 2020 11:33:03 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1knKFC-0008LR-2j; Thu, 10 Dec 2020 11:36:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.10] media fixes (#69927)
Date:   Thu, 10 Dec 2020 11:36:21 +0000
Message-Id: <20201210113621.32036-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210121818.2d5c0353@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201210121818.2d5c0353@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/80710/
Build time: 00:05:03
Link: https://lore.kernel.org/linux-media/20201210121818.2d5c0353@coco.lan

gpg: Signature made Thu 10 Dec 2020 11:10:56 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]

Summary: got 1/7 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0005-media-next-media-vidtv-fix-a-read-from-an-object-aft.patch:

   checkpatch.pl:
	$ cat patches/0005-media-next-media-vidtv-fix-a-read-from-an-object-aft.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

