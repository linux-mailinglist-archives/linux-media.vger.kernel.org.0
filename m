Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A5D23E91A
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgHGIhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgHGIhC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:37:02 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450E6C061574;
        Fri,  7 Aug 2020 01:37:02 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id l64so1026508qkb.8;
        Fri, 07 Aug 2020 01:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I/Ou9tXrhWRK+MpvOUeSIUalY4pwA4fcAtCn4PXLR0k=;
        b=jzOwU/TJPHfOvxuasL2kEjf3CrLKB/5AZA010Knq5M8TaIvaXL8NE7wMuodqtNw0tI
         tqprMJvr/4rnJSxEwWeimCHHUZEMgxV6DDtlmzxGvBjs+/hKxcXeep0qPHK0Af6QzUJ9
         1y1jYjAZ3lE1y8VYChwj8Edm8iiurzP0LqUBGM8DwzhDRNNWoXvTIbtxV9y+hBi/2AW6
         M9ucAhZZ+5hyW6G6dbLpYsHx3DUOi48xVvYcohQuHM6zbzTs/OGbBg1G+jdNHwoT+Dyg
         /as4wl1iK2tGre5P3HvgVMjcYe7aPu4WD7ykfr9dE5fohpW9ZqA7wzr89u0czt+Ql8QX
         FYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I/Ou9tXrhWRK+MpvOUeSIUalY4pwA4fcAtCn4PXLR0k=;
        b=eh1g4yUbGbS7GDU1U2RWh+M/jJ3SsU4FJoS54iZ8nTr3ozyi3F2vcea+V+fNmQLb7X
         lWOmnH77A7stAoIMKM7dzyTm+U7Jfl3xrGJlI6BWwdjiyDg1ItpmDg1teiAtN9K1e6z5
         S1ywl4mKC8Rqh2ZL4ZTXmA9zi+jw0KSdFZIjFTkiZY4q8tHVElSCqyczEG3YaK/SZMgX
         iEJmmP+rPxVmdz1l4cMakIr2CBZTDC4Wi+mvuSf33VPOgM/6eqwLIDuP5/Xg810fvAKA
         38923Em2vWkURSDPa+8YnO+Lhu3Yg2nrpextwHmzDpLX9GHDeBwt1hAkLEXV0tnpI7j9
         Kvuw==
X-Gm-Message-State: AOAM532ghSoW3rSFYyCJOKtFSleHzIQp9g/wg+wryrc5MLir6YSDUb9X
        hnjvvyy54v+1ZzmqudrQ1es33cV63mYGQQ==
X-Google-Smtp-Source: ABdhPJwKJVmcT8SH3+GgtwU6uGrCJSphBSQJK9HCbWbXbcFV2UxSK5KWobdaGQ3hxkW3TKab5yQXbA==
X-Received: by 2002:a05:620a:24e:: with SMTP id q14mr12606378qkn.482.1596789421501;
        Fri, 07 Aug 2020 01:37:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:37:01 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 16/20] media: i2c: imx219.c: fix assignment of 0/1 to bool variable
Date:   Fri,  7 Aug 2020 05:35:43 -0300
Message-Id: <20200807083548.204360-16-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/i2c/imx219.c:1191:1-18:
WARNING: Assignment of 0/1 to bool variable

Replace the assignment to 0 with false instead.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f64c0ef7a897..1cee45e35355 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1188,7 +1188,7 @@ static int __maybe_unused imx219_resume(struct device *dev)
 
 error:
 	imx219_stop_streaming(imx219);
-	imx219->streaming = 0;
+	imx219->streaming = false;
 
 	return ret;
 }
-- 
2.28.0

