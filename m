Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C067730AC85
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 17:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhBAQWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 11:22:08 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54440 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhBAQWH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 11:22:07 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l6bx6-0069Cz-PH; Mon, 01 Feb 2021 16:21:24 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l6c0e-0001tD-V6; Mon, 01 Feb 2021 16:25:05 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.11-rc7] media fixes (#71221)
Date:   Mon,  1 Feb 2021 16:25:04 +0000
Message-Id: <20210201162504.7222-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210201165609.21443571@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210201165609.21443571@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/88358/
Build time: 00:09:08
Link: https://lore.kernel.org/linux-media/20210201165609.21443571@coco.lan

gpg: Signature made Mon 01 Feb 2021 03:52:16 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]

Summary: got 1/6 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0006-media-rockchip-rkisp1-extend-uapi-array-sizes.patch:

   checkpatch.pl:
	$ cat patches/0006-media-rockchip-rkisp1-extend-uapi-array-sizes.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:109: WARNING: line length of 101 exceeds 100 columns


Error #512 when building PDF docs

