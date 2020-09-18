Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C648526FF8F
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIROIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:08:46 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58966 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgIROIq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:08:46 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kJGy5-00EbU7-4L; Fri, 18 Sep 2020 14:02:29 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kJH6r-0002ip-Ch; Fri, 18 Sep 2020 14:11:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] rkisp1 fixes/enhancements + one cedrus fix (#67102)
Date:   Fri, 18 Sep 2020 14:11:33 +0000
Message-Id: <20200918141133.10422-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2e8cb9cc-c4cc-478d-03eb-4c500d4d63fe@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/2e8cb9cc-c4cc-478d-03eb-4c500d4d63fe@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/68861/
Build time: 00:19:49
Link: https://lore.kernel.org/linux-media/2e8cb9cc-c4cc-478d-03eb-4c500d4d63fe@xs4all.nl

gpg: Signature made Fri 18 Sep 2020 01:36:22 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 4/14 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-staging-rkisp1-cap-change-RGB24-format-to-XBGR.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/sh_css.c:1685:16: warning: assignment left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: ../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:703 is_pipe_valid_to_current_run_mode() warn: ignoring unreachable code.

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1911 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0011-media-pixfmt-meta-rkisp1.rst-add-description-of-rkis.patch:

   checkpatch.pl:
	$ cat patches/0011-media-pixfmt-meta-rkisp1.rst-add-description-of-rkis.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:42: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0012-media-admin-guide-add-documentation-file-rkisp1.rst.patch:

   checkpatch.pl:
	$ cat patches/0012-media-admin-guide-add-documentation-file-rkisp1.rst.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0014-media-cedrus-Propagate-OUTPUT-resolution-to-CAPTURE.patch:

   checkpatch.pl:
	$ cat patches/0014-media-cedrus-Propagate-OUTPUT-resolution-to-CAPTURE.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:56: CHECK: Alignment should match open parenthesis


Error #512 when building PDF docs

