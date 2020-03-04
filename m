Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C8A179014
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 13:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729424AbgCDMJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 07:09:33 -0500
Received: from www.linuxtv.org ([130.149.80.248]:39756 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgCDMJd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 07:09:33 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j9SoM-002Qnk-D2; Wed, 04 Mar 2020 12:07:38 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j9Src-0007pB-BQ; Wed, 04 Mar 2020 12:11:00 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] meson: vdec fixes/improvements (#61954)
Date:   Wed,  4 Mar 2020 12:11:00 +0000
Message-Id: <20200304121100.30028-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ab89c537-3a54-11ba-1816-431dad550b37@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61954/
Build log: https://builder.linuxtv.org/job/patchwork/40819/
Build time: 00:10:48
Link: https://lore.kernel.org/linux-media/ab89c537-3a54-11ba-1816-431dad550b37@xs4all.nl

gpg: Signature made Wed 04 Mar 2020 11:52:25 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 7 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l2-mem2mem-handle-draining-stopped-and-next-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l2-mem2mem-handle-draining-stopped-and-next-.patch
patches/0001-media-v4l2-mem2mem-handle-draining-stopped-and-next-.patch:15: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-vicodec-use-v4l2-mem2mem-draining-stopped-and-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-vicodec-use-v4l2-mem2mem-draining-stopped-and-.patch
patches/0002-media-vicodec-use-v4l2-mem2mem-draining-stopped-and-.patch:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-meson-vdec-bring-up-to-compliance.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-meson-vdec-bring-up-to-compliance.patch
patches/0003-media-meson-vdec-bring-up-to-compliance.patch:35: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-meson-vdec-add-H.264-decoding-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-meson-vdec-add-H.264-decoding-support.patch
patches/0004-media-meson-vdec-add-H.264-decoding-support.patch:33: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-meson-vdec-add-common-HEVC-decoder-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-meson-vdec-add-common-HEVC-decoder-support.patch
patches/0007-media-meson-vdec-add-common-HEVC-decoder-support.patch:45: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-meson-vdec-add-VP9-input-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-meson-vdec-add-VP9-input-support.patch
patches/0008-media-meson-vdec-add-VP9-input-support.patch:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-meson-vdec-add-VP9-decoder-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-meson-vdec-add-VP9-decoder-support.patch
patches/0009-media-meson-vdec-add-VP9-decoder-support.patch:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

