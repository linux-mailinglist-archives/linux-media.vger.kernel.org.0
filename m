Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9C326407F
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 10:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbgIJIt7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 04:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgIJIty (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 04:49:54 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC918C061573
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 01:49:51 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so4240715pfd.5
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=gJfJRPhS0IBX4pGFXAvxaZlTwLh++gF14l9b0EGTR/o=;
        b=j4rGsxINc3qUkDLpoVd7tvijRJChfl2RaPVuu2NJANn7AbybzPur9fy9/I13WwYUYn
         8orY8avHR48xSq6SruddhSMsd3xgPzQvKzspuqe8HBff++DYaWntCoVcce8Z4rm8oKFo
         vBYiUoKCjUOuTjnsl7qg4Sqb5fCf0fBuCU+kUo5ZvX2O6pzRe5bAEuyTVxYZmNrsON4p
         3F9oK+B+XvAe+JhNcaawIn87aCNvIVLPkO+asZUiqI9O+EfX2zJY1FcJ6I3/kjNhazA2
         H/O8s/0nfEYPY+7PICuo4tdVPkcBVLSv990rCn//Gw/IQDRG2kkIXfTM5hTbTQ7Gc5zK
         uRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=gJfJRPhS0IBX4pGFXAvxaZlTwLh++gF14l9b0EGTR/o=;
        b=BDJ6JWBd67TQSmvUm0YK8RKse8+HEsOzLbGL8q6gtw7Mc+Jsjk5jWlH+iwLrY7e9dP
         xA5LsoyONy1hbKoFL6UWqWuvqwBpQ1tt1LPeTvL0O2OFdgINX4I3YP8LmZWUzErscggE
         KH08DbxrP/vmUpnpbcZZlf20QRRiqc6svXS0c3OqmktoVTcJOs2HpFLbvnt0lpor0elR
         i1AJsD0cWDEO0LvrlXsGOp61ek4WGIlR9ZEs65Zl/hb81DZvrNJPxc6WoPWGyRuWpcKc
         gek5Ler/fOYMCBOB6ua+hCKTJih+CsIpegestpvukA29wdToBf42lz230/VK1iJWEOnf
         GrwQ==
X-Gm-Message-State: AOAM533IHoS9W0CU1t2vr5AAVfCwd0Au/700FUOAy6AcFkK6Gob2KlIk
        Zrf6ZJM8nGpl22bJDvJe9k7UUrmUOWPNTQ==
X-Google-Smtp-Source: ABdhPJxBRMyM3k0XrGqds+6SOJxmNl0BVrW2AdKSwX+FE9j5VyJWiuNoezWRFrfz523JFatyBY7urA==
X-Received: by 2002:aa7:8e8f:: with SMTP id a15mr4350474pfr.135.1599727790961;
        Thu, 10 Sep 2020 01:49:50 -0700 (PDT)
Received: from DESKTOP-VIRSTQA.lan ([2001:470:1f05:79e:bda0:9a34:f211:5176])
        by smtp.gmail.com with ESMTPSA id q190sm5318293pfc.176.2020.09.10.01.49.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 01:49:50 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] v4l-helpers: don't mix enum type with int
Date:   Thu, 10 Sep 2020 01:49:48 -0700
Message-Id: <20200910084948.8186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

warning: enumeral and non-enumeral type in conditional expression
  return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/common/v4l-helpers.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index e093e717..c09cd987 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -876,8 +876,10 @@ static inline unsigned
 v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
 {
 	unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);
+	if (hsv_enc == V4L2_HSV_ENC_180)
+		return V4L2_HSV_ENC_180;
 
-	return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
+	return hsv_enc;
 }
 
 static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
-- 
2.17.1

