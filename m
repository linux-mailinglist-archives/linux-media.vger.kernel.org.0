Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD521C9688
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 18:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgEGQaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 12:30:55 -0400
Received: from www.linuxtv.org ([130.149.80.248]:46382 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726222AbgEGQaz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 12:30:55 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jWjMy-00GC0E-PJ; Thu, 07 May 2020 16:27:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jWjS6-0006T9-O2; Thu, 07 May 2020 16:32:50 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Register read-only sub-dev devnode (#63662)
Date:   Thu,  7 May 2020 16:32:50 +0000
Message-Id: <20200507163250.24826-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <25d49102-10f1-b8fa-b9fa-42f2b0a17197@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63662/
Build log: https://builder.linuxtv.org/job/patchwork/49932/
Build time: 00:32:21
Link: https://lore.kernel.org/linux-media/25d49102-10f1-b8fa-b9fa-42f2b0a17197@xs4all.nl

gpg: Signature made Thu 07 May 2020 03:45:39 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0005-v4l2-subdev-add-VIDIOC_SUBDEV_QUERYCAP-ioctl.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0005-v4l2-subdev-add-VIDIOC_SUBDEV_QUERYCAP-ioctl.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:43: WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
-:78: WARNING: line over 80 characters

Error #256 when running cat patches/0006-v4l-document-VIDIOC_SUBDEV_QUERYCAP.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-v4l-document-VIDIOC_SUBDEV_QUERYCAP.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:30: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
-:35: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1

