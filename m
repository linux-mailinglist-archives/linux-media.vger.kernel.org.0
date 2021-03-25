Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA410348C84
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 10:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCYJPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 05:15:45 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48656 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhCYJP2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 05:15:28 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lPM5P-00Ea49-OQ; Thu, 25 Mar 2021 09:15:27 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lPM9K-00056u-0d; Thu, 25 Mar 2021 09:19:30 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Various fixes (#72624)
Date:   Thu, 25 Mar 2021 09:19:29 +0000
Message-Id: <20210325091929.19603-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <040ce89b-442d-3a2a-f574-6ec223df245a@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/040ce89b-442d-3a2a-f574-6ec223df245a@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/95795/
Build time: 00:13:25
Link: https://lore.kernel.org/linux-media/040ce89b-442d-3a2a-f574-6ec223df245a@xs4all.nl

gpg: Signature made Thu 25 Mar 2021 08:52:18 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/19 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0014-cobalt-fix-initial-EDID.patch:

   checkpatch.pl:
	$ cat patches/0014-cobalt-fix-initial-EDID.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0015-drivers-media-pci-bt8xx-bttv-cards-fix-typos.patch:

   checkpatch.pl:
	$ cat patches/0015-drivers-media-pci-bt8xx-bttv-cards-fix-typos.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:60: WARNING: space prohibited between function name and open parenthesis '('

patches/0019-vivid-update-EDID.patch:

   checkpatch.pl:
	$ cat patches/0019-vivid-update-EDID.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

