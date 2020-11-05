Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23302A807E
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbgKEOMS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:12:18 -0500
Received: from www.linuxtv.org ([130.149.80.248]:39790 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKEOMR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 09:12:17 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kafzs-00GBV7-OZ; Thu, 05 Nov 2020 14:12:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kag2s-0002zs-Ix; Thu, 05 Nov 2020 14:15:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] v2: Various fixes (#68660)
Date:   Thu,  5 Nov 2020 14:15:22 +0000
Message-Id: <20201105141522.11479-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/75702/
Build time: 00:09:02
Link: https://lore.kernel.org/linux-media/f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl

gpg: Signature made Thu 05 Nov 2020 01:46:31 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/17 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0009-coda-Add-a-V4L2-user-for-control-error-macroblocks-c.patch:

   checkpatch.pl:
	$ cat patches/0009-coda-Add-a-V4L2-user-for-control-error-macroblocks-c.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:95: CHECK: Alignment should match open parenthesis


Error #512 when building PDF docs

