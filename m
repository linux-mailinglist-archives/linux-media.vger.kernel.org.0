Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2941B7BDB
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 18:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgDXQkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 12:40:51 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36662 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbgDXQku (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 12:40:50 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jS1Kg-00Eq1W-9E; Fri, 24 Apr 2020 16:37:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jS1PU-0002HO-Kt; Fri, 24 Apr 2020 16:42:40 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Add V4L2_CAP_IO_MC, extend VIDIOC_ENUM_FMT (#63363)
Date:   Fri, 24 Apr 2020 16:42:40 +0000
Message-Id: <20200424164240.8721-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d999f775-4a4e-b95e-62f3-a306a0c1ad98@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63363/
Build log: https://builder.linuxtv.org/job/patchwork/48067/
Build time: 00:24:34
Link: https://lore.kernel.org/linux-media/d999f775-4a4e-b95e-62f3-a306a0c1ad98@xs4all.nl

gpg: Signature made Fri 24 Apr 2020 03:49:42 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:77: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:81: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:82: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:83: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:96: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:100: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:101: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:102: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:229: WARNING: line over 80 characters
patches/0001-v4l2-dev-ioctl-Add-V4L2_CAP_IO_MC.patch:236: WARNING: Missing Signed-off-by: line by nominal patch author ''

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-v4l2-Extend-VIDIOC_ENUM_FMT-to-support-MC-cent.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-v4l2-Extend-VIDIOC_ENUM_FMT-to-support-MC-cent.patch
patches/0003-media-v4l2-Extend-VIDIOC_ENUM_FMT-to-support-MC-cent.patch:110: WARNING: Avoid logging continuation uses where feasible

