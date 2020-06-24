Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E0D2077D4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404176AbgFXPp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:45:27 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53630 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404187AbgFXPp1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:45:27 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jo7WP-007hwI-UC; Wed, 24 Jun 2020 15:41:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jo7ck-0004Wt-7Z; Wed, 24 Jun 2020 15:47:42 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] More fixes (#64882)
Date:   Wed, 24 Jun 2020 15:47:42 +0000
Message-Id: <20200624154742.17370-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <29109a40-a46b-8d22-067c-c7082b8cf13b@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64882/
Build log: https://builder.linuxtv.org/job/patchwork/56820/
Build time: 00:17:30
Link: https://lore.kernel.org/linux-media/29109a40-a46b-8d22-067c-c7082b8cf13b@xs4all.nl

gpg: Signature made Wed 24 Jun 2020 03:13:15 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 5 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0001-media-staging-rkisp1-cap-remove-support-of-BGR666-fo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0001-media-staging-rkisp1-cap-remove-support-of-BGR666-fo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running cat patches/0004-media-atmel-atmel-sama5d2-isc-fix-warning-in-configs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0004-media-atmel-atmel-sama5d2-isc-fix-warning-in-configs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running cat patches/0007-mtk-mdp-Remove-states-for-format-checks.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-mtk-mdp-Remove-states-for-format-checks.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:117: CHECK: Alignment should match open parenthesis
-:122: CHECK: Alignment should match open parenthesis
-:133: CHECK: Alignment should match open parenthesis
-:162: CHECK: Alignment should match open parenthesis

Error #256 when running cat patches/0014-media-vsp1-dl-Fix-NULL-pointer-dereference-on-unbind.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0014-media-vsp1-dl-Fix-NULL-pointer-dereference-on-unbind.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

