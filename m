Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6B4552231
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 18:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbiFTQZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 12:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239132AbiFTQZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 12:25:22 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CD01D0F6
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:21 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a29so18098479lfk.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=UCpDhGnG8qf0Pht8ozeWOG9JZcY4xZZxEfZx+vL3nrk=;
        b=LfJvdiizbyvUmnNdcArReSPTDd/EjFHFqFCjWuwSFYo+4s0RnfVNe0p4w6YLcw9Haw
         dTT9++dOi50mxf2GnjxJFoFv6rteNNSj9VsoygAJOUtRV7FTNDvX77EVwU5F9x8NDiWc
         AR4b2oShm6El/nOkGngD3RjImyb55ednm0uYMECN8NXV/F47VVP2llwRWvRf3sPH5KAx
         s1glAGNhiewgINYj2IDUk7cFYgkSOz7COvqyw44Z7Suj7iY+GMSyoS4hr/g/il4yFMbq
         /aEa0Cu4LhGHcqzgr51GJc79XuDXsDc7pTHNdbQjrehToni6xgEiAF2am/+vGWeXFjE5
         keNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=UCpDhGnG8qf0Pht8ozeWOG9JZcY4xZZxEfZx+vL3nrk=;
        b=1StIWG6zrDK+80sr5+VPnTML3XeYTQGX2mMW+H/CqolrZwBfgN1IGnsLGtZwMCT67O
         3om9YaEOH3qgIw+BZ17YSxs/dafjaHHnqAGhLDTRw3i4Wb1q8M5eJmArjKfqy38hz9kq
         h5Ozvz9uUE2GrIlDiIYHlyf2DL6qVrcUSO4vf3cAhUoa2vRCNy+KeGYBIScMVyHcwas5
         KMJIN0L5zPiNkAJOdZRk7Ze0z9Cv03MPhzssE9Xkqeqiufc1ykEhLXyySrtJ+B3PKbpZ
         jgALvNxmAZY0Geo50yCeQRbsh4WN15/o+YIAqRbophGe2wGCqjb8FM6wfOWVfeeAHa8P
         fdQA==
X-Gm-Message-State: AJIora8sR5s/lgicIgMj26SIWR+CS3eOh0MVBtQoFqbYxK9dmWXS0911
        wyGFnGSrBsTJtypJqmBnixs/JXoO3FiJejvx9T2xrXzaqQjAFlQmGqV0gyHltwwh4iJK4IEBWGC
        v5+ZcpXrvgvw6CJxY6b1zTkHPPqiZ6UMQK0T2oI6GL7cAkVzdUha81zgQaFpB0eC9V+GFYIxh
X-Google-Smtp-Source: AGRyM1t1DNcCrHdpbtKHkPex43LSxtJ2IIkMbPLEhTYJALYeHAZcfEJFAj0YOGAw0LCZV59qNGRSXQ==
X-Received: by 2002:a05:6512:3ba0:b0:47f:664c:9e87 with SMTP id g32-20020a0565123ba000b0047f664c9e87mr5555031lfv.59.1655742319811;
        Mon, 20 Jun 2022 09:25:19 -0700 (PDT)
Received: from vkh-ThinkPad-T490 ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id u9-20020a197909000000b00478f739f1fdsm1816288lfc.103.2022.06.20.09.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 09:25:19 -0700 (PDT)
Date:   Mon, 20 Jun 2022 19:25:18 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org, vkh@melexis.com, ays@melexis.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        kieran.bingham+renesas@ideasonboard.com, devicetree@vger.kernel.org
Subject: [PATCH 1/6] media: xilinx: csi2rxss: Add 1X12 greyscale format
Message-ID: <20220620162518.GA13973@vkh-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Volodymyr Kharuk <vkh@melexis.com>
To: linux-media@vger.kernel.org
Cc: Volodymyr Kharuk <vkh@melexis.com>,
	Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] media: xilinx: csi2rxss: Add 1X12 greyscale format
Date: Mon, 20 Jun 2022 19:24:32 +0300
Message-Id: <d5e48b4325ee18785ff96260d018557de8fac486.1655738299.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655738299.git.vkh@melexis.com>
References: <cover.1655738299.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the csi2rxss with Y12_1X12 greyscale format

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 051c60cba1e0..67574244eb2b 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -188,6 +188,7 @@ static const u32 xcsi2dt_mbus_lut[][2] = {
 	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SBGGR12_1X12 },
 	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SGBRG12_1X12 },
 	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SGRBG12_1X12 },
+	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_Y12_1X12 },
 	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SRGGB16_1X16 },
 	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SBGGR16_1X16 },
 	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SGBRG16_1X16 },
-- 
BR,
Volodymyr Kharuk

