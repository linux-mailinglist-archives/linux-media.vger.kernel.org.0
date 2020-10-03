Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C7728240B
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 14:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgJCMQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 08:16:11 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52496 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbgJCMQL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 08:16:11 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kOgM3-000O7t-Rq; Sat, 03 Oct 2020 12:09:35 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kOgVC-0003pq-Mr; Sat, 03 Oct 2020 12:19:02 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.10] Four fixes for 5.10. (#67702)
Date:   Sat,  3 Oct 2020 12:19:02 +0000
Message-Id: <20201003121902.14701-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b9bad957-0074-a141-bd89-0b291fc6e1d3@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/b9bad957-0074-a141-bd89-0b291fc6e1d3@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/71002/
Build time: 00:16:33
Link: https://lore.kernel.org/linux-media/b9bad957-0074-a141-bd89-0b291fc6e1d3@xs4all.nl

gpg: Signature made Sat 03 Oct 2020 11:34:55 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/4 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-usbtv-Fix-refcounting-mixup.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-staging-rkisp1-uapi-Do-not-use-BIT-macro.patch:

   checkpatch.pl:
	$ cat patches/0003-staging-rkisp1-uapi-Do-not-use-BIT-macro.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: CHECK: Prefer using the BIT macro
	-:32: CHECK: Prefer using the BIT macro
	-:35: CHECK: Prefer using the BIT macro
	-:38: CHECK: Prefer using the BIT macro
	-:41: CHECK: Prefer using the BIT macro
	-:44: CHECK: Prefer using the BIT macro
	-:47: CHECK: Prefer using the BIT macro
	-:50: CHECK: Prefer using the BIT macro
	-:53: CHECK: Prefer using the BIT macro
	-:56: CHECK: Prefer using the BIT macro
	-:59: CHECK: Prefer using the BIT macro
	-:62: CHECK: Prefer using the BIT macro
	-:65: CHECK: Prefer using the BIT macro
	-:68: CHECK: Prefer using the BIT macro
	-:71: CHECK: Prefer using the BIT macro
	-:74: CHECK: Prefer using the BIT macro
	-:77: CHECK: Prefer using the BIT macro
	-:80: CHECK: Prefer using the BIT macro
	-:92: CHECK: Prefer using the BIT macro
	-:93: CHECK: Prefer using the BIT macro
	-:94: CHECK: Prefer using the BIT macro
	-:95: CHECK: Prefer using the BIT macro


Error #512 when building PDF docs

