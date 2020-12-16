Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55762DBDD8
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 10:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgLPJoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 04:44:23 -0500
Received: from www.linuxtv.org ([130.149.80.248]:42104 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgLPJoX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 04:44:23 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kpTLR-005T5p-Mf; Wed, 16 Dec 2020 09:43:41 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kpTOg-0004hf-RE; Wed, 16 Dec 2020 09:47:02 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] tegra-video: Add support for capturing from (#70078)
Date:   Wed, 16 Dec 2020 09:47:02 +0000
Message-Id: <20201216094702.18038-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <c05885cd-1c29-6dde-de3f-38c8a76a851e@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/c05885cd-1c29-6dde-de3f-38c8a76a851e@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/81562/
Build time: 00:11:16
Link: https://lore.kernel.org/linux-media/c05885cd-1c29-6dde-de3f-38c8a76a851e@xs4all.nl

gpg: Signature made Wed 16 Dec 2020 09:15:29 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/13 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0012-media-tegra-video-Add-support-for-x8-captures-with-g.patch:

   checkpatch.pl:
	$ cat patches/0012-media-tegra-video-Add-support-for-x8-captures-with-g.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:971: CHECK: spinlock_t definition without comment

patches/0013-media-tegra-video-Add-custom-V4L2-control-V4L2_CID_T.patch:

   checkpatch.pl:
	$ cat patches/0013-media-tegra-video-Add-custom-V4L2-control-V4L2_CID_T.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

