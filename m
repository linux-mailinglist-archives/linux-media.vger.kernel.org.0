Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37D636F86F
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 12:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhD3K1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 06:27:25 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49616 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhD3K1Y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 06:27:24 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lcQLx-00Eegd-OB; Fri, 30 Apr 2021 10:26:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lcQQ7-00017Q-HW; Fri, 30 Apr 2021 10:30:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] More Outreachy cleanups (v2) (#73995)
Date:   Fri, 30 Apr 2021 10:30:51 +0000
Message-Id: <20210430103051.4259-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <706ba93e-fa1c-34ce-8c54-d8a1c442811e@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/706ba93e-fa1c-34ce-8c54-d8a1c442811e@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/102415/
Build time: 00:09:24
Link: https://lore.kernel.org/linux-media/706ba93e-fa1c-34ce-8c54-d8a1c442811e@xs4all.nl

gpg: Signature made Fri 30 Apr 2021 10:00:43 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/22 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0008-staging-media-atomisp-Fix-the-rest-of-sh_css.c-brace.patch:

   checkpatch.pl:
	$ cat patches/0008-staging-media-atomisp-Fix-the-rest-of-sh_css.c-brace.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:130: WARNING: please, no spaces at the start of a line
	-:141: CHECK: Unnecessary parentheses around '!pipe'
	-:141: CHECK: Unnecessary parentheses around '!pipe->stream'
	-:269: CHECK: Unnecessary parentheses around '!pipe'
	-:269: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_PREVIEW'
	-:278: CHECK: Unnecessary parentheses around 'fw == last_fw'
	-:278: CHECK: Unnecessary parentheses around 'fw->info.isp.sp.enable.out_frame  != 0'
	-:339: CHECK: Unnecessary parentheses around '!pipe'
	-:339: CHECK: Unnecessary parentheses around '!pipe->stream'
	-:377: CHECK: Unnecessary parentheses around '!pipe'
	-:377: CHECK: Unnecessary parentheses around '!pipe->stream'
	-:377: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_PREVIEW'
	-:469: CHECK: Unnecessary parentheses around '!pipe'
	-:469: CHECK: Unnecessary parentheses around '!pipe->stream'
	-:469: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_PREVIEW'
	-:529: CHECK: Unnecessary parentheses around '!pipe'
	-:529: CHECK: Unnecessary parentheses around '!buffer'
	-:582: CHECK: Unnecessary parentheses around 'queue_id <= SH_CSS_INVALID_QUEUE_ID'
	-:582: CHECK: Unnecessary parentheses around 'queue_id >= SH_CSS_MAX_NUM_QUEUES'
	-:627: CHECK: Logical continuations should be on the previous line
	-:637: CHECK: Unnecessary parentheses around '!h_vbuf'
	-:637: CHECK: Unnecessary parentheses around 'h_vbuf->vptr == 0x0'
	-:647: CHECK: Logical continuations should be on the previous line
	-:657: CHECK: Logical continuations should be on the previous line
	-:707: CHECK: Unnecessary parentheses around '!pipe'
	-:707: CHECK: Unnecessary parentheses around '!buffer'
	-:732: CHECK: Unnecessary parentheses around 'queue_id <= SH_CSS_INVALID_QUEUE_ID'
	-:732: CHECK: Unnecessary parentheses around 'queue_id >= SH_CSS_MAX_NUM_QUEUES'
	-:1197: CHECK: Unnecessary parentheses around '!pipe'
	-:1197: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_VIDEO'
	-:1283: WARNING: please, no spaces at the start of a line
	-:1293: WARNING: please, no spaces at the start of a line
	-:1303: WARNING: please, no spaces at the start of a line
	-:1313: WARNING: please, no spaces at the start of a line
	-:1331: WARNING: line length of 105 exceeds 100 columns
	-:1331: CHECK: Unnecessary parentheses around '!pipe'
	-:1331: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_CAPTURE'
	-:1331: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_COPY'
	-:1360: WARNING: please, no spaces at the start of a line
	-:1370: WARNING: please, no spaces at the start of a line
	-:1513: CHECK: Unnecessary parentheses around '!pipe'
	-:1513: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_YUVPP'
	-:1608: CHECK: Unnecessary parentheses around '!pipe'
	-:1608: CHECK: Unnecessary parentheses around '!pipe->stream'
	-:1608: CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_YUVPP'
	-:1775: CHECK: Unnecessary parentheses around 'num_primary_stage == 0'
	-:1775: CHECK: Unnecessary parentheses around 'mode == IA_CSS_CAPTURE_MODE_PRIMARY'
	-:1880: WARNING: line length of 112 exceeds 100 columns
	-:1909: WARNING: please, no spaces at the start of a line
	-:2052: CHECK: Unnecessary parentheses around '!firmware'
	-:2052: CHECK: Unnecessary parentheses around '!pipe'
	-:2111: WARNING: please, no spaces at the start of a line
	-:2206: CHECK: Unnecessary parentheses around '!pipe'
	-:2206: CHECK: Unnecessary parentheses around '!config'
	-:2764: CHECK: Unnecessary parentheses around '!stream'
	-:2764: CHECK: Unnecessary parentheses around '!stream->last_pipe'

patches/0012-staging-media-atomisp-Fix-alignment-and-line-length-.patch:

   checkpatch.pl:
	$ cat patches/0012-staging-media-atomisp-Fix-alignment-and-line-length-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:281: WARNING: line length of 107 exceeds 100 columns
	-:293: WARNING: line length of 110 exceeds 100 columns
	-:390: WARNING: line length of 107 exceeds 100 columns
	-:402: WARNING: line length of 110 exceeds 100 columns

patches/0017-staging-media-atomisp-use-__func__-over-function-nam.patch:

   checkpatch.pl:
	$ cat patches/0017-staging-media-atomisp-use-__func__-over-function-nam.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:30: WARNING: Unnecessary ftrace-like logging - prefer using ftrace
	-:43: WARNING: Unnecessary ftrace-like logging - prefer using ftrace
	-:119: WARNING: Unnecessary ftrace-like logging - prefer using ftrace


Error #512 when building PDF docs

