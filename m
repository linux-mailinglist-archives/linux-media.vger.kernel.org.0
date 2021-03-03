Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7024132C721
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240116AbhCDAbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:04 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46974 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347902AbhCCNxI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 08:53:08 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHRTv-00HL3t-Er; Wed, 03 Mar 2021 13:24:03 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHRXg-0008Vz-Fb; Wed, 03 Mar 2021 13:27:56 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] RC & DVB fixes (#71850)
Date:   Wed,  3 Mar 2021 13:27:56 +0000
Message-Id: <20210303132756.32690-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303093331.GA21839@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210303093331.GA21839@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/92659/
Build time: 00:12:11
Link: https://lore.kernel.org/linux-media/20210303093331.GA21839@gofer.mess.org

error: FETCH_HEAD: cannot verify a non-tag object of type commit.

Summary: got 3/14 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0006-media-ite-cir-move-runtime-information-into-driver-d.patch:

   checkpatch.pl:
	$ cat patches/0006-media-ite-cir-move-runtime-information-into-driver-d.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:164: WARNING: line length of 115 exceeds 100 columns
	-:164: CHECK: Alignment should match open parenthesis

patches/0009-media-rc-add-keymap-for-minix-neo-remote.patch:

   checkpatch.pl:
	$ cat patches/0009-media-rc-add-keymap-for-minix-neo-remote.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:61: CHECK: Blank lines aren't necessary after an open brace '{'

patches/0014-media-rc-add-keymap-for-Xbox-360-Universal-Media-rem.patch:

   checkpatch.pl:
	$ cat patches/0014-media-rc-add-keymap-for-Xbox-360-Universal-Media-rem.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

