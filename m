Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31337EFA32
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 10:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730584AbfKEJzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 04:55:18 -0500
Received: from www.linuxtv.org ([130.149.80.248]:35459 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730571AbfKEJzS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Nov 2019 04:55:18 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iRvYJ-00029y-Kc; Tue, 05 Nov 2019 09:55:07 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iRvYt-0007cy-Vc; Tue, 05 Nov 2019 09:55:44 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Various fixes and enhancements
Date:   Tue,  5 Nov 2019 09:55:43 +0000
Message-Id: <20191105095543.29279-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6020f449-5ab8-87a6-ff0b-6607da4796eb@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59841/
Build log: https://builder.linuxtv.org/job/patchwork/23533/
Build time: 00:45:34
Link: https://lore.kernel.org/linux-media/6020f449-5ab8-87a6-ff0b-6607da4796eb@xs4all.nl

gpg: Signature made Tue 05 Nov 2019 08:45:40 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 12 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-vimc-Make-capture-devices-and-subdevices-use-d.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-vimc-Make-capture-devices-and-subdevices-use-d.patch
patches/0001-media-vimc-Make-capture-devices-and-subdevices-use-d.patch:21: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-vivid-media_device_cleanup-was-called-too-early.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-vivid-media_device_cleanup-was-called-too-early.patch
patches/0002-vivid-media_device_cleanup-was-called-too-early.patch:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-am437x-fix-smatch-warning.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-am437x-fix-smatch-warning.patch
patches/0003-am437x-fix-smatch-warning.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-mtk-vpu-fix-two-smatch-warnings.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-mtk-vpu-fix-two-smatch-warnings.patch
patches/0004-mtk-vpu-fix-two-smatch-warnings.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-rc-ite-cir-fix-smatch-warning.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-rc-ite-cir-fix-smatch-warning.patch
patches/0005-rc-ite-cir-fix-smatch-warning.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-em28xx-fix-two-smatch-warnings.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-em28xx-fix-two-smatch-warnings.patch
patches/0006-em28xx-fix-two-smatch-warnings.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-ti-vpe-fix-smatch-error.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-ti-vpe-fix-smatch-error.patch
patches/0007-ti-vpe-fix-smatch-error.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-ov6650-fix-smatch-warning.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-ov6650-fix-smatch-warning.patch
patches/0008-ov6650-fix-smatch-warning.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-mantis-fix-two-smatch-errors.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-mantis-fix-two-smatch-errors.patch
patches/0009-mantis-fix-two-smatch-errors.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-siano-fix-spelling-mistake-ENBALE-ENABLE.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-siano-fix-spelling-mistake-ENBALE-ENABLE.patch
patches/0010-media-siano-fix-spelling-mistake-ENBALE-ENABLE.patch:26: WARNING: line over 80 characters
patches/0010-media-siano-fix-spelling-mistake-ENBALE-ENABLE.patch:27: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0011-vivid-add-vivid_create_queue-helper.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0011-vivid-add-vivid_create_queue-helper.patch
patches/0011-vivid-add-vivid_create_queue-helper.patch:15: WARNING: use relative pathname instead of absolute in changelog text
patches/0011-vivid-add-vivid_create_queue-helper.patch:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-exynos4-is-fix-wrong-mdev-and-v4l2-dev-order-i.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-exynos4-is-fix-wrong-mdev-and-v4l2-dev-order-i.patch
patches/0013-media-exynos4-is-fix-wrong-mdev-and-v4l2-dev-order-i.patch:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

