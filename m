Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2014209DD5
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 13:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404521AbgFYLyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 07:54:07 -0400
Received: from www.linuxtv.org ([130.149.80.248]:38154 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404531AbgFYLyF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 07:54:05 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1joQO2-008iXi-Vs; Thu, 25 Jun 2020 11:49:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1joQUO-0004mu-3M; Thu, 25 Jun 2020 11:56:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] v2: Various fixes/enhancements (#64885)
Date:   Thu, 25 Jun 2020 11:56:20 +0000
Message-Id: <20200625115620.18363-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <691d2162-159f-032a-1e7f-99e506ce74ab@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64885/
Build log: https://builder.linuxtv.org/job/patchwork/56939/
Build time: 00:26:09
Link: https://lore.kernel.org/linux-media/691d2162-159f-032a-1e7f-99e506ce74ab@xs4all.nl

gpg: Signature made Thu 25 Jun 2020 11:23:46 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0006-media-vb2-Print-the-queue-pointer-in-debug-messages.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-media-vb2-Print-the-queue-pointer-in-debug-messages.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:34: CHECK: Macro argument 'level' may be better as '(level)' to avoid precedence issues
-:89: CHECK: Alignment should match open parenthesis
-:264: CHECK: Alignment should match open parenthesis
-:278: WARNING: line length of 106 exceeds 100 columns
-:279: CHECK: Alignment should match open parenthesis
-:591: CHECK: Alignment should match open parenthesis
-:618: CHECK: Alignment should match open parenthesis
-:919: CHECK: Macro argument 'level' may be better as '(level)' to avoid precedence issues

Error #256 when running cat patches/0022-media-rockchip-rga-Introduce-color-fmt-macros-and-re.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0022-media-rockchip-rga-Introduce-color-fmt-macros-and-re.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
-:66: CHECK: Macro argument reuse 'fmt' - possible side-effects?

