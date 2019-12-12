Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BA311CE1E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 14:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbfLLNUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 08:20:20 -0500
Received: from www.linuxtv.org ([130.149.80.248]:50292 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729170AbfLLNUU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 08:20:20 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifONq-00AA9z-Ez; Thu, 12 Dec 2019 13:19:58 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifOP1-0003bW-Ly; Thu, 12 Dec 2019 13:21:11 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] ALSA PCM API updates
Date:   Thu, 12 Dec 2019 13:21:11 +0000
Message-Id: <20191212132111.13813-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <babeeeca-d646-d313-ee47-e8b7f2caa57d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60683/
Build log: https://builder.linuxtv.org/job/patchwork/28880/
Build time: 00:11:01
Link: https://lore.kernel.org/linux-media/babeeeca-d646-d313-ee47-e8b7f2caa57d@xs4all.nl

gpg: Signature made Thu 12 Dec 2019 12:42:23 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-tw686x-Use-managed-buffer-allocation.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-tw686x-Use-managed-buffer-allocation.patch
patches/0002-media-tw686x-Use-managed-buffer-allocation.patch:54: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-usbtv-Use-managed-buffer-allocation.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-usbtv-Use-managed-buffer-allocation.patch
patches/0003-media-usbtv-Use-managed-buffer-allocation.patch:66: CHECK: Alignment should match open parenthesis

