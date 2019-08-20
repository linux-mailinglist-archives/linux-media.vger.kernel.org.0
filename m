Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDCB9687A
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 20:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbfHTSUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 14:20:08 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37447 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729639AbfHTSUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 14:20:08 -0400
Received: by mail-io1-f67.google.com with SMTP id q22so14205279iog.4;
        Tue, 20 Aug 2019 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ygTD54+L/gBc5gQPMk4sDNmeYvmKQgCUTQPmTGXe5Vw=;
        b=Qi81BYsQ+Ufm2/OpLBwZuLEgbHKrfUDqS3OYVhPLLIz4kfU3vViTsChICkxUuUyM+Q
         GgdsceHjtvETs7Ao9QyZ/XyMuanBPU+zUwYx4QNYd8/C8/sxEnV/WgZFV8NXMTfZPVAG
         2vHsW3UbQcZm6k2qn3GsR/3M9yE1Uwhkf2coU4u55JynUY0dKq4AG7nZBNoAWkcRTqZD
         wDAsbXsRer8r1ApMeC5FBmp78rZ4trLQZqnRRzPCLEopB/Av38jm5C3XrCYe6mzjcSXX
         tyD+waU3NR01kwthhIuQ7b34sxS7eP0FIDS6FTtDNr0cNSjn33bikNExo1PnaUS02QjJ
         nzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ygTD54+L/gBc5gQPMk4sDNmeYvmKQgCUTQPmTGXe5Vw=;
        b=OduGtvVkj9jW6FgjkHF7dT6KQrzpoGW/B3pey0oS2p0Ldx4q9I4hi6DzrzEP1ZY/Jv
         HrSNO3GRlGZNWe4lIr1CC3XmBGPzHJCrsTEgTSZZBIQlw0pDtVcwgR+4NgcU3khY1hjq
         UqHkTuj4ood0OBaEy8AvGrJ9XOK/kEaWgjrkkDLxm3/JdUk09btibKuOv8lEuqk6gtCi
         NKz/o5XK9//yF3G5QynnP5wzcR275y4YFDlphXpDosCcgAf1NuK76JcBwe5+pcmZXDUe
         9i9dTkaGAyr2A9KYTtQ9snhfQoAbI255VMxBJv4PLpTUF3NAwXpTCJ8qI5ynb+JT3zgm
         vi0Q==
X-Gm-Message-State: APjAAAXKG8Ihk//fJ6iq7NgwPJQmoHjhxYM3rpRC1jnEj1BmL6EEXpCA
        PNHbJQ2npGt2YireLDcbXdyh9JBtJVlNsQ==
X-Google-Smtp-Source: APXvYqxmwwioE87DQyYhg2wQzclwtBjqAUzr1/e+GzX2BA0IohrIJZce+tvG8oEnHXKZuETtvtekFQ==
X-Received: by 2002:a5d:9f50:: with SMTP id u16mr9196187iot.110.1566325207418;
        Tue, 20 Aug 2019 11:20:07 -0700 (PDT)
Received: from peng.science.purdue.edu (cos-128-210-107-27.science.purdue.edu. [128.210.107.27])
        by smtp.googlemail.com with ESMTPSA id s11sm9560207ioo.45.2019.08.20.11.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 11:20:06 -0700 (PDT)
From:   Hui Peng <benquike@gmail.com>
To:     security@kernel.org
Cc:     Hui Peng <benquike@gmail.com>,
        Mathias Payer <mathias.payer@nebelwelt.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kees Cook <keescook@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Fix an OOB access bug in technisat_usb2_get_ir
Date:   Tue, 20 Aug 2019 14:19:16 -0400
Message-Id: <20190820181921.7921-1-benquike@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the while loop of technisat_usb2_get_ir, it scans through
a fix-sized buffer read from the device side, the termination
condition of the loop is `*b == 0xff`. If no `0xff` byte is read
from the device side, OOB access happens.

This patch fixes the bug by adding an upper bound in the while loop.

Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 drivers/media/usb/dvb-usb/technisat-usb2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index c659e18b358b..181f5f97af45 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -612,6 +612,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
 	u8 *b;
 	int ret;
 	struct ir_raw_event ev;
+	int i = 0;
 
 	buf[0] = GET_IR_DATA_VENDOR_REQUEST;
 	buf[1] = 0x08;
@@ -656,11 +657,15 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
 
 	ev.pulse = 0;
 	while (1) {
+		// only `ret` bytes are read from the device side
+		if (i >= ret)
+			break;
 		ev.pulse = !ev.pulse;
 		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
 		ir_raw_event_store(d->rc_dev, &ev);
 
 		b++;
+		i++;
 		if (*b == 0xff) {
 			ev.pulse = 0;
 			ev.duration = 888888*2;
-- 
2.23.0

