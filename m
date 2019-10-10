Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3F2D26B4
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 11:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388005AbfJJJvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 05:51:43 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40588 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387791AbfJJJvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 05:51:40 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so6055055wmj.5;
        Thu, 10 Oct 2019 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=srs/G6L95nqsY4WglnHua/DxIGwZ02H3rDdTeu18fMw=;
        b=KNP5xwS0GAhtmU7mevXpPtwvPbvcC1qhN89NeihjYgO6TjF4o1FrLARNsjko52Mmpn
         3Ywfhvczfqldh7Ca4EuzqK1deE7iJy+ankan/vCXcgtldIwpryGNYzDo06eSzlcSjp+k
         vpV1eYwc1HHS/AzAlvw+gh1stGASP88cbeS0eTt5/W/fwLFG7eyYKqeF0D+mieQhcjZt
         xztiOhv/gsAJ9NvMHSNSeJHP9KVTB/O418NUA4CaYj53qi86EG3HYWVGHDkH1w9xaDrF
         RhgQKOTuLsgWS4nSAzX3XDAKAq4Ya2KApDqXpK98GObWb43HQOHH2gapGgt584Gt14tG
         PhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=srs/G6L95nqsY4WglnHua/DxIGwZ02H3rDdTeu18fMw=;
        b=cMb2IgydKE6GKRs+856Hg51b/OY2ltQsoXN+PS0Ma65L1DlwxD+RQSfEAMNnQeE2qu
         Bia6KJTI115XNcptCdHZBKRnG/wXuGukv78JOwK9ddOx/WLe5b/+Mv76YRWG1FrT96QA
         jFE+oTXG+MoAieL90kdtpdKwc8aGBLNx1QRIEy1RFbIJtgVPCs4515xE5orUw9aKQ7Nw
         5guCkk4aIyiuW1Iv9rlcnlXjKtM8QHjglmV0SQTsXqinb2GeYQcftdE4y1tXZ2fAEssB
         uIQZSv6NqgheZejKa794Tfxd88/eAHeNtwHeTF21/BNoJpNx0fspoyoe6Mpw/aSYlZTI
         9hiw==
X-Gm-Message-State: APjAAAWbopNUq+pKRRvJV3ENabykoOrQ6X47z8BHjkND0/KziVpzsJu8
        RPLOgCjFSYe/N39yyuM3rHQ=
X-Google-Smtp-Source: APXvYqxjAkeyomPfEbaWJy7L3AnKIh7SohJILppQM3Ad8XjX1kEfBfQ07OnsFrKj8jcZJLL3kd9hlQ==
X-Received: by 2002:a7b:ce07:: with SMTP id m7mr7049727wmc.117.1570701097956;
        Thu, 10 Oct 2019 02:51:37 -0700 (PDT)
Received: from localhost.localdomain ([46.114.37.24])
        by smtp.googlemail.com with ESMTPSA id o4sm11678251wre.91.2019.10.10.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 02:51:37 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, mchehab@infradead.org, jp@jpvw.nl,
        crope@iki.fi, sean@mess.org, linux-kernel@vger.kernel.org,
        Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 4/4] Add support for Logilink VG0022A.
Date:   Thu, 10 Oct 2019 11:51:03 +0200
Message-Id: <20191010095103.3803-5-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010091848.GA2898@Limone>
References: <20191010091848.GA2898@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This includes a hack for the device as it returns only 0xff after a new
firmware is loaded. To quote Mauro:

"When the [...] firmware that came with the device is replaced
by a new one, any I2C data received from the tuner will be
replaced by 0xff.

Probably, the vendor firmware has some patch specifically
designed for this device. So, we can't replace by the generic
firmware.

The right solution would be to extract the [...] firmware from
the original driver and ask the driver to load the specifically
designed firmware, but, while we don't have that, the next best
solution is to just keep the original firmware at the device."

Signed-off-by: Gon Solo <gonsolo@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 51e607ea3add..792667ee5ebc 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1619,6 +1619,24 @@ static int it930x_tuner_attach(struct dvb_usb_adapter *adap)
 
 	memset(&si2157_config, 0, sizeof(si2157_config));
 	si2157_config.fe = adap->fe[0];
+
+	/*
+	 * HACK: The Logilink VG0022A has a bug: when the si2157
+	 * firmware that came with the device is replaced by a new
+	 * one, the I2C transfers to the tuner will return just 0xff.
+	 *
+	 * Probably, the vendor firmware has some patch specifically
+	 * designed for this device. So, we can't replace by the
+	 * generic firmware. The right solution would be to extract
+	 * the si2157 firmware from the original driver and ask the
+	 * driver to load the specifically designed firmware, but,
+	 * while we don't have that, the next best solution is to just
+	 * keep the original firmware at the device.
+	 */
+	if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK &&
+	    le16_to_cpu(d->udev->descriptor.idProduct) == 0x0100)
+		si2157_config.dont_load_firmware = true;
+
 	si2157_config.if_port = it930x_addresses_table[state->it930x_addresses].tuner_if_port;
 	ret = af9035_add_i2c_dev(d, "si2157",
 				 it930x_addresses_table[state->it930x_addresses].tuner_i2c_addr,
@@ -2130,6 +2148,8 @@ static const struct usb_device_id af9035_id_table[] = {
 		&it930x_props, "ITE 9303 Generic", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
 		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
+	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
+		&it930x_props, "Logilink VG0022A", NULL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, af9035_id_table);
-- 
2.20.1

