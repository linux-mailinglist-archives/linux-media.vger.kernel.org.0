Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C360E254AA6
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 18:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgH0QZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 12:25:15 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58578 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgH0QZN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 12:25:13 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBKcU-003zze-QI; Thu, 27 Aug 2020 16:19:22 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBKkh-0002HG-SS; Thu, 27 Aug 2020 16:27:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Various fixes/improvements (#66418)
Date:   Thu, 27 Aug 2020 16:27:51 +0000
Message-Id: <20200827162751.8713-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <4f43533b-c6a9-6741-851b-af8d0a74880d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/4f43533b-c6a9-6741-851b-af8d0a74880d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 00:18:00
Link: https://lore.kernel.org/linux-media/4f43533b-c6a9-6741-851b-af8d0a74880d@xs4all.nl

gpg: Signature made Wed 19 Aug 2020 03:43:26 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 8 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0005-media-pci-saa7164.c-Replace-if-cond-BUG-with-BUG_ON.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0005-media-pci-saa7164.c-Replace-if-cond-BUG-with-BUG_ON.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:32: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
-:40: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()

Error #256 when running cat patches/0006-media-pci-saa7164-dvb.c-replace-if-cond-BUG-with-BUG.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-media-pci-saa7164-dvb.c-replace-if-cond-BUG-with-BUG.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:32: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
-:42: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()

Error #256 when running cat patches/0007-media-pci-saa7164-vbi.c-replace-if-cond-BUG-with-BUG.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-media-pci-saa7164-vbi.c-replace-if-cond-BUG-with-BUG.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:32: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
-:42: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()

Error #256 when running cat patches/0008-media-pci-saa7164-core.c-replace-if-cond-BUG-with-BU.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0008-media-pci-saa7164-core.c-replace-if-cond-BUG-with-BU.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:36: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
-:46: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
-:57: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()

Error #256 when running cat patches/0016-media-fsl-viu-Do-not-redefine-out_be32-in_be32-for-C.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0016-media-fsl-viu-Do-not-redefine-out_be32-in_be32-for-C.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:22: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running cat patches/0022-media-mantis-convert-tasklets-to-use-new-tasklet_set.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0022-media-mantis-convert-tasklets-to-use-new-tasklet_set.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:45: CHECK: extern prototypes should be avoided in .h files

Error #256 when running cat patches/0032-media-staging-tegra-vde-Mark-tegra_vde_runtime_suspe.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0032-media-staging-tegra-vde-Mark-tegra_vde_runtime_suspe.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

