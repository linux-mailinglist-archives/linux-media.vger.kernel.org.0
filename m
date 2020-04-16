Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C1E1AC0BD
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 14:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635023AbgDPMIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 08:08:11 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49244 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2635001AbgDPMIH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 08:08:07 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jP3GS-0041NJ-GR; Thu, 16 Apr 2020 12:05:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jP3L4-0005Vj-5p; Thu, 16 Apr 2020 12:09:50 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Add rkvdec codec (#63129)
Date:   Thu, 16 Apr 2020 12:09:50 +0000
Message-Id: <20200416120950.21142-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <f77fa7ee-c9d2-d2ee-5db7-d15fee15c04f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63129/
Build log: https://builder.linuxtv.org/job/patchwork/47007/
Build time: 00:09:40
Link: https://lore.kernel.org/linux-media/f77fa7ee-c9d2-d2ee-5db7-d15fee15c04f@xs4all.nl

gpg: Signature made Thu 16 Apr 2020 11:56:33 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 9 patches and/or PDF generation with issues, being 4 at build time

Error/warnings:


Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make SPHINXDIRS=media htmldocs:

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:56: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:87: CHECK: Alignment should match open parenthesis
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:217: CHECK: Unnecessary parentheses around 'poca < builder->cur_pic_order_count'
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:217: CHECK: Unnecessary parentheses around 'pocb < builder->cur_pic_order_count'
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:262: CHECK: Unnecessary parentheses around 'poca < builder->cur_pic_order_count'
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:262: CHECK: Unnecessary parentheses around 'pocb < builder->cur_pic_order_count'
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:408: CHECK: Alignment should match open parenthesis
patches/0001-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:411: WARNING: line over 80 characters

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make SPHINXDIRS=media htmldocs:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make SPHINXDIRS=media htmldocs:

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-dt-bindings-rockchip-Document-RK3399-Video-Dec.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-dt-bindings-rockchip-Document-RK3399-Video-Dec.patch
patches/0003-media-dt-bindings-rockchip-Document-RK3399-Video-Dec.patch:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make SPHINXDIRS=media htmldocs:

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:186: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:187: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:189: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:190: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:195: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:210: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:211: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:212: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:213: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:247: CHECK: Macro argument reuse 'ctxidx' - possible side-effects?
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:273: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:288: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:306: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:322: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:330: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:342: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:379: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:442: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:505: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:556: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:619: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:682: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:766: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:797: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:799: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:800: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:813: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:825: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:856: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:857: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:935: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:1037: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:1125: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:1128: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:1412: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:1415: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:1846: WARNING: line over 80 characters
patches/0004-media-rkvdec-Add-the-rkvdec-driver.patch:2410: WARNING: line over 80 characters

