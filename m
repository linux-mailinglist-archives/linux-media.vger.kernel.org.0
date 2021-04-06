Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078D6355165
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 12:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245262AbhDFK6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 06:58:20 -0400
Received: from www.linuxtv.org ([130.149.80.248]:34404 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245256AbhDFK6S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 06:58:18 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lTjPO-00EPqP-1X; Tue, 06 Apr 2021 10:58:10 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lTjTM-0003v5-Ti; Tue, 06 Apr 2021 11:02:17 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Various fixes and enhancements (#72955)
Date:   Tue,  6 Apr 2021 11:02:16 +0000
Message-Id: <20210406110216.15026-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <f4f3897a-c55d-162e-0ddb-5657a04789a9@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/f4f3897a-c55d-162e-0ddb-5657a04789a9@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/97533/
Build time: 00:09:20
Link: https://lore.kernel.org/linux-media/f4f3897a-c55d-162e-0ddb-5657a04789a9@xs4all.nl

gpg: Signature made Tue 06 Apr 2021 10:41:21 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/17 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-v4l2-ctrls.c-fix-race-condition-in-hdl-requests-list.patch:

   checkpatch.pl:
	$ cat patches/0002-v4l2-ctrls.c-fix-race-condition-in-hdl-requests-list.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:57: WARNING: Duplicate signature


Error #512 when building PDF docs

