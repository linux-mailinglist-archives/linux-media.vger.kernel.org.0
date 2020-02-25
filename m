Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C3116BD08
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 10:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbgBYJJT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 04:09:19 -0500
Received: from www.linuxtv.org ([130.149.80.248]:35744 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729153AbgBYJJT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 04:09:19 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j6WBh-009vv9-GK; Tue, 25 Feb 2020 09:07:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j6WEl-00070r-5v; Tue, 25 Feb 2020 09:10:43 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR v5.7] rockchip: Add the rkvdec driver (#61802)
Date:   Tue, 25 Feb 2020 09:10:43 +0000
Message-Id: <20200225091043.26916-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d4cc12b2-3d24-95db-102b-e5091c067e76@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61802/
Build log: https://builder.linuxtv.org/job/patchwork/39649/
Build time: 00:10:33
Link: https://lore.kernel.org/linux-media/d4cc12b2-3d24-95db-102b-e5091c067e76@xs4all.nl

gpg: Signature made Tue 25 Feb 2020 08:54:48 AM UTC
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
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:184: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:185: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:187: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:188: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:193: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:208: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:209: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:210: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:211: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:245: CHECK: Macro argument reuse 'ctxidx' - possible side-effects?
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:271: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:286: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:304: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:320: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:328: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:340: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:377: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:440: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:503: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:554: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:617: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:680: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:794: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:810: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:822: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:853: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:854: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:932: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1034: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1122: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1125: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1409: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:1412: WARNING: line over 80 characters
patches/0005-media-rkvdec-Add-the-rkvdec-driver.patch:2441: WARNING: line over 80 characters

