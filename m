Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E77636F5CC
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 08:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhD3Gmx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 02:42:53 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52656 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhD3Gmw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 02:42:52 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lcMqg-00EOSG-Hf; Fri, 30 Apr 2021 06:42:02 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lcMuq-0003fw-2D; Fri, 30 Apr 2021 06:46:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] MPEG-2 stateless API cleanup and destaging (#73991)
Date:   Fri, 30 Apr 2021 06:46:18 +0000
Message-Id: <20210430064619.14087-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <79eb0d83-1967-8caf-e205-b29beec6fa23@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/79eb0d83-1967-8caf-e205-b29beec6fa23@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/102371/
Build time: 00:29:01
Link: https://lore.kernel.org/linux-media/79eb0d83-1967-8caf-e205-b29beec6fa23@xs4all.nl

gpg: Signature made Fri 30 Apr 2021 06:03:41 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 6/10 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-uapi-mpeg2-Rename-quantization-to-quantisation.patch:

   checkpatch.pl:
	$ cat patches/0001-media-uapi-mpeg2-Rename-quantization-to-quantisation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:153: WARNING: line length of 102 exceeds 100 columns
	-:336: CHECK: Alignment should match open parenthesis
	-:423: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0002-media-uapi-mpeg2-rework-quantisation-matrices-semant.patch:

   checkpatch.pl:
	$ cat patches/0002-media-uapi-mpeg2-rework-quantisation-matrices-semant.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:36: WARNING: Duplicate signature

patches/0003-media-uapi-mpeg2-Cleanup-flags.patch:

   checkpatch.pl:
	$ cat patches/0003-media-uapi-mpeg2-Cleanup-flags.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:542: WARNING: line length of 101 exceeds 100 columns
	-:543: WARNING: line length of 105 exceeds 100 columns
	-:544: WARNING: line length of 111 exceeds 100 columns

patches/0004-media-uapi-mpeg2-Split-sequence-and-picture-paramete.patch:

   checkpatch.pl:
	$ cat patches/0004-media-uapi-mpeg2-Split-sequence-and-picture-paramete.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:511: CHECK: Alignment should match open parenthesis
	-:513: CHECK: Alignment should match open parenthesis
	-:551: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:552: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0009-media-controls-Log-MPEG-2-stateless-control-in-.std_.patch:

   checkpatch.pl:
	$ cat patches/0009-media-controls-Log-MPEG-2-stateless-control-in-.std_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:26: WARNING: Avoid logging continuation uses where feasible
	-:29: WARNING: Avoid logging continuation uses where feasible
	-:32: WARNING: Avoid logging continuation uses where feasible

patches/0010-media-uapi-move-MPEG-2-stateless-controls-out-of-sta.patch:

   checkpatch.pl:
	$ cat patches/0010-media-uapi-move-MPEG-2-stateless-controls-out-of-sta.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:551: WARNING: line length of 102 exceeds 100 columns
	-:694: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:849: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:897: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:928: CHECK: spaces preferred around that '+' (ctx:VxV)


Error #512 when building PDF docs

