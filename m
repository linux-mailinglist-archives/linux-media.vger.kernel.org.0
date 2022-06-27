Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63BA55E207
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbiF0LZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 07:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbiF0LZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 07:25:16 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EB665C7
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 04:25:08 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id x8so4217542pgj.13
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 04:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Bdt/pZAOacqJuCFzII9rBWAKqWiyNAPCi+XwvqCQy0=;
        b=gND2N7zr6zJtFEQ1/Qh++AaC/I3sYIjuvDxr52m7Vusjymll7C22xQJnXtQSAgXqpJ
         r89NGcuSNrr6jtyaN6WQTCKIh/3bqzP4HhpSMrh/aHkJRp7fHeZuEPYn9tacdAUncKNg
         MRC5No3iihpOW7bs07Qq05whWNJSKaynJZWv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Bdt/pZAOacqJuCFzII9rBWAKqWiyNAPCi+XwvqCQy0=;
        b=idMqG40C/kS8UvBIkh+gz/5w0gk0noI3BkbZdp4rq0oqIaCRSIR6+cxV9rGvLLsAtn
         2luwP8ZoFAoRusDUyfcwVwpONbUm2CPyI2zxffdStDReKfwxfChRQeQv/GEYwh2yY6pj
         gPLDOILhEcXdcixh3/lVC2vIxM6phY+7rw9TNqaQQ/XVgu50ToOft6FrICnKHEnefTBs
         XBmHmrTKqQFbqm8u7pDsVqD9+Y6w54W86find+GvrNAJTZcX30flLr18ZuSaMwJ73nOp
         XdqoDjo8fPSbJaAQoUq0P3UWPK4ZaCKs+UMDJzbtul6vNAuqRwMwSe30WYqa6mWlVRmR
         8nYA==
X-Gm-Message-State: AJIora99K6gyeAKKp2/N49r6mhRzJ/QTauurSIIgH/VZYfGZacjYDKJH
        ev+daTVelkHyApN37ETC/UW+NQ==
X-Google-Smtp-Source: AGRyM1upMeiOln1K4lkc+rTedGu7rooW/59+/KUoBEA/D4qTE+BzMxTrodbWQsrklKjwp/RQ1Lgmcw==
X-Received: by 2002:a65:6045:0:b0:399:3a5e:e25a with SMTP id a5-20020a656045000000b003993a5ee25amr12685653pgp.139.1656329107880;
        Mon, 27 Jun 2022 04:25:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:25:07 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 4/4] media: mediatek: vcodec: dec: Set maximum resolution when S_FMT on output only
Date:   Mon, 27 Jun 2022 19:24:02 +0800
Message-Id: <20220627112402.2332046-5-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220627112402.2332046-1-wenst@chromium.org>
References: <20220627112402.2332046-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only the coded format impacts whether 4K resolution is supported: the
decoder does not support 4K for VP8, but does for other formats.

Update the maximum resolution in S_FMT only when called for the output
format. Otherwise we could set output format for VP8, then set capture
format, and then the resolution limit becomes inconsistent.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index ea951cb3b927..995c61d6a40e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -521,7 +521,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (fmt == NULL)
 		return -EINVAL;
 
-	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
+	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    !(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
 	    fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
 		mtk_v4l2_debug(3, "4K is enabled");
 		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
-- 
2.37.0.rc0.161.g10f37bed90-goog

