Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79F719A9A1
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 12:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732153AbgDAKgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 06:36:17 -0400
Received: from www.linuxtv.org ([130.149.80.248]:34524 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732146AbgDAKgR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 06:36:17 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jJagi-001jpx-Ro; Wed, 01 Apr 2020 10:33:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jJaku-0006ll-Gd; Wed, 01 Apr 2020 10:37:56 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] v2: Various fixes/enhancements (#62743)
Date:   Wed,  1 Apr 2020 10:37:56 +0000
Message-Id: <20200401103756.25980-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <68df33e0-279c-922c-6ea4-67b76b287451@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/62743/
Build log: https://builder.linuxtv.org/job/patchwork/44840/
Build time: 00:07:46
Link: https://lore.kernel.org/linux-media/68df33e0-279c-922c-6ea4-67b76b287451@xs4all.nl

gpg: Signature made Wed 01 Apr 2020 10:15:45 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 9 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-pci-cx88-convert-to-use-i2c_new_client_device.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-pci-cx88-convert-to-use-i2c_new_client_device.patch
patches/0001-media-pci-cx88-convert-to-use-i2c_new_client_device.patch:53: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-usb-cx231xx-convert-to-use-i2c_new_client_devi.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-usb-cx231xx-convert-to-use-i2c_new_client_devi.patch
patches/0004-media-usb-cx231xx-convert-to-use-i2c_new_client_devi.patch:24: CHECK: Lines should not end with a '('

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-v4l2-common-change-the-pixel_enc-of-V4L2_PIX_F.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-v4l2-common-change-the-pixel_enc-of-V4L2_PIX_F.patch
patches/0007-media-v4l2-common-change-the-pixel_enc-of-V4L2_PIX_F.patch:32: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-imx.rst-Add-example-media-graphs.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-imx.rst-Add-example-media-graphs.patch
patches/0008-media-imx.rst-Add-example-media-graphs.patch:94: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-v4l2-common-Add-BGR666-to-v4l2_format_info.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-v4l2-common-Add-BGR666-to-v4l2_format_info.patch
patches/0010-media-v4l2-common-Add-BGR666-to-v4l2_format_info.patch:23: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-media-add-v4l2-JPEG-helpers.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-media-add-v4l2-JPEG-helpers.patch
patches/0012-media-add-v4l2-JPEG-helpers.patch:57: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0012-media-add-v4l2-JPEG-helpers.patch:558: WARNING: Possible switch case/default not preceded by break or fallthrough comment
patches/0012-media-add-v4l2-JPEG-helpers.patch:559: WARNING: Possible switch case/default not preceded by break or fallthrough comment
patches/0012-media-add-v4l2-JPEG-helpers.patch:564: CHECK: Alignment should match open parenthesis
patches/0012-media-add-v4l2-JPEG-helpers.patch:572: CHECK: Alignment should match open parenthesis
patches/0012-media-add-v4l2-JPEG-helpers.patch:576: CHECK: Alignment should match open parenthesis
patches/0012-media-add-v4l2-JPEG-helpers.patch:581: CHECK: Alignment should match open parenthesis
patches/0012-media-add-v4l2-JPEG-helpers.patch:760: WARNING: line over 80 characters
patches/0012-media-add-v4l2-JPEG-helpers.patch:785: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:45: WARNING: line over 80 characters
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:123: CHECK: Unbalanced braces around else statement
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:201: WARNING: line over 80 characters
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:360: CHECK: Prefer kzalloc(sizeof(*huff_tab)...) over kzalloc(sizeof(struct coda_huff_tab)...)
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:515: CHECK: Alignment should match open parenthesis
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:526: CHECK: Alignment should match open parenthesis
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:718: WARNING: line over 80 characters
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:737: CHECK: Alignment should match open parenthesis
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:746: CHECK: Alignment should match open parenthesis
patches/0013-media-coda-jpeg-add-CODA960-JPEG-decoder-support.patch:784: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-coda-jpeg-support-optimized-huffman-tables.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-coda-jpeg-support-optimized-huffman-tables.patch
patches/0017-media-coda-jpeg-support-optimized-huffman-tables.patch:46: WARNING: line over 80 characters
patches/0017-media-coda-jpeg-support-optimized-huffman-tables.patch:47: WARNING: line over 80 characters
patches/0017-media-coda-jpeg-support-optimized-huffman-tables.patch:48: WARNING: line over 80 characters
patches/0017-media-coda-jpeg-support-optimized-huffman-tables.patch:49: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0022-media-vimc-add-vimc_ent_type-struct-for-the-callback.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0022-media-vimc-add-vimc_ent_type-struct-for-the-callback.patch
patches/0022-media-vimc-add-vimc_ent_type-struct-for-the-callback.patch:211: WARNING: line over 80 characters
patches/0022-media-vimc-add-vimc_ent_type-struct-for-the-callback.patch:221: WARNING: line over 80 characters
patches/0022-media-vimc-add-vimc_ent_type-struct-for-the-callback.patch:222: WARNING: line over 80 characters

