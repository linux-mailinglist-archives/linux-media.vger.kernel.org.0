Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D88D261B
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 11:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387661AbfJJJSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 05:18:54 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34906 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387561AbfJJJSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 05:18:54 -0400
Received: by mail-ed1-f65.google.com with SMTP id v8so4813098eds.2;
        Thu, 10 Oct 2019 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PfylDcjQHOyDfKCfGN7CUwC2z5Nw+1R84ekB8+XNDyw=;
        b=SMp34YA3UQ+fuFMd80I0QbWcRDhdHPxJSh9xHhHX+rDVSkSKR4YL6fYeLAaAAV94qn
         tLJwKrDSzESQWqG3ZHIeU55PeZ9Z1tdPTPXxPKfuh5W7FrYdI+13uPrOZCORcI6zEIXv
         PtAvto7poB2xXNmR+DDnBqHZEoM1q0WAGlzT3GAUEzraSVWQ1Sxmd/IxvU/vs6JCRy/g
         rJl4S+QT6Yt57Htd4Kcs6M5+29tw/P5daOg75AYlB+khvejwqZyIQANkDUtrjmC+fyXG
         zJXqzQkm48pUxwYpKuk8/HAuXihFHJTICn+qQh9ioWyS6BjptBTn05QBxuqFgmGsqepa
         dAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PfylDcjQHOyDfKCfGN7CUwC2z5Nw+1R84ekB8+XNDyw=;
        b=M210TZuC3of55yiXCn2bTvemqvPzno9lV8hTisEeY+aCHPW0AEAqElJ2wiPDZhPBl6
         6GKwE79Sp7tF5q0hb0Zw3PZuAUYlyKN3LHT/bWTlKmixs33Wcmk5zwUJJZccNEaAD1Xn
         yQ/oRxD3LKN+haFnFOmQPP8iOm5T+tjIG5NuOkOWuzEeE5A4Ps8EFNKA2o5+lQf2trRs
         Lhf3hfZLRki8jjrIH+dyAoH3OUzXMYDLPIklrtY2HQvDvV63Rseiw5NQU4YkgfPCjFsh
         qZdEGuOK/IwvNjEikmwR4VTwwP/e+7mxw9CPAxKNIkkQb0saZw+/r1PirgmQNh0ywJDa
         MIww==
X-Gm-Message-State: APjAAAUi8cUkh42awDo/tY5hkCn3fqEEe8Y4lCcI8vN1c6M+M+YFORso
        bUTVxWjAbBQDu8J8jPLRL8k=
X-Google-Smtp-Source: APXvYqzLaPZOBQV7CKfFNRDdsp9kRpcj0LxzV7V6s8H67alanYnCOfyoVappviJJzE4bfdCGAGNUhQ==
X-Received: by 2002:a17:906:7212:: with SMTP id m18mr7098220ejk.88.1570699132012;
        Thu, 10 Oct 2019 02:18:52 -0700 (PDT)
Received: from Limone ([46.114.37.24])
        by smtp.gmail.com with ESMTPSA id v27sm591386ejg.11.2019.10.10.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 02:18:51 -0700 (PDT)
Date:   Thu, 10 Oct 2019 11:18:48 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] media: af9035: add support for Logilink VG0022A
Message-ID: <20191010091848.GA2898@Limone>
References: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
 <9618316567493f917c41109f7dba94e533fbfb4b.1570194906.git.mchehab+samsung@kernel.org>
 <20191009214405.GA3621@Limone>
 <20191009220418.GA3131@Limone>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009220418.GA3131@Limone>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

This patch works for me. It disables firmware downloading for the si2157
instead of the si2168.

Convert si2157 and si2168 to kernel-doc format as suggested by Mauro.
Use bits instead of bool.  Add a flag to si2157 for not loading the
firmware.  Make computation of speed register clear. Add hack for
Logilink VG0022A.

Signed-off-by: Andreas Wendleder <andreas.wendleder@gmail.com>

diff --git a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
index 50dccb394efa..ecd21adf8950 100644
--- a/drivers/media/dvb-frontends/si2168.h
+++ b/drivers/media/dvb-frontends/si2168.h
@@ -9,38 +9,43 @@
 #define SI2168_H
 
 #include <linux/dvb/frontend.h>
-/*
- * I2C address
- * 0x64
+/**
+ * struct si2168_config - configuration parameters for si2168
+ *
+ * @fe:
+ *	frontend returned by driver
+ * @i2c_adapter:
+ *	tuner I2C adapter returned by driver
+ * @ts_mode:
+ *	Transport Stream mode. Can be:
+ *	- %SI2168_TS_PARALLEL
+ *	- %SI2168_TS_SERIAL
+ *	- %SI2168_TS_TRISTATE
+ *	- %SI2168_TS_CLK_MANUAL
+ * @ts_clock_inv:
+ *	TS clock inverted
+ * @ts_clock_gapped:
+ *	TS clock gapped
+ * @spectral_inversion:
+ *	Inverted spectrum
+ *
+ * Note:
+ *	The I2C address of this demod is 0x64.
  */
 struct si2168_config {
-	/*
-	 * frontend
-	 * returned by driver
-	 */
 	struct dvb_frontend **fe;
-
-	/*
-	 * tuner I2C adapter
-	 * returned by driver
-	 */
 	struct i2c_adapter **i2c_adapter;
 
-	/* TS mode */
 #define SI2168_TS_PARALLEL	0x06
 #define SI2168_TS_SERIAL	0x03
 #define SI2168_TS_TRISTATE	0x00
 #define SI2168_TS_CLK_MANUAL	0x20
 	u8 ts_mode;
 
-	/* TS clock inverted */
-	bool ts_clock_inv;
-
-	/* TS clock gapped */
-	bool ts_clock_gapped;
-
-	/* Inverted spectrum */
-	bool spectral_inversion;
+	/* Flags */
+	unsigned int ts_clock_inv:1;
+	unsigned int ts_clock_gapped:1;
+	unsigned int spectral_inversion:1;
 };
 
 #endif
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 804d5b30c697..18bea5222082 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -34,12 +34,12 @@ struct si2168_dev {
 	unsigned int chip_id;
 	unsigned int version;
 	const char *firmware_name;
-	bool active;
-	bool warm;
 	u8 ts_mode;
-	bool ts_clock_inv;
-	bool ts_clock_gapped;
-	bool spectral_inversion;
+	unsigned int active:1;
+	unsigned int warm:1;
+	unsigned int ts_clock_inv:1;
+	unsigned int ts_clock_gapped:1;
+	unsigned int spectral_inversion:1;
 };
 
 /* firmware command struct */
diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..898e0f9f8b70 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -118,6 +118,11 @@ static int si2157_init(struct dvb_frontend *fe)
 			goto err;
 	}
 
+	if (dev->dont_load_firmware) {
+		dev_info(&client->dev, "device is buggy, skipping firmware download\n");
+		goto skip_fw_download;
+	}
+
 	/* query chip revision */
 	memcpy(cmd.args, "\x02", 1);
 	cmd.wlen = 1;
@@ -440,6 +445,7 @@ static int si2157_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, dev);
 	dev->fe = cfg->fe;
 	dev->inversion = cfg->inversion;
+	dev->dont_load_firmware = cfg->dont_load_firmware;
 	dev->if_port = cfg->if_port;
 	dev->chiptype = (u8)id->driver_data;
 	dev->if_frequency = 5000000; /* default value of property 0x0706 */
diff --git a/drivers/media/tuners/si2157.h b/drivers/media/tuners/si2157.h
index c22ca784f43f..ffdece3c2eaa 100644
--- a/drivers/media/tuners/si2157.h
+++ b/drivers/media/tuners/si2157.h
@@ -11,29 +11,34 @@
 #include <media/media-device.h>
 #include <media/dvb_frontend.h>
 
-/*
- * I2C address
- * 0x60
+/**
+ * struct si2157_config - configuration parameters for si2157
+ *
+ * @fe:
+ *	frontend returned by driver
+ * @mdev:
+ *	media device returned by driver
+ * @inversion:
+ *	spectral inversion
+ * @dont_load_firmware:
+ *	Instead of uploading a new firmware, use the existing one
+ * @if_port:
+ *	Port selection
+ *	Select the RF interface to use (pins 9+11 or 12+13)
+ *
+ * Note:
+ *	The I2C address of this demod is 0x60.
  */
 struct si2157_config {
-	/*
-	 * frontend
-	 */
 	struct dvb_frontend *fe;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	struct media_device *mdev;
 #endif
 
-	/*
-	 * Spectral Inversion
-	 */
-	bool inversion;
+	unsigned int inversion:1;
+	unsigned int dont_load_firmware:1;
 
-	/*
-	 * Port selection
-	 * Select the RF interface to use (pins 9+11 or 12+13)
-	 */
 	u8 if_port;
 };
 
diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
index 2bda903358da..778f81b39996 100644
--- a/drivers/media/tuners/si2157_priv.h
+++ b/drivers/media/tuners/si2157_priv.h
@@ -23,8 +23,9 @@ enum si2157_pads {
 struct si2157_dev {
 	struct mutex i2c_mutex;
 	struct dvb_frontend *fe;
-	bool active;
-	bool inversion;
+	unsigned int active:1;
+	unsigned int inversion:1;
+	unsigned int dont_load_firmware:1;
 	u8 chiptype;
 	u8 if_port;
 	u32 if_frequency;
diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 3afd18733614..792667ee5ebc 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1197,6 +1197,15 @@ static int af9035_frontend_attach(struct dvb_usb_adapter *adap)
 	return ret;
 }
 
+/*
+ * The I2C speed register is calculated with:
+ *	I2C speed register = (1000000000 / (24.4 * 16 * I2C_speed))
+ *
+ * The default speed register for it930x is 7, with means a
+ * speed of ~366 kbps
+ */
+#define I2C_SPEED_366K 7
+
 static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	struct state *state = adap_to_priv(adap);
@@ -1208,13 +1217,13 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 
 	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
 
-	/* I2C master bus 2 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
+	/* I2C master bus 2 clock speed 366k */
+	ret = af9035_wr_reg(d, 0x00f6a7, I2C_SPEED_366K);
 	if (ret < 0)
 		goto err;
 
-	/* I2C master bus 1,3 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f103, 0x07);
+	/* I2C master bus 1,3 clock speed 366k */
+	ret = af9035_wr_reg(d, 0x00f103, I2C_SPEED_366K);
 	if (ret < 0)
 		goto err;
 
@@ -1610,6 +1619,24 @@ static int it930x_tuner_attach(struct dvb_usb_adapter *adap)
 
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
@@ -2121,6 +2148,8 @@ static const struct usb_device_id af9035_id_table[] = {
 		&it930x_props, "ITE 9303 Generic", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
 		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
+	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
+		&it930x_props, "Logilink VG0022A", NULL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, af9035_id_table);
