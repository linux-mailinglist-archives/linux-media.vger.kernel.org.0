Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0A91EB9AA
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 12:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgFBKcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 06:32:22 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56160 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbgFBKcW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 06:32:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jg49m-00ElRF-4h; Tue, 02 Jun 2020 10:28:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jg4FY-0006hC-1L; Tue, 02 Jun 2020 10:34:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] Finalize stateful encoder support (#64176)
Date:   Tue,  2 Jun 2020 10:34:27 +0000
Message-Id: <20200602103427.25697-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <741fd4cb-1c56-9546-36da-1993474caf49@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64176/
Build log: https://builder.linuxtv.org/job/patchwork/53633/
Build time: 00:23:59
Link: https://lore.kernel.org/linux-media/741fd4cb-1c56-9546-36da-1993474caf49@xs4all.nl

gpg: Signature made Tue 02 Jun 2020 09:53:49 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0001-media-docs-rst-Document-memory-to-memory-video-encod.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0001-media-docs-rst-Document-memory-to-memory-video-encod.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:37: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

