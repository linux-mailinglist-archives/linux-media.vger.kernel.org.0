Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3ECB30F7A4
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237935AbhBDQXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 11:23:01 -0500
Received: from www.linuxtv.org ([130.149.80.248]:43318 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237988AbhBDQWm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 11:22:42 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l7hOK-00CGqj-Am; Thu, 04 Feb 2021 16:22:00 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l7hRs-0006kW-J9; Thu, 04 Feb 2021 16:25:42 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] Various fixes (#71298)
Date:   Thu,  4 Feb 2021 16:25:40 +0000
Message-Id: <20210204162540.25903-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <54287eeb-4617-dc1a-d77c-1870e81d5ca8@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/54287eeb-4617-dc1a-d77c-1870e81d5ca8@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/88790/
Build time: 00:03:57
Link: https://lore.kernel.org/linux-media/54287eeb-4617-dc1a-d77c-1870e81d5ca8@xs4all.nl

gpg: Signature made Thu 04 Feb 2021 04:08:14 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/5 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-pci-fix-spelling-typo-of-frimware.patch:

   checkpatch.pl:
	$ cat patches/0002-media-pci-fix-spelling-typo-of-frimware.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: CHECK: Avoid CamelCase: <Load>


Error #512 when building PDF docs

