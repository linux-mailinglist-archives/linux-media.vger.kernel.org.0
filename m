Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DAE34D514
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 18:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2Q1M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 12:27:12 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40794 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhC2Q0p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 12:26:45 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lQuiy-003NYP-En; Mon, 29 Mar 2021 16:26:44 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lQumu-0007cf-SV; Mon, 29 Mar 2021 16:30:49 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Venus updates - part2 (#72719)
Date:   Mon, 29 Mar 2021 16:30:48 +0000
Message-Id: <20210329163048.29260-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329155834.1428138-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210329155834.1428138-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/96414/
Build time: 00:19:21
Link: https://lore.kernel.org/linux-media/20210329155834.1428138-1-stanimir.varbanov@linaro.org

gpg: Signature made Mon 29 Mar 2021 03:21:06 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 4/15 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-v4l2-ctrl-add-controls-for-long-term-reference.patch:

   checkpatch.pl:
	$ cat patches/0002-media-v4l2-ctrl-add-controls-for-long-term-reference.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:86: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:87: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:88: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0009-v4l2-ctrl-Add-decoder-conceal-color-control.patch:

   checkpatch.pl:
	$ cat patches/0009-v4l2-ctrl-Add-decoder-conceal-color-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:68: WARNING: line length of 101 exceeds 100 columns
	-:95: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0012-docs-Document-colorimetry-class.patch:

   checkpatch.pl:
	$ cat patches/0012-docs-Document-colorimetry-class.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:30: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0013-v4l-Add-HDR10-static-metadata-controls.patch:

   checkpatch.pl:
	$ cat patches/0013-v4l-Add-HDR10-static-metadata-controls.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:50: WARNING: Avoid logging continuation uses where feasible
	-:53: WARNING: Avoid logging continuation uses where feasible


Error #512 when building PDF docs

