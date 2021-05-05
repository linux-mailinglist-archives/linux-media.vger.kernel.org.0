Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2ED3739B0
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbhEELvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:51:25 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40694 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232658AbhEELvZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 07:51:25 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1leG2u-005SYF-9a; Wed, 05 May 2021 11:50:28 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1leG75-0004sb-9O; Wed, 05 May 2021 11:54:47 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Various fixes (1) (#74074)
Date:   Wed,  5 May 2021 11:54:46 +0000
Message-Id: <20210505115446.18716-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e4087d7e-01e9-3a55-eab7-090e95028b57@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/e4087d7e-01e9-3a55-eab7-090e95028b57@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/103870/
Build time: 00:10:09
Link: https://lore.kernel.org/linux-media/e4087d7e-01e9-3a55-eab7-090e95028b57@xs4all.nl

gpg: Signature made Wed 05 May 2021 11:34:42 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/11 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0008-media-hevc-Fix-dependent-slice-segment-flags.patch:

   checkpatch.pl:
	$ cat patches/0008-media-hevc-Fix-dependent-slice-segment-flags.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:68: CHECK: Prefer using the BIT_ULL macro
	-:76: CHECK: Prefer using the BIT_ULL macro


Error #512 when building PDF docs

