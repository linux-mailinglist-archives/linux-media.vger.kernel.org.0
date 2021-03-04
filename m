Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D840632C9CE
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244467AbhCDBMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 20:12:19 -0500
Received: from www.linuxtv.org ([130.149.80.248]:34022 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355947AbhCDAyw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 19:54:52 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHcFm-000QyI-Qw; Thu, 04 Mar 2021 00:54:10 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHcJY-0001bp-2V; Thu, 04 Mar 2021 00:58:04 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Various fixes (#71873)
Date:   Thu,  4 Mar 2021 00:58:04 +0000
Message-Id: <20210304005804.6144-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <40c1ab80-c9c5-f784-ba54-457c6f21b3c2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/40c1ab80-c9c5-f784-ba54-457c6f21b3c2@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/92728/
Build time: 00:09:29
Link: https://lore.kernel.org/linux-media/40c1ab80-c9c5-f784-ba54-457c6f21b3c2@xs4all.nl

gpg: Signature made Wed 03 Mar 2021 02:37:54 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/21 patches with issues, being 0 at build time

Error/warnings:

patches/0018-media-mtk-fix-mtk-smi-dependency.patch:

   checkpatch.pl:
	$ cat patches/0018-media-mtk-fix-mtk-smi-dependency.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

