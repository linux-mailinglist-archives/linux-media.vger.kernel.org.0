Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E347832CDFB
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 08:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbhCDH6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 02:58:21 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36218 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234568AbhCDH56 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 02:57:58 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHirF-000qSR-RW; Thu, 04 Mar 2021 07:57:17 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHiv1-0007Tx-EA; Thu, 04 Mar 2021 08:01:11 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] V4L2 stateless VP8 de-staging (#71905)
Date:   Thu,  4 Mar 2021 08:01:11 +0000
Message-Id: <20210304080111.28720-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7bcaf084-b0fd-8bf8-92df-0eee02d924a3@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7bcaf084-b0fd-8bf8-92df-0eee02d924a3@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/92769/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/7bcaf084-b0fd-8bf8-92df-0eee02d924a3@xs4all.nl

gpg: Signature made Thu 04 Mar 2021 07:42:47 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-uapi-vp8-Remove-header-from-symbol-names-and-m.patch doesn't apply:
Applying patch patches/0001-media-uapi-vp8-Remove-header-from-symbol-names-and-m.patch
patching file Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
Hunk #1 succeeded at 1780 (offset 31 lines).
Hunk #2 FAILED at 1760.
Hunk #3 FAILED at 1850.
Hunk #4 succeeded at 1904 (offset 41 lines).
Hunk #5 FAILED at 1906.
Hunk #6 succeeded at 1972 with fuzz 2 (offset 41 lines).
Hunk #7 FAILED at 1944.
Hunk #8 succeeded at 2035 with fuzz 2 (offset 49 lines).
Hunk #9 succeeded at 2048 (offset 49 lines).
Hunk #10 FAILED at 2010.
Hunk #11 FAILED at 2043.
6 out of 11 hunks FAILED -- rejects in file Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
patching file Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
Hunk #1 succeeded at 157 (offset 6 lines).
patching file drivers/media/v4l2-core/v4l2-ctrls.c
patching file drivers/staging/media/hantro/hantro_drv.c
patching file drivers/staging/media/hantro/hantro_g1_vp8_dec.c
patching file drivers/staging/media/hantro/hantro_hw.h
patching file drivers/staging/media/hantro/hantro_vp8.c
patching file drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
patching file drivers/staging/media/sunxi/cedrus/cedrus.c
patching file drivers/staging/media/sunxi/cedrus/cedrus.h
patching file drivers/staging/media/sunxi/cedrus/cedrus_dec.c
patching file drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
patching file include/media/v4l2-ctrls.h
patching file include/media/vp8-ctrls.h
Patch patches/0001-media-uapi-vp8-Remove-header-from-symbol-names-and-m.patch does not apply (enforce with -f)

