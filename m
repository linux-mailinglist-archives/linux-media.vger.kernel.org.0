Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B912254B42
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 18:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgH0Q4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 12:56:16 -0400
Received: from www.linuxtv.org ([130.149.80.248]:34216 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgH0Q4Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 12:56:16 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBL6Z-0041s7-2j; Thu, 27 Aug 2020 16:50:27 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBLEm-0002Vh-6H; Thu, 27 Aug 2020 16:58:56 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] More fixes and improvements (#66441)
Date:   Thu, 27 Aug 2020 16:58:56 +0000
Message-Id: <20200827165856.9608-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87327e52-44cc-a2b8-c3fe-619bd6022264@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/87327e52-44cc-a2b8-c3fe-619bd6022264@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 00:28:47
Link: https://lore.kernel.org/linux-media/87327e52-44cc-a2b8-c3fe-619bd6022264@xs4all.nl

gpg: Signature made Thu 20 Aug 2020 11:58:39 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 5 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0018-media-Use-fallthrough-pseudo-keyword.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0018-media-Use-fallthrough-pseudo-keyword.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running cat patches/0030-media-exynos4-is-Add-support-for-multiple-sensors-on.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0030-media-exynos4-is-Add-support-for-multiple-sensors-on.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:29: CHECK: Alignment should match open parenthesis

Error #256 when running cat patches/0037-media-exynos4-is-no-need-to-check-return-value-of-de.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0037-media-exynos4-is-no-need-to-check-return-value-of-de.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:41: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.

Error #256 when running cat patches/0040-media-radio-si476x-no-need-to-check-return-value-of-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0040-media-radio-si476x-no-need-to-check-return-value-of-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:46: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
-:56: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
-:65: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
-:74: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
-:90: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.

