Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD01262D27C
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 06:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiKQFAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 00:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbiKQFAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 00:00:46 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCA7391D2;
        Wed, 16 Nov 2022 21:00:46 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id k15so696753pfg.2;
        Wed, 16 Nov 2022 21:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2RtnWBUODwyk00f7bE/k2r1zJUSsT+1BYQxHB4ViqE=;
        b=ZrcM95rF9iRteNL++4aman1VnuJSb1nT4fxBjaAiP4z2w1N7eACH7+h59qMrfOjxKI
         3UXeP9f0UtRkktfiMy0sIijM4kwBCFL3TR6BcSI3pFsx9yILcaO8rwOwEEMHnNiLGdxA
         Hkl3gIskrKylCm1/MQlpv1C+Uym2s5IYDhAjZuUVBKVYoqQa/moWL37lqcbUBs3y3Oxm
         WoREGqWpWcNdB9N/yIBqPj5qw/zSrSjFFd/3j8PjZ1buZoIUHTGn+v/DALpD1q0shjab
         9iGpgKmeeEb1QQ3j6JNUn07BLtjZdP8879KaiqS3i3qwUH0nEsV0pA4F6DbQLCdQH/On
         KLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2RtnWBUODwyk00f7bE/k2r1zJUSsT+1BYQxHB4ViqE=;
        b=vnGLJHDaH9+oNh4phN1OciysudvplO43rCyGKFUppmmNMN8+ImE34Mk0aByRWOwdIT
         yTy+UZZNO8JrOWcSAxFO4zONrvTt1wSnX9LMRfSyiAkFpJWpvSvnpF2WPUhuXzRNGOZJ
         2F8aKwc/D3HnX4dNtw1PJ8xdpgpeDDFTwezkXTWFYVuF2VudZ9jX85EiWAtVzPIoMY7N
         cruhQKDZFLvQ0VLMcUcOGIxQx+loxGKyO3YxGzaYLAC6uIulAqU+gS0DwQFMdUzyU+NQ
         ku9p7YJULpXL20Se6bt1Z/S0u7WA8+jQqsv8/ABw+KXY6jo466ieJd41KSdYfn8+KRM9
         pl7Q==
X-Gm-Message-State: ANoB5pmi08PoarDOhzAgmYwDcdwbwociptAST1tGehHRYsW5dImvg2z0
        HeSy+hw1grNCl3OgxrcPY/M=
X-Google-Smtp-Source: AA0mqf6lEcmx0f2lp7k5ATjPLqIxg+YwDMIrUijBPYh2QipJXhmFIi7AByjzzK7ffMGfTKrRtOY6SA==
X-Received: by 2002:aa7:9518:0:b0:56c:8c13:24fd with SMTP id b24-20020aa79518000000b0056c8c1324fdmr1436863pfp.2.1668661245754;
        Wed, 16 Nov 2022 21:00:45 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id y18-20020aa79af2000000b0053e468a78a8sm11911178pfp.158.2022.11.16.21.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 21:00:45 -0800 (PST)
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     mchehab@kernel.org
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de,
        imv4bel@gmail.com
Subject: [PATCH v3 4/4] media: ttusb-dec: Fix memory leak in ttusb_dec_exit_dvb()
Date:   Wed, 16 Nov 2022 20:59:25 -0800
Message-Id: <20221117045925.14297-5-imv4bel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117045925.14297-1-imv4bel@gmail.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since dvb_frontend_detach() is not called in ttusb_dec_exit_dvb(),
which is called when the device is disconnected, dvb_frontend_free()
is not finally called.

This causes a memory leak just by repeatedly plugging and
unplugging the device.

Fix this issue by adding dvb_frontend_detach() to ttusb_dec_exit_dvb().

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 38822cedd93a..c4474d4c44e2 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1544,8 +1544,7 @@ static void ttusb_dec_exit_dvb(struct ttusb_dec *dec)
 	dvb_dmx_release(&dec->demux);
 	if (dec->fe) {
 		dvb_unregister_frontend(dec->fe);
-		if (dec->fe->ops.release)
-			dec->fe->ops.release(dec->fe);
+		dvb_frontend_detach(dec->fe);
 	}
 	dvb_unregister_adapter(&dec->adapter);
 }
-- 
2.25.1

