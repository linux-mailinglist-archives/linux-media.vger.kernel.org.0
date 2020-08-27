Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A31254D49
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 20:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0SvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 14:51:14 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49876 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgH0SvO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 14:51:14 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBMtp-0048ma-0z; Thu, 27 Aug 2020 18:45:25 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBN22-0004tC-2D; Thu, 27 Aug 2020 18:53:54 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] mtk-vcodec: venc: support for MT8183 (#66587)
Date:   Thu, 27 Aug 2020 18:53:54 +0000
Message-Id: <20200827185354.18753-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5b4d766c-eeed-11ed-60c6-fa7ee489992f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5b4d766c-eeed-11ed-60c6-fa7ee489992f@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/5b4d766c-eeed-11ed-60c6-fa7ee489992f@xs4all.nl

gpg: Signature made Wed 26 Aug 2020 10:37:55 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-mtk-vcodec-abstract-firmware-interface.patch doesn't apply:
Applying patch patches/0001-media-mtk-vcodec-abstract-firmware-interface.patch
patching file drivers/media/platform/mtk-vcodec/Makefile
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
Hunk #5 FAILED at 222.
Hunk #6 succeeded at 345 (offset 8 lines).
Hunk #7 succeeded at 371 (offset 8 lines).
1 out of 7 hunks FAILED -- rejects in file drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
Hunk #6 FAILED at 230.
Hunk #7 succeeded at 371 (offset 8 lines).
Hunk #8 succeeded at 397 (offset 8 lines).
1 out of 8 hunks FAILED -- rejects in file drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
patching file drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
patching file drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
patching file drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
patching file drivers/media/platform/mtk-vcodec/vdec_drv_base.h
patching file drivers/media/platform/mtk-vcodec/vdec_drv_if.c
patching file drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
patching file drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
patching file drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
patching file drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
patching file drivers/media/platform/mtk-vcodec/venc_drv_if.c
patching file drivers/media/platform/mtk-vcodec/venc_vpu_if.c
patching file drivers/media/platform/mtk-vcodec/venc_vpu_if.h
Patch patches/0001-media-mtk-vcodec-abstract-firmware-interface.patch does not apply (enforce with -f)

