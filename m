Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410CF32FB2D
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 15:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhCFObH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 09:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhCFOaj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 09:30:39 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B58C06174A;
        Sat,  6 Mar 2021 06:30:38 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id z7so2830463plk.7;
        Sat, 06 Mar 2021 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=sTssXhzPVHELqYGgO3fz4klNiS/VEUisGSmKd9f8OhM=;
        b=HuQ2h7BO1J26rYlSbkXhPkHeTa31R9GDqcv0uc8nS0qTxiTxiEHn21uUSeY0cgsuwj
         gu/dqp+ZGniDlkbL1k29e670cmSUN6+TI9YL+rHjCIlSMyx6rEHgOnY+h/6Ajb1pmdhi
         bZCTGR3M4hbzoRN/v9C+H6QTceuFhEk0QMzFCu/ud3b2ezL82ppwDqXZ/7HJ9NjNX49u
         us0GtXtqIXO6TwLZp1tmqYzR2Fi4CLY8YM2SkWrbTHVHZcNiMtooQU2FF4X8uAZOxZbt
         OHrWmp4WFup1B4iUpNemc6HY9AU0IOmjDyNk18A/jota3Np4ucNBtYCV8MvvvW+0Qlsa
         GujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sTssXhzPVHELqYGgO3fz4klNiS/VEUisGSmKd9f8OhM=;
        b=V4cJyoJhGioIgt/tH6hUbMzmJO2xELK5HVc5XbHR9QpVt/LqwlHzoV2IuKygCtb/G3
         nF7qN1ZbK8itbJrrc9Hp5Qo+g5Q4IbkPALIFT+aa/1adxqM6uyV4lMB1gJ87FIwt1WKD
         G9bKlN4NygwDU3Zih4lCF0zfGkZE+u8WgaOmkwEutcTUYFXJNgOJnGDlGaWb+QRAoP9+
         dobLdHOnRtAjfUDYWj0HgoQXbSKMwbQ2stei3PjYqzZLuTKocLBimDVtcw1Xse5kjEKD
         Tu9XTGmFFN1qF8j1Ah+NOvYoRo4r9K4X1Kvdbw8wgzWM3PEK9ZLT/BAp4bTADRBzx0s1
         YrDw==
X-Gm-Message-State: AOAM532q7YiyPxyqTgCwHk2veO67/HSxq5mgmGNJ0DbLAPQd4csMC/ZC
        lEzXOpz1C4uOPcCWCskynLo=
X-Google-Smtp-Source: ABdhPJyFJ8DmP3ei8Huw6ZEmDB/k8/yjBGWR/xlpU3kVtqkfzRneCKLjp8JOhIihK373TGrSb3aWzQ==
X-Received: by 2002:a17:902:e54c:b029:e5:e7cf:d746 with SMTP id n12-20020a170902e54cb02900e5e7cfd746mr9398991plf.56.1615041038383;
        Sat, 06 Mar 2021 06:30:38 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.79])
        by smtp.gmail.com with ESMTPSA id d24sm5546288pjw.37.2021.03.06.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 06:30:37 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: tuners: fix error return code of hybrid_tuner_request_state()
Date:   Sat,  6 Mar 2021 06:30:28 -0800
Message-Id: <20210306143028.19457-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When kzalloc() fails and state is NULL, no error return code is
assigned.
To fix this bug, __ret is assigned with -ENOMEM in this case.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/tuners/tuner-i2c.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/tuner-i2c.h b/drivers/media/tuners/tuner-i2c.h
index 724952e001cd..26cf7da29f30 100644
--- a/drivers/media/tuners/tuner-i2c.h
+++ b/drivers/media/tuners/tuner-i2c.h
@@ -133,8 +133,10 @@ static inline int tuner_i2c_xfer_send_recv(struct tuner_i2c_props *props,
 	}								\
 	if (0 == __ret) {						\
 		state = kzalloc(sizeof(type), GFP_KERNEL);		\
-		if (NULL == state)					\
+		if (NULL == state) {				\
+			__ret = -ENOMEM;				\
 			goto __fail;					\
+ 		} 							\
 		state->i2c_props.addr = i2caddr;			\
 		state->i2c_props.adap = i2cadap;			\
 		state->i2c_props.name = devname;			\
-- 
2.17.1

