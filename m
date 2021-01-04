Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E574F2E953A
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 13:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbhADMqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 07:46:30 -0500
Received: from www.linuxtv.org ([130.149.80.248]:42364 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbhADMq1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Jan 2021 07:46:27 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kwPF3-000JX0-7R; Mon, 04 Jan 2021 12:45:45 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kwPIP-0007u5-SD; Mon, 04 Jan 2021 12:49:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.12] V4L2 camera sensor and other patches (#70394)
Date:   Mon,  4 Jan 2021 12:49:13 +0000
Message-Id: <20210104124913.30338-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104120612.GB850@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210104120612.GB850@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/84315/
Build time: 00:24:32
Link: https://lore.kernel.org/linux-media/20210104120612.GB850@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 04 Jan 2021 11:51:32 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 7/47 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0020-media-ov5647-Add-SGGBR10_1X10-modes.patch:

   checkpatch.pl:
	$ cat patches/0020-media-ov5647-Add-SGGBR10_1X10-modes.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:16: WARNING: Unknown commit id '581dfda6d0a62', maybe rebased or not pulled?

patches/0025-media-ov5647-Support-V4L2_CID_HBLANK-control.patch:

   checkpatch.pl:
	$ cat patches/0025-media-ov5647-Support-V4L2_CID_HBLANK-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:9: WARNING: Unknown commit id 'd82f202156605', maybe rebased or not pulled?

patches/0037-v4l-ioctl-Fix-memory-leak-in-video_usercopy.patch:

   checkpatch.pl:
	$ cat patches/0037-v4l-ioctl-Fix-memory-leak-in-video_usercopy.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:53: CHECK: Comparison to NULL could be written "!array_buf"

patches/0043-dt-bindings-media-i2c-Add-OV5648-bindings-documentat.patch:

   checkpatch.pl:
	$ cat patches/0043-dt-bindings-media-i2c-Add-OV5648-bindings-documentat.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0044-media-i2c-Add-support-for-the-OV5648-image-sensor.patch:

   checkpatch.pl:
	$ cat patches/0044-media-i2c-Add-support-for-the-OV5648-image-sensor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:65: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:567: CHECK: Macro argument 'c' may be better as '(c)' to avoid precedence issues
	-:726: CHECK: struct mutex definition without comment
	-:2375: CHECK: multiple assignments should be avoided
	-:2376: CHECK: multiple assignments should be avoided

patches/0045-dt-bindings-media-i2c-Add-OV8865-bindings-documentat.patch:

   checkpatch.pl:
	$ cat patches/0045-dt-bindings-media-i2c-Add-OV8865-bindings-documentat.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0046-media-i2c-Add-support-for-the-OV8865-image-sensor.patch:

   checkpatch.pl:
	$ cat patches/0046-media-i2c-Add-support-for-the-OV8865-image-sensor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:73: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:172: CHECK: Prefer using the BIT macro
	-:303: CHECK: Please don't use multiple blank lines
	-:349: CHECK: Prefer using the BIT macro
	-:539: CHECK: Macro argument 'c' may be better as '(c)' to avoid precedence issues
	-:750: CHECK: struct mutex definition without comment
	-:1678: CHECK: Alignment should match open parenthesis
	-:2739: CHECK: multiple assignments should be avoided
	-:2740: CHECK: multiple assignments should be avoided


Error #512 when building PDF docs

