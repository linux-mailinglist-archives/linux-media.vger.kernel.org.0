Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF0E3F1764
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 12:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238230AbhHSKkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 06:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237784AbhHSKkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 06:40:03 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFC1C061575;
        Thu, 19 Aug 2021 03:39:26 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id d16so10746783ljq.4;
        Thu, 19 Aug 2021 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=expA65PgsZRhL/SzxtZylqpNhk/qhWit1L+WUueeGt0=;
        b=rpbHpHpE4uDRF+GWj+fdvLgAUWZHorMJzwrFzkvPvJRhorD6EpeRAc8DcC4FF3MHzT
         Xls3TIsmDLvjVTosdvXTt8yea34Dh8tIabWb2QbmXueNaP6AuR8SApft2y66mYTjXRBj
         Qs1ZGXbrkhldAmkuaxOH7lWwzH0EbhY1+XNaZEgkxYkpiQUn1cB5f63u2PFjBPWgpnhU
         9vbbNtuQ+2H4i+E2wwF84PyZ1UWIsjADpGzcmlHwC1/dQcAammk3j4kA5KCw8YLvBDB3
         mC4Qm8dt/+ADSCyg7iAVTtzeSgWMjc8OiemD7Mdr7j8xw8MqQZjFxBDRb3VeKDhw9p/o
         +Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=expA65PgsZRhL/SzxtZylqpNhk/qhWit1L+WUueeGt0=;
        b=plyuiFt6JdZHilqUCF4SUZW5fr2XyNx7hnV4zYI7pcdQqBABaapdpReShbNzHuodbc
         idifV80uAD7huUF2rHoiHOyebstGjc3048xb6QVRBGmpfhiFtNgxmluFq1Q5qyUQ5vpg
         I5NOACJou0TsNIovcLh5qcPfm0zPIlwpfD6xrzpnU9pQXMwN2RG6qa6lJOh7VgtA4iOc
         GohEGJxYDwckaO1GIcaJJBrX/AnRdxku32y7J2A1q+7ckjJ0YIJ4HN9rX9yYXEHbTIba
         LV+u40qwZNMecYxmWLFlPEr/0cvTKQN8YmCoMPgTEWwrSa224VVMs3NsA2zQ352MeSSx
         YPrQ==
X-Gm-Message-State: AOAM532CV51sqTECaWi+JABwrhJyOk/2RyhyylTh+bz1kV4+7ay4GMLo
        zPiy6zpo1N/kmbZ/3JPQSjQ=
X-Google-Smtp-Source: ABdhPJxw+3BWcxCNT4Mse5ENJbd0SlJSleUwzk9MU0hPg647FIh15roZaBVSJzEMaNNu2sjWRFeMAg==
X-Received: by 2002:a2e:7616:: with SMTP id r22mr2283378ljc.387.1629369565321;
        Thu, 19 Aug 2021 03:39:25 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id v78sm294495lfa.180.2021.08.19.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 03:39:24 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Subject: [PATCH v2] media: mxl111sf: change mutex_init() location
Date:   Thu, 19 Aug 2021 13:38:59 +0300
Message-Id: <20210819103859.17498-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819092908.GA27679@gofer.mess.org>
References: <20210819092908.GA27679@gofer.mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
mutex. The problem was in wrong mutex_init() location.

Previous mutex_init(&state->msg_lock) call was in ->init() function, but
dvb_usbv2_init() has this order of calls:

	dvb_usbv2_init()
	  dvb_usbv2_adapter_init()
	    dvb_usbv2_adapter_frontend_init()
	      props->frontend_attach()

	  props->init()

Since mxl111sf_* devices call mxl111sf_ctrl_msg() in ->frontend_attach()
internally we need to initialize state->msg_lock before
frontend_attach(). To achieve it, ->probe() call added to all mxl111sf_*
devices, which will simply initiaize mutex.

Reported-and-tested-by: syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Fixes: 8572211842af ("[media] mxl111sf: convert to new DVB USB")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v2:
	Addressed same bug in all mxl111sf_* devices by adding ->probe
	call

---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 7865fa0a8295..b9714ce994d1 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -1074,6 +1074,14 @@ static int mxl111sf_get_stream_config_dvbt(struct dvb_frontend *fe,
 	return 0;
 }
 
+static int mxl111sf_probe(struct dvb_usb_device *dev)
+{
+	struct mxl111sf_state *state = d_to_priv(dev);
+
+	mutex_init(&state->msg_lock);
+	return 0;
+}
+
 static struct dvb_usb_device_properties mxl111sf_props_dvbt = {
 	.driver_name = KBUILD_MODNAME,
 	.owner = THIS_MODULE,
@@ -1083,6 +1091,7 @@ static struct dvb_usb_device_properties mxl111sf_props_dvbt = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_dvbt,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1124,6 +1133,7 @@ static struct dvb_usb_device_properties mxl111sf_props_atsc = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_atsc,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1165,6 +1175,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mh = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1233,6 +1244,7 @@ static struct dvb_usb_device_properties mxl111sf_props_atsc_mh = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_atsc_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1311,6 +1323,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mercury = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mercury,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1381,6 +1394,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mercury_mh = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mercury_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
-- 
2.32.0

