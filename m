Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F48D9052
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388546AbfJPMEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:04:14 -0400
Received: from www.linuxtv.org ([130.149.80.248]:50086 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfJPMEO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:04:14 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iKi29-0001IN-4a; Wed, 16 Oct 2019 12:04:05 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iKi2b-0005s8-BM; Wed, 16 Oct 2019 12:04:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Add slicing support + spec for stateless decoders
Date:   Wed, 16 Oct 2019 12:04:33 +0000
Message-Id: <20191016120433.22531-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <02bfac01-d6ba-1eca-efc6-1dbfcc712dc0@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59500/
Build log: https://builder.linuxtv.org/job/patchwork/20670/
Build time: 00:14:23
Link: https://lore.kernel.org/linux-media/02bfac01-d6ba-1eca-efc6-1dbfcc712dc0@xs4all.nl

gpg: Signature made Wed 16 Oct 2019 11:31:23 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-vb2-add-V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-vb2-add-V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.patch
patches/0001-vb2-add-V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.patch:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0001-vb2-add-V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.patch:100: WARNING: line over 80 characters
patches/0001-vb2-add-V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.patch:156: CHECK: Prefer using the BIT macro

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-v4l2-mem2mem-support-held-capture-buffers.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-v4l2-mem2mem-support-held-capture-buffers.patch
patches/0002-v4l2-mem2mem-support-held-capture-buffers.patch:68: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-cedrus-h264-Support-multiple-slices-per-frame.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-cedrus-h264-Support-multiple-slices-per-frame.patch
patches/0006-media-cedrus-h264-Support-multiple-slices-per-frame.patch:131: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-docs-rst-Document-m2m-stateless-video-decoder-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-docs-rst-Document-m2m-stateless-video-decoder-.patch
patches/0007-media-docs-rst-Document-m2m-stateless-video-decoder-.patch:31: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

