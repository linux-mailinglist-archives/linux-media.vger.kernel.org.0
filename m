Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7087311E2B5
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 12:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfLMLV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 06:21:26 -0500
Received: from www.linuxtv.org ([130.149.80.248]:57552 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbfLMLV0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 06:21:26 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifj0J-00BfFf-Os; Fri, 13 Dec 2019 11:21:03 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifj1W-0002YK-DO; Fri, 13 Dec 2019 11:22:18 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] Fixes and add hantro csc postproc
Date:   Fri, 13 Dec 2019 11:22:18 +0000
Message-Id: <20191213112218.9771-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ffd3da67-83c4-bb65-c286-6d33a3d5100c@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60700/
Build log: https://builder.linuxtv.org/job/patchwork/29011/
Build time: 00:15:41
Link: https://lore.kernel.org/linux-media/ffd3da67-83c4-bb65-c286-6d33a3d5100c@xs4all.nl

gpg: Signature made Fri 13 Dec 2019 10:47:05 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-hantro-Support-color-conversion-via-post-proce.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-hantro-Support-color-conversion-via-post-proce.patch
patches/0005-media-hantro-Support-color-conversion-via-post-proce.patch:361: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0005-media-hantro-Support-color-conversion-via-post-proce.patch:380: CHECK: Macro argument reuse 'vpu' - possible side-effects?
patches/0005-media-hantro-Support-color-conversion-via-post-proce.patch:380: CHECK: Macro argument 'reg_name' may be better as '(reg_name)' to avoid precedence issues
patches/0005-media-hantro-Support-color-conversion-via-post-proce.patch:387: CHECK: Macro argument reuse 'vpu' - possible side-effects?
patches/0005-media-hantro-Support-color-conversion-via-post-proce.patch:387: CHECK: Macro argument 'reg_name' may be better as '(reg_name)' to avoid precedence issues

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-v4l2-device.h-Explicitly-compare-grp-id-mask-t.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-v4l2-device.h-Explicitly-compare-grp-id-mask-t.patch
patches/0006-media-v4l2-device.h-Explicitly-compare-grp-id-mask-t.patch:50: ERROR: space prohibited before that ',' (ctx:WxE)
patches/0006-media-v4l2-device.h-Explicitly-compare-grp-id-mask-t.patch:59: ERROR: space prohibited before that ',' (ctx:WxE)
patches/0006-media-v4l2-device.h-Explicitly-compare-grp-id-mask-t.patch:70: ERROR: space prohibited before that ',' (ctx:WxW)
patches/0006-media-v4l2-device.h-Explicitly-compare-grp-id-mask-t.patch:81: ERROR: space prohibited before that ',' (ctx:WxW)

