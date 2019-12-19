Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6862B1268F3
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 19:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfLSSXR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 13:23:17 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35765 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfLSSXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 13:23:17 -0500
Received: by mail-pj1-f65.google.com with SMTP id s7so2922370pjc.0
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 10:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gPMrMi1zLN6OA6/X7P7gnmwAhoOj6bYlyFbNpwO69Qo=;
        b=gUtZSwI5Ulzsmc54LykF+cv8X0Jm7Kfs0WesiUq0DuTQnyoBmI/riCz285oek9SAJG
         p8V+AqewtM6MuinpONWRY9UqrOZCI3wcAp7DBhj8JS4DQTdiSrOLwRGRj/mQuohbSG83
         vYk2w01/bsKxzy+QiBpNlxXiTNiUGUlNAPiB5xnDFX90vcVlcMlFZVmZYkr5TYtHjQP3
         MQheafVzi8xnyP8NoAbWCD0ZxYh6PnvPmBgSvwYRvyFzE0wZDwrlyD1q3KpDplaTs90i
         TVGECp5NmtJo22/ecbdc1F3qfAk4oDAz2LFAXQmLNCdtQSmvn9SxirD0PyOhFISwXhKN
         t3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gPMrMi1zLN6OA6/X7P7gnmwAhoOj6bYlyFbNpwO69Qo=;
        b=QM+B1IBzTJT4QFc2/t++sXQP1sXDGTSHVJM+S4uCIbmNag9bkEz8AzeMpOysKyXOoP
         0Ded8eYU8KPB7Obh/do7FeVhv2pGsqmeJlNSklBEzMnqNHp60P+XKolqMYeqxoPKh90c
         B38YBqTWHBRQlmPdzfRpcJr0lkhjT4Y0x8AL5YxxvS50xVV+3uCkK9PYfedj32W6r/h5
         y2dBelKuZPFdlnocJKbQpEn4iGUN591tLzwP9JqiOoq6DhJTUb4gtuIN02TtFSOzbd1l
         vaFphU87RuI0Xd22OrGDFXlRJYFMFf4r6H9ZSLnD8x33xI0CLIEl9OMN9imeySLa8444
         l0SQ==
X-Gm-Message-State: APjAAAXBousdHPvMtUgqgQ83g4hZeAJqFRpY+PYNkGF98pOz23wbbt3A
        JJsBNYOV1+7UdMstZT/SaG2m
X-Google-Smtp-Source: APXvYqxh/cPkFck6sf3vfEQMX1np7F99b/uUWokTEajJPRHT+C0oBMl9tibCAQmI8m6PYTrdepN4Vw==
X-Received: by 2002:a17:90a:9f04:: with SMTP id n4mr11080250pjp.76.1576779796548;
        Thu, 19 Dec 2019 10:23:16 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6010:65a5:a416:e9bd:178a:9286])
        by smtp.gmail.com with ESMTPSA id i3sm9085735pfg.94.2019.12.19.10.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 10:23:16 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 6/6] media: i2c: imx290: Move the settle time delay out of loop
Date:   Thu, 19 Dec 2019 23:52:22 +0530
Message-Id: <20191219182222.18961-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219182222.18961-1-manivannan.sadhasivam@linaro.org>
References: <20191219182222.18961-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 10ms settle time is needed only at the end of all consecutive
register writes. So move the delay to outside of the for loop of
imx290_set_register_array().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 52f1e470b507..fb6d3f649a5a 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -344,11 +344,11 @@ static int imx290_set_register_array(struct imx290 *imx290,
 		ret = imx290_write_reg(imx290, settings->reg, settings->val);
 		if (ret < 0)
 			return ret;
-
-		/* Settle time is 10ms for all registers */
-		msleep(10);
 	}
 
+	/* Provide 10ms settle time */
+	msleep(10);
+
 	return 0;
 }
 
-- 
2.17.1

