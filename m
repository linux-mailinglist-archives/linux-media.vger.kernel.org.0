Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142F22C68FD
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 16:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730758AbgK0Px6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 10:53:58 -0500
Received: from www.linuxtv.org ([130.149.80.248]:56566 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730603AbgK0Px6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 10:53:58 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kig4K-00CnrH-Gh; Fri, 27 Nov 2020 15:53:56 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kig7S-00078v-0K; Fri, 27 Nov 2020 15:57:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.10] Two pulse8-cec fixes (#69441)
Date:   Fri, 27 Nov 2020 15:57:09 +0000
Message-Id: <20201127155709.27416-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <8b2123a2-d67a-ac8d-5764-315c50bf5486@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/8b2123a2-d67a-ac8d-5764-315c50bf5486@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/78869/
Build time: 00:04:09
Link: https://lore.kernel.org/linux-media/8b2123a2-d67a-ac8d-5764-315c50bf5486@xs4all.nl

gpg: Signature made Fri 27 Nov 2020 03:36:27 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/2 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-pulse8-cec-fix-duplicate-free-at-disconnect-or-probe.patch:

   checkpatch.pl:
	$ cat patches/0001-pulse8-cec-fix-duplicate-free-at-disconnect-or-probe.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: Unknown commit id 'aa9eda76129ca', maybe rebased or not pulled?
	-:36: WARNING: email address '<stable@vger.kernel.org>      # for v5.6 and up' might be better as 'stable@vger.kernel.org# for v5.6 and up'

patches/0002-pulse8-cec-add-support-for-FW-v10-and-up.patch:

   checkpatch.pl:
	$ cat patches/0002-pulse8-cec-add-support-for-FW-v10-and-up.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: email address '<stable@vger.kernel.org>      # for v5.9 and up' might be better as 'stable@vger.kernel.org# for v5.9 and up'


Error #512 when building PDF docs

