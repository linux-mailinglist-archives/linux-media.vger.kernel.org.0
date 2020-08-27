Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6A42549A5
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 17:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgH0PkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 11:40:14 -0400
Received: from www.linuxtv.org ([130.149.80.248]:51678 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgH0PkN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 11:40:13 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBJux-003wx1-Ht; Thu, 27 Aug 2020 15:34:23 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBK3A-0005gN-IL; Thu, 27 Aug 2020 15:42:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Support for Tegra video capture from external (#66411)
Date:   Thu, 27 Aug 2020 15:42:52 +0000
Message-Id: <20200827154252.21802-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e58bd15a-fb15-efdb-1faa-455f971ab0a8@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/e58bd15a-fb15-efdb-1faa-455f971ab0a8@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 00:21:57
Link: https://lore.kernel.org/linux-media/e58bd15a-fb15-efdb-1faa-455f971ab0a8@xs4all.nl

gpg: Signature made Wed 19 Aug 2020 10:34:43 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0013-media-tegra-video-Add-support-for-external-sensor-ca.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0013-media-tegra-video-Add-support-for-external-sensor-ca.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:1029: CHECK: Alignment should match open parenthesis

