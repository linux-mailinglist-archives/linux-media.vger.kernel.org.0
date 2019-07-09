Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66EB063A22
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 19:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfGIR0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 13:26:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40733 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIR0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 13:26:52 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so10444962pla.7
        for <linux-media@vger.kernel.org>; Tue, 09 Jul 2019 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t74l/7Ho3KTfFf8z1bhKb84MMgKUqFU6cOGTXd0d22o=;
        b=ayU203d+DAshrSBVZM+C+2OWO9YKDDltNwItjcUrszuGTiGmeEF14OKalCgnqmXBFq
         ropOhJFlvNd9BBtiiFZtnXf+6cuz1tPzgAf2DEEZEK8v4Q+BFxL4gzHhxgB5wvh3LagX
         HbF8oY1wCj6XBBKcaxD4NZl8x8eqnJt2yFNZgjrZKT3234zSHNoasitn9VtJEj/oTpyK
         FO+BaeavFyBAvB2d5w2HXHi30ylaXdhG4IIHQkVDfG8458MnzzyBrP0g1z6OqySelLzn
         KUrNNkTrZIZmd5/KxM1jOxEbpcAB59fgex1ImZgAqC9KTL0kVepV+oE9ggn+Vd8KXcBd
         COwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t74l/7Ho3KTfFf8z1bhKb84MMgKUqFU6cOGTXd0d22o=;
        b=MBzBFoq8hJ1T8oUcXf1OLrUvhwVJWKW2Vf5a9jZ/gP2ONuC0XqDv5jwthrcUqM8Ydf
         oFG2ydAAUkM2JG+AgQ1bys4WfkcY91i3ICxydm9uzqa2pAxtzlyhljgS73UhASnNaNwI
         pUC1ZYJPBxVfSq5mXCydYZ6XebkIHoxAjeLUiKnRUxL+i4lJpk4mk2H63/xhjh4544aR
         fESGsQb3HHq/sUXEDa3lzgWKYg25nZilLBjh+INhxleNS5aZI1eXxFIR7iCRF4IOE/BV
         qIJAQFchczg2OQ3T4eiM48yzuYbvGnhbNYJg+909oJo/8UGA0ylIoq5oUBzGSLS0ROB9
         TlWQ==
X-Gm-Message-State: APjAAAV0uZsRgYlnT1hPfU/Ma+HEF3nYF5v45Xj0rKXlky+IN+HutYL2
        KgQTdThyK7RjgrtLqIsFkug=
X-Google-Smtp-Source: APXvYqzagvQgxpkWBoGQ3221Xtk2wd6FuN3StqQ4TuWGwNS7AF7ExcYV2vfSrUta5JM9ztOvrP+21g==
X-Received: by 2002:a17:902:6b07:: with SMTP id o7mr32761093plk.180.1562693211746;
        Tue, 09 Jul 2019 10:26:51 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id v184sm23353696pgd.34.2019.07.09.10.26.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 10:26:51 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] media: i2c: tvp5150: Add of_node_put() before goto
Date:   Tue,  9 Jul 2019 22:56:40 +0530
Message-Id: <20190709172640.13711-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a goto from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
goto in four places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/media/i2c/tvp5150.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index eaddd977ba40..dffe357e9f7a 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1636,11 +1636,13 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 			dev_err(decoder->sd.dev,
 				 "missing type property in node %pOFn\n",
 				 child);
+			of_node_put(child);
 			goto err_connector;
 		}
 
 		if (input_type >= TVP5150_INPUT_NUM) {
 			ret = -EINVAL;
+			of_node_put(child);
 			goto err_connector;
 		}
 
@@ -1651,6 +1653,7 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 			dev_err(decoder->sd.dev,
 				 "input %s with same type already exists\n",
 				 input->name);
+			of_node_put(child);
 			ret = -EINVAL;
 			goto err_connector;
 		}
@@ -1672,6 +1675,7 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 			dev_err(decoder->sd.dev,
 				 "missing label property in node %pOFn\n",
 				 child);
+			of_node_put(child);
 			goto err_connector;
 		}
 
-- 
2.19.1

