Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3A79D036
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 15:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbfHZNRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 09:17:22 -0400
Received: from www.linuxtv.org ([130.149.80.248]:34017 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbfHZNRW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 09:17:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i2Erv-0003gB-BA; Mon, 26 Aug 2019 13:17:11 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i2Es0-0007GB-Tv; Mon, 26 Aug 2019 13:17:16 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] Various fixes/enhancements
Date:   Mon, 26 Aug 2019 13:17:15 +0000
Message-Id: <20190826131715.27866-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <fa71c2b9-1267-b437-e5ac-cead7dca37a8@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58417/
Build log: https://builder.linuxtv.org/job/patchwork/13358/
Build time: 00:26:47
Link: https://lore.kernel.org/linux-media/fa71c2b9-1267-b437-e5ac-cead7dca37a8@xs4all.nl

gpg: Signature made Mon 26 Aug 2019 12:41:30 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:

patches/0015-media-v4l2-core-Module-re-organization.patch:12: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit a9254475bbfb ("V4L/DVB (7115): Fix bug #9833: regression when compiling V4L without I2C")'
patches/0015-media-v4l2-core-Module-re-organization.patch:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0015-media-v4l2-core-Module-re-organization.patch
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:116: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:132: CHECK: Alignment should match open parenthesis
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:144: CHECK: Alignment should match open parenthesis
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:149: CHECK: Alignment should match open parenthesis
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:154: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:161: CHECK: Comparison to NULL could be written "!spi"
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:161: CHECK: Comparison to NULL could be written "!spi->dev.driver"
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:170: WARNING: Block comments use * on subsequent lines
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:170: WARNING: Block comments use a trailing */ on a separate line
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:179: WARNING: Block comments use * on subsequent lines
patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch:179: WARNING: Block comments use a trailing */ on a separate line

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0016-media-v4l2-core-move-spi-helpers-out-of-v4l2-common..patch
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:216: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:245: CHECK: Alignment should match open parenthesis
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:261: CHECK: Alignment should match open parenthesis
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:267: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:279: WARNING: Block comments use * on subsequent lines
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:284: WARNING: Block comments use a trailing */ on a separate line
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:285: CHECK: Comparison to NULL could be written "!client"
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:285: CHECK: Comparison to NULL could be written "!client->dev.driver"
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:294: WARNING: Block comments use * on subsequent lines
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:294: WARNING: Block comments use a trailing */ on a separate line
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:302: WARNING: Block comments use * on subsequent lines
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:302: WARNING: Block comments use a trailing */ on a separate line
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:303: CHECK: Comparison to NULL could be written "!sd"
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:310: CHECK: Alignment should match open parenthesis
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:316: WARNING: Block comments use * on subsequent lines
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:316: WARNING: Block comments use a trailing */ on a separate line
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:335: WARNING: Block comments use * on subsequent lines
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:335: WARNING: Block comments use a trailing */ on a separate line
patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch:485: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-v4l2-core-move-i2c-helpers-out-of-v4l2-common..patch

