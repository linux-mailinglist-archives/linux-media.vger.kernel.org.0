Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE0C0614881
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 12:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiKAL1h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 07:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiKAL1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 07:27:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FAF17E21;
        Tue,  1 Nov 2022 04:27:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C84AF61588;
        Tue,  1 Nov 2022 11:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DCAC433B5;
        Tue,  1 Nov 2022 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667302053;
        bh=YXsQNvRAP0XbPT0YNr2ogvZLzXqQIuO8u8yY6x/VbSA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iueMesf9/6PzuqKOPOoKfLp4FmpStPmzXLRhbymilCcsrMFDLHrdAOgD1SFHY9RTm
         oXgg3Y/NBmTdroAPvON3kHvp+cxrOCNk1K2827fJxy4yWY5Uj8Z/oiNd2cQYflsT9o
         GRvPpFKbmXPK2BZaCInNFik60769Wj6uWavC7r3pJ7jJAMDpi5Ygs/ptWwwZZiEp4y
         RieaP09Y9vKr0126UQEawPR/gzLlAuTqvX0ErMuHnwyHcnJdM5soZfPXiNwr3NDnPw
         yZ9PHRL5qrDr8uvwlmFVPS52/Zr72ue0uBHVL7DomzYVzwGLxGVH5BLRFQvML+HQ7M
         N/lw3yfzg7ZpA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, heiko@sntech.de,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 03/34] media: rkisp1: Initialize color space on resizer sink and source pads
Date:   Tue,  1 Nov 2022 07:26:55 -0400
Message-Id: <20221101112726.799368-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112726.799368-1-sashal@kernel.org>
References: <20221101112726.799368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 83b9296e399367862845d3b19984444fc756bd61 ]

Initialize the four color space fields on the sink and source video pads
of the resizer in the .init_cfg() operation. The resizer can't perform
any color space conversion, so set the sink and source color spaces to
the same defaults, which match the ISP source video pad default.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index f4caa8f684aa..a2dc6f60d9cf 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -411,6 +411,10 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
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
2.35.1

