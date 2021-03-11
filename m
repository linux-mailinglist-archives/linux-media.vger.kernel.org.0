Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47339336FC8
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbhCKKUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:49 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58135 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232283AbhCKKUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQflKo5s; Thu, 11 Mar 2021 11:20:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458029; bh=Wissy2MsR+SgOH+XIcE7jTChpQ/w6A1FjkheFCd20z4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=QBOdFVNy9j+61Wb3xDuP1USlx5ixvgwLae8H7ZEIBBE8jCFy+6HeyFjfI+cXOxuKN
         gYcQkiwfPqWcUGqxyEftvwCPbbHWvdgfnpkcaoKYpQZn+PVEmEIvujANbbei1EJWPK
         Oe7dUmEeKpWVhUnIR/bKej3fE4+OZHqpbAIp4g1KDsIqtDPOrrBxXJtFogVP646f45
         ZsgzSg6h3dPOFxUvRakkebv8/oFTc7sJ/EnJrj5Qy5RpUP46+XxCbamFKByLvJVD4o
         pwMTg6Ctq/rEPwwgZBpVQilYWgqjLHAgMnTtZUVlTSNqgZ0EWkUgb8VbEdTLvtAU0P
         nOu+Z16U0ReGQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 07/13] staging: media: hantro: fix kernel-doc formatting
Date:   Thu, 11 Mar 2021 11:20:16 +0100
Message-Id: <20210311102022.96954-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJ2t2hEZx/QeWjdRyHoE/3o+ITKtl1JBIhvi1AKPJPEiDGao1h+/Sg4NVx25QIPjhcgyHLu1I1hUODliM2dBLTwkxpqIEab/wIQCIgAQ2SGffk2RzLw3
 SZrOEPdycO75DKE/yJCc4p4985KciOw7LYIZCDmCG0e4qJVMAz90hpx3JUkY8J4zuAZauMq8VeSLTeR7bLVra2uBFD3eLj8JZyHrE6LOX03IMIlDj6Wsh6rJ
 6J+9Sjqmx7weACyLCsjazTqcoV16LTq6ZS2A5tkt0ZI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- @h264_dec was not documented, add that trivial change
- it is not possible to document a global variable in kernel-doc,
  change to use 'DOC:' instead
- fix mismatched struct name (hantro_vp8d_hw_ctx -> hantro_vp8_dec_hw_ctx)

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h    | 3 ++-
 drivers/staging/media/hantro/hantro_hw.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 65f9f7ea7dcf..6c1b888abe75 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -214,6 +214,7 @@ struct hantro_dev {
  *
  * @codec_ops:		Set of operations related to codec mode.
  * @postproc:		Post-processing context.
+ * @h264_dec:		H.264-decoding context.
  * @jpeg_enc:		JPEG-encoding context.
  * @mpeg2_dec:		MPEG-2-decoding context.
  * @vp8_dec:		VP8-decoding context.
@@ -293,7 +294,7 @@ struct hantro_postproc_regs {
 /* Logging helpers */
 
 /**
- * debug - Module parameter to control level of debugging messages.
+ * DOC: hantro_debug: Module parameter to control level of debugging messages.
  *
  * Level of debugging messages can be controlled by bits of
  * module parameter called "debug". Meaning of particular
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 34c9e4649a25..65a9eaf5bb18 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -99,7 +99,7 @@ struct hantro_mpeg2_dec_hw_ctx {
 };
 
 /**
- * struct hantro_vp8d_hw_ctx
+ * struct hantro_vp8_dec_hw_ctx
  * @segment_map:	Segment map buffer.
  * @prob_tbl:		Probability table buffer.
  */
-- 
2.30.1

