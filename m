Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BDF324F4
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 23:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfFBVW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 17:22:27 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40706 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfFBVW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jun 2019 17:22:27 -0400
Received: by mail-lj1-f193.google.com with SMTP id q62so14282996ljq.7;
        Sun, 02 Jun 2019 14:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fz1ltyVFvVWw0/t6pPLFHhNIn1MdgnWyz2QGoYgJ52U=;
        b=CGUGzSnatSXJWaLOSZq3Mb4UjEy+vI/7kOY3a/2heaGwtjHRHjOE66/LeMqv/vQp6o
         Ff/nm9C/KRzryxYS5B/RmvAhQNOvGIUFfQ7Mn8PEOsxIrDTxsgyIJYR7vmwGr9huvwWQ
         laLnthk5eKnJeNtVxMk0tdNn5qJu+Gk9/T7chkKT2DWmlQ0iYsENBZ1cl1B/3eKPGI0d
         8nUQmO0hpaHoNLSKSXUUw8ZuSlo+mPTUPRDlijPWKTi9f4ZGqz2eLnuMJsKubpdVhl4O
         tI0/tT4w3BfBpE/BO8uroFnNAO0tmTlLzxnJOSg2Tx3srNG2Xhc+WkmJjTbEZrUdjYia
         Ox1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fz1ltyVFvVWw0/t6pPLFHhNIn1MdgnWyz2QGoYgJ52U=;
        b=tRT0kuErEGHG3lS4+PQmEe2wXx3cnpZFCQYx7NzWEHqEWs2yx2f/A9bhqzT3zp7vvs
         gkqrgQBI5kB9daRiPUfMkLgl6W37j/UXUhXbQLxsbvR5zBykpyCfep5Df/aMpuTKnHSQ
         ueXt0mkLlZFhPArf7rL2zq38JavUyflpRBfRKfzytzydg91QGdMfUR7EyWCfI7hokWTO
         WvXvVvKPZJ3FuYdW4Ijhbj3bd0eT2Hmz2Yu6zvUPgVYPNrQJhbyPtv3QRpwkivnHF9Pu
         B3xvUl8uwPf/G5fDpKXZPDpsoJVLSQa9k9zf5lA57tEdnncu+NTAuJM5M9xDbc+Y1QI5
         bxvg==
X-Gm-Message-State: APjAAAX+0ra98FJ62/y/RQJsj9/yUnLuca2pzSkpMRp6HbLLenzkbEdl
        iZaDnRJpCJndNoZndSFvva1rv0USQIk=
X-Google-Smtp-Source: APXvYqxvhE4gZ/BFQvzhcXN5ZGedfhX2RC5p6Tu43cmdMyaKqAO3/eULvdg6lBSkQfsToOfJ0v8gpg==
X-Received: by 2002:a2e:809a:: with SMTP id i26mr12499635ljg.182.1559510545309;
        Sun, 02 Jun 2019 14:22:25 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id j11sm2758551lfm.29.2019.06.02.14.22.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 14:22:24 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] media: ov6650: Fix device node exposed without proper locking
Date:   Sun,  2 Jun 2019 23:22:15 +0200
Message-Id: <20190602212215.26734-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit c62b96050bee ("media: ov6650: Register with asynchronous
subdevice framework") carelessly requested creation of a video device
node by setting a V4L2_SUBDEV_FL_HAS_DEVNODE flag.  The driver is not
ready for that as it doesn't implement proper locking required for
serialization of IOCTLs.

Fix it by dropping the flag assignment.

Fixes: c62b96050bee ("media: ov6650: Register with asynchronous subdevice framework")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 1b972e591b48..ace95ba7dd19 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -1009,7 +1009,6 @@ static int ov6650_probe(struct i2c_client *client,
 	priv->colorspace  = V4L2_COLORSPACE_JPEG;
 
 	priv->subdev.internal_ops = &ov6650_internal_ops;
-	priv->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret)
-- 
2.21.0

