Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A812291E04
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfHSHib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:38:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42495 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfHSHib (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:38:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id y1so553436plp.9
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j5rvShXh0kcFKHyYimciyPIhYVtOtWnaMP4y4j+0ekE=;
        b=MDZWXsxXNjd4nSUeLsA+N8f8ThSjLInQzi0W/DzKbpnlKQ+k7ERQHxPzZ6ad+1Trtg
         n4bGqutOzBD2y8Az0KOsJU4IYokZumeEQfjf4RpuqeA0oi0pVVswi5jmlqVjVTV4g3Ek
         sVw55752vZ0XgI1M3yHVjTJyiC5B13vQ7A+nYdoWRb4L5XbIO1+57oqwISE1Vb4s/Id4
         D5ok6fsh2aJJYehxBWyVzRwPEgq8m5zZZGp/LGgIdP5mlie7tuaQGYrTBr7vacuXgVSv
         Teg9TgCEIX9X6gh4FmPF0vtaDj3XAaMthqHG+glcmwK7vz7y1GeE5lgwApU33Q+z0nfc
         JRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j5rvShXh0kcFKHyYimciyPIhYVtOtWnaMP4y4j+0ekE=;
        b=i4O12lCbYNGLErIEv9gXY2J2XwFVMFDzVkb0Nolc0ITERv8q/RZKm27A/1nCT0oS80
         z/tWW5d56IYWyqmjAlZ0WLl4S+U0cnSzO1n/ax4un8vzQm8XoKcxuxQkSK7FRjgBLEbR
         AP+Q9XpNlVOugu/kZvtTIXajqXwRn8HmNZr65XecaDSiQrNugb8Il53zkcAraGz5APjh
         zfzLcU3vRj89paM+lUyQ6Muq+elmgivp1JXo6kkkz3FmZGPY9hR8k3uQ+pfrK7e8Ctq7
         u2zSaS4dxeuZNDQ9gueixUXVDrIOfaBFtQk4gB9E2SDhe2sbpZLM3S6TT9ZarGiHAOUl
         yuNQ==
X-Gm-Message-State: APjAAAXkLLvYc8AaBOd0+Hz57qYjFhiTwuy3HHiKuN+wvatentKzw5EO
        e8Fqcwrd32hMXqxzzL8sxTU=
X-Google-Smtp-Source: APXvYqxmCztOBdzeSMM+aJKzDPsY/JxicbsIrYa4k2Q7iLBJzZ8HXsGkzgZVwWS3ZcPRpJzqA2nW6w==
X-Received: by 2002:a17:902:5a1:: with SMTP id f30mr21554725plf.64.1566200310943;
        Mon, 19 Aug 2019 00:38:30 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id d16sm1831075pfd.81.2019.08.19.00.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:38:30 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org, crope@iki.fi
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] media: ec168: Make structure ec168_props constant
Date:   Mon, 19 Aug 2019 13:08:18 +0530
Message-Id: <20190819073818.32292-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The static structure ec168_props, of type dvb_usb_device_properties, is
used only once, when it is assigned to field props of the constant
structure ec168_driver_info. As this means that ec168_props will never be
modified, make it const as well in order to prevent unintended
modification of its fields.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 0c1fef118be4..e30305876840 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -309,7 +309,7 @@ static int ec168_streaming_ctrl(struct dvb_frontend *fe, int onoff)
 /* DVB USB Driver stuff */
 /* bInterfaceNumber 0 is HID
  * bInterfaceNumber 1 is DVB-T */
-static struct dvb_usb_device_properties ec168_props = {
+static const struct dvb_usb_device_properties ec168_props = {
 	.driver_name = KBUILD_MODNAME,
 	.owner = THIS_MODULE,
 	.adapter_nr = adapter_nr,
-- 
2.19.1

