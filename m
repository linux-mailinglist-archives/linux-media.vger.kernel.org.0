Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F1E2F663A
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 17:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbhANQrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 11:47:55 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46340 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbhANQrz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 11:47:55 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l05mE-00Eyk3-6j; Thu, 14 Jan 2021 16:47:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l05pe-0001LN-OK; Thu, 14 Jan 2021 16:50:47 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.12] IPU3 bridge (#70754)
Date:   Thu, 14 Jan 2021 16:50:46 +0000
Message-Id: <20210114165046.5124-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114162122.GO850@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210114162122.GO850@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/85778/
Build time: 00:16:21
Link: https://lore.kernel.org/linux-media/20210114162122.GO850@valkosipuli.retiisi.org.uk

gpg: Signature made Thu 14 Jan 2021 03:39:38 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 4/17 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0008-software_node-unregister-software_nodes-in-reverse-o.patch:

   checkpatch.pl:
	$ cat patches/0008-software_node-unregister-software_nodes-in-reverse-o.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:39: CHECK: Lines should not end with a '('

patches/0013-ipu3-cio2-Rename-ipu3-cio2.c.patch:

   checkpatch.pl:
	$ cat patches/0013-ipu3-cio2-Rename-ipu3-cio2.c.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0015-ACPI-bus-Add-acpi_dev_get_next_match_dev-and-helper-.patch:

   checkpatch.pl:
	$ cat patches/0015-ACPI-bus-Add-acpi_dev_get_next_match_dev-and-helper-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:99: CHECK: Macro argument reuse 'adev' - possible side-effects?
	-:99: CHECK: Macro argument reuse 'hid' - possible side-effects?
	-:99: CHECK: Macro argument reuse 'uid' - possible side-effects?
	-:99: CHECK: Macro argument reuse 'hrv' - possible side-effects?

patches/0017-ipu3-cio2-Add-cio2-bridge-to-ipu3-cio2-driver.patch:

   checkpatch.pl:
	$ cat patches/0017-ipu3-cio2-Add-cio2-bridge-to-ipu3-cio2-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:158: CHECK: Lines should not end with a '('
	-:168: CHECK: Lines should not end with a '('
	-:171: CHECK: Lines should not end with a '('
	-:175: CHECK: Lines should not end with a '('
	-:178: CHECK: Lines should not end with a '('
	-:182: CHECK: Lines should not end with a '('
	-:187: CHECK: Lines should not end with a '('
	-:192: CHECK: Lines should not end with a '('
	-:196: CHECK: Lines should not end with a '('
	-:225: CHECK: Lines should not end with a '('
	-:231: CHECK: Lines should not end with a '('
	-:293: CHECK: Lines should not end with a '['
	-:418: ERROR: Macros with complex values should be enclosed in parentheses
	-:425: ERROR: Macros with complex values should be enclosed in parentheses
	-:431: ERROR: Macros with complex values should be enclosed in parentheses
	-:437: ERROR: Macros with complex values should be enclosed in parentheses


Error #512 when building PDF docs

