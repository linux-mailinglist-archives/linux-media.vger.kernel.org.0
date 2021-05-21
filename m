Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A604D38BC50
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 04:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237941AbhEUCQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 22:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbhEUCQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 22:16:34 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257C4C061574;
        Thu, 20 May 2021 19:15:12 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id i5so13168051pgm.0;
        Thu, 20 May 2021 19:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dLz7aGadF+Xv8kztA4v+2siux99sGnYrpna00jPGZa8=;
        b=KfeFyY1X93WLYvQD5maNBWuyjPmwAHN94p00zMt3KkNC8Ite9P0I9CVAoItqpBM4Ej
         g0AIdkX4hO6gyksRyv1r5qOyXy3+D2cKGM4yt419UZ2ohEKdw01GgPdGBcZ04Gc9BZXo
         u4PGL31HI8FXy16OaZz18h+0Sf1rrVvr2p4JaJ3wu/Ty8wWYUu8I6/jx7k17esthOYRl
         pO1U3/W8456/4CgAlYUkf2Tx/IsC2BaDPPiu8PHI0XoE8dBe56V1Qt/U50kwZUYtzadu
         wvG+R9HeLqjUiT/FJzrB9/g7Mz6yIJxKf84/yVqt4LM/+xZL1Ha+z0YVospFGAdsSv71
         eOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dLz7aGadF+Xv8kztA4v+2siux99sGnYrpna00jPGZa8=;
        b=QwmEvdMixa5iCG8cTmJDBMc4jkrGRAeVBpTNFepcOvGgK5wDuP9z/b2sqT4QxU8M1s
         Puk+w655/T7e+fxcLx8o7ZR3IGqyTwOkJ8wsgzvK1/KzMlnQr2TNnq7Mry6tRqHnbaSm
         6/o8P3OH6QSrJhT/ZA6dBGn6HcsZGifGY1EXAmdspYB1RS/vyUeNb1bpUNswqoitE+BE
         mQtyZT7pZ3U+/p2IGgE0XXr6DlEL5ze1qr80VlyzisF/NDD3cVIBlo8qJvovUvmEY4dV
         YqEzIEWdkGdN8aajke9j/QBuaRtLmzfV0eR9GdQffNsAc46570vxCzDs6UoAFZIg2WgE
         jUwQ==
X-Gm-Message-State: AOAM531EvW74N3NQVLNjo+cR1tdyrjTk+SvN7+EI6uGhDIW079eW/Gpq
        ffaTwmWJj7KsTRgtRomqxH4R9psolWy8F0eC
X-Google-Smtp-Source: ABdhPJzvtWdnQpDzsPFcvca+oidldFST5RqHZtrj3v/QvQZ3M6NhLldggj/UtI1x3jn4lwAbfS312Q==
X-Received: by 2002:a05:6a00:b51:b029:2d5:874a:6bd7 with SMTP id p17-20020a056a000b51b02902d5874a6bd7mr7922656pfo.6.1621563311585;
        Thu, 20 May 2021 19:15:11 -0700 (PDT)
Received: from yanshuaijun.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id a23sm2474346pjo.21.2021.05.20.19.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 19:15:10 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mikhail.ulyanov@cogentembedded.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/platform/Rcar_jpu.c : fix typo issues
Date:   Fri, 21 May 2021 10:14:57 +0800
Message-Id: <20210521021457.6977-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

change 'requerment' into 'requirement'
change 'quantanization' into 'quantization'
change 'qantization' into 'quantization'

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/platform/rcar_jpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
index a7c198c17deb..f57158bf2b11 100644
--- a/drivers/media/platform/rcar_jpu.c
+++ b/drivers/media/platform/rcar_jpu.c
@@ -42,7 +42,7 @@
 
 /*
  * Align JPEG header end to cache line to make sure we will not have any issues
- * with cache; additionally to requerment (33.3.27 R01UH0501EJ0100 Rev.1.00)
+ * with cache; additionally to requirement (33.3.27 R01UH0501EJ0100 Rev.1.00)
  */
 #define JPU_JPEG_HDR_SIZE		(ALIGN(0x258, L1_CACHE_BYTES))
 #define JPU_JPEG_MAX_BYTES_PER_PIXEL	2	/* 16 bit precision format */
@@ -121,7 +121,7 @@
 #define JCCMD_JEND	(1 << 2)
 #define JCCMD_JSRT	(1 << 0)
 
-/* JPEG code quantanization table number register */
+/* JPEG code quantization table number register */
 #define JCQTN	0x0c
 #define JCQTN_SHIFT(t)		(((t) - 1) << 1)
 
@@ -1644,7 +1644,7 @@ static int jpu_probe(struct platform_device *pdev)
 		goto device_register_rollback;
 	}
 
-	/* fill in qantization and Huffman tables for encoder */
+	/* fill in quantization and Huffman tables for encoder */
 	for (i = 0; i < JPU_MAX_QUALITY; i++)
 		jpu_generate_hdr(i, (unsigned char *)jpeg_hdrs[i]);
 
-- 
2.25.1

