Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02B0858E8E5
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 10:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbiHJIhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 04:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbiHJIh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 04:37:29 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F881835E
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 01:37:28 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id o3-20020a17090a0a0300b001f7649cd317so1504512pjo.0
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 01:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DlRTchSrzeAqXD0wdz67azlV3bDFmBslifJgwlEGxrM=;
        b=XiblQ0IjpoXyM6X8nG1Bqtjxl+4Rp39neB/BGQgF1rb/xUqeUS7R9Ojxxnp0hwZiam
         gWgc+4uN29aGkxpDLV906WmjMuTxi7boS0vwrB0q60mrq4JeEgmMSorVgA8xfwapewp/
         stAcBju6WaL03CGT/F9P/DzwBPk/wGamp4rKdwMeXasvjZ7lEFvfGvDitdQBnlPr+xuA
         j2LUvTQLykL167pOfsDBf6T8QOYtQb11SaIMh6aaFu3Ebx+4OBwETfjQi6xP4DxZMzG7
         ftoFdA9c6HYJhg+vztVE/xfuquZwv3ksxOM3RHN1UpDaqYLxJV0Vuc+Y/FKtSASetcxn
         IIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DlRTchSrzeAqXD0wdz67azlV3bDFmBslifJgwlEGxrM=;
        b=LTUDDPA4vg801fHlQ8448X8qHxvayl6UfucRxNRaBjCZ4uzWWalHVDw5DRcBgQfUQH
         CqhI6EBQ7czS8cYb5LFXcaoQ9tLoTi7fu+dTuD/g7T7yYekE+lZiSRzhg6V6a284R2Qq
         eujyhohK/xKZ1TvNqHGiQyTvF5eZRvgCZgjJDTOz5AvXUvQ+uTlH3LAaLQdY24PCrLdz
         K0uj5c4LOWIcMYkfPtnzisDliQ1W/yMb/Hexo0ak5S1PFPBXbj0CJeD+7oS0GfZyEkDL
         DpROITDoMMBYrPY2ekhYtgTPAXiK/nXwhymaYEK8oCnM05svYPwnIYy+WFoFWnrlwu/o
         oE9Q==
X-Gm-Message-State: ACgBeo1/zVvTB9BIMB0hCJOHSloL9v3WxavKMDbj1J0FNFY25uefnKa+
        Cj3Z4RlCutuVS2VZn9ztSVmyzA==
X-Google-Smtp-Source: AA6agR5u/K6sPizHHrobatXs/nWTKWNULiDkMsbUmVu44yCeLzjkRs56eKuLL6inCGwILPvj05VDaQ==
X-Received: by 2002:a17:90b:38cc:b0:1f7:2835:d45e with SMTP id nn12-20020a17090b38cc00b001f72835d45emr2494905pjb.177.1660120648422;
        Wed, 10 Aug 2022 01:37:28 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:37:28 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org,
        Takanari Hayama <taki@igel.co.jp>
Subject: [PATCH v2 3/3] drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE support
Date:   Wed, 10 Aug 2022 17:37:11 +0900
Message-Id: <20220810083711.219642-4-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810083711.219642-1-taki@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DRM_MODE_BLEND_PIXEL_NONE ignores an alpha channel.

Rcar-du driver supports only 3 formats with an alpha channel
(DRM_FORMAT_ARGB1555, DRM_FORMAT_ARGB8888 and DRM_FORMAT_ARGB4444). We
simply override the format passed to VSP1 for blending with the pixel
format without alpha channel.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b9580fcfec7a..7cce2d414ced 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -151,6 +151,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		.alpha = state->state.alpha >> 8,
 		.zpos = state->state.zpos,
 	};
+	u32 fourcc = state->format->fourcc;
 	unsigned int i;
 
 	cfg.src.left = state->state.src.x1 >> 16;
@@ -169,7 +170,23 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 
 	cfg.premult = (state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI);
 
-	format = rcar_du_format_info(state->format->fourcc);
+	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		switch (fourcc) {
+		case DRM_FORMAT_ARGB1555:
+			fourcc = DRM_FORMAT_XRGB1555;
+			break;
+
+		case DRM_FORMAT_ARGB4444:
+			fourcc = DRM_FORMAT_XRGB4444;
+			break;
+
+		case DRM_FORMAT_ARGB8888:
+			fourcc = DRM_FORMAT_XRGB8888;
+			break;
+		}
+	}
+
+	format = rcar_du_format_info(fourcc);
 	cfg.pixelformat = format->v4l2;
 
 	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
@@ -447,6 +464,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		}
 
 		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 					BIT(DRM_MODE_BLEND_PREMULTI) |
 					BIT(DRM_MODE_BLEND_COVERAGE));
 
-- 
2.25.1

