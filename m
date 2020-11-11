Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31C72AF0AC
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 13:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgKKMcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 07:32:36 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49426 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbgKKMcf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 07:32:35 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kcpIe-007HvV-AQ; Wed, 11 Nov 2020 12:32:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kcpLg-0006rf-7o; Wed, 11 Nov 2020 12:35:40 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Various fixes (#68817)
Date:   Wed, 11 Nov 2020 12:35:40 +0000
Message-Id: <20201111123540.26346-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <98f214b8-f017-4fa2-28ea-cbad2812833d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/98f214b8-f017-4fa2-28ea-cbad2812833d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/76557/
Build time: 00:04:19
Link: https://lore.kernel.org/linux-media/98f214b8-f017-4fa2-28ea-cbad2812833d@xs4all.nl

gpg: Signature made Wed 11 Nov 2020 12:16:42 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/6 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0005-saa7134-improve-f-fmt.win.clips-NULL-check.patch:

   checkpatch.pl:
	$ cat patches/0005-saa7134-improve-f-fmt.win.clips-NULL-check.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

