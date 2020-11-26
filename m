Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AE52C570A
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 15:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390457AbgKZOX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 09:23:59 -0500
Received: from www.linuxtv.org ([130.149.80.248]:40460 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390263AbgKZOX6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 09:23:58 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kiIBf-00BLLj-5Z; Thu, 26 Nov 2020 14:23:55 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kiIEl-0007Ym-Qp; Thu, 26 Nov 2020 14:27:07 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] De-stage H.264 and FWHT stateless codec APIs (#69390)
Date:   Thu, 26 Nov 2020 14:27:07 +0000
Message-Id: <20201126142707.29015-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/78715/
Build time: 00:34:42
Link: https://lore.kernel.org/linux-media/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl

gpg: Signature made Thu 26 Nov 2020 01:32:56 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 8/23 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0006-media-Rename-stateful-codec-control-macros.patch:

   checkpatch.pl:
	$ cat patches/0006-media-Rename-stateful-codec-control-macros.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:142: CHECK: Macro argument reuse 'x' - possible side-effects?
	-:155: CHECK: Macro argument reuse 'x' - possible side-effects?
	-:210: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:211: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:212: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:213: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:214: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:215: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:216: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:217: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:252: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:253: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:294: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:309: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:309: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:310: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:311: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:312: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:313: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:314: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:315: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:323: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:330: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:330: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:339: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:339: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:348: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:348: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:357: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:357: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:366: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:366: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:374: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:374: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:382: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:382: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:389: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:389: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:397: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:397: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:398: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:399: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:408: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:408: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:417: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:417: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:421: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:428: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:428: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:440: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:440: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:441: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:442: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:443: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:444: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:460: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:460: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:461: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:462: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:463: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:464: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:465: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:466: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:467: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:468: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:469: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:480: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:480: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:481: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:482: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:483: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:484: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:500: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:500: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:501: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:502: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:503: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:504: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:505: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:506: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:507: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:511: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:519: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:519: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:546: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:547: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:548: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:549: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:550: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:551: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:552: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:553: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:554: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:555: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:556: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:557: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:558: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:565: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:565: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:566: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:577: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:577: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:578: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:579: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:586: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:586: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:598: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:598: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:599: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:600: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:601: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:612: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:612: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:613: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:614: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:624: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:624: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:625: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:635: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:635: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:636: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:647: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:647: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:648: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:649: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:650: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:651: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:652: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:671: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:671: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:672: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:673: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:674: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:675: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:676: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:677: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:678: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:679: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:680: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:681: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:682: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:683: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:684: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:693: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:693: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:702: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:702: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:709: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:718: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:718: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:719: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:729: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:729: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:730: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:731: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:732: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:741: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:741: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:742: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:743: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:744: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:747: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:756: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:764: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:764: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:799: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:814: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:824: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:832: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:842: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:862: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:891: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:912: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:919: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:919: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:920: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:929: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:929: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:935: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:935: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:942: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:942: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:943: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:956: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:956: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:957: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:958: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:959: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:960: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:969: WARNING: line length of 101 exceeds 100 columns
	-:969: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:970: WARNING: line length of 101 exceeds 100 columns
	-:970: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:971: WARNING: line length of 101 exceeds 100 columns
	-:971: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:978: WARNING: line length of 101 exceeds 100 columns
	-:978: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:978: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:993: WARNING: line length of 101 exceeds 100 columns
	-:993: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:993: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:994: WARNING: line length of 101 exceeds 100 columns
	-:994: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:995: WARNING: line length of 101 exceeds 100 columns
	-:995: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:996: WARNING: line length of 101 exceeds 100 columns
	-:996: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:997: WARNING: line length of 102 exceeds 100 columns
	-:997: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:998: WARNING: line length of 102 exceeds 100 columns
	-:998: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:999: WARNING: line length of 102 exceeds 100 columns
	-:999: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:1000: WARNING: line length of 102 exceeds 100 columns
	-:1000: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:1001: WARNING: line length of 102 exceeds 100 columns
	-:1001: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0008-media-controls-Validate-H264-stateless-controls.patch:

   checkpatch.pl:
	$ cat patches/0008-media-controls-Validate-H264-stateless-controls.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:191: CHECK: Macro argument reuse 'sps' - possible side-effects?

patches/0009-media-controls-Add-the-stateless-codec-control-class.patch:

   checkpatch.pl:
	$ cat patches/0009-media-controls-Add-the-stateless-codec-control-class.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:72: CHECK: Please don't use multiple blank lines
	-:77: CHECK: Please don't use multiple blank lines

patches/0013-media-controls-Log-H264-stateless-controls-in-.std_l.patch:

   checkpatch.pl:
	$ cat patches/0013-media-controls-Log-H264-stateless-controls-in-.std_l.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:26: WARNING: Avoid logging continuation uses where feasible
	-:29: WARNING: Avoid logging continuation uses where feasible
	-:32: WARNING: Avoid logging continuation uses where feasible
	-:35: WARNING: Avoid logging continuation uses where feasible
	-:38: WARNING: Avoid logging continuation uses where feasible
	-:41: WARNING: Avoid logging continuation uses where feasible

patches/0014-media-uapi-move-H264-stateless-controls-out-of-stagi.patch:

   checkpatch.pl:
	$ cat patches/0014-media-uapi-move-H264-stateless-controls-out-of-stagi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:68: WARNING: line length of 101 exceeds 100 columns
	-:71: WARNING: line length of 102 exceeds 100 columns
	-:408: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:891: CHECK: Macro argument reuse 'sps' - possible side-effects?
	-:1026: CHECK: Macro argument reuse 'pps' - possible side-effects?
	-:1026: CHECK: Macro argument reuse 'slice' - possible side-effects?

patches/0015-media-docs-Move-the-H264-stateless-codec-uAPI.patch:

   checkpatch.pl:
	$ cat patches/0015-media-docs-Move-the-H264-stateless-codec-uAPI.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:34: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0018-vicodec-add-V4L2_-prefix-before-FWHT_VERSION-and-FWH.patch:

   checkpatch.pl:
	$ cat patches/0018-vicodec-add-V4L2_-prefix-before-FWHT_VERSION-and-FWH.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:195: CHECK: Prefer using the BIT macro

patches/0019-vicodec-mark-the-stateless-FWHT-API-as-stable.patch:

   checkpatch.pl:
	$ cat patches/0019-vicodec-mark-the-stateless-FWHT-API-as-stable.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:174: WARNING: Avoid logging continuation uses where feasible
	-:200: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

