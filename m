Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFC55631F6
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 12:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236740AbiGAKxT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 06:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235958AbiGAKxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 06:53:14 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3060813EAE
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 03:53:12 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so6022616pjl.5
        for <linux-media@vger.kernel.org>; Fri, 01 Jul 2022 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tNyMQ++pzshlrdbVzN0h4wlM/fIXVOempzIZ1eG6MMs=;
        b=R0aOMwa3NeqUy4oQXlLgM0ZB88OAVKA6dYgXtMw93bB6/rs23mPNXNFWvpU0GH4/yc
         Sb43dmVFsJsUaxYZMZDX+10lSYlhoOSouqkueKVSNJBpG6t7qXpuQD+ZkXbvjk+mCCu5
         7pJH8faeJl/CLhn1M3PPjQYQYZkmZZeoZC/cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNyMQ++pzshlrdbVzN0h4wlM/fIXVOempzIZ1eG6MMs=;
        b=IQ1H0MmXCrwpVvc+8Rxbe8R8YG3FQko1uY4ROJKpgtGAgDaRpskXhstgPSRZv2mEIh
         zkwUnAceRne7kS239MZazbOr8eviYtl5+TYI3AEbrJqtn4qKUMza2co7Gawlg0xv+gE3
         NTjL0VKAigZ2qc3/ZfJmpD0tgYH5tO40g7vZAUMEeWK9Ut4gGhN+4Y/kK9KK/NdOUHSB
         LWiPbV9QtGmNRZ7Ow1DlTRrDFzwmkw1bzEe4EFrhZlUFQN8wNIU3FqUbbQCyfJS+HF/5
         AdKqPGlR9KCkJY8YUBJPmDbsGFEHR4Ww3zriG0eFNGjDOVdLi467P1jpaP/j7GbqXGFI
         mJ3w==
X-Gm-Message-State: AJIora8c7LO2vp5ys9WF3vKnbMBYFpKvDfELzxtvY04ZyqtHapsu/JWg
        IKLzsHbSp3du1oEprEJFiJQzpg==
X-Google-Smtp-Source: AGRyM1uQQ52QyYlrWwh7GikfxSqOxRmuspOTO1vfzF1wU6i5Pt26r3/Hv3209Cj778VfSQ4D3XqAYw==
X-Received: by 2002:a17:902:db11:b0:16b:9057:8007 with SMTP id m17-20020a170902db1100b0016b90578007mr18154361plx.49.1656672791912;
        Fri, 01 Jul 2022 03:53:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:11 -0700 (PDT)
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
Subject: [PATCH 3/6] media: mediatek: vcodec: Use default bus_info for decoder capability
Date:   Fri,  1 Jul 2022 18:52:34 +0800
Message-Id: <20220701105237.932332-4-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit f2d8b6917f3b ("media: v4l: ioctl: Set bus_info in
v4l_querycap()"), the V4L2 core provides a default value for the
bus_info field for platform and PCI devices. This value will match
the default value for media devices added by commit cef699749f37
("media: mc: Set bus_info in media_device_init()"). These defaults
are stable and device-specific.

Drop the custom capability bus_info from the mtk-vcodec decoder
driver, and use the defaults. This also fixes the long standing
issue where the media device used for the stateless decoder didn't
have its bus_info set, and would never match its accompanying video
device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 7f03dab518a4..209de1ec02e4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -249,7 +249,6 @@ static int vidioc_vdec_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", platform_name);
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog

