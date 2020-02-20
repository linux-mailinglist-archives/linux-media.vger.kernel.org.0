Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14CE2166ACE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 00:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgBTXKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 18:10:11 -0500
Received: from www.linuxtv.org ([130.149.80.248]:50994 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgBTXKL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 18:10:11 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j4uvm-004Ty1-Pc; Thu, 20 Feb 2020 23:08:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j4uyj-0003hO-2m; Thu, 20 Feb 2020 23:11:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] rockchip: Add the rkvdec driver
Date:   Thu, 20 Feb 2020 23:11:33 +0000
Message-Id: <20200220231133.14177-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7be24fe6-1a4a-94cb-832e-818db9d1d2e1@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61781/
Build log: https://builder.linuxtv.org/job/patchwork/39013/
Build time: 00:11:19
Link: https://lore.kernel.org/linux-media/7be24fe6-1a4a-94cb-832e-818db9d1d2e1@xs4all.nl

gpg: Signature made Thu 20 Feb 2020 10:56:25 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch
patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:55: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:86: CHECK: Alignment should match open parenthesis
patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:208: CHECK: Unnecessary parentheses around 'poca < builder->cur_pic_order_count'
patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:208: CHECK: Unnecessary parentheses around 'pocb < builder->cur_pic_order_count'
patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:249: CHECK: Unnecessary parentheses around 'poca < builder->cur_pic_order_count'
patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:249: CHECK: Unnecessary parentheses around 'pocb < builder->cur_pic_order_count'
patches/0002-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B.patch:369: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-dt-bindings-rockchip-Document-RK3399-Video-Dec.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-dt-bindings-rockchip-Document-RK3399-Video-Dec.patch
patches/0004-media-dt-bindings-rockchip-Document-RK3399-Video-Dec.patch:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:183: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:184: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:186: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:187: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:192: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:207: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:208: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:209: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:210: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:244: CHECK: Macro argument reuse 'ctxidx' - possible side-effects?
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:270: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:285: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:303: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:319: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:327: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:339: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:376: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:439: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:502: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:553: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:616: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:679: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:793: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:809: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:821: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:852: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:853: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:931: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1033: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1121: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1124: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1408: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1411: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:2440: WARNING: line over 80 characters

