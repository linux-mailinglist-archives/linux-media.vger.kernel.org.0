Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6270B40F4BF
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 11:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343509AbhIQJ1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 05:27:38 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53774
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240950AbhIQJZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 05:25:24 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D14EC402CE
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631870526;
        bh=0xA9iYVKPlBXWipAtGMdHpXi9msntAFNL6yrDBccejQ=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=CScDhI5MoYKVWmeJ6v42XJx1dlwdKWDcEit2XnpuHX4Sb4YlgvDNP84uKOewO53q9
         cX/ZelMPQ5ucNTB2K7A4qfKRBkW9qkb1C7gS9zrW8rFjX74tvmuUaHq7vZVJp0JvTA
         n7aRBY+uQ6gio0hD3eX1KiM/gEz60yieJNJfLBPz7wIlgxJFOYis98U6Sa6Bsewy9i
         +MQsXZFfpJHAGQtiNlcuOx2QJ2GnOk/JoVuaRmiVVI2mugWyeh+//d1X04KWj8ySC+
         dy0cxd7We0MMXV91cPNGCRaQ/ThgWY+UXno1sXcLyuY3zH8gXHsmmDQH4HiZT0/yVH
         +iIQMagz2PZAA==
Received: by mail-wr1-f69.google.com with SMTP id v15-20020adff68f000000b0015df51efa18so3479813wrp.16
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 02:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xA9iYVKPlBXWipAtGMdHpXi9msntAFNL6yrDBccejQ=;
        b=QWyoFUlF7QEFFyDbXTJHlFiToYdpEnAXP8Wi8/sXymFjXSzhSJJjuQaXlkbYSEyO8Y
         rWjilhoIV6bYkYsb1JCxV2+O0ifN4q3waWiRtseKQTvO4X4X7vjpiWq9ezw4dztkYQSe
         bXQg0JxPsH8pzWV3tiedSFzLgmxIXPl/mTWxa2APGx0sbx7NddtZPphU19GkItNtbs6a
         9Svczuf5ie44fZW44k6eLCaG4fYLpscsoRYwch7/8GJtdjCKlEH84VjWWC/RJRX2yEDR
         UpdimYaCjwdLj1iPO/t1eFesWH+Hw1KKuOoXKAu8sIR7ECedObLlnuulSLb88USJQIuO
         sFVQ==
X-Gm-Message-State: AOAM532wG7eLadXR2Ojov7DlmrEA4oTIVgJvP20ssz7QGMTEXuz3U0xg
        dRQZCJMRzp3uZjfjjAgvbX0QISVr0IhY5b7oJKmrKpoq1foqPzhz5e0pUlQmvJHEFp8opLMPpsq
        LOfpAw5WCpdO0OzX6liVFKnVDgZWvnMki9sLW2OO7
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr7870100wri.274.1631870526477;
        Fri, 17 Sep 2021 02:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM4QLRlJ3XkBwIXnQxYsAEyBMDrbjCNY66KTEJUyx4rLj3D0co0hbQIOmIwZ6QAg/cfiiADw==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr7870084wri.274.1631870526335;
        Fri, 17 Sep 2021 02:22:06 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d5sm6531260wra.38.2021.09.17.02.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 02:22:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: siano: remove duplicate USB device IDs
Date:   Fri, 17 Sep 2021 11:21:32 +0200
Message-Id: <20210917092132.19576-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The devices 0x187f,0x0202 and 0x187f,0x0301 are already on the list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/media/usb/siano/smsusb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index df4c5dcba39c..fe9c7b3a950e 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -661,10 +661,6 @@ static const struct usb_device_id smsusb_id_table[] = {
 		.driver_info = SMS1XXX_BOARD_HAUPPAUGE_WINDHAM },
 	{ USB_DEVICE(0x2040, 0x5590),
 		.driver_info = SMS1XXX_BOARD_HAUPPAUGE_WINDHAM },
-	{ USB_DEVICE(0x187f, 0x0202),
-		.driver_info = SMS1XXX_BOARD_SIANO_NICE },
-	{ USB_DEVICE(0x187f, 0x0301),
-		.driver_info = SMS1XXX_BOARD_SIANO_VENICE },
 	{ USB_DEVICE(0x2040, 0xb900),
 		.driver_info = SMS1XXX_BOARD_HAUPPAUGE_WINDHAM },
 	{ USB_DEVICE(0x2040, 0xb910),
-- 
2.30.2

