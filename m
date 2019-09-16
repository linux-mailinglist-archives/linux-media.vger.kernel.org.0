Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4140BB3A58
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 14:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfIPMab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 08:30:31 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48941 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbfIPMab (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 08:30:31 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i9q97-0004lw-Iy; Mon, 16 Sep 2019 12:30:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i9q9K-0006hx-PF; Mon, 16 Sep 2019 12:30:36 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.4-rc1] media updates
Date:   Mon, 16 Sep 2019 12:30:34 +0000
Message-Id: <20190916123034.25744-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916092515.66549c3b@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58782/
Build log: https://builder.linuxtv.org/job/patchwork/16380/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20190916092515.66549c3b@coco.lan

gpg: Signature made Mon 16 Sep 2019 12:06:35 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-v4l2-ioctl-add-missing-pixelformats.patch doesn't apply:
Applying patch patches/0001-media-v4l2-ioctl-add-missing-pixelformats.patch
patching file drivers/media/v4l2-core/v4l2-ioctl.c
Hunk #1 FAILED at 1169.
Hunk #2 FAILED at 1186.
Hunk #3 FAILED at 1301.
Hunk #4 FAILED at 1326.
4 out of 4 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ioctl.c
Patch patches/0001-media-v4l2-ioctl-add-missing-pixelformats.patch can be reverse-applied

