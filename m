Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA0054D2D1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347137AbiFOUpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245376AbiFOUpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:45:00 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D5D2CE18;
        Wed, 15 Jun 2022 13:44:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fu3so25501592ejc.7;
        Wed, 15 Jun 2022 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UkPUwKTnaS1+NO9Nch9w26K0HXt37ZbuHwCJgvzas6w=;
        b=KZTaP/UUBSfkhES3uwAifaBHD+8KYHaDPTIaHC0+kMWiVl0Dc4uQj3rHyguuW0b+e6
         xn2qMFMVoYg0WdHpwEkLRsR8SHg7l/B/B64UMrTxDBHQg0P6se89zaIIJJvuyNzTP7/w
         6R7wtGC5qIwCkTMRWOfvuQKys0nG5fqFfS3KkDp6XsKO+NEUGxFbjqt7QJNvpBNsLPky
         DmG5EbDEUvJO88gfr2a6shjEq2I3cMZHIY5Vkque0II4Nyy5yC2VVUNU/xlp8qqJh6QK
         fBHpPqfHDiL1YiM1Ty4YKVXPO8NrjUK2s16XzBB03W2tP9OhsfEkxn2DckHRMIK/2tcJ
         VayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UkPUwKTnaS1+NO9Nch9w26K0HXt37ZbuHwCJgvzas6w=;
        b=tZKZoktsh3XIHyZmMwsh4XdiNU6PtHjAZT+w4voIMNp5Qa1GLc9wby9zZwgXSdnwNI
         tzLQPIko38Nyl3718RAE/HAWO/Y1FISpjZmsJFnqxCmysSyZDPUf4vcPU24olGGOvpjV
         ikWaa5xBHjfqqy6BlFmLDigJgdkIx9X9u948cIlz3iZclcG53l+pxxZtps0uJzRPr/tp
         mS85Xno5glwaRoBLgoumW1FQ00mMs09owX45gFhVEvG71invto6UdJoc3fqsfIGDxCQp
         hJC+uAoOzaHFrwCn3tsHRi+gIxEKY+CxL5Mlxrg0crPwzCtAmrqkyaKXDjxY+fJ0X0Xt
         lQ9g==
X-Gm-Message-State: AJIora+7rBR6iZ/WcjVxmAoH9hKj6aVx9SVzSrQA171He7GyTPkPPz2L
        CeCz6QufpQkKa6ooHTZHOe5G9ZX987KFaQ==
X-Google-Smtp-Source: AGRyM1vx9khoEZtrG2EZUYe5/IW0+vYV2Dvx6Hyuvnil2j5foF+MmkFd0Ik/E0DR03tXnXp2EQ0hFg==
X-Received: by 2002:a17:907:ea6:b0:708:1282:cbe8 with SMTP id ho38-20020a1709070ea600b007081282cbe8mr1588469ejc.520.1655325897664;
        Wed, 15 Jun 2022 13:44:57 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id h16-20020a1709060f5000b00711d0b41bcfsm6777291ejj.0.2022.06.15.13.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 13:44:57 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, hverkuil-cisco@xs4all.nl,
        benjamin.gaignard@collabora.com, nicolas.dufresne@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: cedrus: h265: Fix logic for not low delay flag
Date:   Wed, 15 Jun 2022 22:44:36 +0200
Message-Id: <20220615204436.137377-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615204436.137377-1-jernej.skrabec@gmail.com>
References: <20220615204436.137377-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we know real purpose of "not low delay" flag, logic for
applying this flag should be fixed too. According to vendor and
reference implementation, low delay is signaled when POC of current
frame is lower than POC of at least one reference of a slice.

Implement mentioned logic and invert it to conform to flag meaning. Also
don't apply flag for I frames. They don't have any reference.

This fixes decoding of 3 reference bitstreams.

Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 2febdf7a97fe..3f50043093be 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -301,6 +301,31 @@ static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
 		}
 }
 
+static int cedrus_h265_is_low_delay(struct cedrus_run *run)
+{
+	const struct v4l2_ctrl_hevc_slice_params *slice_params;
+	const struct v4l2_hevc_dpb_entry *dpb;
+	s32 poc;
+	int i;
+
+	slice_params = run->h265.slice_params;
+	poc = run->h265.decode_params->pic_order_cnt_val;
+	dpb = run->h265.decode_params->dpb;
+
+	for (i = 0; i < slice_params->num_ref_idx_l0_active_minus1 + 1; i++)
+		if (dpb[slice_params->ref_idx_l0[i]].pic_order_cnt[0] > poc)
+			return 1;
+
+	if (slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_B)
+		return 0;
+
+	for (i = 0; i < slice_params->num_ref_idx_l1_active_minus1 + 1; i++)
+		if (dpb[slice_params->ref_idx_l1[i]].pic_order_cnt[0] > poc)
+			return 1;
+
+	return 0;
+}
+
 static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 			      struct cedrus_run *run)
 {
@@ -571,7 +596,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED,
 				slice_params->flags);
 
-	if (decode_params->num_poc_st_curr_after == 0)
+	if (slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_I && !cedrus_h265_is_low_delay(run))
 		reg |= VE_DEC_H265_DEC_SLICE_HDR_INFO1_FLAG_SLICE_NOT_LOW_DELAY;
 
 	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO1, reg);
-- 
2.36.1

