Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E97B56B780
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237762AbiGHKpa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238006AbiGHKpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:45:19 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D692714D
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:45:18 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso1515175pjc.1
        for <linux-media@vger.kernel.org>; Fri, 08 Jul 2022 03:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8FGuAafZHqfrP28YvJIs+zNrzq+lDdIf2d0BaQEypgw=;
        b=kAn9QxId/nVRVVDl4BWaJvyUT7nw0/Wj9Dt7rLTYAw6GgnyPkzXbYgoEJmw5Djd/EU
         6ySb21MhRFifBS1Z0bp2RHFXH8ws5efoziPWD2jYhsCxl4Tbuw8CbYQ4sP7LSl/BQ0Q0
         1/c4LLsIslOSV0juwTx1wa9ywgmT915jt8wXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8FGuAafZHqfrP28YvJIs+zNrzq+lDdIf2d0BaQEypgw=;
        b=x241sM+4vt5dx3BLBva831y2bzCye4GyacnNy6dfwhdBv1uPYwYEEFEuWviaTeu7Ue
         Cqu2KJJU3x8EgX04UB4enMcjuwoq5j7XqaTxM+He0xbVtfIDkzVACzd+jzza1/rcL0VH
         OkNgjYPTeHC1BsLKXekn90yL9qvaYXQYcrR1qwxas+H3HJChUXUBofphLO6D5VOrkimw
         qHxL37hgNu8dfm+Tv5gyBZ4f2C3SOtVE9aj6uebFSQjLKEaS1VxSStNLeDin9jdcNpuQ
         cTz1jYoXMiCPxP+NCOAflvp8+rp6nKIcffGH3rQB3EatoB66gkkqg2Y3PVPj6e3t2U4U
         2+0A==
X-Gm-Message-State: AJIora+hi95q3wUJrI3UN3s5FtE51v/kdhSAAYZJHLFdxfPXNrkppQ+2
        iFkljDIZYqhN7pupehAqVWQL2w==
X-Google-Smtp-Source: AGRyM1vkm3nbZ0roWIsSOm7IfBhet7ILyiwzMy3G/yPRpSMF9I28WxxzEmcHesEkeKJMzES2L1Jf6g==
X-Received: by 2002:a17:90a:e98d:b0:1ef:7863:b7d2 with SMTP id v13-20020a17090ae98d00b001ef7863b7d2mr3256468pjy.101.1657277118450;
        Fri, 08 Jul 2022 03:45:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:db98:ad5d:ca9:da58])
        by smtp.gmail.com with ESMTPSA id m6-20020a635806000000b0040c9213a414sm27216187pgb.46.2022.07.08.03.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 03:45:18 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 0/2] media: mediatek-vcodec: Fix capability fields again
Date:   Fri,  8 Jul 2022 18:44:49 +0800
Message-Id: <20220708104451.3901064-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

This is v2 of my mtk-vcodec capabilities fixes series.

Changes since v1:
- Squashed 3 patches into one, as Hans recommended

The previous round of changes to the mtk-vcodec driver's returned
capabilities caused some issues for ChromeOS. In particular, the
ChromeOS stateless video decoder uses the "Driver Name" field to
match a video device to its media device. As the field was only
changed for the video device and not the media device, a match
could no longer be found.

While fixing this, I found that the current info used for the fields
don't make a lot of sense, and tried to fix them in this series.

Patch 1 fixes the capabilities for the decoder. The driver name field
change is reverted and made explicit that the field really should match
the driver name. The card name is made a user readable string that
includes the SoC model. The bus_info field is dropped and the default
value from the V4L2 core is used.

Patch 2 does the same, but for the encoder size. And since the last
reference to MTK_VCODEC_DRV_NAME is removed, the macro is removed as
well.

This series is based on next-20220708, and was tested on mainline on
MT8183 Juniper, and on ChromeOS v5.10, on which we have a whole bunch
of backports pending, on MT8195 Tomato.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  media: mediatek: vcodec: Make decoder capability fields fit
    requirements
  media: mediatek: vcodec: Make encoder capability fields fit
    requirements

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 ++++---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 7 ++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

