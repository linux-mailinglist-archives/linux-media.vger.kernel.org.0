Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B4311CDAF
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 14:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbfLLNA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 08:00:27 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48440 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729191AbfLLNA1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 08:00:27 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifO4c-00A8tB-1q; Thu, 12 Dec 2019 13:00:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifO5n-0005Og-8z; Thu, 12 Dec 2019 13:01:19 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] Various fixes/enhancements
Date:   Thu, 12 Dec 2019 13:01:19 +0000
Message-Id: <20191212130119.20705-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <4c524bd4-e8bb-89b5-3898-a969a72266ad@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60682/
Build log: https://builder.linuxtv.org/job/patchwork/28878/
Build time: 00:21:38
Link: https://lore.kernel.org/linux-media/4c524bd4-e8bb-89b5-3898-a969a72266ad@xs4all.nl

gpg: Signature made Thu 12 Dec 2019 12:18:27 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:34: CHECK: Macro argument reuse 's' - possible side-effects?
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:34: CHECK: Macro argument reuse 'r' - possible side-effects?
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:38: WARNING: line over 80 characters
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:38: CHECK: spaces preferred around that '+' (ctx:VxV)
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:38: CHECK: Macro argument reuse 's' - possible side-effects?
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:38: CHECK: Macro argument reuse 'r' - possible side-effects?
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:47: CHECK: Macro argument reuse 's' - possible side-effects?
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:47: CHECK: Macro argument reuse 'r' - possible side-effects?
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:52: CHECK: Macro argument reuse 's' - possible side-effects?
patches/0001-media-i2c-adv748x-Fix-unsafe-macros.patch:52: CHECK: Macro argument reuse 'r' - possible side-effects?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-vivid-Add-touch-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-vivid-Add-touch-support.patch
patches/0009-vivid-Add-touch-support.patch:469: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0009-vivid-Add-touch-support.patch:511: WARNING: line over 80 characters
patches/0009-vivid-Add-touch-support.patch:551: WARNING: line over 80 characters
patches/0009-vivid-Add-touch-support.patch:576: WARNING: line over 80 characters
patches/0009-vivid-Add-touch-support.patch:577: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-ivtv-cx18-remove-ivtvdriver.org-references.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-ivtv-cx18-remove-ivtvdriver.org-references.patch
patches/0013-ivtv-cx18-remove-ivtvdriver.org-references.patch:178: WARNING: line over 80 characters
patches/0013-ivtv-cx18-remove-ivtvdriver.org-references.patch:222: WARNING: line over 80 characters

