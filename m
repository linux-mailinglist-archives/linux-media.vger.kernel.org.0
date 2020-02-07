Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A154155AD2
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 16:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgBGPh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 10:37:28 -0500
Received: from www.linuxtv.org ([130.149.80.248]:57240 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726956AbgBGPh2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Feb 2020 10:37:28 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j05fm-005vQV-DD; Fri, 07 Feb 2020 15:36:02 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j05iO-0007is-F6; Fri, 07 Feb 2020 15:38:44 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.6] Fixes for v5.6
Date:   Fri,  7 Feb 2020 15:38:44 +0000
Message-Id: <20200207153844.29644-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3ead2ec9-dc64-4a1a-e21f-341490b86061@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61559/
Build log: https://builder.linuxtv.org/job/patchwork/37096/
Build time: 00:08:34
Link: https://lore.kernel.org/linux-media/3ead2ec9-dc64-4a1a-e21f-341490b86061@xs4all.nl

gpg: Signature made Fri 07 Feb 2020 03:22:17 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-v4l2-mem2mem.c-fix-broken-links.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-v4l2-mem2mem.c-fix-broken-links.patch
patches/0002-v4l2-mem2mem.c-fix-broken-links.patch:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0002-v4l2-mem2mem.c-fix-broken-links.patch:30: CHECK: Alignment should match open parenthesis
patches/0002-v4l2-mem2mem.c-fix-broken-links.patch:36: CHECK: Alignment should match open parenthesis

