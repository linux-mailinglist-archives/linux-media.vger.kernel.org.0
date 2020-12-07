Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984322D1011
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 13:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgLGMGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 07:06:40 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48728 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgLGMGk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 07:06:40 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kmFHB-00940p-JE; Mon, 07 Dec 2020 12:05:57 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kmFKN-00007j-Ao; Mon, 07 Dec 2020 12:09:15 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.11] CCS PLL feature support improvements (#69730)
Date:   Mon,  7 Dec 2020 12:09:15 +0000
Message-Id: <20201207120915.434-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203152421.GF4351@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201203152421.GF4351@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/80283/
Build time: 00:13:34
Link: https://lore.kernel.org/linux-media/20201203152421.GF4351@valkosipuli.retiisi.org.uk

gpg: Signature made Thu 03 Dec 2020 03:15:42 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 17/38 patches with issues, being 0 at build time

Error/warnings:

patches/0002-ccs-pll-Split-limits-and-PLL-configuration-into-fron.patch:

   checkpatch.pl:
	$ cat patches/0002-ccs-pll-Split-limits-and-PLL-configuration-into-fron.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:159: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:363: CHECK: Logical continuations should be on the previous line
	-:416: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:417: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:522: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:523: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:524: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:525: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:552: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:553: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:554: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:555: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:556: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:557: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:558: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:559: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0004-ccs-pll-End-search-if-there-are-no-better-values-ava.patch:

   checkpatch.pl:
	$ cat patches/0004-ccs-pll-End-search-if-there-are-no-better-values-ava.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: CHECK: Prefer kernel type 'u16' over 'uint16_t'

patches/0005-ccs-pll-Remove-parallel-bus-support.patch:

   checkpatch.pl:
	$ cat patches/0005-ccs-pll-Remove-parallel-bus-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:57: CHECK: Prefer kernel type 'u8' over 'uint8_t'

patches/0007-ccs-pll-Move-the-flags-field-down-away-from-8-bit-fi.patch:

   checkpatch.pl:
	$ cat patches/0007-ccs-pll-Move-the-flags-field-down-away-from-8-bit-fi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: CHECK: Prefer kernel type 'u16' over 'uint16_t'

patches/0012-ccs-pll-Avoid-overflow-in-pre-PLL-divisor-lower-boun.patch:

   checkpatch.pl:
	$ cat patches/0012-ccs-pll-Avoid-overflow-in-pre-PLL-divisor-lower-boun.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:47: CHECK: Lines should not end with a '('

patches/0015-ccs-pll-Use-explicit-32-bit-unsigned-type.patch:

   checkpatch.pl:
	$ cat patches/0015-ccs-pll-Use-explicit-32-bit-unsigned-type.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:32: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0016-ccs-pll-Add-support-for-lane-speed-model.patch:

   checkpatch.pl:
	$ cat patches/0016-ccs-pll-Add-support-for-lane-speed-model.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:131: CHECK: Prefer kernel type 'u8' over 'uint8_t'
	-:132: CHECK: Prefer kernel type 'u8' over 'uint8_t'

patches/0020-ccs-pll-Support-two-cycles-per-pixel-on-OP-domain.patch:

   checkpatch.pl:
	$ cat patches/0020-ccs-pll-Support-two-cycles-per-pixel-on-OP-domain.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:26: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:61: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:100: CHECK: Prefer kernel type 'u8' over 'uint8_t'

patches/0023-ccs-pll-Add-C-PHY-support.patch:

   checkpatch.pl:
	$ cat patches/0023-ccs-pll-Add-C-PHY-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:33: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:70: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0024-ccs-pll-Split-off-VT-subtree-calculation.patch:

   checkpatch.pl:
	$ cat patches/0024-ccs-pll-Split-off-VT-subtree-calculation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:222: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:230: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:231: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:232: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0026-ccs-pll-Better-separate-OP-and-VT-sub-tree-calculati.patch:

   checkpatch.pl:
	$ cat patches/0026-ccs-pll-Better-separate-OP-and-VT-sub-tree-calculati.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:70: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0028-ccs-pll-Rework-bounds-checks.patch:

   checkpatch.pl:
	$ cat patches/0028-ccs-pll-Rework-bounds-checks.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:26: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0029-ccs-pll-Make-VT-divisors-16-bit.patch:

   checkpatch.pl:
	$ cat patches/0029-ccs-pll-Make-VT-divisors-16-bit.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:27: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:28: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:29: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:30: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:31: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:60: CHECK: Alignment should match open parenthesis

patches/0030-ccs-pll-Fix-VT-post-PLL-divisor-calculation.patch:

   checkpatch.pl:
	$ cat patches/0030-ccs-pll-Fix-VT-post-PLL-divisor-calculation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:34: CHECK: Prefer kernel type 'u16' over 'uint16_t'

patches/0031-ccs-pll-Separate-VT-divisor-limit-calculation-from-t.patch:

   checkpatch.pl:
	$ cat patches/0031-ccs-pll-Separate-VT-divisor-limit-calculation-from-t.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:26: CHECK: Prefer kernel type 'u16' over 'uint16_t'

patches/0032-ccs-pll-Add-trivial-dual-PLL-support.patch:

   checkpatch.pl:
	$ cat patches/0032-ccs-pll-Add-trivial-dual-PLL-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:65: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:66: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:67: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:101: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:146: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:147: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:148: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:173: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0034-ccs-pll-Add-support-for-DDR-OP-system-and-pixel-cloc.patch:

   checkpatch.pl:
	$ cat patches/0034-ccs-pll-Add-support-for-DDR-OP-system-and-pixel-cloc.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:74: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:111: CHECK: Prefer kernel type 'u32' over 'uint32_t'

