Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9B92CBB55
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 12:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgLBLOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 06:14:04 -0500
Received: from www.linuxtv.org ([130.149.80.248]:55644 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgLBLOD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 06:14:03 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkQ4Y-001u5E-6M; Wed, 02 Dec 2020 11:13:22 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkQ7h-0008G9-HU; Wed, 02 Dec 2020 11:16:37 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Various fixes/enhancements (#69614)
Date:   Wed,  2 Dec 2020 11:16:36 +0000
Message-Id: <20201202111636.31698-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5dbd468d-1d10-e0c8-43f0-ebe8f17abef8@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5dbd468d-1d10-e0c8-43f0-ebe8f17abef8@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/79559/
Build time: 00:19:38
Link: https://lore.kernel.org/linux-media/5dbd468d-1d10-e0c8-43f0-ebe8f17abef8@xs4all.nl

gpg: Signature made Wed 02 Dec 2020 10:39:34 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/26 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0005-media-cedrus-Add-support-for-VP8-decoding.patch:

   checkpatch.pl:
	$ cat patches/0005-media-cedrus-Add-support-for-VP8-decoding.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:155: CHECK: Alignment should match open parenthesis
	-:327: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0016-media-rcar-vin-Mask-VNCSI_IFMD-register.patch:

   checkpatch.pl:
	$ cat patches/0016-media-rcar-vin-Mask-VNCSI_IFMD-register.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:22: WARNING: Unknown commit id 'f54697394457', maybe rebased or not pulled?

patches/0021-si4713-remove-trailing-semicolon-in-macro-definition.patch:

   checkpatch.pl:
	$ cat patches/0021-si4713-remove-trailing-semicolon-in-macro-definition.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:24: CHECK: Macro argument reuse 'p' - possible side-effects?


Error #512 when building PDF docs

