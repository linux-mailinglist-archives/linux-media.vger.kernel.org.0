Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FAB273E1B
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 11:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgIVJJi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 05:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVJJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 05:09:38 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05B4C061755;
        Tue, 22 Sep 2020 02:09:37 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so2525535wmm.2;
        Tue, 22 Sep 2020 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r57iWCuDHaIWumoTfNxqkUyAoNSMqRJV6vH8XsPaOWE=;
        b=uN4TPm80jYkdN2XC8RAifrlrA4q12X3NAOIzWS/FS3Ib5qwbI7zo4U1iIdhS506IsW
         4Fmizz9zDx/iGQUgQ7opItOr9jOi6XoYAq60+o0qHsCSIMBOHxyQhNG50V4xPTrbn3Tn
         Zq7hoEG6ers70G5UjbEeGAbyS+o+6FL3/TXT8lDidnN0CtvGLhZ9AYYR/zNVA4Cirpvb
         QnUzG9gBCA8b35dbZtk4ogZjfnnq68f1MWy16zbJ2kRzJyZBdEsD0YI6w6qmM+DG1xqg
         KhjR3x+HqpFBVbrNFQ1Y3XWNzCaHrqfIHVmSFFsdneM4VtvTEiVms/LNYqEyqzKN5u5n
         LKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r57iWCuDHaIWumoTfNxqkUyAoNSMqRJV6vH8XsPaOWE=;
        b=JxHI8g1grXXtAllJxYkg/It5WsziOqySa8rhmlDfMcBVkKa+H6sF7SnU1trFo31iA/
         WV4Nmtb/0nZe8/ws7op68iVmdJynNSxx2cS2cDQfXW5vrLEfbylc6Ft9J4JNsE8vASCv
         bXxV4ua4vjTVYDxKZ6JdXvn0rDovNAVr0BqoDwc0+Qjr5+QatfxYpMUaXzCYJJ6E2q0u
         gVvPvLa8fRBsuXA7EfmVArWyGdn6Hkb4sKQThoLPsCrZEKdR4qz49WLBAu+uET78i5et
         v5nlbKd0zoW/wnBN9PVNm5RrSx4A+r69olTEqykX1WwYCOhT37Hqtx3PR9nN+wB8Myz+
         XCdg==
X-Gm-Message-State: AOAM533F6KzjEpB5xf02xKodRLzx4u+75KEIvkouNe92F8bhjaxLqis2
        4TpKb7q1I7DjCW0x3/FcL28=
X-Google-Smtp-Source: ABdhPJy/tuF8IskuK9u88sAZfrDy+NdeScFVkvl1Ds3OvsDQ6LYn4XC5UFFeMXSvCqSHDRGACRAkzA==
X-Received: by 2002:a1c:8115:: with SMTP id c21mr3499169wmd.153.1600765776638;
        Tue, 22 Sep 2020 02:09:36 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id u186sm3659332wmu.34.2020.09.22.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 02:09:36 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH REBASE 2/3] staging: media: atomisp: Remove unhelpful info message
Date:   Tue, 22 Sep 2020 10:09:09 +0100
Message-Id: <20200922090914.20702-3-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922090914.20702-1-alex.dewar90@gmail.com>
References: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
 <20200922090914.20702-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We don't really need to know that the LED pin reset successfully.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 67e62b96adf9..5e895586e80a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -772,7 +772,6 @@ static int lm3554_gpio_init(struct i2c_client *client)
 	ret = gpio_direction_output(pdata->gpio_reset, 0);
 	if (ret < 0)
 		goto err_gpio_reset;
-	dev_info(&client->dev, "flash led reset successfully\n");
 
 	if (!gpio_is_valid(pdata->gpio_strobe)) {
 		ret = -EINVAL;
-- 
2.28.0

