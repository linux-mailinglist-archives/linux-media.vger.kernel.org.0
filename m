Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168DF1EE64D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 16:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgFDOFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 10:05:45 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52396 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728673AbgFDOFo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 10:05:44 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jgqRK-00HVFo-Az; Thu, 04 Jun 2020 14:01:50 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jgqX9-0006sX-Pr; Thu, 04 Jun 2020 14:07:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.8] Various fixes for v5.8 (#64275)
Date:   Thu,  4 Jun 2020 14:07:51 +0000
Message-Id: <20200604140751.26400-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3fd4dd63-530b-0341-8579-a5759d8bb07a@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64275/
Build log: https://builder.linuxtv.org/job/patchwork/53937/
Build time: 00:17:39
Link: https://lore.kernel.org/linux-media/3fd4dd63-530b-0341-8579-a5759d8bb07a@xs4all.nl

gpg: Signature made Thu 04 Jun 2020 01:43:45 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0004-media-s5p-mfc-Properly-handle-dma_parms-for-the-allo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0004-media-s5p-mfc-Properly-handle-dma_parms-for-the-allo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:6: WARNING: Unknown commit id '9495b7e92f71', maybe rebased or not pulled?
-:15: WARNING: Unknown commit id '9495b7e92f71', maybe rebased or not pulled?

Error #256 when running cat patches/0006-media-videobuf2-dma-contig-fix-bad-kfree-in-vb2_dma_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-media-videobuf2-dma-contig-fix-bad-kfree-in-vb2_dma_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:6: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'Commit fatal: bad o ("ab5e97ab4a39adfdd")'

Error #256 when running cat patches/0007-media-v4l2-ctrls-Unset-correct-HEVC-loop-filter-flag.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-media-v4l2-ctrls-Unset-correct-HEVC-loop-filter-flag.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:28: WARNING: line over 80 characters

