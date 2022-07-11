Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9776570327
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbiGKMpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbiGKMow (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:44:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE95E1BEA6
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:37 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1FE42719;
        Mon, 11 Jul 2022 14:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543420;
        bh=UPJ5XRznE8cv1wBcVUOUFQDm95EI3a0AXC/nNFTTE8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PEK0yW8lSsF1HhztAw/YIBASa+OvMjVjn+I9BI9oc6TsAYyX6CRHJGBxXPp1bUVWj
         Y5YvePPAY8mFD7/FLSTMYNAp0b0w0Xu9PdC247SoIxpvtrcHQFjUp35Of/iwfRojmA
         7FpksrkIS9e8i07uZWZ5KLzwwxU0BkI/z4WPSNoc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 34/46] media: rkisp1: isp: Initialize some variables at declaration time
Date:   Mon, 11 Jul 2022 15:42:36 +0300
Message-Id: <20220711124248.2683-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

Initialize the src_fmt and sink_fmt variable when declaring them in
rkisp1_config_isp().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
Changes since v1:

- Fix typo in commit message
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 938541ce52ce..53f0516594ef 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -142,12 +142,11 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
-	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
+	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
+	const struct rkisp1_mbus_info *src_fmt = isp->src_fmt;
 	struct v4l2_mbus_framefmt *sink_frm;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = isp->sink_fmt;
-	src_fmt = isp->src_fmt;
 	sink_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
 					  RKISP1_ISP_PAD_SINK_VIDEO,
 					  V4L2_SUBDEV_FORMAT_ACTIVE);
-- 
Regards,

Laurent Pinchart

