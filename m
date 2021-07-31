Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC013DC474
	for <lists+linux-media@lfdr.de>; Sat, 31 Jul 2021 09:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhGaHib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Jul 2021 03:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhGaHi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Jul 2021 03:38:29 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917BBC06175F;
        Sat, 31 Jul 2021 00:38:22 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso17619804pjf.4;
        Sat, 31 Jul 2021 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EA3wjniiLlqc+AVcuHkatzn6kofQT99Lx9fge6sBXps=;
        b=UGGQC1i/6lFYHvjJjQYiB0dOC1qjvfbWgMrrW4J80rwl1EnQmKA+vNdsKFbpyBjDeS
         7zKNFolEoQ7OBH3wkfv7hw3IW7dA92svB/ILS0TAXIKl18EZIw9KB0B3UhLcSHKfthdq
         FzN/lYrKbLv/LQYg8gZnSsWJ6lWZbIb1aWoq8UXztCeEQ/O01il3x3cFiuy4AnHaWDxO
         olSq9AoBMC8VKbVSCbLfSp32AkhVkeaPd4mjReHf7mFH7Isueq7xrZjh1xv2FaLTGkxr
         hlumiSwpW5bvrnQjKdM0bJSsL7TrpiN5VsTHGuwUAZfPVuR2JdnUOYL4qKDUQVzj0w7V
         wuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EA3wjniiLlqc+AVcuHkatzn6kofQT99Lx9fge6sBXps=;
        b=sylBttCAk7wwzyo7XoCVHfwsZ2lWaAoAg/5ZFpglXndbT7uy///xPfIV0GuC4ZUt7O
         aDoRh0Ct/VoaizgX4H5jo7F2YoPoSGhR8HW92UYJHAK3hmvehD2zMQzclTs+RB/RgF3b
         5el9D6URuqAul9nM60lftRZM7865ecZR6zOMT71fvx35RyBiCWZVO91/uKeOIWfZnlGA
         X2oRk53E5VTeiieodYyJdrXLqVxAUPXBDVwbzrAt+bpFmbupNS92EAAKTRhQ68ssh6KL
         i8BtfVCjdidtS1fYfubSloDSWXBIM8372Z3MfdNzJfc74FZx0UwOc8u6pwTFBf2vWaZG
         S+hg==
X-Gm-Message-State: AOAM532OateEqOkOe3zhCOMUTJNuM7pf4UNghyf6zX+mHeQaP7WjNCQv
        P1JHBzdcb0hlYW2SEFcIXX4=
X-Google-Smtp-Source: ABdhPJyesMxQJNG/a7Frml8xmfbPsF+IczcYxIl7y8a3L666JPgFRwvhwFD+HuoJWkNcXybwIfkJCw==
X-Received: by 2002:a17:90a:e289:: with SMTP id d9mr6978080pjz.186.1627717102149;
        Sat, 31 Jul 2021 00:38:22 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.29])
        by smtp.gmail.com with ESMTPSA id f4sm5613408pgs.3.2021.07.31.00.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 00:38:21 -0700 (PDT)
From:   Tuo Li <islituo@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        baijiaju1990@gmail.com, Tuo Li <islituo@gmail.com>,
        TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] media: isl6421: fix possible uninitialized-variable access in isl6421_set_voltage()
Date:   Sat, 31 Jul 2021 00:38:06 -0700
Message-Id: <20210731073806.60142-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A memory block is allocated through kmalloc(), and its return value is
assigned to the pointer isl6421. Then isl6421 is assigned to the
varialbe fe->sec_priv. The function isl6421_set_voltage() is called with
the argument fe. In this function, fe->sec_priv is assigned to isl6421.
Thus the pointer isl6421 in the function isl6421_attach() and the function
isl6421_set_voltage() point to the same memory. However, isl6421->is_off
is not initialized but it is accessed at line 75:
  if (isl6421->is_off && !is_off)

To fix this possible uninitialized-variable access, isl6421->is_off is
initialized to false in the function isl6421_attach().

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/media/dvb-frontends/isl6421.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/isl6421.c b/drivers/media/dvb-frontends/isl6421.c
index 43b0dfc6f453..ea101f66ea88 100644
--- a/drivers/media/dvb-frontends/isl6421.c
+++ b/drivers/media/dvb-frontends/isl6421.c
@@ -185,6 +185,7 @@ struct dvb_frontend *isl6421_attach(struct dvb_frontend *fe, struct i2c_adapter
 	isl6421->config = ISL6421_ISEL1;
 	isl6421->i2c = i2c;
 	isl6421->i2c_addr = i2c_addr;
+	isl6421->is_off = false;
 	fe->sec_priv = isl6421;
 
 	/* bits which should be forced to '1' */
-- 
2.25.1

