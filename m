Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B33B133D5B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 09:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgAHIio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 03:38:44 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49196 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgAHIio (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 03:38:44 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ip6qf-00HR0H-C4; Wed, 08 Jan 2020 08:37:53 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ip6sV-0006ZN-8F; Wed, 08 Jan 2020 08:39:47 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] hevc fixes, various other fixes
Date:   Wed,  8 Jan 2020 08:39:47 +0000
Message-Id: <20200108083947.25212-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b6b0321c-5f12-a41f-4959-00e728cbd61b@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61056/
Build log: https://builder.linuxtv.org/job/patchwork/32735/
Build time: 00:19:32
Link: https://lore.kernel.org/linux-media/b6b0321c-5f12-a41f-4959-00e728cbd61b@xs4all.nl

gpg: Signature made Wed 08 Jan 2020 08:05:30 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 5 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-uapi-hevc-Add-scaling-matrix-control.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-uapi-hevc-Add-scaling-matrix-control.patch
patches/0001-media-uapi-hevc-Add-scaling-matrix-control.patch:89: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:58: CHECK: Alignment should match open parenthesis
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:91: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:96: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:97: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:98: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:106: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:107: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:108: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:116: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:117: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:118: WARNING: line over 80 characters
patches/0002-media-cedrus-hevc-Add-support-for-scaling-matrix.patch:125: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-cedrus-hevc-Add-support-for-multiple-slices.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-cedrus-hevc-Add-support-for-multiple-slices.patch
patches/0004-media-cedrus-hevc-Add-support-for-multiple-slices.patch:59: WARNING: line over 80 characters
patches/0004-media-cedrus-hevc-Add-support-for-multiple-slices.patch:60: WARNING: line over 80 characters
patches/0004-media-cedrus-hevc-Add-support-for-multiple-slices.patch:80: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-cedrus-Fix-decoding-for-some-HEVC-videos.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-cedrus-Fix-decoding-for-some-HEVC-videos.patch
patches/0005-media-cedrus-Fix-decoding-for-some-HEVC-videos.patch:53: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-cedrus-hevc-Add-luma-bit-depth.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-cedrus-hevc-Add-luma-bit-depth.patch
patches/0006-media-cedrus-hevc-Add-luma-bit-depth.patch:23: WARNING: line over 80 characters

