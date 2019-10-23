Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8A6E12ED
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 09:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389649AbfJWHPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 03:15:49 -0400
Received: from www.linuxtv.org ([130.149.80.248]:59556 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389327AbfJWHPt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 03:15:49 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iNArp-0000Hk-2Y; Wed, 23 Oct 2019 07:15:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iNAsJ-00035a-V0; Wed, 23 Oct 2019 07:16:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR v5.5] Add HEVC stateless decoder support
Date:   Wed, 23 Oct 2019 07:16:07 +0000
Message-Id: <20191023071607.11833-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <860a9d97-7b8c-abc1-670d-57ea24312862@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59600/
Build log: https://builder.linuxtv.org/job/patchwork/21648/
Build time: 00:15:41
Link: https://lore.kernel.org/linux-media/860a9d97-7b8c-abc1-670d-57ea24312862@xs4all.nl

gpg: Signature made Wed 23 Oct 2019 06:51:20 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-cedrus-Fix-undefined-shift-with-a-SHIFT_AND_MA.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-cedrus-Fix-undefined-shift-with-a-SHIFT_AND_MA.patch
patches/0001-media-cedrus-Fix-undefined-shift-with-a-SHIFT_AND_MA.patch:30: CHECK: Macro argument reuse 'l' - possible side-effects?
patches/0001-media-cedrus-Fix-undefined-shift-with-a-SHIFT_AND_MA.patch:65: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:708: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:709: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:710: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:711: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:712: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:765: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:766: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:790: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:855: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:855: ERROR: trailing statements should be on next line
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:860: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:881: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:908: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:909: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:910: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:911: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:912: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:913: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:914: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:915: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:916: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:948: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:949: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:950: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:951: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:952: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:953: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:954: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:955: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:956: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:957: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:958: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:959: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:960: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:961: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:962: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:963: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:964: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:965: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:966: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1018: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1019: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1020: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1021: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1022: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1023: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1024: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1025: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1026: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1026: CHECK: Prefer using the BIT_ULL macro
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1093: WARNING: line over 80 characters
patches/0003-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1094: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:198: CHECK: Alignment should match open parenthesis
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:200: CHECK: Alignment should match open parenthesis
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:202: CHECK: Alignment should match open parenthesis
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:209: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:335: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:339: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:340: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:348: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:369: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:534: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:535: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:541: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:542: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:543: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:544: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:545: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:546: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:547: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:550: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:551: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:554: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:558: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:565: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:571: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:572: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:573: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:574: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:579: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:587: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:588: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:590: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:592: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:596: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:600: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:604: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:610: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:612: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:613: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:616: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:617: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:620: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:626: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:640: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:641: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:642: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:643: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:644: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:645: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:646: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:648: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:656: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:660: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:664: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:668: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:669: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:672: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:681: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:682: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:683: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:684: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:685: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:686: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:688: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:689: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:692: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:693: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:699: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:701: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:702: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:719: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:743: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:744: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:749: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:750: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:751: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:752: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:753: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:754: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:755: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:762: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:763: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:767: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:768: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:769: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:770: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:771: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:772: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:773: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:918: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:945: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:961: CHECK: Prefer using the BIT macro
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:991: WARNING: line over 80 characters
patches/0005-media-cedrus-Add-HEVC-H.265-decoding-support.patch:992: WARNING: line over 80 characters

