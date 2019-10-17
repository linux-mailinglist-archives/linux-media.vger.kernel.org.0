Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70277DA654
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404931AbfJQHWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:22:02 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54333 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727132AbfJQHWC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:22:02 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iL06e-0006zC-FN; Thu, 17 Oct 2019 07:21:56 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iL076-0002FA-HQ; Thu, 17 Oct 2019 07:22:24 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5 (v2)] vivid: add metadata capture/output support
Date:   Thu, 17 Oct 2019 07:22:23 +0000
Message-Id: <20191017072224.8583-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1074d944-de6e-7483-3337-ca9acd1b1c55@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59516/
Build log: https://builder.linuxtv.org/job/patchwork/20785/
Build time: 00:21:46
Link: https://lore.kernel.org/linux-media/1074d944-de6e-7483-3337-ca9acd1b1c55@xs4all.nl

gpg: Signature made Thu 17 Oct 2019 06:51:01 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 5 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-v4l2-dev-fix-is_tch-checks.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-v4l2-dev-fix-is_tch-checks.patch
patches/0003-v4l2-dev-fix-is_tch-checks.patch:40: WARNING: line over 80 characters
patches/0003-v4l2-dev-fix-is_tch-checks.patch:41: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-vivid-Add-metadata-capture-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-vivid-Add-metadata-capture-support.patch
patches/0005-vivid-Add-metadata-capture-support.patch:530: WARNING: line over 80 characters
patches/0005-vivid-Add-metadata-capture-support.patch:539: WARNING: line over 80 characters
patches/0005-vivid-Add-metadata-capture-support.patch:552: WARNING: line over 80 characters
patches/0005-vivid-Add-metadata-capture-support.patch:562: WARNING: line over 80 characters
patches/0005-vivid-Add-metadata-capture-support.patch:612: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0005-vivid-Add-metadata-capture-support.patch:791: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-Documentation-media-v4l2-Add-vivid-metadata-doc.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-Documentation-media-v4l2-Add-vivid-metadata-doc.patch
patches/0006-Documentation-media-v4l2-Add-vivid-metadata-doc.patch:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0006-Documentation-media-v4l2-Add-vivid-metadata-doc.patch:26: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0006-Documentation-media-v4l2-Add-vivid-metadata-doc.patch:31: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-v4l2-core-Add-new-metadata-format.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-v4l2-core-Add-new-metadata-format.patch
patches/0007-v4l2-core-Add-new-metadata-format.patch:23: ERROR: trailing statements should be on next line
patches/0007-v4l2-core-Add-new-metadata-format.patch:35: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-vivid-Add-metadata-output-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-vivid-Add-metadata-output-support.patch
patches/0008-vivid-Add-metadata-output-support.patch:435: WARNING: line over 80 characters
patches/0008-vivid-Add-metadata-output-support.patch:485: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

