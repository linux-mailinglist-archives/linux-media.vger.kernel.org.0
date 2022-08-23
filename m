Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07AEC59EB93
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 20:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbiHWSyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 14:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbiHWSyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 14:54:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0E565540
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:20:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8387B10CD;
        Tue, 23 Aug 2022 19:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661275136;
        bh=e9dDoI7js6GAclo5QIceH/HdFmi9cGjnukCULiCyneE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Slke7OUD7FbrSdZFj81M/mBKdABPf/5k+HpkHY9ASG1pWVacc8K+e9YIMJGX+3ZvQ
         vR7DTrXG/uISbi1PPykZJpOoAZITKxonwaKDsGIdBaVOsHMl/LEBKmEXOADmpam/uv
         2LQgR74uSFQGir8B5gWc3/eGOZbdkgyq2LQprGX0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 8/9] media: rkisp1: Initialize color space on resizer sink and source pads
Date:   Tue, 23 Aug 2022 20:18:39 +0300
Message-Id: <20220823171840.8958-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialize the four color space fields on the sink and source video pads
of the resizer in the .init_cfg() operation. The resizer can't perform
any color space conversion, so set the sink and source color spaces to
the same defaults, which match the ISP source video pad default.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index becef04fdf2d..6f6ec00b63b8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -430,6 +430,10 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
 	sink_fmt->code = RKISP1_DEF_FMT;
+	sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	sink_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 
 	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
 					     RKISP1_RSZ_PAD_SINK);
-- 
Regards,

Laurent Pinchart

