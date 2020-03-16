Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A69186CA6
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 14:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731476AbgCPNzf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 09:55:35 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40896 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731437AbgCPNzf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 09:55:35 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jDqBL-00GYqf-I4; Mon, 16 Mar 2020 13:53:27 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jDqEu-0002iV-6f; Mon, 16 Mar 2020 13:57:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] Various fixes (#62212)
Date:   Mon, 16 Mar 2020 13:57:08 +0000
Message-Id: <20200316135708.10402-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1c3b8d02-2073-2bb2-c613-b72c90112e5a@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/62212/
Build log: https://builder.linuxtv.org/job/patchwork/42555/
Build time: 00:26:55
Link: https://lore.kernel.org/linux-media/1c3b8d02-2073-2bb2-c613-b72c90112e5a@xs4all.nl

gpg: Signature made Mon 16 Mar 2020 01:26:17 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:43: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:48: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:138: ERROR: trailing statements should be on next line
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:139: ERROR: trailing statements should be on next line
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:140: ERROR: trailing statements should be on next line
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:141: ERROR: trailing statements should be on next line
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:153: WARNING: line over 80 characters
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:154: WARNING: line over 80 characters
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:155: WARNING: line over 80 characters
patches/0001-media-v4l-Add-14-bit-raw-bayer-pixel-formats.patch:156: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-v4l-Add-14-bit-raw-greyscale-pixel-format.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-v4l-Add-14-bit-raw-greyscale-pixel-format.patch
patches/0002-media-v4l-Add-14-bit-raw-greyscale-pixel-format.patch:25: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0002-media-v4l-Add-14-bit-raw-greyscale-pixel-format.patch:30: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
patches/0002-media-v4l-Add-14-bit-raw-greyscale-pixel-format.patch:122: ERROR: trailing statements should be on next line
patches/0002-media-v4l-Add-14-bit-raw-greyscale-pixel-format.patch:134: WARNING: line over 80 characters

