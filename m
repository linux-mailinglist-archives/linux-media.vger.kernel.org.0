Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8DC3903D3
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 16:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbhEYOXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 10:23:05 -0400
Received: from www.linuxtv.org ([130.149.80.248]:50016 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233663AbhEYOXE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 10:23:04 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1llXw5-003ZOZ-AW; Tue, 25 May 2021 14:21:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1llY0O-0003uQ-VI; Tue, 25 May 2021 14:26:01 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] v4l2-ctrls: one fix plus refactor work (#74554)
Date:   Tue, 25 May 2021 14:26:00 +0000
Message-Id: <20210525142600.14985-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b1efb0db-9894-5f9b-e1b8-d733758822bb@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/b1efb0db-9894-5f9b-e1b8-d733758822bb@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/109625/
Build time: 00:16:52
Link: https://lore.kernel.org/linux-media/b1efb0db-9894-5f9b-e1b8-d733758822bb@xs4all.nl

gpg: Signature made Tue 25 May 2021 01:50:23 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/2 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-v4l2-ctrls-always-copy-the-controls-on-completion.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]

    allyesconfig: return code #0:
	SPARSE:../drivers/media/cec/core/cec-core.c ../include/asm-generic/bitops/find.h:90:32:  warning: shift count is negative (-192)
	SPARSE:../drivers/media/mc/mc-devnode.c ../include/asm-generic/bitops/find.h:90:32:  warning: shift count is negative (-192)
	SPARSE:../drivers/media/v4l2-core/v4l2-dev.c ../include/asm-generic/bitops/find.h:132:46:  warning: shift count is negative (-192)
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:268 v4l_print_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:292 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:302 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:328 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:347 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:352 v4l_print_format() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:362 v4l_print_framebuffer() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:735 v4l_print_frmsizeenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:762 v4l_print_frmivalenum() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:1424 v4l_fill_fmtdesc() error: unrecognized %p extension '4', treated as normal %p
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1929 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2835 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-v4l2-ctrls-split-up-into-four-source-files.patch:

   checkpatch.pl:
	$ cat patches/0002-v4l2-ctrls-split-up-into-four-source-files.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:73: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:1299: WARNING: return of an errno should typically be negative (ie: return -EPOLLPRI)
	-:1343: CHECK: Logical continuations should be on the previous line
	-:1517: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:1520: WARNING: Avoid logging continuation uses where feasible
	-:1521: WARNING: Avoid logging continuation uses where feasible
	-:1526: WARNING: Avoid logging continuation uses where feasible
	-:1529: WARNING: Avoid logging continuation uses where feasible
	-:1532: WARNING: Avoid logging continuation uses where feasible
	-:1535: WARNING: Avoid logging continuation uses where feasible
	-:1538: WARNING: Avoid logging continuation uses where feasible
	-:1541: WARNING: Avoid logging continuation uses where feasible
	-:1544: WARNING: Avoid logging continuation uses where feasible
	-:1547: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:1547: WARNING: Avoid logging continuation uses where feasible
	-:1550: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:1550: WARNING: Avoid logging continuation uses where feasible
	-:1553: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:1553: WARNING: Avoid logging continuation uses where feasible
	-:1556: WARNING: Avoid logging continuation uses where feasible
	-:1559: WARNING: Avoid logging continuation uses where feasible
	-:1562: WARNING: Avoid logging continuation uses where feasible
	-:1565: WARNING: Avoid logging continuation uses where feasible
	-:1568: WARNING: Avoid logging continuation uses where feasible
	-:1571: WARNING: Avoid logging continuation uses where feasible
	-:1574: WARNING: Avoid logging continuation uses where feasible
	-:1577: WARNING: Avoid logging continuation uses where feasible
	-:1580: WARNING: Avoid logging continuation uses where feasible
	-:1583: WARNING: Avoid logging continuation uses where feasible
	-:1586: WARNING: Avoid logging continuation uses where feasible
	-:1589: WARNING: Avoid logging continuation uses where feasible
	-:1592: WARNING: Avoid logging continuation uses where feasible
	-:1595: WARNING: Avoid logging continuation uses where feasible
	-:1605: CHECK: Macro argument reuse 'val' - possible side-effects?
	-:1605: CHECK: Macro argument 'val' may be better as '(val)' to avoid precedence issues
	-:1605: CHECK: Macro argument reuse 'ctrl' - possible side-effects?
	-:2105: CHECK: Comparison to NULL could be written "!ctrl"
	-:2115: CHECK: Comparison to NULL could be written "!ctrl"
	-:2136: WARNING: Block comments use * on subsequent lines
	-:2136: WARNING: Block comments use a trailing */ on a separate line
	-:2140: CHECK: Alignment should match open parenthesis
	-:2149: CHECK: Comparison to NULL could be written "!ctrl"
	-:2209: WARNING: Block comments use * on subsequent lines
	-:2209: WARNING: Block comments use a trailing */ on a separate line
	-:2225: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2243: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2268: CHECK: Comparison to NULL could be written "!hdl"
	-:2268: CHECK: Comparison to NULL could be written "!hdl->buckets"
	-:2296: WARNING: Block comments use * on subsequent lines
	-:2300: WARNING: Block comments use a trailing */ on a separate line
	-:2301: CHECK: Lines should not end with a '('
	-:2309: WARNING: Block comments use * on subsequent lines
	-:2309: WARNING: Block comments use a trailing */ on a separate line
	-:2392: CHECK: Comparison to NULL could be written "!find_ref_lock"
	-:2414: WARNING: Block comments use * on subsequent lines
	-:2416: WARNING: Block comments use a trailing */ on a separate line
	-:2458: CHECK: Alignment should match open parenthesis
	-:2468: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2469: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2470: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2472: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2473: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2564: CHECK: Comparison to NULL could be written "!name"
	-:2566: CHECK: Comparison to NULL could be written "!qmenu"
	-:2567: CHECK: Comparison to NULL could be written "!qmenu_int"
	-:2599: CHECK: Comparison to NULL could be written "!ctrl"
	-:2600: WARNING: Possible unnecessary 'out of memory' message
	-:2631: CHECK: multiple assignments should be avoided
	-:2663: CHECK: Alignment should match open parenthesis
	-:2677: CHECK: Comparison to NULL could be written "!name"
	-:2679: CHECK: Alignment should match open parenthesis
	-:2695: CHECK: Alignment should match open parenthesis
	-:2707: CHECK: Alignment should match open parenthesis
	-:2729: CHECK: Alignment should match open parenthesis
	-:2762: CHECK: Alignment should match open parenthesis
	-:2782: CHECK: Comparison to NULL could be written "!qmenu"
	-:2790: CHECK: Blank lines aren't necessary before a close brace '}'
	-:2795: CHECK: Alignment should match open parenthesis
	-:2816: CHECK: Alignment should match open parenthesis
	-:2896: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:2902: CHECK: Comparison to NULL could be written "!controls[0]"
	-:2917: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3072: CHECK: Comparison to NULL could be written "!ctrl"
	-:3090: CHECK: Comparison to NULL could be written "!ctrl"
	-:3112: CHECK: Comparison to NULL could be written "!hdl"
	-:3150: CHECK: Comparison to NULL could be written "!hdl"
	-:3178: WARNING: Avoid logging continuation uses where feasible
	-:3180: WARNING: Avoid logging continuation uses where feasible
	-:3182: WARNING: Avoid logging continuation uses where feasible
	-:3184: WARNING: Avoid logging continuation uses where feasible
	-:3967: CHECK: Macro argument reuse 'arr' - possible side-effects?
	-:4088: WARNING: line length of 101 exceeds 100 columns
	-:4089: WARNING: line length of 105 exceeds 100 columns
	-:4092: WARNING: line length of 102 exceeds 100 columns
	-:4096: WARNING: line length of 105 exceeds 100 columns
	-:4112: WARNING: line length of 103 exceeds 100 columns
	-:4113: WARNING: line length of 102 exceeds 100 columns
	-:4120: WARNING: line length of 103 exceeds 100 columns
	-:4121: WARNING: line length of 104 exceeds 100 columns
	-:4125: WARNING: line length of 105 exceeds 100 columns
	-:4126: WARNING: line length of 102 exceeds 100 columns
	-:4127: WARNING: line length of 104 exceeds 100 columns
	-:4128: WARNING: line length of 105 exceeds 100 columns
	-:4129: WARNING: line length of 103 exceeds 100 columns
	-:4131: WARNING: line length of 105 exceeds 100 columns
	-:4132: WARNING: line length of 103 exceeds 100 columns
	-:4135: WARNING: line length of 105 exceeds 100 columns
	-:4137: WARNING: line length of 101 exceeds 100 columns
	-:4138: WARNING: line length of 101 exceeds 100 columns
	-:4139: WARNING: line length of 103 exceeds 100 columns
	-:4140: WARNING: line length of 103 exceeds 100 columns
	-:4141: WARNING: line length of 103 exceeds 100 columns
	-:4142: WARNING: line length of 103 exceeds 100 columns
	-:4143: WARNING: line length of 103 exceeds 100 columns
	-:4144: WARNING: line length of 103 exceeds 100 columns
	-:4145: WARNING: line length of 105 exceeds 100 columns
	-:4146: WARNING: line length of 105 exceeds 100 columns
	-:4147: WARNING: line length of 105 exceeds 100 columns
	-:4148: WARNING: line length of 105 exceeds 100 columns
	-:4149: WARNING: line length of 105 exceeds 100 columns
	-:4150: WARNING: line length of 105 exceeds 100 columns
	-:4151: WARNING: line length of 105 exceeds 100 columns
	-:4161: WARNING: line length of 101 exceeds 100 columns
	-:4168: WARNING: line length of 101 exceeds 100 columns
	-:4169: WARNING: line length of 103 exceeds 100 columns
	-:4183: WARNING: line length of 105 exceeds 100 columns
	-:4184: WARNING: line length of 101 exceeds 100 columns
	-:4185: WARNING: line length of 101 exceeds 100 columns
	-:4186: WARNING: line length of 103 exceeds 100 columns
	-:4187: WARNING: line length of 105 exceeds 100 columns
	-:4203: WARNING: line length of 103 exceeds 100 columns
	-:4204: WARNING: line length of 103 exceeds 100 columns
	-:4205: WARNING: line length of 103 exceeds 100 columns
	-:4206: WARNING: line length of 103 exceeds 100 columns
	-:4207: WARNING: line length of 103 exceeds 100 columns
	-:4208: WARNING: line length of 103 exceeds 100 columns
	-:4213: WARNING: line length of 104 exceeds 100 columns
	-:4215: WARNING: line length of 104 exceeds 100 columns
	-:4220: WARNING: line length of 103 exceeds 100 columns
	-:4221: WARNING: line length of 104 exceeds 100 columns
	-:4222: WARNING: line length of 102 exceeds 100 columns
	-:4223: WARNING: line length of 102 exceeds 100 columns
	-:4224: WARNING: line length of 102 exceeds 100 columns
	-:4225: WARNING: line length of 102 exceeds 100 columns
	-:4226: WARNING: line length of 102 exceeds 100 columns
	-:4227: WARNING: line length of 102 exceeds 100 columns
	-:4228: WARNING: line length of 102 exceeds 100 columns
	-:4229: WARNING: line length of 105 exceeds 100 columns
	-:4230: WARNING: line length of 105 exceeds 100 columns
	-:4231: WARNING: line length of 105 exceeds 100 columns
	-:4232: WARNING: line length of 105 exceeds 100 columns
	-:4233: WARNING: line length of 105 exceeds 100 columns
	-:4234: WARNING: line length of 105 exceeds 100 columns
	-:4235: WARNING: line length of 105 exceeds 100 columns
	-:4238: WARNING: line length of 101 exceeds 100 columns
	-:4241: WARNING: line length of 103 exceeds 100 columns
	-:4243: WARNING: line length of 103 exceeds 100 columns
	-:4244: WARNING: line length of 102 exceeds 100 columns
	-:4247: WARNING: line length of 104 exceeds 100 columns
	-:4249: WARNING: line length of 101 exceeds 100 columns
	-:4418: WARNING: line length of 101 exceeds 100 columns
	-:4421: WARNING: line length of 102 exceeds 100 columns
	-:4428: WARNING: line length of 102 exceeds 100 columns
	-:4845: CHECK: Macro argument reuse 'vdev' - possible side-effects?
	-:4847: WARNING: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
	-:4851: CHECK: Macro argument reuse 'master' - possible side-effects?
	-:4851: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues
	-:4853: CHECK: Macro argument reuse 'master' - possible side-effects?
	-:4853: CHECK: Macro argument reuse 'op' - possible side-effects?


Error #512 when building PDF docs

