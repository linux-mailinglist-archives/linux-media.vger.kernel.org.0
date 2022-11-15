Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B1E6299EF
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 14:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiKONTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 08:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbiKONTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 08:19:43 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA88711C16;
        Tue, 15 Nov 2022 05:19:42 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so16869239pjs.4;
        Tue, 15 Nov 2022 05:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMXbPuT8/apKqChj/zU2J23s1sl6whOKF1BEx7eXQxI=;
        b=Bef/p6nhKlBugQnck4zBnZEky3g+7F0dsB7bsfZCxG9NiLOKVrzps0RQTSyn+tWZCO
         2P2LimiU9odXGC9p9Ju3Xc2ImB+z2fuXcBuuG/EIQJA0lpjfZKW9cwfnvDkggWhZ92Qs
         Ytiu5LayryCinoTlXE8Q/YUuPnMIgcw8HyonZUYPdKFlRiAef7sBvyYc5ohglQMdy8qC
         mjnxG9Ay0+DRBaKSB9ZsLai4cG8Q04xtgTVVw2+qSfrbbttkIobblAKBLquEJSqplZ7D
         p/qEbDWqHIDCtpRRJLEXseJtA/FUMOlioyfQO3oszJHc4nK7cyiMbSXmOHo4iiU4Dn0t
         +QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMXbPuT8/apKqChj/zU2J23s1sl6whOKF1BEx7eXQxI=;
        b=PrPVwoKj6iPuaLYW7IBymJNbFdeHz0GijIxD1MRRLOBuPniVPUyihNjI0xPT0YarWT
         wT+TKOMuHZOkKDtjkABDAVjDdosSh4mbO3Vnbf0GnwI2W9hCzUB14PiP2BUW+qF8GkNQ
         gUr7M0mcOiwOjV2zX49kTZ4xDFwYyN9Uh0qFAIb/bdk1CLQ9f+tVTMWb2FL716YY2C5F
         q+A9Ahgkr4nDqco+NnD8H86O7Mmk0ivnvmvbdA6AO+2G9Z6w7JiNI+2nmsnxo5sB/D8e
         X35Tug8KzLV1Or+B/COhNh+WDBPxZN12nBdc7DvEKAqyXMYHN0sWtTQcedLUcYQZ9zjX
         +0/g==
X-Gm-Message-State: ANoB5pn5DBL9FgIYFsBSrYdR4OvIcxwZHbbmyV4VjnpEXVDyepBJqbXO
        EaqKPrwYQxd+JTKKfAIfolg=
X-Google-Smtp-Source: AA0mqf51UB87woqrbzm1Zfx62dB3veGCWwS7XDUSaHN6MvnCwkLEreoDDtrAq3J8UomMrcZzl7VBfw==
X-Received: by 2002:a17:902:f54d:b0:186:6e16:18dd with SMTP id h13-20020a170902f54d00b001866e1618ddmr3939156plf.131.1668518382213;
        Tue, 15 Nov 2022 05:19:42 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id i24-20020aa796f8000000b00562784609fbsm8670937pfq.209.2022.11.15.05.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:19:41 -0800 (PST)
From:   imv4bel@gmail.com
To:     mchehab@kernel.org
Cc:     Hyunwoo Kim <imv4bel@gmail.com>, kernel@tuxforce.de,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        cai.huoqing@linux.dev, tiwai@suse.de
Subject: [PATCH 4/4] media: ttusb-dec: Fix memory leak in ttusb_dec_exit_dvb()
Date:   Tue, 15 Nov 2022 05:18:22 -0800
Message-Id: <20221115131822.6640-5-imv4bel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115131822.6640-1-imv4bel@gmail.com>
References: <20221115131822.6640-1-imv4bel@gmail.com>
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

From: Hyunwoo Kim <imv4bel@gmail.com>

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

