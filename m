Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B125DF6932
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 14:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfKJNyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 08:54:08 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54317 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbfKJNyI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 08:54:08 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iTnfD-0005KT-RZ; Sun, 10 Nov 2019 13:54:00 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iTnfq-0004RU-Kz; Sun, 10 Nov 2019 13:54:38 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR v5.5] Various fixes
Date:   Sun, 10 Nov 2019 13:54:38 +0000
Message-Id: <20191110135438.17035-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <a0d43238-a7dd-5fbb-4256-3739cc9d29e8@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59988/
Build log: https://builder.linuxtv.org/job/patchwork/24278/
Build time: 00:04:29
Link: https://lore.kernel.org/linux-media/a0d43238-a7dd-5fbb-4256-3739cc9d29e8@xs4all.nl

gpg: Signature made Sun 10 Nov 2019 01:36:43 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-hantro-Fix-s_fmt-for-dynamic-resolution-change.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-hantro-Fix-s_fmt-for-dynamic-resolution-change.patch
patches/0003-media-hantro-Fix-s_fmt-for-dynamic-resolution-change.patch:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0003-media-hantro-Fix-s_fmt-for-dynamic-resolution-change.patch:60: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-hantro-Fix-H264-motion-vector-buffer-offset.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-hantro-Fix-H264-motion-vector-buffer-offset.patch
patches/0008-media-hantro-Fix-H264-motion-vector-buffer-offset.patch:18: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

