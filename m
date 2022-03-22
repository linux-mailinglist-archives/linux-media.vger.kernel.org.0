Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB56F4E4988
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 00:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237714AbiCVXKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 19:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236936AbiCVXKo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 19:10:44 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED0060CC3
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 16:09:14 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u3so26092197ljd.0
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=R7sSA5lf8yiLD4b95+HvVilkXGGfNGgEWqfKUc/8rNU=;
        b=dKr0nNhN/p8Yg9ahcNqtoeAs9P3T+qlzYyvFWeLcAQ3g0H0Aulx2+S5WDWaKvgshBp
         tT/SNe/tcwNhBvJVNbLmzy8jRG9sHzjLGss/hhWdfR840qVgm9Gg5BV9IWqWI2y84nP8
         C1h2Vjz1DkM432FxQZVovZLjZZY6fFtk8lypd2KBgVRnLBFoaWH7MKUi42IQYW9Bh36g
         MbcZe1iPvsP31cqV/92H6PC7u+S/47Jw0SXeKtsgcclmyYSTSQpPi3cvZnH6vZGPdcTe
         o/W9cS1pMHf/udG9J7mdAzQfEQVjdKW5Yjs2G6t6pmhSc0ZVG/I/944r4y9EEYbfkEYu
         pyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=R7sSA5lf8yiLD4b95+HvVilkXGGfNGgEWqfKUc/8rNU=;
        b=7Yv2TGvB76R1tWrPPtQAPQNYpgnHXhIWMLhGV54a6DPJQHFZIC+YprIXIzmtjjxaVM
         ej9tKjUpqND7hjuA+Pf/jQ3GZKA9ufvpZM7ReDs4iDQnQt+2bfvaXif+S/pUX/hZmyLK
         2wHwzxiIyRrVLJTFTy6BG20o3o5sQBJLfTFQ8E0HVrXftX7ojsXjqyDaOiKTFVfiwwbu
         8u344n4mCAsRawhZFmPKmN4V3/jeFWNJVdbYBFxlz7B8qkT8Wbjoqbb6rQWAmC7EfTD4
         u85UiEx21Vc1FQ5LaovUqjl8sgBDklSySizMwWD5sOuvo/xY1QOODBfFcm5srEO+pfPC
         wlzg==
X-Gm-Message-State: AOAM530X9EZDQgvI1TK5OpU8ZHWkB17pwl4EH00d9p8Q83NW4roqUvnJ
        M8PyrOv22m99EBtSuJi7i3hbXxXlbGo=
X-Google-Smtp-Source: ABdhPJwgaYr/hG1A+tnVuoEG0Glvvj0ecm1KePYzoTqrQHWB3fVQFvjQGTlkszpcWnrlWSN5U6O+KQ==
X-Received: by 2002:a2e:a54e:0:b0:249:8cad:ec8 with SMTP id e14-20020a2ea54e000000b002498cad0ec8mr6192988ljn.362.1647990552997;
        Tue, 22 Mar 2022 16:09:12 -0700 (PDT)
Received: from [192.168.1.2] (235.132.246.94.ip4.artcom.pl. [94.246.132.235])
        by smtp.googlemail.com with ESMTPSA id f11-20020a19dc4b000000b0044389008f64sm2332244lfj.164.2022.03.22.16.08.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 16:09:04 -0700 (PDT)
Message-ID: <6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com>
Date:   Wed, 23 Mar 2022 00:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To:     linux-media@vger.kernel.org
Content-Language: en-US
From:   Piotr Chmura <chmooreck@gmail.com>
Subject: [PATCH] si2157: unknown chip version Si2147-A30 ROM 0x50
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes firmware file names assignment in si2157 tuner.

kernel version: 5.17.0
device: 07ca:1871 AVerMedia Technologies, Inc. TD310 DVB-T/T2/C dongle

modprobe gives error: unknown chip version Si2147-A30 ROM 0x50

device worked fine on 2.16 series

caused by:
1. table si2157_tuners has swapped fields rom_id and required vs struct 
si2157_tuner_info.
2. both firmware file names can be null for devices with required == 
false - device uses build-in firmware in this case


Tested on my device.


Signed-of-by: Piotr Chmura <chmooreck@poczta.onet.pl>
---

diff -u a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
--- a/drivers/media/tuners/si2157.c    2022-03-20 21:14:17.000000000 +0100
+++ b/drivers/media/tuners/si2157.c    2022-03-22 23:48:05.604408331 +0100
@@ -77,16 +77,16 @@
  }

  static const struct si2157_tuner_info si2157_tuners[] = {
-    { SI2141, false, 0x60, SI2141_60_FIRMWARE, SI2141_A10_FIRMWARE },
-    { SI2141, false, 0x61, SI2141_61_FIRMWARE, SI2141_A10_FIRMWARE },
-    { SI2146, false, 0x11, SI2146_11_FIRMWARE, NULL },
-    { SI2147, false, 0x50, SI2147_50_FIRMWARE, NULL },
-    { SI2148, true,  0x32, SI2148_32_FIRMWARE, SI2158_A20_FIRMWARE },
-    { SI2148, true,  0x33, SI2148_33_FIRMWARE, SI2158_A20_FIRMWARE },
-    { SI2157, false, 0x50, SI2157_50_FIRMWARE, SI2157_A30_FIRMWARE },
-    { SI2158, false, 0x50, SI2158_50_FIRMWARE, SI2158_A20_FIRMWARE },
-    { SI2158, false, 0x51, SI2158_51_FIRMWARE, SI2158_A20_FIRMWARE },
-    { SI2177, false, 0x50, SI2177_50_FIRMWARE, SI2157_A30_FIRMWARE },
+    { SI2141, 0x60, false, SI2141_60_FIRMWARE, SI2141_A10_FIRMWARE },
+    { SI2141, 0x61, false, SI2141_61_FIRMWARE, SI2141_A10_FIRMWARE },
+    { SI2146, 0x11, false, SI2146_11_FIRMWARE, NULL },
+    { SI2147, 0x50, false, SI2147_50_FIRMWARE, NULL },
+    { SI2148, 0x32, true,  SI2148_32_FIRMWARE, SI2158_A20_FIRMWARE },
+    { SI2148, 0x33, true,  SI2148_33_FIRMWARE, SI2158_A20_FIRMWARE },
+    { SI2157, 0x50, false, SI2157_50_FIRMWARE, SI2157_A30_FIRMWARE },
+    { SI2158, 0x50, false, SI2158_50_FIRMWARE, SI2158_A20_FIRMWARE },
+    { SI2158, 0x51, false, SI2158_51_FIRMWARE, SI2158_A20_FIRMWARE },
+    { SI2177, 0x50, false, SI2177_50_FIRMWARE, SI2157_A30_FIRMWARE },
  };

  static int si2157_load_firmware(struct dvb_frontend *fe,
@@ -178,7 +178,7 @@
          }
      }

-    if (!fw_name && !fw_alt_name) {
+    if (required && !fw_name && !fw_alt_name) {
          dev_err(&client->dev,
              "unknown chip version Si21%d-%c%c%c ROM 0x%02x\n",
              part_id, cmd.args[1], cmd.args[3], cmd.args[4], rom_id);

