Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32EF6A7457
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfICUND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38883 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfICUNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id h3so10514136ljb.5;
        Tue, 03 Sep 2019 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bEcAPc5QA3wF+/4wLcZWH7jU+CdtRX6IAxGP+R1Ah10=;
        b=Vh/OUISBTVP0NkGSkNqB95kQyQUBjvw3lj23q2dEfU1UsgTSSmXDJZP6GZt/WrScl1
         e5E58pVLrAIJ84qhSlcbai1PwuCLOBLEiGH4tPD8eOYsa/RolQS0Ic1YFxgNnZKFn9Nh
         I7/DDvsSOtSD65bdoPJfDcVEyEvgZ/BNMMkzQHUhWxK7PXKgF4XJA8k0/2aZXl5tZvie
         QMV5SkobgGkcNmz28fe2DpLuGiDPxZowqEE14LL3qMLquDCRhee98kVnJ+JBF1/eWLBC
         XbGQN0tlktJpHdeGaFU740QAQ5RH4qMIPI56zrYWsvYCvLuuDqC3G3ior9lBqXc/6vFC
         iI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bEcAPc5QA3wF+/4wLcZWH7jU+CdtRX6IAxGP+R1Ah10=;
        b=H6w2NRV728kDY9qbzDd8DlR+j9+C18/gmiZMHKox9w9GFaJDn+5QB25I5Q+hD8uao5
         JvdupwP46YwJTPsRFi3qePCivN81DmjqmIAhFbq5dnfJ5ECt/toteHq2/8RwwgH9eVmc
         Ajba94wb4vUuRdW2IHhZh4sjEBo1+8bQ36cqHQ/sbM/2fyMJTcdSWYCcpjNsf/Vpe8Zm
         +6l8ptlLjrRcB389B93HbRf1Tu7FK4P9Q57cA3qdGcLDiL4Nju7k00XnRZgVX/mndD9d
         naivYmGoe1v35fxS4YbYZwIm3WYCxDHrTZiMy1EXfZnBLxgWHCrYu02An6PuNEgMfICr
         Z23A==
X-Gm-Message-State: APjAAAXH1RpqZqJ5/xJyTPbHSDpy3mgpJwqy9Quucc8gmsxl6gz7B2OQ
        L9VyZSm74LApITlydstFjpc=
X-Google-Smtp-Source: APXvYqwsNdbQFWygN50xYCTgNU+i01y5RV/csJGkJf33FA3Jkcf56+4t0thjpVPRQ3Z2nqAGXUFVXA==
X-Received: by 2002:a2e:5c43:: with SMTP id q64mr21009365ljb.14.1567541579705;
        Tue, 03 Sep 2019 13:12:59 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.12.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:12:59 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 1/9] media: ov6650: Fix MODULE_DESCRIPTION
Date:   Tue,  3 Sep 2019 22:11:36 +0200
Message-Id: <20190903201144.13219-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 23a52386fabe ("media: ov6650: convert to standalone v4l2
subdevice") converted the driver from a soc_camera sensor to a
standalone V4L subdevice driver.  Unfortunately, module description was
not updated to reflect the change.  Fix it.

While being at it, update email address of the module author.

Fixes: 23a52386fabe ("media: ov6650: convert to standalone v4l2 subdevice")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 5b9af5e5b7f1..53550cae2353 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -1041,6 +1041,6 @@ static struct i2c_driver ov6650_i2c_driver = {
 
 module_i2c_driver(ov6650_i2c_driver);
 
-MODULE_DESCRIPTION("SoC Camera driver for OmniVision OV6650");
-MODULE_AUTHOR("Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>");
+MODULE_DESCRIPTION("V4L2 subdevice driver for OmniVision OV6650 camera sensor");
+MODULE_AUTHOR("Janusz Krzysztofik <jmkrzyszt@gmail.com");
 MODULE_LICENSE("GPL v2");
-- 
2.21.0

