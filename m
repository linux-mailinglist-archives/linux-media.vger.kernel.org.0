Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083BBD0AD6
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 11:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbfJIJSl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 05:18:41 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41339 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730215AbfJIJSl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 05:18:41 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iI871-0007rL-JG; Wed, 09 Oct 2019 09:18:27 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iI87Q-0001Df-Dd; Wed, 09 Oct 2019 09:18:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Add HEVC stateless decoder support
Date:   Wed,  9 Oct 2019 09:18:52 +0000
Message-Id: <20191009091852.4646-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d783b7cc-4cc6-6c36-ab95-264c7427564e@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59358/
Build log: https://builder.linuxtv.org/job/patchwork/19649/
Build time: 00:08:24
Link: https://lore.kernel.org/linux-media/d783b7cc-4cc6-6c36-ab95-264c7427564e@xs4all.nl

gpg: Signature made Wed 09 Oct 2019 09:06:52 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:708: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:709: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:710: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:711: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:712: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:764: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:765: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:789: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:848: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:848: ERROR: trailing statements should be on next line
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:853: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:874: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:901: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:902: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:903: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:904: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:905: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:906: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:907: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:908: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:909: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:941: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:942: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:943: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:944: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:945: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:946: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:947: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:948: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:949: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:950: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:951: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:952: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:953: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:954: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:955: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:956: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:957: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:958: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:959: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1011: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1012: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1013: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1014: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1015: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1016: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1017: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1018: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1019: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1019: CHECK: Prefer using the BIT macro
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1086: WARNING: line over 80 characters
patches/0001-media-v4l-Add-definitions-for-HEVC-stateless-decodin.patch:1087: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:200: CHECK: Alignment should match open parenthesis
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:202: CHECK: Alignment should match open parenthesis
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:204: CHECK: Alignment should match open parenthesis
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:211: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:337: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:341: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:342: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:350: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:371: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:536: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:537: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:543: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:544: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:545: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:546: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:547: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:548: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:549: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:552: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:553: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:556: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:560: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:567: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:573: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:574: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:575: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:576: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:581: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:589: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:590: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:592: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:594: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:598: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:602: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:606: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:612: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:614: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:615: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:618: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:619: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:622: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:628: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:642: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:643: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:644: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:645: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:646: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:647: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:648: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:650: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:658: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:662: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:666: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:670: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:671: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:674: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:683: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:684: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:685: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:686: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:687: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:688: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:690: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:691: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:694: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:695: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:701: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:703: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:704: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:721: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:745: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:746: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:751: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:752: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:753: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:754: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:755: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:756: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:757: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:764: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:765: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:769: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:770: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:771: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:772: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:773: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:774: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:775: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:920: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:947: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:963: CHECK: Prefer using the BIT macro
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:993: WARNING: line over 80 characters
patches/0003-media-cedrus-Add-HEVC-H.265-decoding-support.patch:994: WARNING: line over 80 characters

