Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE2152DA46
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 18:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242041AbiESQaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 12:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242055AbiESQ37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 12:29:59 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B814AD809D;
        Thu, 19 May 2022 09:29:58 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id v65so7057121oig.10;
        Thu, 19 May 2022 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
        b=GopHsktLl1FQHiOTG2Rcl7tq6cJcuAMLUPz/tIktAVi4pFMYnsHSyGZ/yNj18WFDUC
         qVvLfkJjJBsrQ9FK3hKmBv/G2kWYIIGctov/JcnxBJpj6Fo2Dq5vH+K+7J1L7e3ChsVa
         oAlXRfBGdaapF58zbqZnvfDY2J/15YRO/sx91miCOxpNhbrH1aACE9iUw3kp/XAd/jXG
         ofWGsCWs9xkx9zdWP8X82Sp5A10NP+d+jfb8DWv6t59TgMlOZBxPdhYxOKuSVmklg2NU
         v+UThHdaGO4a2MCA1BahEdkdwuOOSV8jATDUHhwsurxzLnXZY8qRsUj4SWzrHpMK2+LW
         wt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
        b=T8RUsbMGELUCmtmzg8T8jFGnwT0tVYkCkm5CFVN2bqyHlDLG2b8e9p4eOEXAQaFkpw
         VZCxo8MGClQhVKLPveD0buAnKt/bH8wwSJJWNcHl5SWck2wDaxmJrzNtiPcShrRbrt1P
         6RSybmr3VMwZiknDbujUU5AXom8D/eS67QY3U6eKfebHhKeuddYSVKr6lgjMNP234U1V
         aw7HbOi6lUxXAGRSRTuPsTHyJftq8XZCeJXfUQkS7OUO8GWF8cih0H94HuFRgq5xa/z5
         dz7h2af4BNmjo9h0NYtEWNF+3VkhSjTgC0DGCo6ixbgfC3awEW6TTKPAyFTIOeSIxpXJ
         TnAQ==
X-Gm-Message-State: AOAM531crKHeDg9fhJT/Ptm6DtUqjuaJZz1IRDA3YC8NVUuRaih0VKIr
        6OXCRZxk1eIaUhnUjk43JfA=
X-Google-Smtp-Source: ABdhPJyRSED3NYB6g3npUapZBROIw+TePvZdH0R/K6jTKuECnoY/NSeSywuMIYCDp1g99Vxzp2Wo5Q==
X-Received: by 2002:a05:6808:ec7:b0:322:2bcc:42c2 with SMTP id q7-20020a0568080ec700b003222bcc42c2mr3283588oiv.168.1652977796926;
        Thu, 19 May 2022 09:29:56 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 09:29:56 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [RESEND 6/6 v2] drm/vc4: dpi: Support DPI interface in mode3 for RGB565
Date:   Thu, 19 May 2022 11:29:35 -0500
Message-Id: <20220519162935.1585-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the VC4 DPI driver to utilize DPI mode 3. This is
defined here as xxxRRRRRxxGGGGGGxxxBBBBB:
https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi

This mode is required to use the Geekworm MZP280 DPI display.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60b..3c58ade25 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -173,6 +173,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
 					       DPI_FORMAT);
 			break;
+		case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
+					       DPI_FORMAT);
+			break;
 		default:
 			DRM_ERROR("Unknown media bus format %d\n", bus_format);
 			break;
-- 
2.25.1

