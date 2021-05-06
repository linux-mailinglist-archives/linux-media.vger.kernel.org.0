Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CC2375425
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhEFMyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:54:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41718 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhEFMyD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:54:03 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ledV2-0075Aa-HD; Thu, 06 May 2021 12:53:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ledZE-0000YS-Qv; Thu, 06 May 2021 12:57:24 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Microchip SAMA5D4 VPU support (v2) (#74096)
Date:   Thu,  6 May 2021 12:57:24 +0000
Message-Id: <20210506125724.2091-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5559aa93-3afd-a711-bd95-4ff2c77f2e49@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5559aa93-3afd-a711-bd95-4ff2c77f2e49@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/104169/
Build time: 00:07:30
Link: https://lore.kernel.org/linux-media/5559aa93-3afd-a711-bd95-4ff2c77f2e49@xs4all.nl

gpg: Signature made Thu 06 May 2021 12:35:27 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/9 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0005-media-hantro-introduce-hantro_g1.c-for-common-API.patch:

   checkpatch.pl:
	$ cat patches/0005-media-hantro-introduce-hantro_g1.c-for-common-API.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:37: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0007-media-dt-bindings-Document-SAMA5D4-VDEC-bindings.patch:

   checkpatch.pl:
	$ cat patches/0007-media-dt-bindings-Document-SAMA5D4-VDEC-bindings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0008-media-hantro-add-initial-SAMA5D4-support.patch:

   checkpatch.pl:
	$ cat patches/0008-media-hantro-add-initial-SAMA5D4-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:41: WARNING: please write a paragraph that describes the config symbol fully
	-:93: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

