Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27164498564
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243981AbiAXQzl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241260AbiAXQzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:55:40 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C31BC06173B;
        Mon, 24 Jan 2022 08:55:40 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id z25-20020a0568301db900b005946f536d85so23039068oti.9;
        Mon, 24 Jan 2022 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
        b=mFvJkRflVMDxfhilop3n9rxvfDmP9BLPXOUunIlHCZ0Xb9y9Ct8IxqFF8rwK469lCm
         KNd50fy+6iX6SJc4AnCBNCrWinPWrZllHsjTCq/S2JBPLb1Fh0Xi6tATKKE7erd/KEop
         Q895XDQnVqwakbu7dAG+gaEyBVuv5/uHjtGQquhJ0ZAuMd8FGRlNp3JsZ+WddCEvdc2o
         SA4cUOrs3H6g5jKBY4lJc0Byhcri9T6H5g0YhQIrR/7VCnw3atyr03X9NzMu8tURvqBm
         KgSjAKpZXzdR18JFpsLFpX2/2YiqEPZAATvRYBEx3OhedscwGW4cfcSYTbOEvCE2AhDD
         D3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
        b=IV1mKm2BcHE/LJs/RA0nn9YWaQ8NqTWGPx+9Q8nfx62gaVP5MzZwUJCft7i0VzvFbE
         WZgM4Pw3GWq9kXrllCkUDoXSJTSnt0iYkG4NGBBu6U18QhKTWvoPAdpQQf7btv4oDE9g
         TeCyZN7BnZ13J8zhz5viA66PKWIbwzNViQ5gjBsKUpSZW2NIRBfgTTjOQdhgiCeTSKmB
         1IJ18koBdcxzlCduLx6wmwhVEDsQUX0vCmUrQvgz7qD6atKas5dQ2S13jr5bUQwbHKBr
         mJdcZ/1dpIOOr5Jt9vfNn+5p3aHUl1W5e6Ath13opcXJy0tywISf0wmlmGrHqm2BDdW4
         5zhg==
X-Gm-Message-State: AOAM533sW4sdDBclaU9u+uwvVMJeQzxTUKDaB0mIm2+tnUghzsfZzqd8
        /4LrAnLbGao8XH3RTwvDCh0=
X-Google-Smtp-Source: ABdhPJxc+R5TUybGMgkLTdOCbd88m7UuIygCYWDxjJSp/RRfiTE1CbDPHurAbusUCHTR37gsZpmKdw==
X-Received: by 2002:a05:6830:2461:: with SMTP id x33mr2805442otr.368.1643043339780;
        Mon, 24 Jan 2022 08:55:39 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:55:39 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 6/6 v2] drm/vc4: dpi: Support DPI interface in mode3 for RGB565
Date:   Mon, 24 Jan 2022 10:55:26 -0600
Message-Id: <20220124165526.1104-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

