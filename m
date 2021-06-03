Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5997E39A009
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 13:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhFCLow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 07:44:52 -0400
Received: from www.linuxtv.org ([130.149.80.248]:50570 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229936AbhFCLov (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 07:44:51 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lolkg-0002cv-BA; Thu, 03 Jun 2021 11:43:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lolp3-00055M-SG; Thu, 03 Jun 2021 11:47:37 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] vb2_queue_change_type, hevc fix and atmel-isc (#74764)
Date:   Thu,  3 Jun 2021 11:47:36 +0000
Message-Id: <20210603114736.19506-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <57e15ed1-61c7-0240-5bf3-115de3bbec9c@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/57e15ed1-61c7-0240-5bf3-115de3bbec9c@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/112158/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/57e15ed1-61c7-0240-5bf3-115de3bbec9c@xs4all.nl

gpg: Signature made Thu 03 Jun 2021 10:47:23 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5


Build aborted due to a fatal error:
FAILED: patch patch patches/0028-media-atmel-atmel-isc-move-the-formats-list-into-pro.patch doesn't apply:
Applying patch patches/0028-media-atmel-atmel-isc-move-the-formats-list-into-pro.patch
patching file drivers/media/platform/atmel/atmel-isc-base.c
Hunk #2 FAILED at 788.
Hunk #3 succeeded at 1346 (offset -1 lines).
Hunk #4 succeeded at 1383 (offset -1 lines).
Hunk #5 succeeded at 1995 (offset -1 lines).
Hunk #6 succeeded at 2018 (offset -1 lines).
Hunk #7 succeeded at 2028 (offset -1 lines).
Hunk #8 succeeded at 2049 (offset -1 lines).
1 out of 8 hunks FAILED -- rejects in file drivers/media/platform/atmel/atmel-isc-base.c
patching file drivers/media/platform/atmel/atmel-isc.h
patching file drivers/media/platform/atmel/atmel-sama5d2-isc.c
Patch patches/0028-media-atmel-atmel-isc-move-the-formats-list-into-pro.patch does not apply (enforce with -f)

