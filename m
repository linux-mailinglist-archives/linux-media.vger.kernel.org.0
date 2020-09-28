Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA92127AFEA
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 16:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1OXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 10:23:46 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58238 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgI1OXp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 10:23:45 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kMtxi-00Ac9C-0C; Mon, 28 Sep 2020 14:17:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kMu6i-00048r-83; Mon, 28 Sep 2020 14:26:24 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Fix for s5p-mfc and resurrect zoran driver (#67428)
Date:   Mon, 28 Sep 2020 14:26:24 +0000
Message-Id: <20200928142624.15880-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3f8a1094-0fa6-e539-345b-7bd3e953c840@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/3f8a1094-0fa6-e539-345b-7bd3e953c840@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/70296/
Build time: 00:38:56
Link: https://lore.kernel.org/linux-media/3f8a1094-0fa6-e539-345b-7bd3e953c840@xs4all.nl

gpg: Signature made Mon 28 Sep 2020 01:28:46 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 22/50 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-platform-s5p-mfc-Fix-adding-a-standard-frame-s.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-staging-media-Revert-media-zoran-remove-deprecated-d.patch:

   checkpatch.pl:
	$ cat patches/0002-staging-media-Revert-media-zoran-remove-deprecated-d.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:61: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:682: WARNING: please write a paragraph that describes the config symbol fully
	-:692: WARNING: please write a paragraph that describes the config symbol fully
	-:700: WARNING: please write a paragraph that describes the config symbol fully
	-:708: WARNING: please write a paragraph that describes the config symbol fully
	-:717: WARNING: please write a paragraph that describes the config symbol fully
	-:726: WARNING: please write a paragraph that describes the config symbol fully
	-:772: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:780: WARNING: CVS style keyword markers, these will _not_ be updated
	-:819: CHECK: Macro argument 'num' may be better as '(num)' to avoid precedence issues
	-:822: WARNING: printk() should include KERN_<LEVEL> facility level
	-:844: WARNING: space prohibited between function name and open parenthesis '('
	-:852: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:857: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:863: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:871: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:882: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:892: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:894: CHECK: Prefer kzalloc(sizeof(*ptr)...) over kzalloc(sizeof(struct attached_list)...)
	-:898: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:919: WARNING: else is not generally useful after a break or return
	-:926: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_attach', this function's name, in a string
	-:937: WARNING: space prohibited between function name and open parenthesis '('
	-:944: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_detach', this function's name, in a string
	-:949: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_detach', this function's name, in a string
	-:954: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_detach', this function's name, in a string
	-:966: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_detach', this function's name, in a string
	-:972: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_detach', this function's name, in a string
	-:976: CHECK: Comparison to NULL could be written "!prev"
	-:997: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_detach', this function's name, in a string
	-:1002: WARNING: space prohibited between function name and open parenthesis '('
	-:1007: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_register', this function's name, in a string
	-:1015: CHECK: Prefer kzalloc(sizeof(*ptr)...) over kzalloc(sizeof(struct codec_list)...)
	-:1017: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_register', this function's name, in a string
	-:1037: WARNING: space prohibited between function name and open parenthesis '('
	-:1042: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_unregister', this function's name, in a string
	-:1053: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_unregister', this function's name, in a string
	-:1068: CHECK: Comparison to NULL could be written "!prev"
	-:1086: WARNING: Prefer using '"%s...", __func__' to using 'videocodec_unregister', this function's name, in a string
	-:1096: WARNING: Prefer seq_puts to seq_printf
	-:1097: WARNING: Prefer seq_puts to seq_printf
	-:1101: CHECK: Alignment should match open parenthesis
	-:1106: CHECK: Alignment should match open parenthesis
	-:1124: WARNING: space prohibited between function name and open parenthesis '('
	-:1130: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:1135: CHECK: Alignment should match open parenthesis
	-:1136: WARNING: braces {} are not necessary for single statement blocks
	-:1144: WARNING: space prohibited between function name and open parenthesis '('
	-:1151: WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
	-:1152: WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
	-:1153: WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
	-:1154: WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
	-:1169: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:1177: WARNING: CVS style keyword markers, these will _not_ be updated
	-:1199: WARNING: Block comments use * on subsequent lines
	-:1235: CHECK: Invalid UTF-8, patch and commit message should be encoded in UTF-8
	-:1235: ERROR: trailing whitespace
	-:1236: CHECK: Please don't use multiple blank lines
	-:1242: WARNING: Block comments use * on subsequent lines
	-:1282: CHECK: Invalid UTF-8, patch and commit message should be encoded in UTF-8
	-:1282: ERROR: trailing whitespace
	-:1288: WARNING: Block comments use * on subsequent lines
	-:1302: CHECK: Invalid UTF-8, patch and commit message should be encoded in UTF-8
	-:1302: ERROR: trailing whitespace
	-:1303: CHECK: Please don't use multiple blank lines
	-:1381: CHECK: Invalid UTF-8, patch and commit message should be encoded in UTF-8
	-:1381: ERROR: trailing whitespace
	-:1382: CHECK: Please don't use multiple blank lines
	-:1407: CHECK: Avoid CamelCase: <Wa>
	-:1407: CHECK: Avoid CamelCase: <HStart>
	-:1407: CHECK: Avoid CamelCase: <HSyncStart>
	-:1407: CHECK: Avoid CamelCase: <Ht>
	-:1407: CHECK: Avoid CamelCase: <Ha>
	-:1407: CHECK: Avoid CamelCase: <VStart>
	-:1438: ERROR: "foo * bar" should be "foo *bar"
	-:1438: WARNING: Unnecessary space before function pointer arguments
	-:1439: ERROR: "foo * bar" should be "foo *bar"
	-:1439: WARNING: Unnecessary space before function pointer arguments
	-:1443: ERROR: "foo * bar" should be "foo *bar"
	-:1443: WARNING: Unnecessary space before function pointer arguments
	-:1446: ERROR: "foo * bar" should be "foo *bar"
	-:1446: WARNING: Unnecessary space before function pointer arguments
	-:1447: ERROR: "foo * bar" should be "foo *bar"
	-:1448: ERROR: "foo * bar" should be "foo *bar"
	-:1449: ERROR: "foo * bar" should be "foo *bar"
	-:1451: ERROR: "foo * bar" should be "foo *bar"
	-:1451: WARNING: Unnecessary space before function pointer arguments
	-:1458: ERROR: "foo * bar" should be "foo *bar"
	-:1458: WARNING: Unnecessary space before function pointer arguments
	-:1460: ERROR: "foo * bar" should be "foo *bar"
	-:1460: WARNING: Unnecessary space before function pointer arguments
	-:1464: ERROR: "foo * bar" should be "foo *bar"
	-:1464: WARNING: Unnecessary space before function pointer arguments
	-:1471: ERROR: "foo * bar" should be "foo *bar"
	-:1471: WARNING: Unnecessary space before function pointer arguments
	-:1489: ERROR: "foo * bar" should be "foo *bar"
	-:1489: WARNING: missing space after return type
	-:1489: WARNING: Unnecessary space before function pointer arguments
	-:1491: ERROR: "foo * bar" should be "foo *bar"
	-:1491: WARNING: Unnecessary space before function pointer arguments
	-:1495: CHECK: Invalid UTF-8, patch and commit message should be encoded in UTF-8
	-:1495: ERROR: trailing whitespace
	-:1496: CHECK: Please don't use multiple blank lines
	-:1505: CHECK: extern prototypes should be avoided in .h files
	-:1505: WARNING: function definition argument 'struct videocodec_master *' should also have an identifier name
	-:1507: CHECK: extern prototypes should be avoided in .h files
	-:1507: WARNING: function definition argument 'struct videocodec *' should also have an identifier name
	-:1511: CHECK: extern prototypes should be avoided in .h files
	-:1511: WARNING: function definition argument 'const struct videocodec *' should also have an identifier name
	-:1513: CHECK: extern prototypes should be avoided in .h files
	-:1513: WARNING: function definition argument 'const struct videocodec *' should also have an identifier name
	-:1524: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:1564: CHECK: Please don't use multiple blank lines
	-:1591: WARNING: Comparisons should place the constant on the right side of the test
	-:1667: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:1668: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:1668: ERROR: Macros with complex values should be enclosed in parentheses
	-:1668: CHECK: Prefer using the BIT macro
	-:1669: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:1669: ERROR: Macros with complex values should be enclosed in parentheses
	-:1669: CHECK: Prefer using the BIT macro
	-:1670: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:1670: ERROR: Macros with complex values should be enclosed in parentheses
	-:1670: CHECK: Prefer using the BIT macro
	-:1671: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:1671: ERROR: Macros with complex values should be enclosed in parentheses
	-:1671: CHECK: Prefer using the BIT macro
	-:1690: WARNING: line length of 102 exceeds 100 columns
	-:1690: CHECK: Avoid CamelCase: <HorDcm>
	-:1690: CHECK: Avoid CamelCase: <VerDcm>
	-:1690: CHECK: Avoid CamelCase: <TmpDcm>
	-:1691: WARNING: line length of 107 exceeds 100 columns
	-:1788: ERROR: "foo * bar" should be "foo *bar"
	-:1788: WARNING: Unnecessary space before function pointer arguments
	-:1871: WARNING: line length of 105 exceeds 100 columns
	-:1889: CHECK: Avoid CamelCase: <intr_counter_CodRepIRQ>
	-:1890: CHECK: Avoid CamelCase: <intr_counter_JPEGRepIRQ>
	-:1917: WARNING: Block comments use a trailing */ on a separate line
	-:1918: ERROR: space required after that ',' (ctx:VxV)
	-:1918: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:1919: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:1921: ERROR: space required after that ',' (ctx:VxV)
	-:1921: CHECK: Macro argument reuse 'adr' - possible side-effects?
	-:1922: ERROR: space required after that ',' (ctx:VxV)
	-:1922: CHECK: Macro argument reuse 'adr' - possible side-effects?
	-:1923: ERROR: space required after that ',' (ctx:VxV)
	-:1923: ERROR: space required after that ',' (ctx:VxV)
	-:1923: CHECK: Macro argument reuse 'adr' - possible side-effects?
	-:1932: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:1990: CHECK: spaces preferred around that '-' (ctx:VxV)
	-:1995: WARNING: Block comments use * on subsequent lines
	-:1999: WARNING: Possible repeated word: 'in'
	-:2007: WARNING: Block comments use * on subsequent lines
	-:2025: CHECK: spaces preferred around that '-' (ctx:VxV)
	-:2043: ERROR: do not initialise globals to 0
	-:2044: WARNING: line length of 108 exceeds 100 columns
	-:2078: WARNING: space prohibited between function name and open parenthesis '('
	-:2081: CHECK: No space is necessary after a cast
	-:2085: CHECK: Logical continuations should be on the previous line
	-:2086: CHECK: Logical continuations should be on the previous line
	-:2095: WARNING: space prohibited between function name and open parenthesis '('
	-:2099: CHECK: No space is necessary after a cast
	-:2102: CHECK: Logical continuations should be on the previous line
	-:2103: CHECK: Logical continuations should be on the previous line
	-:2112: WARNING: space prohibited between function name and open parenthesis '('
	-:2115: CHECK: No space is necessary after a cast
	-:2119: CHECK: Logical continuations should be on the previous line
	-:2128: WARNING: space prohibited between function name and open parenthesis '('
	-:2132: CHECK: No space is necessary after a cast
	-:2135: CHECK: Logical continuations should be on the previous line
	-:2144: WARNING: space prohibited between function name and open parenthesis '('
	-:2147: CHECK: No space is necessary after a cast
	-:2150: WARNING: braces {} are not necessary for single statement blocks
	-:2160: WARNING: space prohibited between function name and open parenthesis '('
	-:2164: CHECK: No space is necessary after a cast
	-:2166: WARNING: braces {} are not necessary for single statement blocks
	-:2178: WARNING: space prohibited between function name and open parenthesis '('
	-:2190: WARNING: space prohibited between function name and open parenthesis '('
	-:2196: WARNING: space prohibited between function name and open parenthesis '('
	-:2207: WARNING: space prohibited between function name and open parenthesis '('
	-:2215: WARNING: space prohibited between function name and open parenthesis '('
	-:2236: CHECK: Blank lines aren't necessary before a close brace '}'
	-:2239: WARNING: space prohibited between function name and open parenthesis '('
	-:2267: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:2268: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:2276: WARNING: Block comments use a trailing */ on a separate line
	-:2277: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:2278: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:2284: WARNING: Block comments use a trailing */ on a separate line
	-:2314: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2314: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2344: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2344: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2373: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2373: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2404: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2404: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2435: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2435: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2464: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2493: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2522: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2522: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2541: WARNING: Block comments use * on subsequent lines
	-:2541: WARNING: Block comments use a trailing */ on a separate line
	-:2561: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:2585: WARNING: space prohibited between function name and open parenthesis '('
	-:2587: CHECK: No space is necessary after a cast
	-:2593: WARNING: space prohibited between function name and open parenthesis '('
	-:2595: CHECK: No space is necessary after a cast
	-:2601: WARNING: space prohibited between function name and open parenthesis '('
	-:2604: CHECK: No space is necessary after a cast
	-:2614: WARNING: space prohibited between function name and open parenthesis '('
	-:2617: CHECK: No space is necessary after a cast
	-:2636: WARNING: space prohibited between function name and open parenthesis '('
	-:2649: WARNING: space prohibited between function name and open parenthesis '('
	-:2657: WARNING: space prohibited between function name and open parenthesis '('
	-:2817: WARNING: space prohibited between function name and open parenthesis '('
	-:2842: WARNING: braces {} are not necessary for single statement blocks
	-:2847: WARNING: braces {} are not necessary for single statement blocks
	-:2877: WARNING: space prohibited between function name and open parenthesis '('
	-:2886: CHECK: Avoid CamelCase: <ZR36057_ICR_IntPinEn>
	-:2894: WARNING: braces {} are not necessary for single statement blocks
	-:2902: WARNING: space prohibited between function name and open parenthesis '('
	-:2920: CHECK: No space is necessary after a cast
	-:2939: CHECK: Comparison to NULL could be written "!zr->timing"
	-:2948: CHECK: spaces preferred around that '-' (ctx:VxV)
	-:2952: CHECK: spaces preferred around that '-' (ctx:VxV)
	-:2961: WARNING: Block comments use a trailing */ on a separate line
	-:2972: WARNING: braces {} are not necessary for single statement blocks
	-:2984: WARNING: Block comments use * on subsequent lines
	-:2985: WARNING: Block comments use a trailing */ on a separate line
	-:3053: WARNING: space prohibited between function name and open parenthesis '('
	-:3063: CHECK: Prefer kmalloc(sizeof(*m)...) over kmalloc(sizeof(struct videocodec_master)...)
	-:3071: WARNING: Block comments use * on subsequent lines
	-:3082: ERROR: that open brace { should be on the previous line
	-:3109: WARNING: Block comments use * on subsequent lines
	-:3109: WARNING: Block comments use a trailing */ on a separate line
	-:3131: CHECK: Please don't use multiple blank lines
	-:3139: CHECK: Prefer kzalloc(sizeof(*zr)...) over kzalloc(sizeof(struct zoran)...)
	-:3214: WARNING: Block comments use a trailing */ on a separate line
	-:3271: CHECK: Alignment should match open parenthesis
	-:3276: CHECK: Alignment should match open parenthesis
	-:3396: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:3405: WARNING: Block comments use a trailing */ on a separate line
	-:3430: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:3430: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:3462: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:3492: CHECK: Macro argument 'num' may be better as '(num)' to avoid precedence issues
	-:3495: WARNING: printk() should include KERN_<LEVEL> facility level
	-:3503: CHECK: extern prototypes should be avoided in .h files
	-:3506: CHECK: extern prototypes should be avoided in .h files
	-:3507: CHECK: extern prototypes should be avoided in .h files
	-:3518: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:3564: WARNING: Use #include <linux/io.h> instead of <asm/io.h>
	-:3571: ERROR: space prohibited after that open parenthesis '('
	-:3573: ERROR: space prohibited before that close parenthesis ')'
	-:3573: CHECK: Avoid CamelCase: <ZR36057_ISR_JPEGRepIRQ>
	-:3583: WARNING: Block comments use a trailing */ on a separate line
	-:3590: WARNING: space prohibited between function name and open parenthesis '('
	-:3602: WARNING: space prohibited between function name and open parenthesis '('
	-:3603: WARNING: please, no spaces at the start of a line
	-:3604: WARNING: please, no spaces at the start of a line
	-:3611: WARNING: Block comments use a trailing */ on a separate line
	-:3614: WARNING: braces {} are not necessary for single statement blocks
	-:3626: WARNING: space prohibited between function name and open parenthesis '('
	-:3630: WARNING: line length of 111 exceeds 100 columns
	-:3631: CHECK: Avoid CamelCase: <ZR36057_POR_POPen>
	-:3631: WARNING: braces {} are not necessary for single statement blocks
	-:3634: CHECK: Avoid CamelCase: <ZR36057_POR_POTime>
	-:3645: WARNING: space prohibited between function name and open parenthesis '('
	-:3653: CHECK: Avoid CamelCase: <ZR36057_POR_PODir>
	-:3661: WARNING: space prohibited between function name and open parenthesis '('
	-:3669: WARNING: braces {} are not necessary for single statement blocks
	-:3681: WARNING: space prohibited between function name and open parenthesis '('
	-:3690: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:3696: WARNING: space prohibited between function name and open parenthesis '('
	-:3702: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:3705: CHECK: multiple assignments should be avoided
	-:3712: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
	-:3730: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:3733: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:3737: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:3747: WARNING: space prohibited between function name and open parenthesis '('
	-:3754: WARNING: Prefer using '"%s...", __func__' to using 'jpeg_codec_sleep', this function's name, in a string
	-:3756: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
	-:3760: WARNING: Prefer using '"%s...", __func__' to using 'jpeg_codec_sleep', this function's name, in a string
	-:3767: WARNING: space prohibited between function name and open parenthesis '('
	-:3796: WARNING: space prohibited between function name and open parenthesis '('
	-:3803: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_ExtFl>
	-:3805: WARNING: braces {} are not necessary for single statement blocks
	-:3820: WARNING: braces {} are not necessary for single statement blocks
	-:3833: WARNING: space prohibited between function name and open parenthesis '('
	-:3839: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3839: CHECK: Avoid CamelCase: <HEnd>
	-:3839: CHECK: Avoid CamelCase: <VEnd>
	-:3840: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3840: CHECK: Avoid CamelCase: <DispMode>
	-:3841: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3841: CHECK: Avoid CamelCase: <VidWinWid>
	-:3841: CHECK: Avoid CamelCase: <VidWinHt>
	-:3842: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3843: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3843: CHECK: Avoid CamelCase: <We>
	-:3843: CHECK: Avoid CamelCase: <He>
	-:3844: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3846: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:3885: CHECK: Avoid CamelCase: <ZR36057_VFEHCR_Hmask>
	-:3885: CHECK: Avoid CamelCase: <ZR36057_VFEHCR_HStart>
	-:3886: CHECK: Avoid CamelCase: <ZR36057_VFEHCR_HEnd>
	-:3888: CHECK: Avoid CamelCase: <ZR36057_VFEHCR_HSPol>
	-:3900: WARNING: line length of 108 exceeds 100 columns
	-:3903: CHECK: Avoid CamelCase: <ZR36057_VFEVCR_Vmask>
	-:3903: CHECK: Avoid CamelCase: <ZR36057_VFEVCR_VStart>
	-:3904: CHECK: Avoid CamelCase: <ZR36057_VFEVCR_VEnd>
	-:3906: CHECK: Avoid CamelCase: <ZR36057_VFEVCR_VSPol>
	-:3911: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_HorDcm>
	-:3912: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_VerDcm>
	-:3913: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_DispMode>
	-:3916: WARNING: Block comments use a trailing */ on a separate line
	-:3921: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_TopField>
	-:3922: WARNING: braces {} are not necessary for any arm of this statement
	-:3923: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_HFilter>
	-:3933: CHECK: Avoid CamelCase: <ZR36057_VDCR_MinPix>
	-:3934: CHECK: Avoid CamelCase: <ZR36057_VDCR_VidWinHt>
	-:3935: CHECK: Avoid CamelCase: <ZR36057_VDCR_VidWinWid>
	-:3938: CHECK: Avoid CamelCase: <ZR36057_VDCR_Triton>
	-:3947: WARNING: Block comments use a trailing */ on a separate line
	-:3959: CHECK: Avoid CamelCase: <ZR36057_OCR_MaskStride>
	-:3971: WARNING: space prohibited between function name and open parenthesis '('
	-:3978: CHECK: Avoid CamelCase: <ZR36057_VDCR_VidEn>
	-:3987: WARNING: Block comments use a trailing */ on a separate line
	-:3990: CHECK: No space is necessary after a cast
	-:3999: WARNING: Prefer using '"%s...", __func__' to using 'zr36057_overlay', this function's name, in a string
	-:4014: WARNING: Prefer using '"%s...", __func__' to using 'zr36057_overlay', this function's name, in a string
	-:4016: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_DispStride>
	-:4017: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_VidOvf>
	-:4022: CHECK: Avoid CamelCase: <ZR36057_OCR_OvlEnable>
	-:4040: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:4043: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:4064: WARNING: braces {} are not necessary for single statement blocks
	-:4067: WARNING: braces {} are not necessary for single statement blocks
	-:4072: WARNING: braces {} are not necessary for single statement blocks
	-:4075: WARNING: braces {} are not necessary for single statement blocks
	-:4086: CHECK: No space is necessary after a cast
	-:4095: WARNING: space prohibited between function name and open parenthesis '('
	-:4106: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_SnapShot>
	-:4109: WARNING: Prefer using '"%s...", __func__' to using 'zr36057_set_memgrab', this function's name, in a string
	-:4143: WARNING: space prohibited between function name and open parenthesis '('
	-:4153: CHECK: Alignment should match open parenthesis
	-:4171: WARNING: space prohibited between function name and open parenthesis '('
	-:4178: WARNING: space prohibited between function name and open parenthesis '('
	-:4197: WARNING: space prohibited between function name and open parenthesis '('
	-:4212: WARNING: braces {} are not necessary for single statement blocks
	-:4215: WARNING: braces {} are not necessary for single statement blocks
	-:4221: WARNING: space prohibited between function name and open parenthesis '('
	-:4234: CHECK: Blank lines aren't necessary after an open brace '{'
	-:4237: CHECK: Avoid CamelCase: <ZR36057_JMC_MJPGCmpMode>
	-:4241: CHECK: Avoid CamelCase: <ZR36057_JMC_MJPGExpMode>
	-:4242: CHECK: Avoid CamelCase: <ZR36057_JMC_SyncMstr>
	-:4248: CHECK: Avoid CamelCase: <ZR36057_JMC_JPGCmpMode>
	-:4252: CHECK: Avoid CamelCase: <ZR36057_JMC_JPGExpMode>
	-:4255: CHECK: Blank lines aren't necessary before a close brace '}'
	-:4258: CHECK: Avoid CamelCase: <ZR36057_JMC_Fld_per_buff>
	-:4263: CHECK: Avoid CamelCase: <ZR36057_VSP_VsyncSize>
	-:4264: CHECK: Avoid CamelCase: <ZR36057_VSP_FrmTot>
	-:4275: CHECK: Avoid CamelCase: <ZR36057_HSP_HsyncStart>
	-:4276: CHECK: Avoid CamelCase: <ZR36057_HSP_LineTot>
	-:4285: CHECK: Avoid CamelCase: <ZR36057_FPP_Odd_Even>
	-:4301: CHECK: Blank lines aren't necessary after an open brace '{'
	-:4319: CHECK: Blank lines aren't necessary before a close brace '}'
	-:4323: CHECK: Blank lines aren't necessary before a close brace '}'
	-:4326: WARNING: space prohibited between function name and open parenthesis '('
	-:4330: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:4331: ERROR: do not use assignment in if condition
	-:4331: WARNING: braces {} are not necessary for single statement blocks
	-:4332: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4332: WARNING: Avoid logging continuation uses where feasible
	-:4334: ERROR: do not use assignment in if condition
	-:4335: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4335: WARNING: Avoid logging continuation uses where feasible
	-:4338: ERROR: do not use assignment in if condition
	-:4339: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4339: WARNING: Avoid logging continuation uses where feasible
	-:4342: ERROR: do not use assignment in if condition
	-:4343: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4343: WARNING: Avoid logging continuation uses where feasible
	-:4346: ERROR: do not use assignment in if condition
	-:4347: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4347: WARNING: Avoid logging continuation uses where feasible
	-:4351: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4351: WARNING: Avoid logging continuation uses where feasible
	-:4354: WARNING: braces {} are not necessary for single statement blocks
	-:4355: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4355: WARNING: Avoid logging continuation uses where feasible
	-:4358: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4358: WARNING: Avoid logging continuation uses where feasible
	-:4361: WARNING: braces {} are not necessary for single statement blocks
	-:4362: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4362: WARNING: Avoid logging continuation uses where feasible
	-:4364: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4364: WARNING: Avoid logging continuation uses where feasible
	-:4368: WARNING: space prohibited between function name and open parenthesis '('
	-:4388: WARNING: space prohibited between function name and open parenthesis '('
	-:4392: ERROR: do not use assignment in if condition
	-:4401: CHECK: Avoid CamelCase: <ZR36057_ISR_CodRepIRQ>
	-:4414: WARNING: space prohibited between function name and open parenthesis '('
	-:4421: CHECK: Avoid CamelCase: <ZR36057_JPC_P_Reset>
	-:4423: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CFlush>
	-:4425: CHECK: Avoid CamelCase: <ZR36057_JPC_CodTrnsEn>
	-:4431: CHECK: Avoid CamelCase: <ZR36057_ICR_JPEGRepIRQ>
	-:4438: CHECK: Avoid CamelCase: <ZR36057_JCGI_JPEGuestID>
	-:4439: CHECK: Avoid CamelCase: <ZR36057_JCGI_JPEGuestReg>
	-:4453: CHECK: Avoid CamelCase: <ZR36057_JPC_Active>
	-:4456: CHECK: Avoid CamelCase: <ZR36057_JMC_Go_en>
	-:4457: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
	-:4461: WARNING: Prefer using '"%s...", __func__' to using 'jpeg_start', this function's name, in a string
	-:4465: WARNING: space prohibited between function name and open parenthesis '('
	-:4483: CHECK: Blank lines aren't necessary after an open brace '{'
	-:4591: CHECK: Blank lines aren't necessary before a close brace '}'
	-:4596: WARNING: space prohibited between function name and open parenthesis '('
	-:4608: CHECK: Blank lines aren't necessary after an open brace '{'
	-:4632: CHECK: Blank lines aren't necessary before a close brace '}'
	-:4639: WARNING: space prohibited between function name and open parenthesis '('
	-:4651: WARNING: Block comments use a trailing */ on a separate line
	-:4653: WARNING: braces {} are not necessary for single statement blocks
	-:4666: WARNING: braces {} are not necessary for single statement blocks
	-:4783: WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
	-:4789: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:4792: WARNING: line length of 111 exceeds 100 columns
	-:4793: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4793: WARNING: Avoid logging continuation uses where feasible
	-:4796: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:4796: WARNING: Avoid logging continuation uses where feasible
	-:4841: WARNING: space prohibited between function name and open parenthesis '('
	-:4875: WARNING: braces {} are not necessary for single statement blocks
	-:4880: WARNING: Prefer using '"%s...", __func__' to using 'zoran_irq', this function's name, in a string
	-:4892: WARNING: Block comments use a trailing */ on a separate line
	-:4903: WARNING: line length of 107 exceeds 100 columns
	-:4904: WARNING: line length of 103 exceeds 100 columns
	-:4904: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_FrameGrab>
	-:4907: WARNING: line length of 114 exceeds 100 columns
	-:4908: WARNING: line length of 117 exceeds 100 columns
	-:4909: WARNING: line length of 114 exceeds 100 columns
	-:4922: WARNING: line length of 101 exceeds 100 columns
	-:4953: WARNING: Block comments use a trailing */ on a separate line
	-:4959: WARNING: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
	-:4960: CHECK: Alignment should match open parenthesis
	-:4961: CHECK: Avoid CamelCase: <ZR36057_ICR_CodRepIRQ>
	-:4973: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:4983: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:5001: WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
	-:5004: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:5004: WARNING: Avoid logging continuation uses where feasible
	-:5007: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:5007: WARNING: Avoid logging continuation uses where feasible
	-:5019: CHECK: Unnecessary parentheses around 'zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS'
	-:5019: CHECK: Unnecessary parentheses around 'zr->JPEG_missed > zr->jpg_settings.field_per_buff'
	-:5048: WARNING: space prohibited between function name and open parenthesis '('
	-:5063: WARNING: space prohibited between function name and open parenthesis '('
	-:5069: WARNING: braces {} are not necessary for single statement blocks
	-:5076: CHECK: Alignment should match open parenthesis
	-:5098: WARNING: space prohibited between function name and open parenthesis '('
	-:5102: CHECK: Avoid CamelCase: <ZR36057_SPGPPCR_SoftReset>
	-:5119: WARNING: space prohibited between function name and open parenthesis '('
	-:5124: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_LittleEndian>
	-:5125: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_VCLKPol>
	-:5143: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:5172: CHECK: extern prototypes should be avoided in .h files
	-:5177: CHECK: extern prototypes should be avoided in .h files
	-:5178: CHECK: extern prototypes should be avoided in .h files
	-:5179: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:5180: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:5181: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:5182: CHECK: extern prototypes should be avoided in .h files
	-:5183: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:5184: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
	-:5186: CHECK: extern prototypes should be avoided in .h files
	-:5188: CHECK: extern prototypes should be avoided in .h files
	-:5190: CHECK: extern prototypes should be avoided in .h files
	-:5193: CHECK: extern prototypes should be avoided in .h files
	-:5195: CHECK: extern prototypes should be avoided in .h files
	-:5198: CHECK: extern prototypes should be avoided in .h files
	-:5200: CHECK: extern prototypes should be avoided in .h files
	-:5203: CHECK: extern prototypes should be avoided in .h files
	-:5204: CHECK: extern prototypes should be avoided in .h files
	-:5205: CHECK: extern prototypes should be avoided in .h files
	-:5208: CHECK: extern prototypes should be avoided in .h files
	-:5209: CHECK: extern prototypes should be avoided in .h files
	-:5211: CHECK: extern prototypes should be avoided in .h files
	-:5214: CHECK: extern prototypes should be avoided in .h files
	-:5216: CHECK: extern prototypes should be avoided in .h files
	-:5217: CHECK: extern prototypes should be avoided in .h files
	-:5228: CHECK: Macro argument 'zr' may be better as '(zr)' to avoid precedence issues
	-:5230: CHECK: Macro argument 'zr' may be better as '(zr)' to avoid precedence issues
	-:5240: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:5303: WARNING: Use #include <linux/io.h> instead of <asm/io.h>
	-:5312: CHECK: Please don't use multiple blank lines
	-:5321: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:5321: CHECK: space preferred before that '|' (ctx:VxE)
	-:5321: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_ErrDif>
	-:5330: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:5338: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:5338: CHECK: space preferred before that '|' (ctx:VxE)
	-:5347: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:5355: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:5355: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_Pack24>
	-:5363: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:5387: CHECK: spaces preferred around that '|' (ctx:VxV)
	-:5398: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:5402: WARNING: Block comments use a trailing */ on a separate line
	-:5404: WARNING: space prohibited between function name and open parenthesis '('
	-:5434: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:5440: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:5574: CHECK: Comparison to NULL could be written "!mem"
	-:5592: CHECK: Comparison to NULL could be written "!mem"
	-:5674: WARNING: space prohibited between function name and open parenthesis '('
	-:5776: WARNING: Prefer 'fallthrough;' over fallthrough comment
	-:5779: WARNING: Block comments use a trailing */ on a separate line
	-:5834: CHECK: Unnecessary parentheses around 'zr->v4l_buffers.buffer[frame].state != BUZ_STATE_PEND'
	-:5835: CHECK: Alignment should match open parenthesis
	-:5835: CHECK: spaces preferred around that '*' (ctx:VxV)
	-:5858: CHECK: multiple assignments should be avoided
	-:5936: WARNING: Prefer 'fallthrough;' over fallthrough comment
	-:5939: WARNING: Block comments use a trailing */ on a separate line
	-:5980: CHECK: multiple assignments should be avoided
	-:5984: WARNING: else is not generally useful after a break or return
	-:5993: ERROR: do not use assignment in if condition
	-:6030: CHECK: Alignment should match open parenthesis
	-:6032: CHECK: spaces preferred around that '*' (ctx:VxV)
	-:6047: CHECK: Blank lines aren't necessary before a close brace '}'
	-:6110: CHECK: multiple assignments should be avoided
	-:6125: CHECK: multiple assignments should be avoided
	-:6137: CHECK: multiple assignments should be avoided
	-:6169: CHECK: Prefer kzalloc(sizeof(*fh)...) over kzalloc(sizeof(struct zoran_fh)...)
	-:6181: WARNING: Block comments use a trailing */ on a separate line
	-:6236: WARNING: Block comments use a trailing */ on a separate line
	-:6284: CHECK: Alignment should match open parenthesis
	-:6297: WARNING: Block comments use * on subsequent lines
	-:6298: WARNING: Block comments use a trailing */ on a separate line
	-:6307: WARNING: Consider removing the code enclosed by this #if 0 and its #endif
	-:6314: WARNING: Block comments use a trailing */ on a separate line
	-:6345: CHECK: No space is necessary after a cast
	-:6358: CHECK: Please don't use multiple blank lines
	-:6372: CHECK: Please don't use multiple blank lines
	-:6464: CHECK: Comparison to NULL could be written "!vcp"
	-:6520: CHECK: multiple assignments should be avoided
	-:6523: WARNING: Block comments use a trailing */ on a separate line
	-:6542: CHECK: multiple assignments should be avoided
	-:6549: WARNING: Block comments use a trailing */ on a separate line
	-:6664: WARNING: space prohibited between function name and open parenthesis '('
	-:6693: WARNING: Block comments use a trailing */ on a separate line
	-:6711: WARNING: space prohibited between function name and open parenthesis '('
	-:6714: WARNING: braces {} are not necessary for single statement blocks
	-:6738: CHECK: Alignment should match open parenthesis
	-:6781: CHECK: Alignment should match open parenthesis
	-:6790: CHECK: Alignment should match open parenthesis
	-:6799: CHECK: Alignment should match open parenthesis
	-:6808: CHECK: Alignment should match open parenthesis
	-:6830: CHECK: Alignment should match open parenthesis
	-:6853: CHECK: Alignment should match open parenthesis
	-:6871: CHECK: Alignment should match open parenthesis
	-:6889: CHECK: Alignment should match open parenthesis
	-:6953: CHECK: Alignment should match open parenthesis
	-:6971: CHECK: Lines should not end with a '('
	-:6978: CHECK: Alignment should match open parenthesis
	-:6984: CHECK: Alignment should match open parenthesis
	-:6997: CHECK: Alignment should match open parenthesis
	-:7006: CHECK: Alignment should match open parenthesis
	-:7008: CHECK: No space is necessary after a cast
	-:7078: CHECK: Alignment should match open parenthesis
	-:7100: CHECK: Alignment should match open parenthesis
	-:7128: CHECK: Alignment should match open parenthesis
	-:7148: CHECK: Alignment should match open parenthesis
	-:7191: CHECK: Alignment should match open parenthesis
	-:7202: CHECK: Alignment should match open parenthesis
	-:7244: CHECK: Alignment should match open parenthesis
	-:7409: CHECK: multiple assignments should be avoided
	-:7428: CHECK: multiple assignments should be avoided
	-:7466: WARNING: braces {} are not necessary for single statement blocks
	-:7467: CHECK: Blank lines aren't necessary after an open brace '{'
	-:7475: CHECK: multiple assignments should be avoided
	-:7478: CHECK: multiple assignments should be avoided
	-:7496: CHECK: Alignment should match open parenthesis
	-:7511: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:7535: CHECK: Alignment should match open parenthesis
	-:7579: CHECK: Alignment should match open parenthesis
	-:7631: CHECK: multiple assignments should be avoided
	-:7636: CHECK: multiple assignments should be avoided
	-:7693: CHECK: Alignment should match open parenthesis
	-:7696: WARNING: Missing a blank line after declarations
	-:7715: CHECK: Alignment should match open parenthesis
	-:7745: WARNING: space prohibited between function name and open parenthesis '('
	-:7819: CHECK: Please don't use multiple blank lines
	-:7833: WARNING: space prohibited between function name and open parenthesis '('
	-:7836: WARNING: Missing a blank line after declarations
	-:7840: WARNING: space prohibited between function name and open parenthesis '('
	-:7858: WARNING: braces {} are not necessary for single statement blocks
	-:7873: CHECK: multiple assignments should be avoided
	-:7881: CHECK: multiple assignments should be avoided
	-:7893: WARNING: space prohibited between function name and open parenthesis '('
	-:7958: CHECK: Prefer kmalloc(sizeof(*map)...) over kmalloc(sizeof(struct zoran_mapping)...)
	-:7977: CHECK: Alignment should match open parenthesis
	-:7998: WARNING: Avoid multiple line dereference - prefer 'fh->buffers.buffer[i].jpg.frag_tab[2*j+1]'
	-:8004: WARNING: Avoid multiple line dereference - prefer 'fh->buffers.buffer[i].jpg.frag_tab[2*j]'
	-:8009: CHECK: Alignment should match open parenthesis
	-:8022: WARNING: Avoid multiple line dereference - prefer 'fh->buffers.buffer[i].jpg.frag_tab[2*j+1]'
	-:8029: CHECK: Blank lines aren't necessary before a close brace '}'
	-:8096: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:8137: WARNING: Use #include <linux/io.h> instead of <asm/io.h>
	-:8182: WARNING: space prohibited between function name and open parenthesis '('
	-:8188: CHECK: Comparison to NULL could be written "zr67[i].name"
	-:8190: CHECK: multiple assignments should be avoided
	-:8194: WARNING: simple_strtoul is obsolete, use kstrtoul instead
	-:8200: WARNING: Prefer using '"%s...", __func__' to using 'setparam', this function's name, in a string
	-:8215: WARNING: Prefer seq_puts to seq_printf
	-:8217: WARNING: unnecessary whitespace before a quoted newline
	-:8218: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:8218: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:8218: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:8225: WARNING: Missing a blank line after declarations
	-:8229: CHECK: Alignment should match open parenthesis
	-:8238: CHECK: multiple assignments should be avoided
	-:8247: WARNING: space prohibited between function name and open parenthesis '('
	-:8284: WARNING: space prohibited between function name and open parenthesis '('
	-:8291: CHECK: Comparison to NULL could be written "zr->zoran_proc"
	-:8306: WARNING: space prohibited between function name and open parenthesis '('
	-:8323: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:8351: CHECK: extern prototypes should be avoided in .h files
	-:8352: CHECK: extern prototypes should be avoided in .h files
	-:8361: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:8366: WARNING: CVS style keyword markers, these will _not_ be updated
	-:8394: WARNING: Use #include <linux/io.h> instead of <asm/io.h>
	-:8405: WARNING: Block comments use * on subsequent lines
	-:8405: WARNING: Block comments use a trailing */ on a separate line
	-:8416: CHECK: Macro argument 'num' may be better as '(num)' to avoid precedence issues
	-:8419: WARNING: printk() should include KERN_<LEVEL> facility level
	-:8423: WARNING: Block comments use * on subsequent lines
	-:8426: WARNING: Block comments use a trailing */ on a separate line
	-:8430: WARNING: space prohibited between function name and open parenthesis '('
	-:8439: WARNING: Avoid multiple line dereference - prefer 'ptr->codec->master_data->readreg'
	-:8452: WARNING: space prohibited between function name and open parenthesis '('
	-:8460: CHECK: braces {} should be used on all arms of this statement
	-:8462: CHECK: Unbalanced braces around else statement
	-:8471: WARNING: Block comments use a trailing */ on a separate line
	-:8473: WARNING: space prohibited between function name and open parenthesis '('
	-:8479: CHECK: Unnecessary parentheses around 'ptr->codec->master_data->writereg'
	-:8479: CHECK: Unnecessary parentheses around 'ptr->codec->master_data->readreg'
	-:8482: WARNING: line length of 103 exceeds 100 columns
	-:8483: CHECK: Unbalanced braces around else statement
	-:8495: WARNING: space prohibited between function name and open parenthesis '('
	-:8505: WARNING: line length of 103 exceeds 100 columns
	-:8506: CHECK: Unbalanced braces around else statement
	-:8514: WARNING: Block comments use * on subsequent lines
	-:8517: WARNING: Block comments use a trailing */ on a separate line
	-:8521: WARNING: space prohibited between function name and open parenthesis '('
	-:8528: WARNING: Block comments use * on subsequent lines
	-:8531: WARNING: Block comments use a trailing */ on a separate line
	-:8534: WARNING: space prohibited between function name and open parenthesis '('
	-:8538: WARNING: Missing a blank line after declarations
	-:8576: WARNING: Block comments use * on subsequent lines
	-:8579: WARNING: Block comments use a trailing */ on a separate line
	-:8581: WARNING: Consider removing the code enclosed by this #if 0 and its #endif
	-:8582: WARNING: space prohibited between function name and open parenthesis '('
	-:8587: ERROR: spaces required around that '=' (ctx:VxV)
	-:8590: ERROR: space required after that ',' (ctx:VxV)
	-:8591: ERROR: spaces required around that '<' (ctx:VxV)
	-:8591: WARNING: braces {} are not necessary for single statement blocks
	-:8600: WARNING: Block comments use * on subsequent lines
	-:8603: WARNING: Block comments use a trailing */ on a separate line
	-:8606: WARNING: space prohibited between function name and open parenthesis '('
	-:8639: WARNING: Block comments use * on subsequent lines
	-:8642: WARNING: Block comments use a trailing */ on a separate line
	-:8645: WARNING: Block comments use * on subsequent lines
	-:8645: WARNING: Block comments use a trailing */ on a separate line
	-:8647: WARNING: space prohibited between function name and open parenthesis '('
	-:8650: CHECK: No space is necessary after a cast
	-:8654: CHECK: Unnecessary parentheses around 'mode != CODEC_DO_EXPANSION'
	-:8654: CHECK: Unnecessary parentheses around 'mode != CODEC_DO_COMPRESSION'
	-:8665: WARNING: space prohibited between function name and open parenthesis '('
	-:8670: CHECK: No space is necessary after a cast
	-:8679: WARNING: Block comments use a trailing */ on a separate line
	-:8687: WARNING: Block comments use a trailing */ on a separate line
	-:8692: WARNING: Block comments use a trailing */ on a separate line
	-:8703: WARNING: space prohibited between function name and open parenthesis '('
	-:8708: CHECK: No space is necessary after a cast
	-:8709: CHECK: No space is necessary after a cast
	-:8751: WARNING: Block comments use * on subsequent lines
	-:8754: WARNING: Block comments use a trailing */ on a separate line
	-:8757: WARNING: space prohibited between function name and open parenthesis '('
	-:8777: WARNING: Block comments use * on subsequent lines
	-:8783: WARNING: Block comments use a trailing */ on a separate line
	-:8786: WARNING: space prohibited between function name and open parenthesis '('
	-:8800: CHECK: multiple assignments should be avoided
	-:8800: CHECK: Prefer kzalloc(sizeof(*ptr)...) over kzalloc(sizeof(struct zr36016)...)
	-:8801: WARNING: Comparisons should place the constant on the right side of the test
	-:8848: WARNING: Block comments use * on subsequent lines
	-:8849: WARNING: Block comments use a trailing */ on a separate line
	-:8852: WARNING: space prohibited between function name and open parenthesis '('
	-:8860: WARNING: space prohibited between function name and open parenthesis '('
	-:8883: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:8888: WARNING: CVS style keyword markers, these will _not_ be updated
	-:8996: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:9001: WARNING: CVS style keyword markers, these will _not_ be updated
	-:9029: WARNING: Use #include <linux/io.h> instead of <asm/io.h>
	-:9038: WARNING: Block comments use * on subsequent lines
	-:9038: WARNING: Block comments use a trailing */ on a separate line
	-:9049: CHECK: Macro argument 'num' may be better as '(num)' to avoid precedence issues
	-:9052: WARNING: printk() should include KERN_<LEVEL> facility level
	-:9056: WARNING: Block comments use * on subsequent lines
	-:9059: WARNING: Block comments use a trailing */ on a separate line
	-:9063: WARNING: space prohibited between function name and open parenthesis '('
	-:9084: WARNING: space prohibited between function name and open parenthesis '('
	-:9102: WARNING: Block comments use * on subsequent lines
	-:9105: WARNING: Block comments use a trailing */ on a separate line
	-:9109: WARNING: space prohibited between function name and open parenthesis '('
	-:9118: WARNING: Block comments use * on subsequent lines
	-:9121: WARNING: Block comments use a trailing */ on a separate line
	-:9125: WARNING: space prohibited between function name and open parenthesis '('
	-:9136: WARNING: Block comments use * on subsequent lines
	-:9139: WARNING: Block comments use a trailing */ on a separate line
	-:9142: WARNING: space prohibited between function name and open parenthesis '('
	-:9158: WARNING: Block comments use * on subsequent lines
	-:9161: WARNING: Block comments use a trailing */ on a separate line
	-:9164: WARNING: space prohibited between function name and open parenthesis '('
	-:9200: WARNING: Block comments use * on subsequent lines
	-:9203: WARNING: Block comments use a trailing */ on a separate line
	-:9206: WARNING: space prohibited between function name and open parenthesis '('
	-:9215: WARNING: braces {} are not necessary for single statement blocks
	-:9223: WARNING: Block comments use * on subsequent lines
	-:9231: WARNING: Block comments use a trailing */ on a separate line
	-:9325: WARNING: Block comments use * on subsequent lines
	-:9329: WARNING: Block comments use a trailing */ on a separate line
	-:9334: WARNING: Block comments use * on subsequent lines
	-:9334: WARNING: Block comments use a trailing */ on a separate line
	-:9337: WARNING: space prohibited between function name and open parenthesis '('
	-:9356: WARNING: line length of 114 exceeds 100 columns
	-:9366: WARNING: Block comments use * on subsequent lines
	-:9366: WARNING: Block comments use a trailing */ on a separate line
	-:9369: WARNING: space prohibited between function name and open parenthesis '('
	-:9397: WARNING: space prohibited between function name and open parenthesis '('
	-:9412: WARNING: Block comments use * on subsequent lines
	-:9418: WARNING: Block comments use a trailing */ on a separate line
	-:9420: WARNING: space prohibited between function name and open parenthesis '('
	-:9455: WARNING: Block comments use a trailing */ on a separate line
	-:9568: WARNING: Block comments use * on subsequent lines
	-:9571: WARNING: Block comments use a trailing */ on a separate line
	-:9574: WARNING: Block comments use * on subsequent lines
	-:9574: WARNING: Block comments use a trailing */ on a separate line
	-:9576: WARNING: space prohibited between function name and open parenthesis '('
	-:9579: CHECK: No space is necessary after a cast
	-:9583: CHECK: Unnecessary parentheses around 'mode != CODEC_DO_EXPANSION'
	-:9583: CHECK: Unnecessary parentheses around 'mode != CODEC_DO_COMPRESSION'
	-:9594: WARNING: space prohibited between function name and open parenthesis '('
	-:9599: CHECK: No space is necessary after a cast
	-:9608: WARNING: Block comments use a trailing */ on a separate line
	-:9628: WARNING: Block comments use a trailing */ on a separate line
	-:9636: WARNING: space prohibited between function name and open parenthesis '('
	-:9641: CHECK: No space is necessary after a cast
	-:9642: CHECK: No space is necessary after a cast
	-:9689: WARNING: Block comments use a trailing */ on a separate line
	-:9753: WARNING: Block comments use * on subsequent lines
	-:9756: WARNING: Block comments use a trailing */ on a separate line
	-:9759: WARNING: space prohibited between function name and open parenthesis '('
	-:9779: WARNING: Block comments use * on subsequent lines
	-:9785: WARNING: Block comments use a trailing */ on a separate line
	-:9788: WARNING: space prohibited between function name and open parenthesis '('
	-:9802: CHECK: multiple assignments should be avoided
	-:9802: CHECK: Prefer kzalloc(sizeof(*ptr)...) over kzalloc(sizeof(struct zr36050)...)
	-:9803: WARNING: Comparisons should place the constant on the right side of the test
	-:9824: WARNING: Block comments use a trailing */ on a separate line
	-:9863: WARNING: Block comments use * on subsequent lines
	-:9864: WARNING: Block comments use a trailing */ on a separate line
	-:9867: WARNING: space prohibited between function name and open parenthesis '('
	-:9875: WARNING: space prohibited between function name and open parenthesis '('
	-:9898: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:9903: WARNING: CVS style keyword markers, these will _not_ be updated
	-:9985: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:9986: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:9987: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:9988: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:10045: CHECK: Please don't use multiple blank lines
	-:10083: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:10102: CHECK: Please don't use multiple blank lines
	-:10106: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10106: CHECK: Prefer using the BIT macro
	-:10112: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10112: CHECK: Prefer using the BIT macro
	-:10118: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10118: CHECK: Prefer using the BIT macro
	-:10119: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10119: CHECK: Prefer using the BIT macro
	-:10120: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10120: CHECK: Prefer using the BIT macro
	-:10125: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10126: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10126: CHECK: Prefer using the BIT macro
	-:10127: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10128: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10129: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10129: CHECK: Prefer using the BIT macro
	-:10130: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10130: CHECK: Prefer using the BIT macro
	-:10131: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10131: CHECK: Prefer using the BIT macro
	-:10139: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10139: CHECK: Prefer using the BIT macro
	-:10140: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10140: CHECK: Prefer using the BIT macro
	-:10141: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10141: CHECK: Prefer using the BIT macro
	-:10144: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10144: CHECK: Prefer using the BIT macro
	-:10146: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10146: CHECK: Prefer using the BIT macro
	-:10155: CHECK: Prefer using the BIT macro
	-:10159: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10159: CHECK: Prefer using the BIT macro
	-:10166: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CodTime>
	-:10166: CHECK: Prefer using the BIT macro
	-:10167: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CEmpty>
	-:10167: CHECK: Prefer using the BIT macro
	-:10168: CHECK: Prefer using the BIT macro
	-:10169: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CodGuestID>
	-:10170: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CodGuestReg>
	-:10175: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10175: CHECK: Prefer using the BIT macro
	-:10176: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10176: CHECK: Prefer using the BIT macro
	-:10177: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10177: CHECK: Prefer using the BIT macro
	-:10178: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10178: CHECK: Prefer using the BIT macro
	-:10181: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10181: CHECK: Prefer using the BIT macro
	-:10182: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10182: CHECK: Prefer using the BIT macro
	-:10183: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10183: CHECK: Prefer using the BIT macro
	-:10184: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10184: CHECK: Prefer using the BIT macro
	-:10185: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10185: CHECK: Prefer using the BIT macro
	-:10188: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10188: CHECK: Prefer using the BIT macro
	-:10189: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10189: CHECK: Prefer using the BIT macro
	-:10192: CHECK: Prefer using the BIT macro
	-:10194: CHECK: Prefer using the BIT macro
	-:10197: CHECK: Prefer using the BIT macro
	-:10198: CHECK: Prefer using the BIT macro
	-:10199: CHECK: Prefer using the BIT macro
	-:10200: CHECK: Prefer using the BIT macro
	-:10201: CHECK: Prefer using the BIT macro
	-:10202: CHECK: Prefer using the BIT macro
	-:10203: CHECK: Avoid CamelCase: <ZR36057_JMC_Stll_LitEndian>
	-:10203: CHECK: Prefer using the BIT macro
	-:10206: CHECK: Prefer using the BIT macro
	-:10207: CHECK: Prefer using the BIT macro
	-:10208: CHECK: Prefer using the BIT macro
	-:10227: CHECK: Prefer using the BIT macro
	-:10240: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10240: CHECK: Prefer using the BIT macro
	-:10241: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10241: CHECK: Prefer using the BIT macro
	-:10242: CHECK: spaces preferred around that '<<' (ctx:VxV)
	-:10242: CHECK: Prefer using the BIT macro
	-:10253: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:10258: WARNING: CVS style keyword markers, these will _not_ be updated
	-:10286: WARNING: Use #include <linux/io.h> instead of <asm/io.h>
	-:10295: WARNING: Block comments use * on subsequent lines
	-:10295: WARNING: Block comments use a trailing */ on a separate line
	-:10310: CHECK: Macro argument 'num' may be better as '(num)' to avoid precedence issues
	-:10313: WARNING: printk() should include KERN_<LEVEL> facility level
	-:10317: WARNING: Block comments use * on subsequent lines
	-:10320: WARNING: Block comments use a trailing */ on a separate line
	-:10324: WARNING: space prohibited between function name and open parenthesis '('
	-:10362: WARNING: Block comments use * on subsequent lines
	-:10365: WARNING: Block comments use a trailing */ on a separate line
	-:10369: WARNING: space prohibited between function name and open parenthesis '('
	-:10378: WARNING: Block comments use * on subsequent lines
	-:10381: WARNING: Block comments use a trailing */ on a separate line
	-:10385: WARNING: space prohibited between function name and open parenthesis '('
	-:10396: WARNING: Block comments use * on subsequent lines
	-:10399: WARNING: Block comments use a trailing */ on a separate line
	-:10402: WARNING: space prohibited between function name and open parenthesis '('
	-:10406: CHECK: Avoid CamelCase: <ZR060_CFSR_Busy>
	-:10418: WARNING: Block comments use * on subsequent lines
	-:10421: WARNING: Block comments use a trailing */ on a separate line
	-:10424: WARNING: space prohibited between function name and open parenthesis '('
	-:10448: WARNING: Block comments use * on subsequent lines
	-:10451: WARNING: Block comments use a trailing */ on a separate line
	-:10454: WARNING: space prohibited between function name and open parenthesis '('
	-:10463: WARNING: braces {} are not necessary for single statement blocks
	-:10471: WARNING: Block comments use * on subsequent lines
	-:10479: WARNING: Block comments use a trailing */ on a separate line
	-:10573: WARNING: Block comments use * on subsequent lines
	-:10577: WARNING: Block comments use a trailing */ on a separate line
	-:10582: WARNING: Block comments use * on subsequent lines
	-:10582: WARNING: Block comments use a trailing */ on a separate line
	-:10585: WARNING: space prohibited between function name and open parenthesis '('
	-:10615: WARNING: Block comments use * on subsequent lines
	-:10615: WARNING: Block comments use a trailing */ on a separate line
	-:10618: WARNING: space prohibited between function name and open parenthesis '('
	-:10647: WARNING: space prohibited between function name and open parenthesis '('
	-:10662: WARNING: Block comments use * on subsequent lines
	-:10668: WARNING: Block comments use a trailing */ on a separate line
	-:10670: WARNING: space prohibited between function name and open parenthesis '('
	-:10678: CHECK: Avoid CamelCase: <ZR060_LOAD_SyncRst>
	-:10681: CHECK: Avoid CamelCase: <ZR060_CIR_CodeMstr>
	-:10686: CHECK: Avoid CamelCase: <ZR060_CMR_Comp>
	-:10686: CHECK: Avoid CamelCase: <ZR060_CMR_Pass2>
	-:10711: WARNING: Block comments use a trailing */ on a separate line
	-:10762: CHECK: Avoid CamelCase: <ZR060_MER_Com>
	-:10763: CHECK: Avoid CamelCase: <ZR060_MER_App>
	-:10767: CHECK: Avoid CamelCase: <ZR060_VCR_Range>
	-:10792: WARNING: Block comments use a trailing */ on a separate line
	-:10804: CHECK: Avoid CamelCase: <ZR060_LOAD_Load>
	-:10816: WARNING: Block comments use * on subsequent lines
	-:10819: WARNING: Block comments use a trailing */ on a separate line
	-:10822: WARNING: Block comments use * on subsequent lines
	-:10822: WARNING: Block comments use a trailing */ on a separate line
	-:10824: WARNING: space prohibited between function name and open parenthesis '('
	-:10827: CHECK: No space is necessary after a cast
	-:10831: CHECK: Unnecessary parentheses around 'mode != CODEC_DO_EXPANSION'
	-:10831: CHECK: Unnecessary parentheses around 'mode != CODEC_DO_COMPRESSION'
	-:10842: WARNING: space prohibited between function name and open parenthesis '('
	-:10847: CHECK: No space is necessary after a cast
	-:10856: WARNING: Block comments use a trailing */ on a separate line
	-:10866: WARNING: Block comments should align the * on each line
	-:10867: CHECK: Avoid CamelCase: <ZR060_VPR_VSPol>
	-:10868: CHECK: Avoid CamelCase: <ZR060_VPR_HSPol>
	-:10869: CHECK: Avoid CamelCase: <ZR060_VPR_FIPol>
	-:10870: CHECK: Avoid CamelCase: <ZR060_VPR_BLPol>
	-:10871: CHECK: Avoid CamelCase: <ZR060_VPR_SImgPol>
	-:10872: CHECK: Avoid CamelCase: <ZR060_VPR_PoePol>
	-:10873: CHECK: Avoid CamelCase: <ZR060_VPR_PValPol>
	-:10874: CHECK: Avoid CamelCase: <ZR060_VPR_VCLKPol>
	-:10884: CHECK: Avoid CamelCase: <ZR060_SR_HScale2>
	-:10888: CHECK: Avoid CamelCase: <ZR060_SR_HScale4>
	-:10898: CHECK: Avoid CamelCase: <ZR060_SR_VScale>
	-:10922: WARNING: Block comments use * on subsequent lines
	-:10980: WARNING: Block comments use a trailing */ on a separate line
	-:10993: WARNING: Block comments use a trailing */ on a separate line
	-:11002: WARNING: space prohibited between function name and open parenthesis '('
	-:11007: CHECK: No space is necessary after a cast
	-:11008: CHECK: No space is necessary after a cast
	-:11117: WARNING: Block comments use * on subsequent lines
	-:11120: WARNING: Block comments use a trailing */ on a separate line
	-:11123: WARNING: space prohibited between function name and open parenthesis '('
	-:11143: WARNING: Block comments use * on subsequent lines
	-:11149: WARNING: Block comments use a trailing */ on a separate line
	-:11152: WARNING: space prohibited between function name and open parenthesis '('
	-:11166: CHECK: multiple assignments should be avoided
	-:11166: CHECK: Prefer kzalloc(sizeof(*ptr)...) over kzalloc(sizeof(struct zr36060)...)
	-:11167: WARNING: Comparisons should place the constant on the right side of the test
	-:11188: WARNING: Block comments use a trailing */ on a separate line
	-:11228: WARNING: Block comments use * on subsequent lines
	-:11229: WARNING: Block comments use a trailing */ on a separate line
	-:11232: WARNING: space prohibited between function name and open parenthesis '('
	-:11240: WARNING: space prohibited between function name and open parenthesis '('
	-:11265: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
	-:11270: WARNING: CVS style keyword markers, these will _not_ be updated
	-:11353: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:11354: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:11355: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:11356: WARNING: 'TRUN' may be misspelled - perhaps 'TURN'?
	-:11406: CHECK: Prefer using the BIT macro
	-:11407: CHECK: Prefer using the BIT macro
	-:11411: CHECK: Prefer using the BIT macro
	-:11412: CHECK: Avoid CamelCase: <ZR060_CFSR_CBusy>
	-:11412: CHECK: Prefer using the BIT macro
	-:11417: CHECK: Avoid CamelCase: <ZR060_CIR_Code16>
	-:11417: CHECK: Prefer using the BIT macro
	-:11418: CHECK: Avoid CamelCase: <ZR060_CIR_Endian>
	-:11418: CHECK: Prefer using the BIT macro
	-:11419: CHECK: Prefer using the BIT macro
	-:11420: CHECK: Prefer using the BIT macro
	-:11424: CHECK: Prefer using the BIT macro
	-:11425: CHECK: Prefer using the BIT macro
	-:11426: CHECK: Prefer using the BIT macro
	-:11427: CHECK: Prefer using the BIT macro
	-:11428: CHECK: Prefer using the BIT macro
	-:11429: CHECK: Prefer using the BIT macro
	-:11433: CHECK: Prefer using the BIT macro
	-:11434: CHECK: Prefer using the BIT macro
	-:11435: CHECK: Prefer using the BIT macro
	-:11436: CHECK: Prefer using the BIT macro
	-:11437: CHECK: Prefer using the BIT macro
	-:11441: CHECK: Prefer using the BIT macro
	-:11442: CHECK: Prefer using the BIT macro
	-:11443: CHECK: Avoid CamelCase: <ZR060_IMR_End>
	-:11443: CHECK: Prefer using the BIT macro
	-:11444: CHECK: Avoid CamelCase: <ZR060_IMR_DataErr>
	-:11444: CHECK: Prefer using the BIT macro
	-:11448: CHECK: Avoid CamelCase: <ZR060_ISR_ProCnt>
	-:11449: CHECK: Prefer using the BIT macro
	-:11450: CHECK: Prefer using the BIT macro
	-:11451: CHECK: Avoid CamelCase: <ZR060_ISR_End>
	-:11451: CHECK: Prefer using the BIT macro
	-:11452: CHECK: Avoid CamelCase: <ZR060_ISR_DataErr>
	-:11452: CHECK: Prefer using the BIT macro
	-:11456: CHECK: Avoid CamelCase: <ZR060_VCR_Video8>
	-:11456: CHECK: Prefer using the BIT macro
	-:11457: CHECK: Prefer using the BIT macro
	-:11458: CHECK: Avoid CamelCase: <ZR060_VCR_FIDet>
	-:11458: CHECK: Prefer using the BIT macro
	-:11459: CHECK: Avoid CamelCase: <ZR060_VCR_FIVedge>
	-:11459: CHECK: Prefer using the BIT macro
	-:11460: CHECK: Avoid CamelCase: <ZR060_VCR_FIExt>
	-:11460: CHECK: Prefer using the BIT macro
	-:11461: CHECK: Avoid CamelCase: <ZR060_VCR_SyncMstr>
	-:11461: CHECK: Prefer using the BIT macro
	-:11465: CHECK: Prefer using the BIT macro
	-:11466: CHECK: Prefer using the BIT macro
	-:11467: CHECK: Prefer using the BIT macro
	-:11468: CHECK: Prefer using the BIT macro
	-:11469: CHECK: Prefer using the BIT macro
	-:11470: CHECK: Prefer using the BIT macro
	-:11471: CHECK: Prefer using the BIT macro
	-:11472: CHECK: Prefer using the BIT macro
	-:11476: CHECK: Prefer using the BIT macro
	-:11477: CHECK: Prefer using the BIT macro

patches/0006-staging-media-zoran-fix-checkpatch-issue.patch:

   checkpatch.pl:
	$ cat patches/0006-staging-media-zoran-fix-checkpatch-issue.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:4: WARNING: A patch subject line should describe the change not the tool that found it
	-:556: CHECK: Macro argument reuse 'adr' - possible side-effects?
	-:557: CHECK: Macro argument reuse 'adr' - possible side-effects?
	-:558: CHECK: Macro argument reuse 'adr' - possible side-effects?
	-:604: WARNING: Possible repeated word: 'in'
	-:1406: CHECK: Avoid CamelCase: <ZR36057_ISR_JPEGRepIRQ>
	-:1655: CHECK: Avoid CamelCase: <HEnd>
	-:1655: CHECK: Avoid CamelCase: <VStart>
	-:1655: CHECK: Avoid CamelCase: <VEnd>
	-:1657: CHECK: Avoid CamelCase: <VidWinHt>
	-:1659: CHECK: Avoid CamelCase: <We>
	-:1659: CHECK: Avoid CamelCase: <Ha>
	-:1659: CHECK: Avoid CamelCase: <He>
	-:1660: CHECK: Avoid CamelCase: <HorDcm>
	-:1660: CHECK: Avoid CamelCase: <VerDcm>
	-:1894: CHECK: Avoid CamelCase: <intr_counter_CodRepIRQ>
	-:1900: CHECK: Avoid CamelCase: <intr_counter_JPEGRepIRQ>
	-:1955: CHECK: Avoid CamelCase: <ZR36057_ICR_JPEGRepIRQ>
	-:1955: CHECK: Avoid CamelCase: <ZR36057_ICR_IntPinEn>
	-:2066: CHECK: Alignment should match open parenthesis
	-:2132: CHECK: Avoid CamelCase: <ZR36057_VDCR_VidEn>
	-:2149: WARNING: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
	-:2195: WARNING: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
	-:2195: WARNING: Avoid logging continuation uses where feasible
	-:2287: CHECK: extern prototypes should be avoided in .h files
	-:2298: WARNING: line length of 105 exceeds 100 columns
	-:2298: CHECK: extern prototypes should be avoided in .h files
	-:2299: CHECK: extern prototypes should be avoided in .h files
	-:2305: CHECK: extern prototypes should be avoided in .h files
	-:2316: CHECK: extern prototypes should be avoided in .h files
	-:2317: CHECK: extern prototypes should be avoided in .h files
	-:2318: CHECK: extern prototypes should be avoided in .h files
	-:2328: CHECK: extern prototypes should be avoided in .h files
	-:2381: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_ErrDif>
	-:2417: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_Pack24>
	-:2426: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_LittleEndian>
	-:2521: WARNING: Prefer 'fallthrough;' over fallthrough comment
	-:2547: WARNING: Prefer 'fallthrough;' over fallthrough comment
	-:2880: CHECK: Alignment should match open parenthesis
	-:3387: CHECK: Unnecessary parentheses around 'ptr->codec->master_data->writereg'
	-:3387: CHECK: Unnecessary parentheses around 'ptr->codec->master_data->readreg'
	-:3470: WARNING: braces {} are not necessary for single statement blocks
	-:3508: CHECK: Alignment should match open parenthesis
	-:3877: CHECK: Alignment should match open parenthesis
	-:3889: WARNING: Block comments use a trailing */ on a separate line
	-:4040: CHECK: Avoid CamelCase: <ZR36057_VFEHCR_HSPol>
	-:4047: CHECK: Avoid CamelCase: <ZR36057_VFEVCR_VSPol>
	-:4056: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_ExtFl>
	-:4057: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_TopField>
	-:4058: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_VCLKPol>
	-:4069: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_VidOvf>
	-:4070: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_SnapShot>
	-:4071: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_FrameGrab>
	-:4078: CHECK: Avoid CamelCase: <ZR36057_VDCR_Triton>
	-:4087: CHECK: Avoid CamelCase: <ZR36057_OCR_OvlEnable>
	-:4092: CHECK: Avoid CamelCase: <ZR36057_SPGPPCR_SoftReset>
	-:4102: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CodTime>
	-:4103: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CEmpty>
	-:4104: CHECK: Avoid CamelCase: <ZR36057_MCTCR_CFlush>
	-:4117: CHECK: Avoid CamelCase: <ZR36057_ISR_CodRepIRQ>
	-:4128: CHECK: Avoid CamelCase: <ZR36057_ICR_CodRepIRQ>
	-:4143: CHECK: Avoid CamelCase: <ZR36057_JMC_JPGCmpMode>
	-:4154: CHECK: Avoid CamelCase: <ZR36057_JMC_Go_en>
	-:4155: CHECK: Avoid CamelCase: <ZR36057_JMC_SyncMstr>
	-:4156: CHECK: Avoid CamelCase: <ZR36057_JMC_Fld_per_buff>
	-:4159: CHECK: Avoid CamelCase: <ZR36057_JMC_Stll_LitEndian>
	-:4165: CHECK: Avoid CamelCase: <ZR36057_JPC_P_Reset>
	-:4166: CHECK: Avoid CamelCase: <ZR36057_JPC_CodTrnsEn>
	-:4167: CHECK: Avoid CamelCase: <ZR36057_JPC_Active>
	-:4176: CHECK: Avoid CamelCase: <ZR36057_FPP_Odd_Even>
	-:4187: CHECK: Avoid CamelCase: <ZR36057_POR_POPen>
	-:4188: CHECK: Avoid CamelCase: <ZR36057_POR_POTime>
	-:4189: CHECK: Avoid CamelCase: <ZR36057_POR_PODir>
	-:4429: WARNING: line length of 102 exceeds 100 columns
	-:4492: CHECK: Avoid CamelCase: <ZR060_CMR_Comp>
	-:4492: CHECK: Avoid CamelCase: <ZR060_CMR_Pass2>
	-:4547: CHECK: Avoid CamelCase: <ZR060_LOAD_SyncRst>
	-:4547: CHECK: Avoid CamelCase: <ZR060_LOAD_Load>
	-:4728: CHECK: multiple assignments should be avoided
	-:4847: CHECK: Avoid CamelCase: <ZR060_CFSR_Busy>
	-:4848: CHECK: Avoid CamelCase: <ZR060_CFSR_CBusy>
	-:4857: CHECK: Avoid CamelCase: <ZR060_CIR_Code16>
	-:4858: CHECK: Avoid CamelCase: <ZR060_CIR_Endian>
	-:4860: CHECK: Avoid CamelCase: <ZR060_CIR_CodeMstr>
	-:4884: CHECK: Avoid CamelCase: <ZR060_MER_App>
	-:4885: CHECK: Avoid CamelCase: <ZR060_MER_Com>
	-:4898: CHECK: Avoid CamelCase: <ZR060_IMR_End>
	-:4899: CHECK: Avoid CamelCase: <ZR060_IMR_DataErr>
	-:4910: CHECK: Avoid CamelCase: <ZR060_ISR_End>
	-:4911: CHECK: Avoid CamelCase: <ZR060_ISR_DataErr>
	-:4921: CHECK: Avoid CamelCase: <ZR060_VCR_Video8>
	-:4922: CHECK: Avoid CamelCase: <ZR060_VCR_Range>
	-:4923: CHECK: Avoid CamelCase: <ZR060_VCR_FIDet>
	-:4924: CHECK: Avoid CamelCase: <ZR060_VCR_FIVedge>
	-:4925: CHECK: Avoid CamelCase: <ZR060_VCR_FIExt>
	-:4926: CHECK: Avoid CamelCase: <ZR060_VCR_SyncMstr>
	-:4938: CHECK: Avoid CamelCase: <ZR060_VPR_VCLKPol>
	-:4939: CHECK: Avoid CamelCase: <ZR060_VPR_PValPol>
	-:4940: CHECK: Avoid CamelCase: <ZR060_VPR_PoePol>
	-:4941: CHECK: Avoid CamelCase: <ZR060_VPR_SImgPol>
	-:4942: CHECK: Avoid CamelCase: <ZR060_VPR_BLPol>
	-:4943: CHECK: Avoid CamelCase: <ZR060_VPR_FIPol>
	-:4944: CHECK: Avoid CamelCase: <ZR060_VPR_HSPol>
	-:4945: CHECK: Avoid CamelCase: <ZR060_VPR_VSPol>
	-:4951: CHECK: Avoid CamelCase: <ZR060_SR_VScale>
	-:4952: CHECK: Avoid CamelCase: <ZR060_SR_HScale2>

patches/0007-staging-media-zoran-do-not-forward-declare-zr36057_i.patch:

   checkpatch.pl:
	$ cat patches/0007-staging-media-zoran-do-not-forward-declare-zr36057_i.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_LittleEndian>
	-:32: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_VCLKPol>
	-:33: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_ExtFl>
	-:34: CHECK: Avoid CamelCase: <ZR36057_VFESPFR_TopField>
	-:39: CHECK: Avoid CamelCase: <ZR36057_VDCR_Triton>

patches/0008-staging-media-zoran-convert-all-error-dprintk-to-pci.patch:

   checkpatch.pl:
	$ cat patches/0008-staging-media-zoran-convert-all-error-dprintk-to-pci.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:307: WARNING: line length of 101 exceeds 100 columns
	-:390: WARNING: Prefer using '"%s...", __func__' to using 'zr36057_overlay', this function's name, in a string
	-:402: WARNING: Prefer using '"%s...", __func__' to using 'zr36057_overlay', this function's name, in a string
	-:466: WARNING: line length of 116 exceeds 100 columns
	-:478: WARNING: line length of 105 exceeds 100 columns
	-:490: WARNING: line length of 121 exceeds 100 columns
	-:560: WARNING: line length of 102 exceeds 100 columns
	-:591: WARNING: line length of 107 exceeds 100 columns
	-:648: WARNING: line length of 102 exceeds 100 columns
	-:672: WARNING: line length of 106 exceeds 100 columns
	-:820: WARNING: line length of 106 exceeds 100 columns
	-:843: WARNING: line length of 103 exceeds 100 columns
	-:884: WARNING: line length of 103 exceeds 100 columns
	-:896: WARNING: line length of 103 exceeds 100 columns
	-:909: CHECK: Alignment should match open parenthesis
	-:993: WARNING: line length of 101 exceeds 100 columns
	-:1154: WARNING: line length of 107 exceeds 100 columns
	-:1175: WARNING: line length of 112 exceeds 100 columns
	-:1200: WARNING: line length of 122 exceeds 100 columns
	-:1212: WARNING: line length of 101 exceeds 100 columns
	-:1224: WARNING: line length of 109 exceeds 100 columns

patches/0009-staging-media-zoran-convert-dprintk-warn.patch:

   checkpatch.pl:
	$ cat patches/0009-staging-media-zoran-convert-dprintk-warn.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: WARNING: line length of 123 exceeds 100 columns
	-:69: WARNING: Prefer using '"%s...", __func__' to using 'zr36057_set_memgrab', this function's name, in a string
	-:131: WARNING: line length of 106 exceeds 100 columns
	-:143: WARNING: line length of 106 exceeds 100 columns

patches/0010-staging-media-zoran-convert-dprintk-info-to-pci_info.patch:

   checkpatch.pl:
	$ cat patches/0010-staging-media-zoran-convert-dprintk-info-to-pci_info.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:76: WARNING: line length of 101 exceeds 100 columns
	-:118: WARNING: line length of 102 exceeds 100 columns
	-:144: WARNING: line length of 101 exceeds 100 columns
	-:151: WARNING: line length of 102 exceeds 100 columns

patches/0011-staging-media-zoran-convert-dprintk-debug.patch:

   checkpatch.pl:
	$ cat patches/0011-staging-media-zoran-convert-dprintk-debug.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:63: CHECK: Avoid CamelCase: <HorDcm>
	-:82: WARNING: line length of 104 exceeds 100 columns
	-:94: WARNING: line length of 105 exceeds 100 columns
	-:124: WARNING: Prefer using '"%s...", __func__' to using 'jpeg_start', this function's name, in a string
	-:160: WARNING: line length of 101 exceeds 100 columns

patches/0012-staging-media-zoran-zoran_device.c-convert-pr_x-to-p.patch:

   checkpatch.pl:
	$ cat patches/0012-staging-media-zoran-zoran_device.c-convert-pr_x-to-p.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: WARNING: Missing commit description - Add an appropriate one
	-:49: WARNING: line length of 103 exceeds 100 columns

patches/0013-staging-media-zoran-remove-proc_fs.patch:

   checkpatch.pl:
	$ cat patches/0013-staging-media-zoran-remove-proc_fs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:121: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0019-staging-media-zoran-move-jpg_settings-out-of-zoran_f.patch:

   checkpatch.pl:
	$ cat patches/0019-staging-media-zoran-move-jpg_settings-out-of-zoran_f.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:59: CHECK: Avoid CamelCase: <TmpDcm>
	-:79: CHECK: Avoid CamelCase: <HorDcm>
	-:81: CHECK: Avoid CamelCase: <VerDcm>

patches/0020-staging-media-zoran-move-overlay_settings-out-of-zor.patch:

   checkpatch.pl:
	$ cat patches/0020-staging-media-zoran-move-overlay_settings-out-of-zor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0023-staging-media-zoran-remove-overlay.patch:

   checkpatch.pl:
	$ cat patches/0023-staging-media-zoran-remove-overlay.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:245: CHECK: Avoid CamelCase: <ZR36057_VDCR_VidEn>
	-:246: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_SnapShot>

patches/0024-staging-media-zoran-Use-DMA-coherent-for-stat_com.patch:

   checkpatch.pl:
	$ cat patches/0024-staging-media-zoran-Use-DMA-coherent-for-stat_com.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:71: WARNING: line length of 101 exceeds 100 columns
	-:83: WARNING: line length of 101 exceeds 100 columns

patches/0029-staging-media-zoran-convert-mdelay-to-udelay.patch:

   checkpatch.pl:
	$ cat patches/0029-staging-media-zoran-convert-mdelay-to-udelay.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
	-:26: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst

patches/0032-staging-media-zoran-use-devm_ioremap.patch:

   checkpatch.pl:
	$ cat patches/0032-staging-media-zoran-use-devm_ioremap.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: line length of 107 exceeds 100 columns

patches/0033-staging-media-zoran-add-stat_com-buffer.patch:

   checkpatch.pl:
	$ cat patches/0033-staging-media-zoran-add-stat_com-buffer.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:62: WARNING: line length of 107 exceeds 100 columns
	-:70: WARNING: line length of 107 exceeds 100 columns

patches/0037-staging-media-zoran-Add-vb_queue.patch:

   checkpatch.pl:
	$ cat patches/0037-staging-media-zoran-Add-vb_queue.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:231: CHECK: Avoid CamelCase: <ZR36057_ICR_IntPinEn>
	-:264: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_DispStride>
	-:265: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_VidOvf>
	-:266: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_SnapShot>
	-:267: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_FrameGrab>
	-:270: CHECK: Avoid CamelCase: <ZR36057_VDCR_VidEn>

patches/0038-staging-media-zoran-disable-output.patch:

   checkpatch.pl:
	$ cat patches/0038-staging-media-zoran-disable-output.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:63: WARNING: Block comments use a trailing */ on a separate line

patches/0047-staging-media-zoran-convert-to-vb2.patch:

   checkpatch.pl:
	$ cat patches/0047-staging-media-zoran-convert-to-vb2.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:316: WARNING: externs should be avoided in .c files
	-:565: CHECK: Avoid CamelCase: <TmpDcm>
	-:865: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_SnapShot>
	-:867: CHECK: Avoid CamelCase: <ZR36057_VSSFGR_FrameGrab>
	-:889: CHECK: Avoid CamelCase: <ZR36057_ISR_JPEGRepIRQ>

patches/0049-zoran-fix-smatch-warning.patch:

   checkpatch.pl:
	$ cat patches/0049-zoran-fix-smatch-warning.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:4: WARNING: A patch subject line should describe the change not the tool that found it

patches/0050-zoran-fix-sparse-warnings.patch:

   checkpatch.pl:
	$ cat patches/0050-zoran-fix-sparse-warnings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:4: WARNING: A patch subject line should describe the change not the tool that found it
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:39: WARNING: Consider removing the code enclosed by this #if 0 and its #endif
	-:64: WARNING: Consider removing the code enclosed by this #if 0 and its #endif


Error #512 when building PDF docs

