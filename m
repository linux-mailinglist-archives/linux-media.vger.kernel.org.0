Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6A5A13F1
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 10:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfH2IjF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 04:39:05 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42790 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfH2IjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 04:39:03 -0400
Received: by mail-pf1-f193.google.com with SMTP id i30so1571290pfk.9
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 01:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yO2qDhPwGX7mB4VXosralsD40lCXHvpCucFOfhI0Egk=;
        b=qG4NJMCIQ8vat5zBTVCyEzkSTrZZigmx8/KCEv9E+6saKhvdSYaliX9UOhPr1MFLvO
         ihSUt7F3Hpr7gHgPlyIB3OGRbs1Y9cmMK1tCtXE95zPD3XKPhnQYjjEIhepDa6QcuLjT
         2r9ODiI1q3PnVs81Yjk6XtXgOlCkjRD/YfDkLvL0Nufhql2hN+WS9bGG253s2bt1id/r
         PlLAvRzXelekb9OpBpQWynu8KL8H5fcgTnAStfCWI52TohupPBZqMns0DGWDGni8vyrT
         qe9JdvAyQ2XrOYqeVitUdDZZWSMfXYDyrql3gEXkep8ItYjOrtfzmIRpUeRqgs+LRKmR
         sT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yO2qDhPwGX7mB4VXosralsD40lCXHvpCucFOfhI0Egk=;
        b=fumnxRek9LkiapWltlxhnSnPsQUFUmsPUk5ryjPTIy19BP9gU8i5aHPByLqxI6fq+Y
         EM1ZIEOnoylJZIJ+2Z+XLadQu+nWp7G/EhgH5mKCx9+xX9ivFMLjy9RW4/qvAYxE4DWC
         3kHI4TXBPKGBrtYA5LuWvj4WZY8V2jSuyRJDWAmNOI+GcCyvBL8qUckUgCivrTwT7u8F
         nxkl7DC2dky74uz1E/OuJHiQe1oCI9qXuMVX0kztb4hh/1Suqk0Nd3HAUZ3t9axUry6k
         iQOxb28Posh0BCkGHS/+RkU0inX1tVOVMxYOmJ2uFrJWGlhVSmiEf7NVAkXt2U+u5xdI
         JDuA==
X-Gm-Message-State: APjAAAX6/MPqlsp92XDzD/wHMw1DkwGhmVGfyWyS8st1JYn53DlLdeRQ
        MvslTHe9NUklR+yOl6awxb8wRswY
X-Google-Smtp-Source: APXvYqwlAb5B4gJ+jb5BWS4ocXXYgb0HIRRFr82jV6K/koRkQnO3XlAKP7E/CI875aZYDZhdZ+n2WQ==
X-Received: by 2002:a63:6ec1:: with SMTP id j184mr7230222pgc.232.1567067942455;
        Thu, 29 Aug 2019 01:39:02 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id g10sm3498518pfb.95.2019.08.29.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 01:39:02 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH v2 2/4] dvb-usb-v2/gl861: remove an un-used header file
Date:   Thu, 29 Aug 2019 17:38:20 +0900
Message-Id: <20190829083822.3670-3-tskd08@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829083822.3670-1-tskd08@gmail.com>
References: <20190829083822.3670-1-tskd08@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Akihiro Tsukada <tskd08@gmail.com>

The header contained just internal definitions
and they are not used anymore.

Signed-off-by: Akihiro Tsukada <tskd08@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/gl861.c |  2 +-
 drivers/media/usb/dvb-usb-v2/gl861.h | 14 --------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 drivers/media/usb/dvb-usb-v2/gl861.h

diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index 7e5bcf49896..e5dc1fc409f 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -5,7 +5,7 @@
  */
 #include <linux/string.h>
 
-#include "gl861.h"
+#include "dvb_usb.h"
 
 #include "zl10353.h"
 #include "qt1010.h"
diff --git a/drivers/media/usb/dvb-usb-v2/gl861.h b/drivers/media/usb/dvb-usb-v2/gl861.h
deleted file mode 100644
index 02c00e10748..00000000000
--- a/drivers/media/usb/dvb-usb-v2/gl861.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _DVB_USB_GL861_H_
-#define _DVB_USB_GL861_H_
-
-#include "dvb_usb.h"
-
-#define GL861_WRITE		0x40
-#define GL861_READ		0xc0
-
-#define GL861_REQ_I2C_WRITE	0x01
-#define GL861_REQ_I2C_READ	0x02
-#define GL861_REQ_I2C_RAW	0x03
-
-#endif
-- 
2.23.0

