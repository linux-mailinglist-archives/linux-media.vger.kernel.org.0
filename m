Return-Path: <linux-media+bounces-56125-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OClF/+9uWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56125-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:47:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7252B2648
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAFAB3100C4A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A854D389E18;
	Tue, 17 Mar 2026 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="qr5izMuY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9743254A9
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780415; cv=none; b=KDJj0pbDW1+43HxP112VB3ySnssQ53Ed/JF0YBLg0bizROXC2HaN3DMeJYPfO1od8jMSn5+i+bQNq58dZfk4hTn2s0r+iKz34uogPv6Wx4kXfSWk7iPrHOWwIBUrcDU8pakont3tr3o635q67rmjwtGzkMee43cSnSGYvt0ar3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780415; c=relaxed/simple;
	bh=+Rky+iEk6nXiagg9G/NoNhEtXz7TUJ1UjsEcqDwF1o0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UD5wQP0Wm+wztxnMiwo/c7IWjhlc6i4SsVDGKAAV2b88RpoleXxm9yS9kNZAoMpjFq0pV6R5ucdVBDoKLD9ovVCS+2e9GfwMsVu4s1rif2ecvs4myMe8okRRcIKBH4EMIebMDpG235c55odh/ig7R2U3Ws7Q+4OeK/s0i0HusRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=qr5izMuY; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ca6595c8aso5947445d50.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773780413; x=1774385213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4wTfr3Y6zTqjkFGZEWUznJIC7OP9liwhy3bKxKhAQM=;
        b=qr5izMuYLStNdWeHLvskmAET6wfiTukcnu7vbUXj7bvE6caaPf0GEn6y5vy0lGG+h1
         zQeH6v04hUx9lyduXn9VUNib8GPBR80N3zlRuZKC7DntddeqbL6uGz3BhLmqi+wLtK5P
         4I/UUCi9/NOigmq+IKj1r4kjRVG2EBddqhCP/BDp2i19GT4DaAsuYs9DlK05/SdPV8XP
         YEKywiCZSTBTyJnWISZQ6giHfVWFSOI8Zw7pwjxewgMWjf8A0fqsvdi4XsbCkTdNmyWv
         NRzZEI34EnCuwTpG1NVDZ2rzFGnlRPOPrmiNUC90Wqq0sPfdQWEBZEBSzgmofHPUqlGI
         BwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780413; x=1774385213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4wTfr3Y6zTqjkFGZEWUznJIC7OP9liwhy3bKxKhAQM=;
        b=lXbrL9RVLSeG57Q7eHkQxjDkdyQ/hPdGot/9EWOwCB7PneMFe1omJCrpEZyLWpdGkM
         9x8vUQ/T06aHA0S77BMWB/ABIgkpKAazniUf0VF11YjVnb+CyXFMMOsnxdz9TY9tlxxG
         IxSGnaVgvSH+GZ9cTsBAhIVgZXrd9o1lbm4Xr6Mi9+Uo9byuy8l7XaG61qxwAbCiRHOK
         05kSNCKBSWKbSzK0aTbTZ0rMclm4c+DS3Ho3gO7CE729/LHW4uz2xKad75gDaqQr26Ue
         Mwmxk6F/k6KQLEjfEU4n5yGQU+lbxw6b/a+o81H0Wc1SWMMs+O0sRnJQQ6MaBoA4MSlI
         GbyA==
X-Gm-Message-State: AOJu0YxvcaSYk25VaPPOzmYgwmoO77+ry3EmBTXv9PLXx7tGb0gXREIB
	0fRwF3OkYNSKPXcB+asUx9IX9D53n5uIXh3SfJnabCO9vrEeKUc3dJzC6KyeTHI0hs9v6vwTY6q
	M1cF4NeY=
X-Gm-Gg: ATEYQzxl37wum1DNvLt4ck12/wihx0XJ8uTnx/9Ss+WA8wQhEcSKUuXCS3cVer2o0/T
	C4IFT72xOVbQ952Z1M2h2OA2+xILzQhbNcfd0MohJ/gy/4kA4UiuoQjjCFZdPkXleT2XLNIqmmm
	sEuuT/KKj4JLsxN1BE1beFb11xdGHRa8aVZkUzKfk6BhrbDuKYAry0W4dZaiC10J3U3cy2gLfCK
	1XB4WpIlF1tSRPGtdPuPq6KvAP8bSnjinNpPGNrax+iJ7CV3Itp37sEf6Rc2gO+qS1NHkvsAMht
	8YefOKFy4Yfocqxrt+UXRCVEkBOAkrsOVS3Xn3A0WYq2i1FZpPx0TvP4HCEGduTbJZHn/6+aRPA
	YLoYxOtqeSSwKbSnAXi9rGSt9jRsEUImZO37aXbx3lBGcu2FLi6pRFQyhzBAMEk+rXdh+wkiuHp
	WPhjUeKvpxlAMv6+rcMhnv4zjdf2/V0Y0t/o+moqoYKuwmOZTad9HQGCS4mRcVgmPSlEzTHseDk
	AtrVyG4om2sGcOubgDcldlfkFCo5Q==
X-Received: by 2002:a05:690e:2cb:b0:64d:6cf8:f8c with SMTP id 956f58d0204a3-64e9159f310mr1029645d50.40.1773780412673;
        Tue, 17 Mar 2026 13:46:52 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91a47690sm476773d50.5.2026.03.17.13.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:46:52 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v2 2/2] media: em28xx: Add Hauppauge USB Live2
Date: Tue, 17 Mar 2026 15:46:45 -0500
Message-Id: <20260317204645.3365244-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312224915.2907539-3-brad@nextdimension.cc>
References: <20260312224915.2907539-3-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56125-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B7252B2648
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

New revision of Hauppauge USB Live2 switches from cx231xx usb bridge
to Empia em2828X bridge. Inputs for the USB Live2 remain the same:
- Composite video
- S-Video
- Analog stereo audio

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
Changes since v1:
- Added media: to subject line


 drivers/media/usb/em28xx/em28xx-cards.c | 20 ++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h       |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 67266bddb713..0c5851bf4ef0 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2623,6 +2623,23 @@ const struct em28xx_board em28xx_boards[] = {
 			.gpio     = mygica_utv3_tuner_audio_gpio,
 		} },
 	},
+	[EM2828X_BOARD_HAUPPAUGE_USB_LIVE2] = {
+		.name         = "Hauppauge USB Live2",
+		.vchannels    = 2,
+		.tuner_type   = TUNER_ABSENT,
+		.has_dvb      = 0,
+		.decoder      = EM28XX_BUILTIN,
+		.i2c_speed    = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_400_KHZ,
+		.input           = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = 0,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = 1,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		} },
+	},
 };
 EXPORT_SYMBOL_GPL(em28xx_boards);
 
@@ -2770,6 +2787,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x846d),
 			.driver_info = EM2874_BOARD_HAUPPAUGE_USB_QUADHD },
+	{ USB_DEVICE(0x2040, 0xc220),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_USB_LIVE2 },
 	{ USB_DEVICE(0x0438, 0xb002),
 			.driver_info = EM2880_BOARD_AMD_ATI_TV_WONDER_HD_600 },
 	{ USB_DEVICE(0x2001, 0xf112),
@@ -3260,6 +3279,7 @@ static void em28xx_card_setup(struct em28xx *dev)
 	case EM2884_BOARD_HAUPPAUGE_WINTV_HVR_930C:
 	case EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB:
 	case EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595:
+	case EM2828X_BOARD_HAUPPAUGE_USB_LIVE2:
 	{
 		struct tveeprom tv;
 
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index b77357f71cf3..a4a91c0eb2fc 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -144,6 +144,7 @@
 #define EM2860_BOARD_MYGICA_IGRABBER              105
 #define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
 #define EM2860_BOARD_MYGICA_UTV3                  107
+#define EM2828X_BOARD_HAUPPAUGE_USB_LIVE2         108
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.35.1


