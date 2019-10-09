Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70AED0CFB
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 12:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730807AbfJIKnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 06:43:00 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45318 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbfJIKnA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 06:43:00 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iI9Qe-0004pe-W9; Wed, 09 Oct 2019 10:42:49 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iI9R4-0004VO-87; Wed, 09 Oct 2019 10:43:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] ti-vpe maintenance, add
Date:   Wed,  9 Oct 2019 10:43:14 +0000
Message-Id: <20191009104314.17277-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e74ba649-28a5-a936-531c-aa2e0419384f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59359/
Build log: https://builder.linuxtv.org/job/patchwork/19655/
Build time: 00:33:03
Link: https://lore.kernel.org/linux-media/e74ba649-28a5-a936-531c-aa2e0419384f@xs4all.nl

gpg: Signature made Wed 09 Oct 2019 10:01:01 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 9 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l2-core-Implement-v4l2_ctrl_new_std_compound.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-v4l2-core-Implement-v4l2_ctrl_new_std_compound.patch
patches/0001-media-v4l2-core-Implement-v4l2_ctrl_new_std_compound.patch:119: CHECK: Alignment should match open parenthesis
patches/0001-media-v4l2-core-Implement-v4l2_ctrl_new_std_compound.patch:199: WARNING: Missing Signed-off-by: line by nominal patch author 'Ricardo Ribalda Delgado <ricardo@ribalda.com>'

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-add-V4L2_CID_UNIT_CELL_SIZE-control.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-add-V4L2_CID_UNIT_CELL_SIZE-control.patch
patches/0005-media-add-V4L2_CID_UNIT_CELL_SIZE-control.patch:50: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-imx214-Add-new-control-with-V4L2_CID_UNIT_CELL.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-imx214-Add-new-control-with-V4L2_CID_UNIT_CELL.patch
patches/0008-media-imx214-Add-new-control-with-V4L2_CID_UNIT_CELL.patch:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0008-media-imx214-Add-new-control-with-V4L2_CID_UNIT_CELL.patch:44: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-ti-vpe-vpe-Fix-Motion-Vector-vpdma-stride.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-ti-vpe-vpe-Fix-Motion-Vector-vpdma-stride.patch
patches/0010-media-ti-vpe-vpe-Fix-Motion-Vector-vpdma-stride.patch:6: WARNING: Unknown commit id '52831a418fa6', maybe rebased or not pulled?
patches/0010-media-ti-vpe-vpe-Fix-Motion-Vector-vpdma-stride.patch:7: WARNING: Unknown commit id '8c1e4fa17e92', maybe rebased or not pulled?
patches/0010-media-ti-vpe-vpe-Fix-Motion-Vector-vpdma-stride.patch:12: WARNING: Unknown commit id '44f98adf71a8', maybe rebased or not pulled?
patches/0010-media-ti-vpe-vpe-Fix-Motion-Vector-vpdma-stride.patch:15: WARNING: Unknown commit id '52831a418fa6', maybe rebased or not pulled?
patches/0010-media-ti-vpe-vpe-Fix-Motion-Vector-vpdma-stride.patch:16: WARNING: Unknown commit id '8c1e4fa17e92', maybe rebased or not pulled?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0018-media-ti-vpe-vpe-Make-sure-YUYV-is-set-as-default-fo.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0018-media-ti-vpe-vpe-Make-sure-YUYV-is-set-as-default-fo.patch
patches/0018-media-ti-vpe-vpe-Make-sure-YUYV-is-set-as-default-fo.patch:15: WARNING: Unknown commit id '94ed726e8e01', maybe rebased or not pulled?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0019-media-ti-vpe-vpe-fix-a-v4l2-compliance-failure-about.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0019-media-ti-vpe-vpe-fix-a-v4l2-compliance-failure-about.patch
patches/0019-media-ti-vpe-vpe-fix-a-v4l2-compliance-failure-about.patch:38: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-media-ti-vpe-vpe-use-standard-struct-instead-of-dupl.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-media-ti-vpe-vpe-use-standard-struct-instead-of-dupl.patch
patches/0024-media-ti-vpe-vpe-use-standard-struct-instead-of-dupl.patch:386: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0027-media-v4l2-common-add-pixel-encoding-support.patch
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:47: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:48: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:49: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:50: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:51: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:52: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:53: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:54: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:55: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:56: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:57: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:58: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:59: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:60: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:61: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:68: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:69: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:70: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:71: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:87: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:88: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:89: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:90: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:91: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:92: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:94: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:95: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:96: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:97: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:98: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:99: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:113: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:114: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:115: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:116: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:117: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:118: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:120: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:121: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:122: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:123: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:146: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:147: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:148: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:149: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:150: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:151: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:152: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:153: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:154: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:155: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:156: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:157: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:158: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:159: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:160: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:161: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:162: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:163: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:164: WARNING: line over 80 characters
patches/0027-media-v4l2-common-add-pixel-encoding-support.patch:165: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0028-media-v4l2-common-add-RGB565-and-RGB55-to-v4l2_forma.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0028-media-v4l2-common-add-RGB565-and-RGB55-to-v4l2_forma.patch
patches/0028-media-v4l2-common-add-RGB565-and-RGB55-to-v4l2_forma.patch:22: WARNING: line over 80 characters
patches/0028-media-v4l2-common-add-RGB565-and-RGB55-to-v4l2_forma.patch:23: WARNING: line over 80 characters

