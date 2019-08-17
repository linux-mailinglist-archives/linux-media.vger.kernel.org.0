Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43F1690FE6
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 12:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfHQKIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 06:08:53 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58730 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbfHQKIx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 06:08:53 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hyvdb-0001Ff-FN; Sat, 17 Aug 2019 10:08:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hyvdd-0000MN-3W; Sat, 17 Aug 2019 10:08:45 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] Hantro H.264 + finish stateful decoder spec
Date:   Sat, 17 Aug 2019 10:08:44 +0000
Message-Id: <20190817100844.1342-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1be8ac17-349b-ef4d-299d-4f38889492ec@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58252/
Build log: https://builder.linuxtv.org/job/patchwork/10603/
Build time: 00:35:01
Link: https://lore.kernel.org/linux-media/1be8ac17-349b-ef4d-299d-4f38889492ec@xs4all.nl
Summary: 8 patches and/or PDF generation with issues, being 0 at build time

gpg: Signature made Sat 17 Aug 2019 08:26:34 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]


Error/warnings:

patches/0001-lib-sort.c-implement-sort-variant-taking-context-arg.patch:30: WARNING: Non-standard signature: Requested-by:
patches/0001-lib-sort.c-implement-sort-variant-taking-context-arg.patch:114: WARNING: line over 80 characters
patches/0001-lib-sort.c-implement-sort-variant-taking-context-arg.patch:120: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-lib-sort.c-implement-sort-variant-taking-context-arg.patch
patches/0002-media-uapi-h264-Rename-pixel-format.patch:50: WARNING: line over 80 characters
patches/0002-media-uapi-h264-Rename-pixel-format.patch:50: ERROR: trailing statements should be on next line
patches/0002-media-uapi-h264-Rename-pixel-format.patch:107: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-uapi-h264-Rename-pixel-format.patch
patches/0003-media-uapi-h264-Add-the-concept-of-decoding-mode.patch:154: WARNING: line over 80 characters
patches/0003-media-uapi-h264-Add-the-concept-of-decoding-mode.patch:174: CHECK: spaces preferred around that '+' (ctx:VxV)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-uapi-h264-Add-the-concept-of-decoding-mode.patch
patches/0004-media-uapi-h264-Add-the-concept-of-start-code.patch:118: WARNING: line over 80 characters
patches/0004-media-uapi-h264-Add-the-concept-of-start-code.patch:138: CHECK: spaces preferred around that '+' (ctx:VxV)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-uapi-h264-Add-the-concept-of-start-code.patch
patches/0006-media-cedrus-Cleanup-control-initialization.patch:109: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-cedrus-Cleanup-control-initialization.patch
patches/0009-media-hantro-Add-core-bits-to-support-H264-decoding.patch:138: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0009-media-hantro-Add-core-bits-to-support-H264-decoding.patch:536: CHECK: Unnecessary parentheses around 'poca < builder->curpoc'
patches/0009-media-hantro-Add-core-bits-to-support-H264-decoding.patch:536: CHECK: Unnecessary parentheses around 'pocb < builder->curpoc'
patches/0009-media-hantro-Add-core-bits-to-support-H264-decoding.patch:577: CHECK: Unnecessary parentheses around 'poca < builder->curpoc'
patches/0009-media-hantro-Add-core-bits-to-support-H264-decoding.patch:577: CHECK: Unnecessary parentheses around 'pocb < builder->curpoc'

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-hantro-Add-core-bits-to-support-H264-decoding.patch
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:32: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:89: WARNING: line over 80 characters
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:95: WARNING: line over 80 characters
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:107: WARNING: line over 80 characters
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:111: WARNING: line over 80 characters
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:125: WARNING: line over 80 characters
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:141: WARNING: line over 80 characters
patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch:142: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-hantro-Add-support-for-H264-decoding-on-G1.patch
patches/0017-media-docs-rst-Document-memory-to-memory-video-decod.patch:39: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-docs-rst-Document-memory-to-memory-video-decod.patch

