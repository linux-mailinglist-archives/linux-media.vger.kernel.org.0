Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAFE1F7D02
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgFLSj4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLSj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:39:56 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B46C03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:39:55 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id b18so8091181oti.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1lYYt12LyqwgnRy30s+B8H0p09E/N8YF4ER1tK9L5pE=;
        b=tK4nHHdN04fcDD5I+e1opANtsVzebFdOaz5h+QAnv3vL7knCat9iNF3lch1Wfcj3xK
         C89kiz1VC05AoQbGN6CmfpGhzjhZUFXzqXTBtnIuR2yd+4eIjfQbrbJkFEgscuovya0/
         TyEndGf589MI9cWc2GPwHKxuWtYDfTPKPWsnbLsKN9zGmhoCDxLZoRfTqhAbxU40VGRR
         EW3D9MSTHhuFWAGISEsXG5TZoQI6Ad0WSxmcHbva9b/e+XmU8CPqRge3OnNruoQzvEM0
         MpQBFtQMofbpTti4gACWrHiikGuNzRLvel1LsuLgsi6nz8hS9vCND+bgLZDfdDtrNt8O
         KSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1lYYt12LyqwgnRy30s+B8H0p09E/N8YF4ER1tK9L5pE=;
        b=raQtL99PG1urUWfEtArfKQWtrZs/ZcTMh3sPfTLTqrjjl5YsNHqeXgBJRisHGaP3oQ
         L6W5S8B1ydsUpBrI6HmNUiwmVx9W4ogFfH3khwo+spIo4YRnMoP41U1TRmJjmjBwDVzQ
         7W44M9wpG1dxZGudrSMmGQGvXoSypZ1faHAR9RxggVo+a5vLxag6557hPbuWSTKrSvCr
         PY+wzXz8uBptivNz7h/+0S1CI8Q4P1xYho2YnJTksB7kKc/Zru4AKueG0IovStgRVLqn
         rB5vgzC/tC5vqUiGYiwO0XyTUB3lCgDfVJ5lJ+MixUu5tyMgtXXDJxDuHqgJPll+l4UM
         Roog==
X-Gm-Message-State: AOAM532g+F8Argslp60cc9yR4+UmK9tTHv966fTq9FwSJE6MTEPBlzBv
        NQWmZIW1hS4DOb2sJPr5CNxfNFqYohhe0Q==
X-Google-Smtp-Source: ABdhPJwt9eQiwGTezVkIPkOZ3gjY98hYYnAz7tB3BzyHcS53My5Q9jvzHtk2A9hPkWaKDKZ8HNMkPw==
X-Received: by 2002:a9d:3df7:: with SMTP id l110mr11526054otc.214.1591987194217;
        Fri, 12 Jun 2020 11:39:54 -0700 (PDT)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id n128sm1461376oih.33.2020.06.12.11.39.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:39:53 -0700 (PDT)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 2/3] em28xx-core: Fix TS2 active led
Date:   Fri, 12 Jun 2020 13:39:36 -0500
Message-Id: <20200612183937.10952-3-3126054018@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200612183937.10952-1-3126054018@nextdimension.cc>
References: <20200612183937.10952-1-3126054018@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TS2 active led is completely igored, fix that.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index e6088b5d1b80..299cd38a86e9 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -698,8 +698,10 @@ int em28xx_capture_start(struct em28xx *dev, int start)
 
 	if (dev->mode == EM28XX_ANALOG_MODE)
 		led = em28xx_find_led(dev, EM28XX_LED_ANALOG_CAPTURING);
-	else
+	else if (dev->ts == PRIMARY_TS)
 		led = em28xx_find_led(dev, EM28XX_LED_DIGITAL_CAPTURING);
+	else
+		led = em28xx_find_led(dev, EM28XX_LED_DIGITAL_CAPTURING_TS2);
 
 	if (led)
 		em28xx_write_reg_bits(dev, led->gpio_reg,
-- 
2.23.0

