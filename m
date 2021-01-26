Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6200305802
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 11:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhA0KOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 05:14:46 -0500
Received: from www.linuxtv.org ([130.149.80.248]:57422 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S314323AbhAZXFQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 18:05:16 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l4XNp-00FMvJ-8o; Tue, 26 Jan 2021 23:04:25 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l4XRL-0000Lm-Mh; Tue, 26 Jan 2021 23:08:03 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] UVC driver changes (#71094)
Date:   Tue, 26 Jan 2021 23:08:03 +0000
Message-Id: <20210126230803.1305-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YBBZzXcB8R1xd3Hm@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YBBZzXcB8R1xd3Hm@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/87535/
Build time: 00:06:54
Link: https://lore.kernel.org/linux-media/YBBZzXcB8R1xd3Hm@pendragon.ideasonboard.com

gpg: Signature made Tue 26 Jan 2021 06:03:22 PM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 7/13 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0004-media-uvcvideo-Allow-extra-entities.patch:

   checkpatch.pl:
	$ cat patches/0004-media-uvcvideo-Allow-extra-entities.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: CHECK: Alignment should match open parenthesis

patches/0007-media-uvcvideo-Allow-entity-defined-get_info-and-get.patch:

   checkpatch.pl:
	$ cat patches/0007-media-uvcvideo-Allow-entity-defined-get_info-and-get.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:36: CHECK: Alignment should match open parenthesis

patches/0008-media-uvcvideo-Implement-UVC_EXT_GPIO_UNIT.patch:

   checkpatch.pl:
	$ cat patches/0008-media-uvcvideo-Implement-UVC_EXT_GPIO_UNIT.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0010-media-uvcvideo-Use-dev_-printk-aliases.patch:

   checkpatch.pl:
	$ cat patches/0010-media-uvcvideo-Use-dev_-printk-aliases.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:387: CHECK: Macro argument 'flag' may be better as '(flag)' to avoid precedence issues
	-:390: WARNING: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
	-:393: CHECK: Macro argument reuse '_dev' - possible side-effects?

patches/0011-media-uvcvideo-New-macro-uvc_trace_cont.patch:

   checkpatch.pl:
	$ cat patches/0011-media-uvcvideo-New-macro-uvc_trace_cont.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:163: CHECK: Macro argument 'flag' may be better as '(flag)' to avoid precedence issues
	-:166: WARNING: Avoid logging continuation uses where feasible

patches/0012-media-uvcvideo-use-dev_printk-for-uvc_trace.patch:

   checkpatch.pl:
	$ cat patches/0012-media-uvcvideo-use-dev_printk-for-uvc_trace.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:820: CHECK: Alignment should match open parenthesis
	-:1332: CHECK: Macro argument 'flag' may be better as '(flag)' to avoid precedence issues
	-:1336: WARNING: Prefer dev_dbg(... to dev_printk(KERN_DEBUG, ...

patches/0013-media-uvcvideo-Rename-debug-functions.patch:

   checkpatch.pl:
	$ cat patches/0013-media-uvcvideo-Rename-debug-functions.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:975: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:975: WARNING: Symbolic permissions 'S_IRUGO|S_IWUSR' are not preferred. Consider using octal permissions '0644'.
	-:1065: CHECK: Avoid CamelCase: <bValue>
	-:1072: CHECK: Avoid CamelCase: <bEvent>
	-:1090: CHECK: Avoid CamelCase: <bSelector>
	-:1509: CHECK: Prefer using the BIT macro
	-:1510: CHECK: Prefer using the BIT macro
	-:1511: CHECK: Prefer using the BIT macro
	-:1512: CHECK: Prefer using the BIT macro
	-:1513: CHECK: Prefer using the BIT macro
	-:1514: CHECK: Prefer using the BIT macro
	-:1515: CHECK: Prefer using the BIT macro
	-:1516: CHECK: Prefer using the BIT macro
	-:1517: CHECK: Prefer using the BIT macro
	-:1518: CHECK: Prefer using the BIT macro
	-:1519: CHECK: Prefer using the BIT macro
	-:1520: CHECK: Prefer using the BIT macro


Error #512 when building PDF docs

