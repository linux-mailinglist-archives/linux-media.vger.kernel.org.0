Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F9672926A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240001AbjFIIPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 04:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239192AbjFIIPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 04:15:38 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520941FEC
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 01:15:37 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7XHT-0000YV-Iv; Fri, 09 Jun 2023 08:15:35 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7XHQ-006vf6-O3; Fri, 09 Jun 2023 08:15:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.5] Add AV1 stateless decoder support (#92229)
Date:   Fri,  9 Jun 2023 08:15:32 +0000
Message-Id: <20230609081532.1651574-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <52a82b66-a068-80eb-9e40-d4c61cb0272d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/52a82b66-a068-80eb-9e40-d4c61cb0272d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/313143/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/52a82b66-a068-80eb-9e40-d4c61cb0272d@xs4all.nl

gpg: Signature made Tue 30 May 2023 10:34:50 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-Add-AV1-uAPI.patch doesn't apply:
Applying patch patches/0001-media-Add-AV1-uAPI.patch
patching file Documentation/userspace-api/media/v4l/biblio.rst
Hunk #1 FAILED at 427.
1 out of 1 hunk FAILED -- rejects in file Documentation/userspace-api/media/v4l/biblio.rst
patching file Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
Hunk #1 FAILED at 1890.
Hunk #2 FAILED at 2957.
2 out of 2 hunks FAILED -- rejects in file Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
patching file Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
Hunk #1 succeeded at 274 with fuzz 2 (offset 16 lines).
patching file Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
Hunk #1 FAILED at 279.
1 out of 1 hunk FAILED -- rejects in file Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
patching file Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
Hunk #1 FAILED at 525.
1 out of 1 hunk FAILED -- rejects in file Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
patching file Documentation/userspace-api/media/videodev2.h.rst.exceptions
Hunk #1 FAILED at 161.
1 out of 1 hunk FAILED -- rejects in file Documentation/userspace-api/media/videodev2.h.rst.exceptions
patching file drivers/media/v4l2-core/v4l2-ctrls-core.c
Hunk #1 succeeded at 244 with fuzz 2 (offset -106 lines).
Hunk #2 succeeded at 803 (offset 243 lines).
Hunk #3 FAILED at 1149.
Hunk #4 succeeded at 2103 with fuzz 2 (offset 263 lines).
1 out of 4 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ctrls-core.c
patching file drivers/media/v4l2-core/v4l2-ctrls-defs.c
Hunk #1 succeeded at 533 (offset 34 lines).
Hunk #2 FAILED at 738.
Hunk #3 succeeded at 1080 with fuzz 2 (offset 42 lines).
Hunk #4 FAILED at 1228.
Hunk #5 FAILED at 1403.
Hunk #6 succeeded at 1630 with fuzz 2 (offset 61 lines).
3 out of 6 hunks FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ctrls-defs.c
patching file drivers/media/v4l2-core/v4l2-ioctl.c
Hunk #1 FAILED at 1506.
1 out of 1 hunk FAILED -- rejects in file drivers/media/v4l2-core/v4l2-ioctl.c
patching file include/media/v4l2-ctrls.h
Hunk #1 FAILED at 52.
Hunk #2 FAILED at 81.
2 out of 2 hunks FAILED -- rejects in file include/media/v4l2-ctrls.h
patching file include/uapi/linux/v4l2-controls.h
Hunk #1 succeeded at 886 with fuzz 2 (offset 82 lines).
Hunk #2 succeeded at 3561 with fuzz 1 (offset 721 lines).
patching file include/uapi/linux/videodev2.h
Hunk #1 FAILED at 758.
Hunk #2 FAILED at 1828.
Hunk #3 FAILED at 1901.
3 out of 3 hunks FAILED -- rejects in file include/uapi/linux/videodev2.h
Patch patches/0001-media-Add-AV1-uAPI.patch can be reverse-applied

