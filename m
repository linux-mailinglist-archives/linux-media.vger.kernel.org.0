Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFF821B65D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgGJN30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:29:26 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36596 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726774AbgGJN3Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:29:25 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jtrwE-009NrD-2o; Fri, 10 Jul 2020 12:15:34 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jts38-0001QN-IT; Fri, 10 Jul 2020 12:22:42 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] Various fixes (#65372)
Date:   Fri, 10 Jul 2020 12:22:42 +0000
Message-Id: <20200710122242.5434-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <f50d6ee4-91c4-2a10-dfc8-827081cf290a@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/65372/
Build log: https://builder.linuxtv.org/job/patchwork/59099/
Build time: 00:42:03
Link: https://lore.kernel.org/linux-media/f50d6ee4-91c4-2a10-dfc8-827081cf290a@xs4all.nl

gpg: Signature made Fri 10 Jul 2020 11:19:23 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0007-v4l2-core-Print-control-name-in-VIDIOC_S-G_-EXT-_CTR.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-v4l2-core-Print-control-name-in-VIDIOC_S-G_-EXT-_CTR.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
-:13: WARNING: Use a single space after To:
-:13: ERROR: Unrecognized email address: ''
-:41: WARNING: Avoid logging continuation uses where feasible
-:53: WARNING: Avoid logging continuation uses where feasible
-:57: WARNING: Avoid logging continuation uses where feasible
-:61: WARNING: Avoid logging continuation uses where feasible

Error #256 when running cat patches/0015-media-atmel-atmel-isc-rework-component-offsets.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0015-media-atmel-atmel-isc-rework-component-offsets.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:34: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

