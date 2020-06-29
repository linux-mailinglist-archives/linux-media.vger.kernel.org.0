Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3175620DF2A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbgF2Ucu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:32:50 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49142 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732405AbgF2Ucr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 16:32:47 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jq0O8-00E6ru-FM; Mon, 29 Jun 2020 20:28:24 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jq0Ua-0000on-55; Mon, 29 Jun 2020 20:35:04 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] Removal of soc-camera and dependent sensor (#64993)
Date:   Mon, 29 Jun 2020 20:35:04 +0000
Message-Id: <20200629203504.3104-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <bf6d5d12-9460-2bcc-a0d7-5553e7e18065@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64993/
Build log: https://builder.linuxtv.org/job/patchwork/57568/
Build time: 00:04:50
Link: https://lore.kernel.org/linux-media/bf6d5d12-9460-2bcc-a0d7-5553e7e18065@xs4all.nl

gpg: Signature made Mon 29 Jun 2020 07:45:36 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 6 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0003-mach-imx-mach-imx27_visstrim_m10.c-remove-soc_camera.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0003-mach-imx-mach-imx27_visstrim_m10.c-remove-soc_camera.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running cat patches/0004-mach-omap1-board-ams-delta.c-remove-soc_camera-depen.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0004-mach-omap1-board-ams-delta.c-remove-soc_camera-depen.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
-:104: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running cat patches/0005-mach-pxa-palmz72-pcm990-remove-soc_camera-dependenci.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0005-mach-pxa-palmz72-pcm990-remove-soc_camera-dependenci.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running cat patches/0006-staging-media-soc_camera-remove-this-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-staging-media-soc_camera-remove-this-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:67: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running cat patches/0007-soc_camera.h-remove-this-unused-header.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-soc_camera.h-remove-this-unused-header.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

