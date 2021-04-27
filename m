Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604CB36C4D4
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbhD0LQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235943AbhD0LQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:16:45 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE84C06175F
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:02 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id i190so1525167pfc.12
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FGCi4wgyNmOswZhTsUzcguHV+B0Lp+oepbJNaLdIIQs=;
        b=eM/J7FTNEqy/zfDU2sn4V/mLvs/9ZVj7P8OeX8GYnAg1OLcd/aZi3pIJ34tMwyGLTg
         ttZdQQSMaCDyhPcEOUdUT7UqSweFwjsZgymNQ2cqZ4t4cMdUNC8ACJqw+MqWwPw3TOqE
         XFZY6A4SL+Bh4dfHH3MxZaUUhPfMk/rCzWt8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FGCi4wgyNmOswZhTsUzcguHV+B0Lp+oepbJNaLdIIQs=;
        b=q3SjQ1Wm35Eo+tZtKiAcyjQ6YoY8ks0IHYWgcOW1em9AzQkgYIuM00MLgHMmqvW+aC
         hfhWimU7jd3nteI+H0nq0BFxqQp3V5MO0VLvCOkiiSfsiVjQuQEXzUExVQx90k5B0NBR
         YGgS7DHy3MYfgEW35yPfMdOsno1YPKF6nCdQLX9fQW/m/Rsf3QbUCKdjjykt6jko3Z+/
         TNmsvcsDd/WZKT8l1u1cNmVQSA7abVzC5jDrq60U58lS36Q/VpY38TTaFd+epCR6L5Di
         /gFUUz2TPc4jYqNjHxCkgcjHx+dv/N4nKgXOYS9EmqwcwYYMfCKEUSrJMoLgkwpV3aH5
         7Rxw==
X-Gm-Message-State: AOAM532CLE2e+WMmXyM8xSu/HCVNQTXJ8Vlohwk7u5EPtvS8PAZtpGNh
        VYd14DZWsbaDsXOIhpwfGP8yvg==
X-Google-Smtp-Source: ABdhPJzMT5Fck/ahyuMY+JNQxL/9oUgdrbw/UDDbspnGnAl+oGo6sz77U5W7LGN1CgNLep74HZAJZA==
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id g136-20020a62528e0000b02901f5c5eea487mr21962939pfb.7.1619522161753;
        Tue, 27 Apr 2021 04:16:01 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:b182:d363:32d0:53a2])
        by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 04:16:01 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 09/15] media: mtk-vcodec: enable MT8183 decoder
Date:   Tue, 27 Apr 2021 20:15:20 +0900
Message-Id: <20210427111526.1772293-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable decoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e942e28f96fe..e0526c0900c8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -383,12 +383,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",
 		.data = &mtk_vdec_8173_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8183-vcodec-dec",
+		.data = &mtk_vdec_8183_pdata,
+	},
 	{},
 };
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

