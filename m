Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D8FF68B7
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 12:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfKJLf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 06:35:56 -0500
Received: from www.linuxtv.org ([130.149.80.248]:47597 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbfKJLf4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 06:35:56 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iTlVU-0003YQ-La; Sun, 10 Nov 2019 11:35:48 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iTlW7-0002QM-Ld; Sun, 10 Nov 2019 11:36:27 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Various fixes
Date:   Sun, 10 Nov 2019 11:36:26 +0000
Message-Id: <20191110113626.9277-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <06580f57-7b93-3bfd-7fa5-ad25732f3606@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59987/
Build log: https://builder.linuxtv.org/job/patchwork/24264/
Build time: 00:06:06
Link: https://lore.kernel.org/linux-media/06580f57-7b93-3bfd-7fa5-ad25732f3606@xs4all.nl

gpg: Signature made Sun 10 Nov 2019 11:20:01 AM UTC
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

