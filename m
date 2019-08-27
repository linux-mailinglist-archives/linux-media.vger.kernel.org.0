Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0709EBC7
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 17:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbfH0PCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 11:02:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40949 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbfH0PCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 11:02:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id h3so11915534pls.7
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yO2qDhPwGX7mB4VXosralsD40lCXHvpCucFOfhI0Egk=;
        b=KV3DsdgssZbibOkfYe3Jb4zgEEXCZSCv0AzsCX+0bDMR34Iy8RYbFwfvb1kwvWesTV
         3DiOXUcVgupmCXsNrTvljgKDOP2UmtbkuVNVgtXgqaEfdCsklFMS0qWlJtEQvBAP9OOi
         Nx8fC80fTtQ0Paq8kqj6dVrNcbAy5PQS+e95Wo3n+UXNeNvfJk2KHwVPdNIrDDwCqTpU
         /lH/fDR+rOW2o9ljUvIt3Nh1ByQ8bY0Pf2ndcbjHLpyrwtTbfYEpekqgfvZZF9Gji0M/
         +FzVEWHrKAf2q+o8f8NpfZq2FcCfwYivdm2e5n6CTcmKOhdX0GovzvIWsYuxLbhN4DRY
         NggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yO2qDhPwGX7mB4VXosralsD40lCXHvpCucFOfhI0Egk=;
        b=VvmrDKIE1OJ6kRXLwmyw3Mok2Wl/N3w45yVqIQd9oNC5T/CzV0z6sT8tQwU77paLe1
         YuGvdzW8ZGToKVIUM44dm+4a7k7niBWw3cVxDYX6w8mXtArDn7Kv+dlYuxbhye1XePw+
         XvunlQBRsPln9O0vNEJuFmDSsGaea9QcHguiH0M1rgo93n1K6tK+jgydxEMv3VPK/qdJ
         G2F1/tiIpWkFKgnqqrp3g1eDj0Mx2ZRgiF2/gsXlTr6nOzk6gofNP8a3Qnyik6baq0fi
         1uDl/nnh/t4du0/GanFMe6nZCX9Bqp84/u7HENinxPw3HByw4BekAHsZB88ySlZ90zPN
         z5OQ==
X-Gm-Message-State: APjAAAW6NYC6NkWdprPWj83Duj1x2dhozRJ2jp25I4cm1sMB0BHDNrMM
        3lSXDPqHgJ7zaqPucNFhCI4g4SWQ
X-Google-Smtp-Source: APXvYqwoSFWifG8H2ZBKG9MXfDFbwnGOtD+x7OqV1rpYuAKmJWp2LwLAnNulFoSemXHc/wzh5EeXnA==
X-Received: by 2002:a17:902:a6:: with SMTP id a35mr25828638pla.130.1566918149722;
        Tue, 27 Aug 2019 08:02:29 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id p20sm14845699pgj.47.2019.08.27.08.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 08:02:29 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH 2/2] dvb-usb-v2/gl861: remove un-used header file
Date:   Wed, 28 Aug 2019 00:01:41 +0900
Message-Id: <20190827150141.10240-3-tskd08@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827150141.10240-1-tskd08@gmail.com>
References: <20190827150141.10240-1-tskd08@gmail.com>
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

