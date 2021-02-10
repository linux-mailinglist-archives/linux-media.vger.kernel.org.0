Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E89315E0C
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 05:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhBJEIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 23:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhBJEIs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 23:08:48 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2831AC06174A;
        Tue,  9 Feb 2021 20:08:08 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id w20so707732qta.0;
        Tue, 09 Feb 2021 20:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqmBxAF2S/lqLqepzGI6ExvnAgzNlPrrveCuAjuPhBs=;
        b=FmbwPUlO9ocu0j3DIm9KR3GxzSfDF8uqPze9DIfBLVb7suMVkBD/DWC40oHH4ov2xr
         Sk3WnjjEw+NukO0Zrt5lo6z2A+25gxXSA6N2GLvzJXgfNzdI94fTV/e5hHmE033cUpnF
         dL0LKrr+/OGaJJ4g8GtsEHnoPQYtQAPnP03rEBMidRVc9bto5qVw+Gjc6vvrSuu4HhGd
         mgBvv+R6appuoKrIf7qAQHWa/XhVjKZYjANsKdewFitDF/GvrSkZ2F+ztFzKRAK4/bYN
         /8idr37QHrIIcMABZBmjaVimbwAOx+hgi2IoVcVTon7eJKcPRf6UDGLgkBsd0UHtc6te
         oEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqmBxAF2S/lqLqepzGI6ExvnAgzNlPrrveCuAjuPhBs=;
        b=W1roaRJ9ETgIxwgQc1rDJC3ZFJ78JzcFCED9RPHpW9EcXR9+B4XOdN7K0t6K9xDrsP
         idNSttYV6LPiMb+UW6tXWfboCYUY2I7BJVfG4P70B1ndi9haE5NXyObt1WUYuLgq6eBp
         4o30cmLE8kL+X3Umom3NnwBw5g7b6JhrPv0NyR6sBR9KPb5cuqnyXrKvcfRZTR5YuzSj
         kcXa9nbQ9ROOtrZudZmFk1AKBz/MTFZkjWDycWJmgvMpWt8BDMJlGaVUCV/KvjaeS6ya
         yXoRN5tAM5K2SVyaM2jCaVKzbayJlvB1B10ahCAvxNA7D/oJPCl1vEUgv/2zxMLlco76
         gOXA==
X-Gm-Message-State: AOAM530xv2WNXFIJLoQBt8qdyVOI+g9Zn39nu/bFh64KSdPvfNodoZbC
        wQCDEKC+erF075o9xfapxfg=
X-Google-Smtp-Source: ABdhPJxzmjanZOSeMx6h6VOUNseHcdIU6gZ9O1yspL7zZKxxC9R0SyTNAwMMVJCwUeJaIGAnsjyYAg==
X-Received: by 2002:ac8:3a63:: with SMTP id w90mr1183698qte.300.1612930087390;
        Tue, 09 Feb 2021 20:08:07 -0800 (PST)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:7408:b5fb:1cd8:ad04])
        by smtp.googlemail.com with ESMTPSA id q3sm668209qkb.73.2021.02.09.20.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 20:08:06 -0800 (PST)
From:   Tong Zhang <ztong0001@gmail.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ztong0001@gmail.com
Subject: [PATCH v1] media: ti-vpe: cal: fix ce
Date:   Tue,  9 Feb 2021 23:08:02 -0500
Message-Id: <20210210040802.1069235-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FIELD_GET require mask field to be constant, however it is wrapped by a
function which will cause error

././include/linux/compiler_types.h:320:38: error: call to ‘__compiletime_assert_270’ declared with attribute error: FIELD_GET: mask is
not constant
  320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

redefine cal_read_field as a macro

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/media/platform/ti-vpe/cal.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 4123405ee0cf..d73a4a3b99cb 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -215,10 +215,7 @@ static inline void cal_write(struct cal_dev *cal, u32 offset, u32 val)
 	iowrite32(val, cal->base + offset);
 }
 
-static inline u32 cal_read_field(struct cal_dev *cal, u32 offset, u32 mask)
-{
-	return FIELD_GET(mask, cal_read(cal, offset));
-}
+#define cal_read_field(cal, offset, mask) FIELD_GET(mask, cal_read(cal, offset))
 
 static inline void cal_write_field(struct cal_dev *cal, u32 offset, u32 value,
 				   u32 mask)
-- 
2.25.1

