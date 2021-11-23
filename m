Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CD5459EDE
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 10:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhKWJKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 04:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbhKWJJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 04:09:56 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77436C061574;
        Tue, 23 Nov 2021 01:06:48 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso1531051wms.3;
        Tue, 23 Nov 2021 01:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdcJrIchN8INkkTI6cCxH2vT48fjRUPaOVRVxUI8sDo=;
        b=PBoe45SX5i0t7OddMHWdl/OTNKnM3gRr9JL6qBth9TnGhoHlPJb9O5fxt3S2pROyR5
         uh1e6jFtTLvUfmhNDAALEDDUcJLqrRJ2LIlPKeTlFLyvvYLLzcWm6lkvMjgSf7kQZKnH
         gjIsAGCjxlgRrcJyPaBffO8nO4MqCVAsb48gXJM0Tqi5HFYzbnX7HHuWy4TfYradxV3N
         ZgQKTTak5GzlcOzdujLRz6D6LYcjJbW0NnykLOnrrZWv/4VP3ha1DLChY1OUxydIcCt9
         aXwSxY3dx198MqSad//HlTEsb8u98MK1ZxEtviM39kIRMwbltkLCs4FQ2yYiUXmlHr2z
         y7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdcJrIchN8INkkTI6cCxH2vT48fjRUPaOVRVxUI8sDo=;
        b=X/9SHzAyFEnz02xyuqbPht81pe/8PHBxyZ2aixcGBUoD+ueI6Koj4Dcv+Ywzpgz/Yw
         o77Zac+jYcDOjytlRbNZ9qKT/D+gl8jC0hg2bbFWCBNSouvLLZjNKIS38pcwYj7GtCva
         2ZmHRbjgstf4k8E48qqSNZovoVGmvhryGx5upnZYoY6cSsHQCcJALIh6RGzyDaOSZpLy
         3FNJKva+kG+x2rRJebn1t9gKtFUhihETA+FGXr4K/simslwQqSEfWbIatz/L98zX5gcb
         MN12Q54jcmXaMe3h9IKaq/TIDtBMhVVVxK33e6uJybAd/J9peReJHJ5tk2Avapqe0FHm
         vq/A==
X-Gm-Message-State: AOAM532LAI3oNjpvUqTOtXQNxKVvP3sxAt06THqkXpWeFKWqjM5SoHKe
        6o3Nw7BRaDOHlQ==
X-Google-Smtp-Source: ABdhPJx1BZLZ4+bCWdt1DbXq8HkLcRH+dxNpY5/2CJABWJHUzL0bypMdBDbgDz51b8vpnVeCHRa7lQ==
X-Received: by 2002:a05:600c:1993:: with SMTP id t19mr1108358wmq.21.1637658406958;
        Tue, 23 Nov 2021 01:06:46 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t8sm11498672wrv.30.2021.11.23.01.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 01:06:46 -0800 (PST)
From:   Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: media si2168: Fix spelling mistake "previsously" -> "previously"
Date:   Tue, 23 Nov 2021 09:06:45 +0000
Message-Id: <20211123090645.165299-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/dvb-frontends/si2168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 8a3c41a80c03..196e028a6617 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -549,7 +549,7 @@ static int si2168_resume(struct dvb_frontend *fe)
 	 * device untouched.
 	 */
 	if (dev->initialized) {
-		dev_dbg(&client->dev, "previsously initialized, call si2168_init()\n");
+		dev_dbg(&client->dev, "previously initialized, call si2168_init()\n");
 		return si2168_init(fe);
 	}
 	dev_dbg(&client->dev, "not initialized yet, skipping init on resume\n");
-- 
2.32.0

