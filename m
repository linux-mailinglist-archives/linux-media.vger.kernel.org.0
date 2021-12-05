Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F37468A3A
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 10:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhLEJFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 04:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbhLEJF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 04:05:29 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF57C0613F8
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 01:02:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id e3so30285943edu.4
        for <linux-media@vger.kernel.org>; Sun, 05 Dec 2021 01:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tvc+uZInx3k8MrEByxSHttKZs3Fai2Uq5Zu34fIedjU=;
        b=AvMAShKOUIY9XXKnwe+5LZen2TaNUA3bsCgHjtUEGjVIG6AvPIDH4LuYaodoAPnI02
         b6m19sc+ZBE4B+8Ho3n+jEaMaOvOJjnHP7njYXueNU0IaAVjVfT1mDCxsiilgUkYWyd9
         23xLFDUvb0UQIlJqfuxkUFcP/gHextKnS1Nu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tvc+uZInx3k8MrEByxSHttKZs3Fai2Uq5Zu34fIedjU=;
        b=2NINMORJzLGRG0BuJhpYr1yRNoZfnYXgtZC50MrzUMMFuwdJo6MA4u7gpLzNa/1rYD
         ws4iMXjc0++2cYqcNf7lJ01Rcm1jv/qhvXS7TZEuc9BcE0wsNhv8el9loe7WZAT/Ymkn
         F1WSpXLQ54F088LHNDJWQ5YmshVRzlUC/nPMbyfvyQu61cLq3K5YUsCqbIrWBfyiOtFa
         1kOdIFV7eO/GhSbI4x34086e7eiDD7V2sXD+5wovf0BizQSIstXZC8ZL/fH5GRS4u+Il
         r+1Hnyvcs+N9L1FKm9fkyRnfnU6Jd9RSvOyt7HYFvJZNy2bCqOTix1QjeTzKg2M29tVa
         r0tw==
X-Gm-Message-State: AOAM5331Ay3ZTwxK8QCT7o6/CaBDZ/d4EG6ZedvBiKPc8uLotYI0Hgyl
        8UeQKl+Y9d2zWpQcRMTDCLJh9RpKxoRO0A==
X-Google-Smtp-Source: ABdhPJy6Qpomjort6jh02katlPpnxxy7lMoq7ioqFNGH5zIsrOl3E4emaui1HU6kvVdjWT5DANLa/Q==
X-Received: by 2002:a17:906:e103:: with SMTP id gj3mr36983716ejb.456.1638694920820;
        Sun, 05 Dec 2021 01:02:00 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id dm6sm4921492ejc.89.2021.12.05.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 01:02:00 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH v1 5/5] adds i2c/ explicitly to Makefile
Date:   Sun,  5 Dec 2021 11:01:49 +0200
Message-Id: <20211205090149.5221-5-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211205090149.5221-1-petko.manolov@konsulko.com>
References: <20211205090149.5221-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 7e2c86e3695d..338c08d2429a 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
+obj-y				+= i2c/
-- 
2.30.2

