Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE803952E4
	for <lists+linux-media@lfdr.de>; Sun, 30 May 2021 22:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhE3UqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 16:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhE3UqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 16:46:22 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4326BC061574;
        Sun, 30 May 2021 13:44:44 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id o27so9500051qkj.9;
        Sun, 30 May 2021 13:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RL6cDeAlG0LBZMl6xb0WVuFtskFVdK/P7eLeI1c+lN0=;
        b=g5//hAT9Bss8X1RCcPDH7nH9hCTSaqv2DK4vQrz8cGkLk7CiN0HLCFVnn3Uu37PwVW
         h9uvpndX4cGh6gpytAtnvJQGNdHLDbTtvRmQf+sIBorXXFgsQadpDYc3HBCzXHKejUlj
         rvpIrw4fQ0GMSh1U2/9xXYXxSIUdYONdPGjY2HEWJG7A3pZJvp5KY7spNLh7Nwd37LkD
         KDycQGDe/FFOeeFd03DXXYCF/z9jf8k9031tPL9yydQfmuDEMy2WCQ/UkYyzxy2cak5o
         wfvFPQQpgtnwjpwKsiRkAlw98DiqxWgrALxsEUzKtsOL3Iux6/IHezH14sNuybiinBuj
         yp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RL6cDeAlG0LBZMl6xb0WVuFtskFVdK/P7eLeI1c+lN0=;
        b=pTZ2puxySqmiQHsVtKHadF7byt2ZbY+Jao66l/dvTpVt6LggLo/yTloDixldwefvdd
         J7P9RACDLrvYchdEu8lfnmjBXSe5j+CVcAZjaP1228T9samjDsQWF+IAgCLksukv7ub4
         Tt2hMmpnamoKsZ75SzMK4jBUtmCmWVNlKGSEg/0xgDaDczZFXDQI+dnd6keRRLuYJBeO
         u1nSVXagwDWNmnvFnI8c499X2tYN05k39PaCytiAxRbtPI7++/A8fcre5ZNxacFetgdD
         m3WU3mECi0HyLm88HVztqTr/Cz666XaxI6iuj1CYKYLgczJB9FwY2QiIoPiLYXPyVqha
         bXrA==
X-Gm-Message-State: AOAM531LPhikF+XZnQf9IOMtfBXHC1Qhchrr/vEsaLJ88NKR3JDeFYgg
        2LC0LfbGwoIvKsVw/TlbKg0=
X-Google-Smtp-Source: ABdhPJzUyKvLZ+PY0OMnWqctO3qvtMjyuCpz8On1AqREQYq7g99INlx7zjhuObPF/yCahpJKgnXR0Q==
X-Received: by 2002:a37:a9d3:: with SMTP id s202mr13693405qke.246.1622407483400;
        Sun, 30 May 2021 13:44:43 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:3dc6:a286:1b00:8f0a])
        by smtp.gmail.com with ESMTPSA id m14sm7192666qti.12.2021.05.30.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 13:44:42 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        frieder.schrempf@kontron.de, niklas.soderlund@ragnatech.se,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] media: i2c: adv7180: Print the chip ID on probe
Date:   Sun, 30 May 2021 17:44:10 -0300
Message-Id: <20210530204410.676831-3-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530204410.676831-1-festevam@gmail.com>
References: <20210530204410.676831-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the probe message by printing the chip ID version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/adv7180.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 2811f2c337fa..e5ef99f0460c 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1404,11 +1404,19 @@ static int adv7180_probe(struct i2c_client *client,
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

