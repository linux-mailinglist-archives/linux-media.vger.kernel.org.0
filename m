Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A1E23E913
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgHGIgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgHGIgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:49 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913BDC061574;
        Fri,  7 Aug 2020 01:36:49 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id j187so1013409qke.11;
        Fri, 07 Aug 2020 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kPkFIcSFokKvqTTqVmcPnp2f4e3lwJk4o7y95n1MRkU=;
        b=D2DaAEUzOKCb7TGI6DOVsPJRLnFUBxyYmyKABoBJ5taUVHtcWEA6oG0LRz2j/8hRmL
         EnnsibjHoaQgwbOnWXA+qvy3DvRRyrJfl85MbmWEA6YwWDr9/3hflJB69GMYDLtLUEQR
         Vsz3VMUeC8yqzASnBfwgdfNRbKb9HKWSvw/1/Iq2ZVMVTYcVYX8reKqGerD8Q4Bk6RpK
         pP/GpgQG86JWwC2yQ8Cn7UvGEMDVM9HMjh1i+EzVVZh2PB98HuZpvh2Lzz2hGRPV/um8
         HJWK55HE4bWroOkdVFnrgvWNQ7BylHDomHHU9aIm5QTfCgNuqgwWlJj/56JwO6PbtTIl
         UeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kPkFIcSFokKvqTTqVmcPnp2f4e3lwJk4o7y95n1MRkU=;
        b=hqOW4Ptq+Y7JbmPNLZDrmlzr1Cs2+4vRrr9Cwk0S9iajGO1w+YkUsf588aIk6Gq3Fu
         BAYKZy2e2aeZNdEyT2lqYR2uxTgna01dOYtSN4pYX2M/9g1CPjCFICH+LIenw380R1D0
         ksQ34oH+qsqHdLKYY6tR02KGbYncsYUNo5ZKyerfLX8Bjc8TNVLDjrTEbKfOa44SvOMo
         sjidsh66PgSo1O0d7i7UjT/i6XJnwi0VwIcObjwVGPGXP+xiuf4MBGcIXrdQJX2WDKNr
         /Zd/rhGwoUqEgtRjXa/NuyC563MingGnm6jXXy9D+VaFH5HRDX08f6eSk6a+s/e0FsI1
         liVw==
X-Gm-Message-State: AOAM532o9BLM3vPx0RHwheZIsMLjKAhaWAnp1E2yvMqnrl3lptlxQm+X
        7XxbzNwdhOGh6H8WLPNY1z/WpHSRZO4=
X-Google-Smtp-Source: ABdhPJwUpDiyth/4I15fdaDZ8QJARvT0XSF+0JeDhsu+7pvdxLbDnhvEMt5AL1ULfayG+rOIOQz7QQ==
X-Received: by 2002:a05:620a:5f7:: with SMTP id z23mr13039865qkg.206.1596789408463;
        Fri, 07 Aug 2020 01:36:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:47 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 12/20] media: usb: dib0700_devices.c: remove useless if/else
Date:   Fri,  7 Aug 2020 05:35:39 -0300
Message-Id: <20200807083548.204360-12-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/usb/dvb-usb/dib0700_devices.c:1741:1-3:
WARNING: possible condition with no effect (if == else)

Both branches are the same, so remove the if/else altogether.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/usb/dvb-usb/dib0700_devices.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 4ef3fa98d20f..f027db979c90 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -1738,14 +1738,9 @@ static int dib809x_tuner_attach(struct dvb_usb_adapter *adap)
 	struct dib0700_adapter_state *st = adap->priv;
 	struct i2c_adapter *tun_i2c = st->dib8000_ops.get_i2c_master(adap->fe_adap[0].fe, DIBX000_I2C_INTERFACE_TUNER, 1);
 
-	if (adap->id == 0) {
-		if (dvb_attach(dib0090_register, adap->fe_adap[0].fe, tun_i2c, &dib809x_dib0090_config) == NULL)
-			return -ENODEV;
-	} else {
-		/* FIXME: check if it is fe_adap[1] */
-		if (dvb_attach(dib0090_register, adap->fe_adap[0].fe, tun_i2c, &dib809x_dib0090_config) == NULL)
-			return -ENODEV;
-	}
+	/* FIXME: if adap->id != 0, check if it is fe_adap[1] */
+	if (dvb_attach(dib0090_register, adap->fe_adap[0].fe, tun_i2c, &dib809x_dib0090_config) == NULL)
+		return -ENODEV;
 
 	st->set_param_save = adap->fe_adap[0].fe->ops.tuner_ops.set_params;
 	adap->fe_adap[0].fe->ops.tuner_ops.set_params = dib8096_set_param_override;
-- 
2.28.0

