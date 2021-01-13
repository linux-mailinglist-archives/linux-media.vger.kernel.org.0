Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E600F2F508E
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 18:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbhAMRC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 12:02:59 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49296 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727527AbhAMRC7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 12:02:59 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kzjXF-00DTyt-C7; Wed, 13 Jan 2021 17:02:17 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kzjag-0005sV-4V; Wed, 13 Jan 2021 17:05:50 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] Various fixes/enhancements (#70720)
Date:   Wed, 13 Jan 2021 17:05:50 +0000
Message-Id: <20210113170550.22554-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <38f99047-2ecf-ab1b-630e-6cf1853f548f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/38f99047-2ecf-ab1b-630e-6cf1853f548f@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/85636/
Build time: 00:14:23
Link: https://lore.kernel.org/linux-media/38f99047-2ecf-ab1b-630e-6cf1853f548f@xs4all.nl

gpg: Signature made Wed 13 Jan 2021 04:16:51 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/12 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-v4l2-ctrl-Add-frame-specific-min-max-qp-contro.patch:

   checkpatch.pl:
	$ cat patches/0002-media-v4l2-ctrl-Add-frame-specific-min-max-qp-contro.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:106: WARNING: line length of 103 exceeds 100 columns
	-:107: WARNING: line length of 103 exceeds 100 columns
	-:115: WARNING: line length of 103 exceeds 100 columns
	-:116: WARNING: line length of 103 exceeds 100 columns
	-:117: WARNING: line length of 103 exceeds 100 columns
	-:118: WARNING: line length of 103 exceeds 100 columns
	-:119: WARNING: line length of 103 exceeds 100 columns
	-:120: WARNING: line length of 103 exceeds 100 columns
	-:132: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:133: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0003-media-v4l2-ctrl-Add-layer-wise-bitrate-controls-for-.patch:

   checkpatch.pl:
	$ cat patches/0003-media-v4l2-ctrl-Add-layer-wise-bitrate-controls-for-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:56: WARNING: line length of 105 exceeds 100 columns
	-:57: WARNING: line length of 105 exceeds 100 columns
	-:58: WARNING: line length of 105 exceeds 100 columns
	-:59: WARNING: line length of 105 exceeds 100 columns
	-:60: WARNING: line length of 105 exceeds 100 columns
	-:61: WARNING: line length of 105 exceeds 100 columns
	-:62: WARNING: line length of 105 exceeds 100 columns
	-:74: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:75: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:76: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:77: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:78: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:79: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:80: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0005-media-v4l2-ctrl-Add-base-layer-priority-id-control.patch:

   checkpatch.pl:
	$ cat patches/0005-media-v4l2-ctrl-Add-base-layer-priority-id-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:55: CHECK: spaces preferred around that '+' (ctx:VxV)


Error #512 when building PDF docs

