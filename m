Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19CCA7E008B
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 11:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346151AbjKCHjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Nov 2023 03:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbjKCHjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Nov 2023 03:39:35 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FC019D
        for <linux-media@vger.kernel.org>; Fri,  3 Nov 2023 00:39:29 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9d242846194so258640766b.1
        for <linux-media@vger.kernel.org>; Fri, 03 Nov 2023 00:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698997168; x=1699601968; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+1fX8kJBhzdwigodozxrwdBIS/K0K2HiycV1It+8hk=;
        b=el27EnVHz1u+nyGidUu54/BMxy3z8NplabwfkhQoTrRUdFShKr26BkBW4x9h3dlGsQ
         2R8Y2Dp8osGgAZ4tlr2OR9citKoPZY9xtqk6eATM425CGoJihf6wb7GrysNkTVt6cvoZ
         XWI6oFhcJg4pyqPxIcU3GE9HN2X/3bNebC+gb++OHU4wWQQw/36Tm5LmJGpBka+C1h+g
         akEYOj0L4RXeQuCb9CKqbkRj5AvhiX/xLUebn3Ch43PBTh0uxXtQy7Cv6gZYFGPzpwP9
         1/ur9sAhdQ0L5S9mB7rXynLXiS/ZwsT9y9ELIwp/Pzt185dTUhlt9pjytWZxXIW80j1d
         1fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698997168; x=1699601968;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+1fX8kJBhzdwigodozxrwdBIS/K0K2HiycV1It+8hk=;
        b=Wl/yChtuC9Gfl7NhsAAMeUIc3xpUiEnwYxmWF5uRvYeJAQzLoNDgG35hpZTZ38sKX6
         qIWzGJzbuTE5104YCy6HnPsBEyR1ZhEcL/VACuogDWih8sf/KSDmfzqf5HD2Z6JaT4OQ
         yV4DMRcUMqK9iCLMnHtR2F71yTm5+q2mET7BufVPju8EOX26nK8ht/E6kZMJ90npJ4r6
         4vEW1V60M7xpef7ZS8BK5kvSpLJvB8VSgSmmMi8xidNJXi+vpL0VQMVsqlC7xvhTiDI1
         OAdGNEmERxbf72wJD6okDp3ndAbCZBZLQZ/QxwNXEmUd7Wlf1Sm7rDmjw38s1oFEHGdt
         Hgvg==
X-Gm-Message-State: AOJu0Yy/2maYsg4tjG18YmzPzYEDJ3hcGrp6tK75ugnStT3x4w/DRcZs
        6d11ujNmiFz5KiY7TN80A/PKfA==
X-Google-Smtp-Source: AGHT+IG3OoW+Xxvx6gQD2giIbs91cb1d56EdFI8iHQYAo+XeIp+1JHaoMLP9xUiLWRXwXnMXYSe0Qg==
X-Received: by 2002:a17:907:86a7:b0:9be:ab38:a367 with SMTP id qa39-20020a17090786a700b009beab38a367mr6724881ejc.16.1698997168135;
        Fri, 03 Nov 2023 00:39:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n5-20020a170906840500b0099ddc81903asm591965ejx.221.2023.11.03.00.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 00:39:27 -0700 (PDT)
Date:   Fri, 3 Nov 2023 10:39:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <b9b0c0c8-6ece-466a-99e4-d49797f69957@moroto.mountain>
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
because it's a 32 bit variable it accidentally clears out the high 32
bits as well.

Currently we only use the first bit and none of the upper bits so this
doesn't affect runtime behavior.

Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Don't use BIT_ULL() because this is UAPI.  Also fix a couple typos
    in the commit message.

 include/uapi/linux/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 4a195b68f28f..b383c2fe0cf3 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
  * set (which is the default), the 'stream' fields will be forced to 0 by the
  * kernel.
  */
- #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
+ #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1ULL << 0)
 
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
-- 
2.42.0
