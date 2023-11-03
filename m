Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7ED7E003E
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 11:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbjKCGeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Nov 2023 02:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjKCGeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Nov 2023 02:34:37 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A85C1AB
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 23:34:30 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9d2e6c8b542so245468066b.0
        for <linux-media@vger.kernel.org>; Thu, 02 Nov 2023 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698993269; x=1699598069; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUSFDpSLRhr004/t6MtVre5IXfBX4gh3FzzO4X/g14E=;
        b=ZQHNXNdWx+dHhfTpf6HaNPxoUrQnAwAaqgxXHg3Imgf85GJpuLC+Ys/nrul43cLvaG
         hS3/bZ6G4kGMqh1VjqlxpuBhlOKb6nYKpRWnHaJhigTls+EVOXvHTQJM6ZX5wtm+Vf66
         aJpALyJNMmJJZlK7SrKZ16prYUaOG/AthIviqWbbPu4SWVIaB7wz2qKotyrR3EzbwU9I
         mD6biJb8Z6XmOv0TUR7wXDpynMNYFYLVNfFm9u8zX4aTVPoINY90idOvPxhYEjKROyKD
         WwodZLZglBUDc+5SzkQ+hPslLxTg26tDlAUNykpkCluWmV7BV4GyCRBqNHFXI3TUkeZG
         jtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698993269; x=1699598069;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUSFDpSLRhr004/t6MtVre5IXfBX4gh3FzzO4X/g14E=;
        b=ROfnC1gwL6MBHNC54OXAWqEXbApvdibwTd3hOCNto6/whnVOHPzrp6/FaOtZaWQI5D
         Im/jexJursRmKG8KXB1q2pPxsRz6r7RZnS/2arEIbpuWcsk03laZR1dAUIlv2iI4BafW
         58GYzsodvoqLsNkGhnJgFtq3i/Oibv1YtkR1mDE8tVF4/lAEvOhq2PRUm4ttRNzLK0Kh
         EyJcxyZ6y1N6r85lBiFgGBGo4UQH2gC1WPnVLf/LS1d//VASrnfgwQbLlNQtiC6lFBOE
         PPOlZbLUadZ5/UNsIhkHX3CzwSbvuWrY+GdrCGFzWPdmReuaYxovJo8W5oPoxrEpKQYX
         gY5Q==
X-Gm-Message-State: AOJu0YwiSfOfXSgAOg/N7QRgyxgGDFnhTo3DyElDsvclu/WG4KuXLArs
        1ORXBO0rb6TApqqNb+EF46KiAg==
X-Google-Smtp-Source: AGHT+IHUxr/13ZJwmsjF1s1nibtvQQcOSPGuNRBFGnGJ5rb0tkUfVpIIYcuZ3a6a1INjx2OCw2fBig==
X-Received: by 2002:a17:907:a687:b0:9db:df62:fd82 with SMTP id vv7-20020a170907a68700b009dbdf62fd82mr2546315ejc.31.1698993268925;
        Thu, 02 Nov 2023 23:34:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gu13-20020a170906f28d00b00982a352f078sm534511ejb.124.2023.11.02.23.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 23:34:28 -0700 (PDT)
Date:   Fri, 3 Nov 2023 09:34:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The problem is this line here from subdev_do_ioctl().

	client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;

The "client_cap->capabilities" variable is a u64.  The AND operation
is supposed to clear out the V4L2_SUBDEV_CLIENT_CAP_STREAMS flag.  But
because it's a 32 bit variable it accidentally clears our the high 32
bits as well.

Currently we only use BIT(0) and none ofthe upper bits so this doesn't
affect runtime behavior.

Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 include/uapi/linux/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 4a195b68f28f..21d149969119 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
  * set (which is the default), the 'stream' fields will be forced to 0 by the
  * kernel.
  */
- #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
+ #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		BIT_ULL(0)
 
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
-- 
2.42.0

