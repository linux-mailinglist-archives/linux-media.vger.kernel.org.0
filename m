Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F662D0FAA
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 12:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgLGLrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 06:47:16 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46338 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgLGLrQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 06:47:16 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kmEyQ-0092pq-OH; Mon, 07 Dec 2020 11:46:34 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kmF1c-0006O3-Ge; Mon, 07 Dec 2020 11:49:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Various fixes and a new meson driver (#69706)
Date:   Mon,  7 Dec 2020 11:49:52 +0000
Message-Id: <20201207114952.24510-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <4bfaa4d3-7b04-3b5c-801c-d68f0765646d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/4bfaa4d3-7b04-3b5c-801c-d68f0765646d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/80283/
Build time: 00:04:52
Link: https://lore.kernel.org/linux-media/4bfaa4d3-7b04-3b5c-801c-d68f0765646d@xs4all.nl

gpg: Signature made Thu 03 Dec 2020 11:10:07 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/7 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0003-dt-bindings-media-Add-bindings-for-the-Amlogic-GE2D-.patch:

   checkpatch.pl:
	$ cat patches/0003-dt-bindings-media-Add-bindings-for-the-Amlogic-GE2D-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0004-media-meson-Add-M2M-driver-for-the-Amlogic-GE2D-Acce.patch:

   checkpatch.pl:
	$ cat patches/0004-media-meson-Add-M2M-driver-for-the-Amlogic-GE2D-Acce.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:76: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0005-MAINTAINERS-Add-myself-as-maintainer-of-the-Amlogic-.patch:

   checkpatch.pl:
	$ cat patches/0005-MAINTAINERS-Add-myself-as-maintainer-of-the-Amlogic-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: WARNING: Possible repeated word: 'git'


Error #512 when building PDF docs

