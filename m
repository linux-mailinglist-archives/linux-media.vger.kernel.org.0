Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B95C13AAA
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfEDOkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:40 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39995 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOkj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:39 -0400
Received: by mail-qt1-f195.google.com with SMTP id k24so6240001qtq.7;
        Sat, 04 May 2019 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c7G9mJrY8Tv8lVtdImCY5iGpFlSSDAqtE39f9pCz3/E=;
        b=DF6RQdlwOAX/Xcd8h9ZqprdPrTnGaUajmILD6byS2HoxbQ5nnQNOe1+w9kwOX0WBIV
         oTPRd7nftajG4ki/F9Rj0yMWaLBUL03v9CobPTY3ua8jyLqa5W/Fz2FgD6taRojX33HN
         HkHf8Y/H8IX1703dQEwCmWxdBZD08duhDvY1ZlsyQPuWvsMG3VrkhyuiD9LgjauuhTyI
         ZKezncCXa2KjNuzC6lWflwhYWZZzmkj1zQhbjYWs01ilS258YLf3aC6RPYiSt70GDt17
         h4T9Ph7YoIfqBfUtqKEzcivYSS+MnVXsGfDTR69vSmmObQHfAq8U/Xw4RFkCi+cez2q6
         bw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c7G9mJrY8Tv8lVtdImCY5iGpFlSSDAqtE39f9pCz3/E=;
        b=AveLiosC6/zDnYvCJugDiP6wbpaJRBJBZDG2k0UOYto3hmFF2ljZ520tOP6MPnsLIi
         8/wx8QWGwsCHmZy/4rfxjDtkVLxiUHR1IITJ59f+EYY45M9gnjygPWl0MW8fiXX+XX7w
         PPrkCd0pXuniepimWmnYTARuKhxqVWA3P6FFp7TRBHo9rgondFIQhXxl6lGaA6z61ucY
         7N0oDBEMJJZbc1KH4//b630/Sw9ub9FI05Q1KKilYp1E/i3sUbexQwHpxmxj1utyddVu
         /pt4BPAtczpt3kvClnmzNFVzHffiLFW4gkvx47bTwLXFJ8CFmmZ0MlLQKJb+kNaro7Rf
         0CrQ==
X-Gm-Message-State: APjAAAW8UVfWB+Xmhaprf+2dGNbDhHjF03IhAOIW/2QNb/0VfTxwmFw3
        UB6+3g2uYhuBfyFVclF2Qu8=
X-Google-Smtp-Source: APXvYqzPapuCQF3gZ9dvRLfluvZFIeS2tzskxXz1C1OQgZnoIe64DsJYLIRDKDzk0JbQgcTl1WDb4w==
X-Received: by 2002:a0c:81c7:: with SMTP id 7mr12616654qve.2.1556980838814;
        Sat, 04 May 2019 07:40:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:38 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 5/8] media: imx7-media-csi: Propagate the correct error for devm_request_irq()
Date:   Sat,  4 May 2019 11:40:23 -0300
Message-Id: <20190504144027.31920-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the case of devm_request_irq() failure, let's propagate the real error
code instead of a fake one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a4cc9a342674..88265cd133ab 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1223,7 +1223,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 			       (void *)csi);
 	if (ret < 0) {
 		dev_err(dev, "Request CSI IRQ failed.\n");
-		ret = -ENODEV;
 		goto destroy_mutex;
 	}
 
-- 
2.17.1

