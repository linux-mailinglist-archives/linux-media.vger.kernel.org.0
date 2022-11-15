Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8CE3629C0A
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 15:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiKOOZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 09:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiKOOZR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 09:25:17 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E1513D68;
        Tue, 15 Nov 2022 06:25:16 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so17040731pjs.4;
        Tue, 15 Nov 2022 06:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2RtnWBUODwyk00f7bE/k2r1zJUSsT+1BYQxHB4ViqE=;
        b=b2KSlcaX09baSICJR7fo4ZJdSKeEe0g1hDJo79SrydGzyefJBlgnEGTadyk9V7qIlh
         d4oAzKX7Ot3m/bexK5MVqj3YtmiXGBXakOOBe4VXQEM18hiwwoDLu03orHp8bbY9Tm4x
         +8zy3ml79WvKGmxYPWwmEuv5tyzN20mcd1gJcBUPZ/lSfv+nCCAf9tlLiNIJH54RLWt+
         PRoAn3CTPJV49lvSh3rCq5TIn+5BCxtz5YY694boWyepjT94bVH1Kt2gtgnZ5t1uCpBa
         vaO0it3QGWWNiBf7HRQw0qtKsSsh7krWWtAe4B3qqHqVzMsfGyCr2ioN4896izE48Oo3
         w0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2RtnWBUODwyk00f7bE/k2r1zJUSsT+1BYQxHB4ViqE=;
        b=CI84sK3KcROwy9Mf/gLWpw3k3xV23oYFN2btK9CXs8zvqEzkW+1D4UMwixqKWnUo0l
         JqFScY7zUJU33FV5m9ryL1i3re3FAdnDLyP0y7MAIP91B9GhGjr3mElkANYRBme2nmkJ
         LsZV5tP3FuY1G69OmObCKctPmhjzNbUZ368Gm6cz2+c78M9/Do1CieSWqtOBFCdPYhKB
         +f3lF+OHH/bQspWNA0yqbdds0h0n2mYo+tTCrd/fyBh87PxuMpFinUIAckH8PJh3H+ZC
         klgdpmw/PUx2ncYDolqNzZepRzmnFEQ3cdU/hlZcmFxDQUCtkrG66e+U4TTmw0VS/Yly
         jTyA==
X-Gm-Message-State: ANoB5pmDRAJIUI+aOUjuuC5xClQtGiB9Yuh9YXu8z5DKX5bjF6glaSiS
        NpFXwouAt8Sg+gJNlj+Do6k=
X-Google-Smtp-Source: AA0mqf7wqe0ECsHzkiw8k6ZgPwlJ9iuI5uSSfME0mPwlHMQDDXY9sm9dLkiev+MEPSN+mJ8hMjcjTA==
X-Received: by 2002:a17:903:483:b0:17c:5b30:6a1e with SMTP id jj3-20020a170903048300b0017c5b306a1emr4088084plb.138.1668522315893;
        Tue, 15 Nov 2022 06:25:15 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id g17-20020aa79f11000000b0056da2bf607csm8733661pfr.214.2022.11.15.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:25:15 -0800 (PST)
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     mchehab@kernel.org
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de,
        imv4bel@gmail.com
Subject: [PATCH v2 4/4] media: ttusb-dec: Fix memory leak in ttusb_dec_exit_dvb()
Date:   Tue, 15 Nov 2022 06:23:56 -0800
Message-Id: <20221115142356.12315-5-imv4bel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115142356.12315-1-imv4bel@gmail.com>
References: <20221115142356.12315-1-imv4bel@gmail.com>
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

