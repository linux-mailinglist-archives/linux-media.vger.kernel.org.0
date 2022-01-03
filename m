Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86192483035
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 12:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiACLJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 06:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbiACLJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 06:09:44 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15209C061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 03:09:44 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id b13so134448480edd.8
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 03:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cSQGNDQhJlx1HiN+2TiPcHT749zApNvgHzuss25yZM8=;
        b=ERwZsWyjh1QrioraOeNScVLj0ci1Iv6zNSm+eTrbyrKOIN6w+bTgNlOz/pprNFHx3e
         pHNLaIavvqX5PnML/hmA3WyyM18c/F8pHqn44YWJGckznyVLwA2B1pSamAQ9y/a0fKO6
         uJxzPapK1Bf1OurXGpWkB5ZsxNziG/Bfkt2Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cSQGNDQhJlx1HiN+2TiPcHT749zApNvgHzuss25yZM8=;
        b=RswEPd8stYgqpRXCDY7TT0pYFz24k5XHOg+ZJOYcjJ3qLwXlf0LZGRTOJ5uP0j0drR
         qB3ZLQYI3Ont6YVVzoMrtflaMnfEmj2VEbJP4C1p6j0mGc9YAvSFAvDGuWj1CSzFvKpz
         iLNNJfq3irm2BXjrYPc3Hyr5IFKD4vt/zlo389K2WC40Ia1apUwEzeElkO0Q58+6erum
         Gr9Zzhr04Ea8VmaSDp26hbW0OJaev0AD/OYMYljGrjXA+bs2y9KcITVzw6l9QxdwrXcL
         xFjHJVLj5SCfJ558yNQCa4hvk0q91bp4fqtRtbTH/V/Gi+3vxXrfrvJvF1vZKU3OtS/N
         2kCA==
X-Gm-Message-State: AOAM531fFYDtSRPosJKfw4y0RvjcB2h5wJPceGvjV2MqNbureIMAP/eG
        GTh07TzCTc2WUdE2SLF9yiphYDx0ndTDXA==
X-Google-Smtp-Source: ABdhPJyjJ/hU24SmkqG0fDarb8rO7740NsJf9KRXoDlwH+eBSluglAMf+NgteGX/72gcN9/3pDRWrA==
X-Received: by 2002:a17:907:7242:: with SMTP id ds2mr27610672ejc.514.1641208182516;
        Mon, 03 Jan 2022 03:09:42 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d17sm10536476ejd.217.2022.01.03.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 03:09:42 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 4/5] adds drivers/staging/media/i2c/Kconfig entry
Date:   Mon,  3 Jan 2022 13:09:21 +0200
Message-Id: <20220103110922.715065-5-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220103110922.715065-1-petko.manolov@konsulko.com>
References: <20220103110922.715065-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index b81cfa74edb7..5be3d503f037 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -24,6 +24,8 @@ source "drivers/staging/media/atomisp/Kconfig"
 
 source "drivers/staging/media/hantro/Kconfig"
 
+source "drivers/staging/media/i2c/Kconfig"
+
 source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/max96712/Kconfig"
-- 
2.30.2

