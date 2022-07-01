Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50C85631F0
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 12:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbiGAKxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 06:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235693AbiGAKxL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 06:53:11 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B36013EAE
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 03:53:10 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so6022490pjl.5
        for <linux-media@vger.kernel.org>; Fri, 01 Jul 2022 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4MDjjO8BzInQr5TM6t/zvnDVVooHxE4yuX82IM60po=;
        b=F3QxikYl5N3X8/xOvdJRq17w3/NvwpiHC3GsLbFy1xYBZcDslcuAXxxjAOmbRx+2Da
         JYZdAUyxWrab4Pt6Qpwnf19kDkkaaul5CO8fcfr5Lszh9rOuNFTCFUMOJl6sDAjDDbeT
         FnCw6/fhwibl1Y2uUb0unP3OSQTZgVklKjUgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4MDjjO8BzInQr5TM6t/zvnDVVooHxE4yuX82IM60po=;
        b=EqMgxEBk/Q7gTXERZDiaVBPIWWlwkTnU+eBKoEBHg1h3gC9tiduNt/HfdiuJkdTbTB
         LhLmtCKrg4Zzsy/7fB3qskkxVO2yhIfdagowCwAYDxl/eXtWMUrHbCmeztzYmk03M50U
         9iSrp4F8tSChEPTkuh3VwXXdMThl7s5tEddJk7BQ31vD1dw2XoHVzm8C71aHCcrtbHvS
         Cg3noYvDtaBu2bwna7lAgu+UaGCLORENDqlKeRVniHOycfmgoIY7xvSKrk1H5L+Qp0Uy
         iqboLu2ZUhjZD7kJKBGd9ASjZXuw/erObEE7bDacyHRrRncM+YgoXH/0qWa7IRPZ3VZE
         Tklg==
X-Gm-Message-State: AJIora9TNTI9xX1/Qz+2Koy/5xJPGHHsDl8F6sopOijFkXHBwmRK675D
        9SNPc2O/I9V9P/2hMvSvR6UNyNONI3FyYQ==
X-Google-Smtp-Source: AGRyM1vbOP8ZG1cPe69kNtF3atkiQXQM1DFxbicYf1wohz+ZtbE2UYVdKl/eREdjtV/98YWDo3SckQ==
X-Received: by 2002:a17:90b:2245:b0:1ed:fef:5656 with SMTP id hk5-20020a17090b224500b001ed0fef5656mr15588223pjb.100.1656672789632;
        Fri, 01 Jul 2022 03:53:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:09 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/6] media: mediatek: vcodec: Use meaningful decoder card name including chip name
Date:   Fri,  1 Jul 2022 18:52:33 +0800
Message-Id: <20220701105237.932332-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
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

The card name for the video decoder previously held a static platform
name, that was fixed to match MT8173. This obviously doesn't make sense
for newer chips. Since commit a8a7a278c56a ("media: mediatek: vcodec:
Change decoder v4l2 capability value"), this field was changed to hold
the driver's name, or "mtk-vcodec-dec". This doesn't make much sense
either, since this still doesn't reflect what chip this is.

Instead, fill in the card name with "MTxxxx video decoder" with the
proper chip number.

Fixes: a8a7a278c56a ("media: mediatek: vcodec: Change decoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index e7ea632a3f94..7f03dab518a4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -248,7 +248,7 @@ static int vidioc_vdec_querycap(struct file *file, void *priv,
 	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	strscpy(cap->card, MTK_VCODEC_DEC_NAME, sizeof(cap->card));
+	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", platform_name);
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
 
 	return 0;
-- 
2.37.0.rc0.161.g10f37bed90-goog

