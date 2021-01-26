Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8710D305B45
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314059AbhAZW4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392798AbhAZT10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:27:26 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F18C0613ED
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:45 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id k8so17359648otr.8
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y4/anOXivGV6ZLOM5vHU2BQKpLVVHE4/9GWogoMUGnA=;
        b=nbKgPCa4/lzHcM+83/zVQbo+M1QHFSMhwoAZfTIP7/zL6zrODVShk8o2e5rOSweL2C
         ZD4cQ0x4SUAgg9aYK3ELykRwdn2q7tUkPUTuUQ+61JOwhsO1A41Ka5xHNoy8gnndJwzc
         J323GrElvHKefgiJYgNAkBGSXs41o8XWyslEGr2DUkAmtnzjW4WEx/oYszbiFe0gCkEH
         U0CLn5jWtu5GN9lho7Qv/N9SaOM0UL1cvBArg8Gwhf/CgyEV/sjZnoBJ1jGHw2o39iDk
         yALGsVeB6gFotXjs8v1V5PzNVoP54od13C6EhMX5hjEGKo4lmrpcFa+MDHesbzlq4paC
         ksgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y4/anOXivGV6ZLOM5vHU2BQKpLVVHE4/9GWogoMUGnA=;
        b=KrhEn/mO85sHUUQoEwpOvLAjbASu4DkqnK7q0PK+49b3Cdkd/awwNweh146ae0MQCq
         dKdgtSjB/8/td2qmld3RdnWGwewXz+AWplhVt6djrLM2PoAsmcURIQYeRKdVgCSK4xSo
         af0nBKujgVjkCg3yv7xzSZdj9MyCAhrMMULhhaAss94D0sy1nVrL411VLBW9tSP2kn+4
         NAnkN7m4YmE/DZnghJwKLuCV94tLkse5xGygG0QWrXlL0xL9oaWrfr6E3uNwXrT39MRM
         WZLhUJolDyvdMtJUZWH82iSSSfaXfCMem40+M2/g7aqJfOOJV00hwPJzspg4vghZdNyl
         kSaQ==
X-Gm-Message-State: AOAM532XLWwEc4/1WWLevpHR1PYORDjEtMbMjOEzR1c8p+wMPxU0g45k
        Kg3qDMSCu+ub8IrdUxlIAG93CYQpnNwTncZp
X-Google-Smtp-Source: ABdhPJxEz8AKyfUXm1HW87VQ9YONgA4fLmvfPhpwN1IDdrakOFwAKg7QDkFmEttvOLJpZyCZAkhWQg==
X-Received: by 2002:a9d:5544:: with SMTP id h4mr5229001oti.104.1611689204347;
        Tue, 26 Jan 2021 11:26:44 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id t74sm2977986oih.17.2021.01.26.11.26.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2021 11:26:43 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 2/4] em28xx-core: Fix TS2 active led
Date:   Mon, 25 Jan 2021 19:54:14 -0600
Message-Id: <20210126015416.5622-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126015416.5622-1-brad@nextdimension.cc>
References: <20200612183937.10952-1-3126054018@nextdimension.cc>
 <20210126015416.5622-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TS2 active led is completely igored, fix that.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v1:
- None

 drivers/media/usb/em28xx/em28xx-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 3daa64bb1e1d..584fa400cd7d 100644
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
2.28.0

