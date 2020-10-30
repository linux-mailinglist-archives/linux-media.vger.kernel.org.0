Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F972A0A9B
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgJ3QBL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:01:11 -0400
Received: from www.linuxtv.org ([130.149.80.248]:42764 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgJ3QBL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:01:11 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYWUE-007Q3K-TA; Fri, 30 Oct 2020 15:38:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYWXC-0008RK-HU; Fri, 30 Oct 2020 15:41:46 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] (v2) Various fixes (#68460)
Date:   Fri, 30 Oct 2020 15:41:46 +0000
Message-Id: <20201030154146.32401-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <c635ef64-55e6-1c8e-a6c9-c11666b0144d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/c635ef64-55e6-1c8e-a6c9-c11666b0144d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/74847/
Build time: 00:10:30
Link: https://lore.kernel.org/linux-media/c635ef64-55e6-1c8e-a6c9-c11666b0144d@xs4all.nl

gpg: Signature made Fri 30 Oct 2020 03:16:06 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/23 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0003-media-pxa_camera-Use-fallthrough-pseudo-keyword.patch:

   checkpatch.pl:
	$ cat patches/0003-media-pxa_camera-Use-fallthrough-pseudo-keyword.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

