Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DE9305A44
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 12:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314076AbhAZW4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:56:23 -0500
Received: from www.linuxtv.org ([130.149.80.248]:37510 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728083AbhAZTtN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:49:13 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l4UKE-00FAUM-Nw; Tue, 26 Jan 2021 19:48:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l4UNk-00065s-Oq; Tue, 26 Jan 2021 19:52:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] Various fixes (#71091)
Date:   Tue, 26 Jan 2021 19:52:08 +0000
Message-Id: <20210126195208.23383-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5660c371-6020-bae8-aa19-38e3ec4f09b9@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5660c371-6020-bae8-aa19-38e3ec4f09b9@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/87515/
Build time: 00:06:51
Link: https://lore.kernel.org/linux-media/5660c371-6020-bae8-aa19-38e3ec4f09b9@xs4all.nl

gpg: Signature made Mon 25 Jan 2021 12:09:15 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/9 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-ioctl-print-capabilities-in-v4l_print_cre.patch:

   checkpatch.pl:
	$ cat patches/0001-media-v4l2-ioctl-print-capabilities-in-v4l_print_cre.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:26: WARNING: Avoid logging continuation uses where feasible

patches/0005-Fix-RTL2832-not-depending-on-REGMAP_I2C.patch:

   checkpatch.pl:
	$ cat patches/0005-Fix-RTL2832-not-depending-on-REGMAP_I2C.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

