Return-Path: <linux-media+bounces-18795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E974098A16F
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE43283FCC
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69411191493;
	Mon, 30 Sep 2024 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ziy9rojv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658619047E
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697859; cv=none; b=TPmVmUnvKkmdWOGcd5dwtImFaID/QNpEU7/4Q8HiAMcwcYjK6RlVNkl3mOdugLcgapUXHG+ceYHa43oIuB08+mHRKaOmK3Ijbfn4a0V0Ku7Tr7Szmb4npETN8Yvng5KBzgM081kcxpReV9gV9I8KLivXEcIfyBJ+B8NsYaR9N3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697859; c=relaxed/simple;
	bh=ICSsuBtQWRmVw7s3R+cDaXaHD1gfa1jDUFcDWE5NTRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UV7FOrj0WAzWzg4YpG0KTyXuBYEtXKDKfpGnnvVQGXvk4H++T2A00WeZiHXBpRiqkjb00StwKOFJ0znLLL9W8c91QcYQhCWd/wIPzMfypdcO+bnz7QoPIW95eCZhk6ZWMq/FAUwMwrEG2fjIBkyDYEXtzmCEZTFhtxDICr105Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ziy9rojv; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb2824ddc2so34589216d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697857; x=1728302657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oi1bEzb1SAt3y006RY0yDL5v/D/r838jI6u8v0CE/P0=;
        b=Ziy9rojvpQCxlz+ndF9x9OVAyNvUUpVAOEEyhHe974zeEGnqXvzMo3WdCbj+FZQ8IM
         t0/SFRbwXq+T9ybd3vEyKmA3k62DT3P5y3uvZ9XW5ZlaXfK5PNLpNM+kG0UMZvNUFIh3
         cq0jWXCGEZpz/RNMK9ja5vs/lsE7Ss30PO6go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697857; x=1728302657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi1bEzb1SAt3y006RY0yDL5v/D/r838jI6u8v0CE/P0=;
        b=qO2dS10XlLyrqcPXyIOwpYZFjd6XS+dRlw3D1DC5otN4BoYjhXZ7HK+ysXEqfr2FdR
         ranJj5O3IohPtS8bbhKsCIZ3VCmoAfKuk5Px2PTEJdO3umrcXPuoAAkmd5/gLbGt6lI2
         B0MdtV728abvHNat8kYCa5e0lauXklScCzrxHEmdy4v7AkUTW8kkoONvs51gQJdLDby+
         aGmD/hk9MzHZpIaALFdLKeDD0N0fXEJlOa2cHzbnVFw7HEU8nTHOuYg1QEc/7iDAoXds
         te0369TxSI6XO2U1P6yR8NLH2ufIrwbpe04fc29MLNCYu5o9lGhg8s0bv0gBCmKWgKTo
         eoaw==
X-Gm-Message-State: AOJu0YzRIo0vzjc9haQNetHES7YF+xMwQLOw3AlAGSjB/GQN3AwyKsaS
	Komm+HevLt+i4AEpojJ6i6Ao27JDn0if3VarTp+86sNzlKG3dKBCfCVyNL38SA==
X-Google-Smtp-Source: AGHT+IEfJSXK0Wsel23PY6RuLEcqGR+eVsnaqOIyvQM277nf0XUs151BJ1cKdgq24SPhmJrtG19jVA==
X-Received: by 2002:a05:6214:488f:b0:6cb:5fba:e006 with SMTP id 6a1803df08f44-6cb5fbae166mr61875236d6.29.1727697857240;
        Mon, 30 Sep 2024 05:04:17 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:02 +0000
Subject: [PATCH 07/45] media: dvb-usb: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-7-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/usb/dvb-usb/opera1.c:326:26-31: opportunity for str_enable_disable(onoff)
drivers/media/usb/dvb-usb/opera1.c:310:3-8: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/opera1.c:283:19-24: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/opera1.c:296:23-28: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/dvb-usb-dvb.c:49:21-26: opportunity for str_on_off(onoff)
drivers/media/usb/dvb-usb/dvb-usb-dvb.c:47:2-46: opportunity for str_yes_no(adap -> fe_adap [ adap -> active_fe ] . pid_filtering)
drivers/media/usb/dvb-usb/af9005-fe.c:1282:27-31: opportunity for str_high_low(temp)
drivers/media/usb/dvb-usb/af9005-fe.c:790:30-32: opportunity for str_on_off(on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/af9005-fe.c   | 4 ++--
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c | 6 +++---
 drivers/media/usb/dvb-usb/opera1.c      | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/af9005-fe.c b/drivers/media/usb/dvb-usb/af9005-fe.c
index 404e56b32145..ea3aaf3a56cb 100644
--- a/drivers/media/usb/dvb-usb/af9005-fe.c
+++ b/drivers/media/usb/dvb-usb/af9005-fe.c
@@ -787,7 +787,7 @@ static int af9005_fe_power(struct dvb_frontend *fe, int on)
 	struct af9005_fe_state *state = fe->demodulator_priv;
 	u8 temp = on;
 	int ret;
-	deb_info("power %s tuner\n", on ? "on" : "off");
+	deb_info("power %s tuner\n", str_on_off(on));
 	ret = af9005_send_command(state->d, 0x03, &temp, 1, NULL, 0);
 	return ret;
 }
@@ -1279,7 +1279,7 @@ static int af9005_fe_get_frontend(struct dvb_frontend *fe,
 	if (ret)
 		return ret;
 	/* if temp is set = high priority */
-	deb_info("PRIORITY %s\n", temp ? "high" : "low");
+	deb_info("PRIORITY %s\n", str_high_low(temp));
 
 	/* high coderate */
 	ret =
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 0a7f8ba90992..b663c3dff25c 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -44,9 +44,9 @@ static int dvb_usb_ctrl_feed(struct dvb_demux_feed *dvbdmxfeed, int onoff)
 
 	/* activate the pid on the device specific pid_filter */
 	deb_ts("setting pid (%s): %5d %04x at index %d '%s'\n",
-		adap->fe_adap[adap->active_fe].pid_filtering ?
-		"yes" : "no", dvbdmxfeed->pid, dvbdmxfeed->pid,
-		dvbdmxfeed->index, onoff ? "on" : "off");
+		str_yes_no(adap->fe_adap[adap->active_fe].pid_filtering),
+		dvbdmxfeed->pid, dvbdmxfeed->pid,
+		dvbdmxfeed->index, str_on_off(onoff));
 	if (adap->props.fe[adap->active_fe].caps & DVB_USB_ADAP_HAS_PID_FILTER &&
 		adap->fe_adap[adap->active_fe].pid_filtering &&
 		adap->props.fe[adap->active_fe].pid_filter != NULL)
diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index 268f05fc8691..8412b64660d8 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -280,7 +280,7 @@ static int opera1_power_ctrl(struct dvb_usb_device *d, int onoff)
 	u8 val = onoff ? 0x01 : 0x00;
 
 	if (dvb_usb_opera1_debug)
-		info("power %s", onoff ? "on" : "off");
+		info("power %s", str_on_off(onoff));
 	return opera1_xilinx_rw(d->udev, 0xb7, val,
 				&val, 1, OPERA_WRITE_MSG);
 }
@@ -293,7 +293,7 @@ static int opera1_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 		{.addr = ADDR_B1A6_STREAM_CTRL,.buf = onoff ? buf_start : buf_stop,.len = 2},
 	};
 	if (dvb_usb_opera1_debug)
-		info("streaming %s", onoff ? "on" : "off");
+		info("streaming %s", str_on_off(onoff));
 	i2c_transfer(&adap->dev->i2c_adap, start_tuner, 1);
 	return 0;
 }
@@ -307,7 +307,7 @@ static int opera1_pid_filter(struct dvb_usb_adapter *adap, int index, u16 pid,
 	};
 	if (dvb_usb_opera1_debug)
 		info("pidfilter index: %d pid: %d %s", index, pid,
-			onoff ? "on" : "off");
+			str_on_off(onoff));
 	b_pid[0] = (2 * index) + 4;
 	b_pid[1] = onoff ? (pid & 0xff) : (0x00);
 	b_pid[2] = onoff ? ((pid >> 8) & 0xff) : (0x00);
@@ -323,7 +323,7 @@ static int opera1_pid_filter_control(struct dvb_usb_adapter *adap, int onoff)
 		{.addr = ADDR_B1A6_STREAM_CTRL,.buf = b_pid,.len = 3},
 	};
 	if (dvb_usb_opera1_debug)
-		info("%s hw-pidfilter", onoff ? "enable" : "disable");
+		info("%s hw-pidfilter", str_enable_disable(onoff));
 	for (; u < 0x7e; u += 2) {
 		b_pid[0] = u;
 		b_pid[1] = 0;

-- 
2.46.1.824.gd892dcdcdd-goog


