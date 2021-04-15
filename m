Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6832360C74
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 16:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbhDOOvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 10:51:02 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58440 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233864AbhDOOu2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 10:50:28 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lX3Jj-009p4N-Hy; Thu, 15 Apr 2021 14:50:03 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lX3Nm-0001sb-1a; Thu, 15 Apr 2021 14:54:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Various staging cleanups from the Outreachy (#73324)
Date:   Thu, 15 Apr 2021 14:54:13 +0000
Message-Id: <20210415145413.7184-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0db4d232-b345-6c06-5e3d-11504196af3b@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/0db4d232-b345-6c06-5e3d-11504196af3b@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/98851/
Build time: 00:08:40
Link: https://lore.kernel.org/linux-media/0db4d232-b345-6c06-5e3d-11504196af3b@xs4all.nl

gpg: Signature made Thu 15 Apr 2021 02:25:44 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/16 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0009-staging-media-intel-ipu3-line-should-not-end-with.patch:

   checkpatch.pl:
	$ cat patches/0009-staging-media-intel-ipu3-line-should-not-end-with.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: WARNING: Prefer __aligned(32) over __attribute__((aligned(32)))

patches/0010-staging-media-zoran-add-spaces-around-operator.patch:

   checkpatch.pl:
	$ cat patches/0010-staging-media-zoran-add-spaces-around-operator.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:32: CHECK: Prefer using the BIT macro
	-:35: CHECK: Prefer using the BIT macro
	-:36: CHECK: Prefer using the BIT macro
	-:37: CHECK: Prefer using the BIT macro


Error #512 when building PDF docs

