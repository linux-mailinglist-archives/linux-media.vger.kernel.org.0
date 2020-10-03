Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12DDB282436
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 15:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgJCNJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 09:09:49 -0400
Received: from www.linuxtv.org ([130.149.80.248]:33022 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgJCNJs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 09:09:48 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kOhBw-000S3r-Ub; Sat, 03 Oct 2020 13:03:12 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kOhL7-0002GT-2o; Sat, 03 Oct 2020 13:12:41 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Various fixes (#67703)
Date:   Sat,  3 Oct 2020 13:12:41 +0000
Message-Id: <20201003131241.8664-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6b4d935f-89fd-7256-e123-d470fed2beb9@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/6b4d935f-89fd-7256-e123-d470fed2beb9@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/71003/
Build time: 00:51:39
Link: https://lore.kernel.org/linux-media/6b4d935f-89fd-7256-e123-d470fed2beb9@xs4all.nl

gpg: Signature made Sat 03 Oct 2020 12:11:27 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 4/26 patches with issues, being 3 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-coda-use-semicolons-rather-than-commas-to-sepa.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0009-media-pvrusb2-use-semicolons-rather-than-commas-to-s.patch:

   checkpatch.pl:
	$ cat patches/0009-media-pvrusb2-use-semicolons-rather-than-commas-to-s.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: CHECK: Avoid CamelCase: <xtalMHz>

patches/0023-media-uapi-h264-Add-documentation-to-the-interface-h.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0024-Fix-V4L2_COLORSPACE_470_SYSTEM_BG-description.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2835 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

