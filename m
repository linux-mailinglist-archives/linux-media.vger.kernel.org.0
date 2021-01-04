Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC86C2E958A
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 14:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbhADNF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 08:05:29 -0500
Received: from www.linuxtv.org ([130.149.80.248]:45560 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726278AbhADNF3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Jan 2021 08:05:29 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kwPXT-000Kms-73; Mon, 04 Jan 2021 13:04:47 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kwPap-0002A0-DA; Mon, 04 Jan 2021 13:08:15 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.12] Additional CCS driver features (#70395)
Date:   Mon,  4 Jan 2021 13:08:15 +0000
Message-Id: <20210104130815.8263-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104123850.GC850@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210104123850.GC850@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/84316/
Build time: 00:15:32
Link: https://lore.kernel.org/linux-media/20210104123850.GC850@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 04 Jan 2021 12:27:47 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 3/25 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0008-ccs-Add-support-for-analogue-gain-coefficient-contro.patch:

   checkpatch.pl:
	$ cat patches/0008-ccs-Add-support-for-analogue-gain-coefficient-contro.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:65: CHECK: multiple assignments should be avoided

patches/0010-ccs-Add-support-for-alternate-analogue-global-gain.patch:

   checkpatch.pl:
	$ cat patches/0010-ccs-Add-support-for-alternate-analogue-global-gain.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:76: CHECK: multiple assignments should be avoided

patches/0018-ccs-Hardware-requires-a-delay-after-starting-the-clo.patch:

   checkpatch.pl:
	$ cat patches/0018-ccs-Hardware-requires-a-delay-after-starting-the-clo.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:67: WARNING: usleep_range should not use min == max args; see Documentation/timers/timers-howto.rst


Error #512 when building PDF docs

