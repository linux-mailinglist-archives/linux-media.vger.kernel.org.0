Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1191E2EB852
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 04:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbhAFDFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 22:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbhAFDFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 22:05:33 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DEAC061359;
        Tue,  5 Jan 2021 19:05:08 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id z3so1272236qtw.9;
        Tue, 05 Jan 2021 19:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zHmmCBGfy4ShazVVVDUgrXKI7nP1Rs0OHaoIlOcZSyU=;
        b=JL2en4yo9zkQGXpTev0LLdXXCf2THcuyHqiHq08UV531nMDdozzMmBTMfv4RzN8CPQ
         lllYZNvjyJ9qgxB9+8DOs/huEduwu1lZbso+4dQ3cNlajt1gOKr51ZJvHmbYRfRhrZoE
         3fpH0TujSELp1PrZzpt4GHK1t+fB6YHnav4W7OtJfm2Xu5LMhz5AXSxTt6SaJtzsvXzs
         VAqhf+7S1YOfeninpvhpQO2O9LA4FZYvVjrBLAOAVKnsUVtuJc1L7TDMniIz+k2W+nGV
         MOvJX7FiKFv7LjrYYUga8GG1L2nZHe/KcDBkp5B8zBV/mTny9ane6Ci1USHBxQX7Illn
         cWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHmmCBGfy4ShazVVVDUgrXKI7nP1Rs0OHaoIlOcZSyU=;
        b=rGT2v/XOAyvIixB21hnpAL0OzRTVZWXrcMzd0Ch7LqWbFEjy/Cqiojiad1lVqy4q/f
         n88pcDscH79Xsmc5Mitp5KpPNdW9ycjCgSWblAitEv5kcxAZQ+8osT6QcP1i5vZ/wYdR
         eEBRB3tYcb6ks0Ah1andbVrWsZpCeYsA+uU3/1ay7KkPtTt21oSeHujGcIbAQLYAswiY
         dnAQtiNjk9UnBGgOp77hk+oZ/SriXyY2VggPK2PT69m4ArQwHU8/3GFy7WGUfauS6HQ+
         fh7Ur2Lv/+B1b39380PP3u8+XzLMFoUdEk4O+Cb3s4dBNBbFRUydrWN2n6hVPBOe745/
         QDfw==
X-Gm-Message-State: AOAM533TPQS8wU/7jk/QaJdDxuEDWrfJE7WDow32fnd2x93qxpopS+Yu
        1VV4rjWx/RuYv5ctu1YBUNk=
X-Google-Smtp-Source: ABdhPJzHN/EkN4HNuCCqLOYv9mdakCw4XwaOJPrDyI72TQNZVr0TOgJlIqrA83OL2S9wPgHFBL117g==
X-Received: by 2002:aed:29a5:: with SMTP id o34mr2365384qtd.379.1609902307535;
        Tue, 05 Jan 2021 19:05:07 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:05:07 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] media: vidtv: print message when driver is removed
Date:   Wed,  6 Jan 2021 00:04:49 -0300
Message-Id: <20210106030449.3223172-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
References: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Print a message when the driver is removed so that we get some
visual confirmation when unbinding vidtv.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 9964d1331aff..bde3785333cd 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -555,6 +555,7 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 	dvb_dmxdev_release(&dvb->dmx_dev);
 	dvb_dmx_release(&dvb->demux);
 	dvb_unregister_adapter(&dvb->adapter);
+	dev_info(&pdev->dev, "Successfully removed vidtv\n");
 
 	return 0;
 }
-- 
2.30.0

