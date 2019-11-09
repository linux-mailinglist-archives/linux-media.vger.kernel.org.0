Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EECCF5FFE
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 16:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfKIPUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 10:20:45 -0500
Received: from www.linuxtv.org ([130.149.80.248]:39726 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726424AbfKIPUp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Nov 2019 10:20:45 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iTSXV-0005c5-Fh; Sat, 09 Nov 2019 15:20:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iTSY6-0000rb-8i; Sat, 09 Nov 2019 15:21:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Various fixes and enhancements
Date:   Sat,  9 Nov 2019 15:21:14 +0000
Message-Id: <20191109152114.3278-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ff5eacbd-f3c5-f5d9-88a1-a74ff6ff36f7@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59983/
Build log: https://builder.linuxtv.org/job/patchwork/24142/
Build time: 00:10:32
Link: https://lore.kernel.org/linux-media/ff5eacbd-f3c5-f5d9-88a1-a74ff6ff36f7@xs4all.nl

gpg: Signature made Sat 09 Nov 2019 02:56:59 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-dt-bindings-sh-mobile-ceu-Remove-now-unimplemented-b.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-dt-bindings-sh-mobile-ceu-Remove-now-unimplemented-b.patch
patches/0001-dt-bindings-sh-mobile-ceu-Remove-now-unimplemented-b.patch:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0001-dt-bindings-sh-mobile-ceu-Remove-now-unimplemented-b.patch:10: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 43a445f188e1 ("media: sh_mobile_ceu_camera: remove obsolete soc_camera driver")'
patches/0001-dt-bindings-sh-mobile-ceu-Remove-now-unimplemented-b.patch:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0001-dt-bindings-sh-mobile-ceu-Remove-now-unimplemented-b.patch:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0015-vim2m-media_device_cleanup-was-called-too-early.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0015-vim2m-media_device_cleanup-was-called-too-early.patch
patches/0015-vim2m-media_device_cleanup-was-called-too-early.patch:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0016-vicodec-media_device_cleanup-was-called-too-early.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0016-vicodec-media_device_cleanup-was-called-too-early.patch
patches/0016-vicodec-media_device_cleanup-was-called-too-early.patch:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

