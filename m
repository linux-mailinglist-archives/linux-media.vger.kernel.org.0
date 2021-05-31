Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB033959A3
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhEaLYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhEaLYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:24:44 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CC6C06174A;
        Mon, 31 May 2021 04:23:05 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id c10so7654871qtx.10;
        Mon, 31 May 2021 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mt7POv9PaCwKFvdwIODXsLJlyClKZZS8dpjMNwC08Rk=;
        b=FpkAUxBHyO6WxH6MjvrfYwHqOShz/gWIonA+Zb6HgAqE7r/GxLuo7uPfudu/hlT4Cz
         EvoMTXEi8geOdv0lx/bn7vQDJIXeSoBupCGmZZfQ1sCCzNIMy/+0X7zU2kt+KNqGIhp3
         MhVs2rNyUU5oP+zHJG6kfWdlOMrj/HN83OAK3AKPzG25FDxOF4TkZitdjQ+UVjXVxpTi
         5KKji0u8fvXeyel7lUPyDgyCvXztM0CfChX2TKFs8zLMM4lhB2C6wnkICSmNRZYtpZjA
         F0/RajNllgXEK6ftJ4FaprWp+O8at6YCo46gLDFWaUZPbGIzSUnMTNCqJrifVIWyfyN1
         qB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mt7POv9PaCwKFvdwIODXsLJlyClKZZS8dpjMNwC08Rk=;
        b=RQCwh0SDrwNJQ5HzMLuB/He2QnXNk5MtKtoFjY5cWZOCGOBnCw/6fjgl3j0mCOrogc
         R1rcjqxrFRGxlfn7d+MeCZbrpUFr+mFiJA7bnhBYokZ0WTa4RgskgXxJu9+hWZWF+vpz
         fsbYctFWnQ7Kjdfc/FCNgfjhVcL151OEM/pIThDvBMpsmTmOAOPLyghLVjlELdVObaX1
         nQ1kRyv0vb3dQNhrBphZ6BNdyX4Jxl/374uXnDn5yFrzfsai0vHWCR08pjo11mNrpnmF
         TWZUMbqBJpJKzpVa14yFy1JsHf1Uzm2yU8G9mVS1OePRcWAaLVTF3xh5uBihplm3aigT
         UrSQ==
X-Gm-Message-State: AOAM533vEJ+YVAs9RO6wqNkKvdulKFiu5m79Ho4no3cOX3JZ1lXUeo+Z
        xJL+/0Lc2AhKnCjnbJaAXBY=
X-Google-Smtp-Source: ABdhPJxzSZAUeVtEqtOK6G/lO950T7d9LNRDEcB1h+2IPLpRndsKnrbArB4s83shNBHe9LfY3fRZOw==
X-Received: by 2002:ac8:51c4:: with SMTP id d4mr14458594qtn.186.1622460184409;
        Mon, 31 May 2021 04:23:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:df45:f91c:ea2e:9334])
        by smtp.gmail.com with ESMTPSA id h5sm9105480qkg.122.2021.05.31.04.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 04:23:04 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        frieder.schrempf@kontron.de, niklas.soderlund@ragnatech.se,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 3/3] media: i2c: adv7180: Print the chip ID on probe
Date:   Mon, 31 May 2021 08:22:37 -0300
Message-Id: <20210531112237.706063-3-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531112237.706063-1-festevam@gmail.com>
References: <20210531112237.706063-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the probe message by printing the chip ID version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes since v1:
- Added Frieder's Reviewed-by tag.

 drivers/media/i2c/adv7180.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 2890041cc231..4f99b46e7eaa 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1415,11 +1415,19 @@ static int adv7180_probe(struct i2c_client *client,
 	if (ret)
 		goto err_free_irq;
 
-	v4l_info(client, "chip found @ 0x%02x (%s)\n",
-		 client->addr, client->adapter->name);
+	mutex_lock(&state->mutex);
+	ret = adv7180_read(state, ADV7180_REG_IDENT);
+	mutex_unlock(&state->mutex);
+	if (ret < 0)
+		goto err_v4l2_async_unregister;
+
+	v4l_info(client, "chip id 0x%x found @ 0x%02x (%s)\n",
+		 ret, client->addr, client->adapter->name);
 
 	return 0;
 
+err_v4l2_async_unregister:
+	v4l2_async_unregister_subdev(sd);
 err_free_irq:
 	if (state->irq > 0)
 		free_irq(client->irq, state);
-- 
2.25.1

