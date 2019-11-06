Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77BF1F17B3
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 14:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731704AbfKFNyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 08:54:19 -0500
Received: from www.linuxtv.org ([130.149.80.248]:33686 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729960AbfKFNyT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 08:54:19 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iSLlB-0000Aj-Ho; Wed, 06 Nov 2019 13:54:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iSLlm-0004Dq-6q; Wed, 06 Nov 2019 13:54:46 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Various fixes (mostly codec related)
Date:   Wed,  6 Nov 2019 13:54:45 +0000
Message-Id: <20191106135445.16189-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b9a3b48b-ed51-a844-2384-ec5482f0650b@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59868/
Build log: https://builder.linuxtv.org/job/patchwork/23701/
Build time: 00:14:05
Link: https://lore.kernel.org/linux-media/b9a3b48b-ed51-a844-2384-ec5482f0650b@xs4all.nl

gpg: Signature made Wed 06 Nov 2019 01:25:27 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-cedrus-Fix-decoding-for-some-H264-videos.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-cedrus-Fix-decoding-for-some-H264-videos.patch
patches/0001-media-cedrus-Fix-decoding-for-some-H264-videos.patch:51: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-hantro-Fix-H264-max-frmsize-supported-on-RK328.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-hantro-Fix-H264-max-frmsize-supported-on-RK328.patch
patches/0006-media-hantro-Fix-H264-max-frmsize-supported-on-RK328.patch:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-MAINTAINERS-ao-cec-Update-path-for-yaml-bindings.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-MAINTAINERS-ao-cec-Update-path-for-yaml-bindings.patch
patches/0012-MAINTAINERS-ao-cec-Update-path-for-yaml-bindings.patch:6: WARNING: 'convertion' may be misspelled - perhaps 'conversion'?

