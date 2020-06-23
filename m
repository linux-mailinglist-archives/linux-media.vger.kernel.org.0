Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B8020563C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 17:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732955AbgFWPoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 11:44:07 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54288 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732940AbgFWPoH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 11:44:07 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jnl1b-006IQC-4z; Tue, 23 Jun 2020 15:39:51 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jnl7t-00022h-Pe; Tue, 23 Jun 2020 15:46:21 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] Various fixes/enhancements (#64836)
Date:   Tue, 23 Jun 2020 15:46:21 +0000
Message-Id: <20200623154621.7810-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d4e7cebd-23de-831f-9f12-5822079fbf90@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64836/
Build log: https://builder.linuxtv.org/job/patchwork/56676/
Build time: 00:35:47
Link: https://lore.kernel.org/linux-media/d4e7cebd-23de-831f-9f12-5822079fbf90@xs4all.nl

gpg: Signature made Tue 23 Jun 2020 03:04:00 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0007-media-vb2-Print-the-queue-pointer-in-debug-messages.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-media-vb2-Print-the-queue-pointer-in-debug-messages.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:35: CHECK: Macro argument 'level' may be better as '(level)' to avoid precedence issues
-:90: CHECK: Alignment should match open parenthesis
-:265: CHECK: Alignment should match open parenthesis
-:279: WARNING: line length of 106 exceeds 100 columns
-:280: CHECK: Alignment should match open parenthesis
-:592: CHECK: Alignment should match open parenthesis
-:619: CHECK: Alignment should match open parenthesis
-:920: CHECK: Macro argument 'level' may be better as '(level)' to avoid precedence issues

