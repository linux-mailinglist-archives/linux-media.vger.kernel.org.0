Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45448D8EA8
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 12:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730697AbfJPKxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 06:53:39 -0400
Received: from www.linuxtv.org ([130.149.80.248]:46727 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbfJPKxj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 06:53:39 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iKgvt-0005G2-KR; Wed, 16 Oct 2019 10:53:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iKgwL-0000fi-QM; Wed, 16 Oct 2019 10:54:01 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] vivid: add metadata capture/output support
Date:   Wed, 16 Oct 2019 10:54:01 +0000
Message-Id: <20191016105401.2541-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5364cdbc-ccea-addd-3849-c4f9e26023fb@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59498/
Build log: https://builder.linuxtv.org/job/patchwork/20663/
Build time: 00:13:22
Link: https://lore.kernel.org/linux-media/5364cdbc-ccea-addd-3849-c4f9e26023fb@xs4all.nl

gpg: Signature made Wed 16 Oct 2019 10:27:36 AM UTC
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

