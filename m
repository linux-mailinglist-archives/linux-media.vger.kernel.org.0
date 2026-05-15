Return-Path: <linux-media+bounces-61759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH/6IlhNB2pZwwIAu9opvQ
	(envelope-from <linux-media+bounces-61759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:44:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C9553D30
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9174F31F3EFC
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4920F3F9296;
	Fri, 15 May 2026 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="fQuPdJW2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16C3F44CD
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861750; cv=none; b=VOclYAZN3U0rR681p/eH7PhufSVQ0lBWTelOSVvMfAfBje1shXKmJ1wks7OqYf02fFRzTGkxrLsRSqizlk9nwtaCBz8xGhf2eYt7Z7FXDwYdSh+K3y3OGvvgDE2iiLvJkEuC1Eezqlth4z8NveAwNM53KbiInoKglhHM2jQnBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861750; c=relaxed/simple;
	bh=m9vEsqoFmoYYQYS+IK+vJ9/C14D2JldaFmUo8FuEZkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DN3yP0Zh9FvmG4yDt3yC99iPQVTUnF439P+lRCc/1QHFLQTZNQMxlGFO7ywnYiKsFBO2vp8DjUzsV1myQGh3msAAMRWfA6Mg2DPQtrj8VIOAWj5Q7eQzxujtc/moEe3C8rtMlhn2xEZNbIJXYaP3dyN0D25xSK1F8ehqZFkZsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=fQuPdJW2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-441209fb77eso683870f8f.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778861743; x=1779466543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYmEcH/Emg6RmlvW6mJdFm5V145YP2TgS8AggJelOe4=;
        b=fQuPdJW2qJsZsuv0iayAvPD9IBbMya9ehjDqzash6k8qRBRvIgfzfqvZUID39uemeq
         36VhOQOiODbvshMHwN3TREZf0EKLJCF53ooyqUyCVVVzrHn20wy6PjwWYEBPpzQkJVT6
         NrlvkdfCJ3EI0WJ7rQH9lnxUkUAUm1wwOS4DxzxjUm3DQBqqX3XVHrLXZcICsdUEVwNl
         uRpPs5eInA6u1mtEm/ADhYyQcPcCJpvvZHkbc24WSbGfv5S3+WSJPfpfSwEad7Y6zAeW
         WZ8AafaLa6x2LBXdahEg5wVjyyCzM2rBZ2uEh7FedSyULMVd/zbYZAWrhzXHgnWQHhda
         JxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778861743; x=1779466543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYmEcH/Emg6RmlvW6mJdFm5V145YP2TgS8AggJelOe4=;
        b=kEQD8S/PNiZzBrKeo8SiDv5Z+yDb3vuPBfLsTZDMu2pcFz4/kshm6nrlAjFYZHNdw/
         bOB+qvubyKJKwiXkcdJGfEFsQ8JfZDOEGHTP7U+qMQwRlHLgd/YXuY4yjKhKSNzkhACL
         gBmn03Jq/wOHLEfNlRuOfiyqTFcIkD73GQToYc+GVVLhTA/Iz8Icv2275g8JsDlbbBAS
         SV5mSE+bhzONSzcGMGpv4EvumtxjictP17a8M+6buSaMAFwbwVCbat/apF7lmFDgtjTZ
         /hQ2n/Ghq912Jd4cX5CBTxEVYzu0hZPtJI1IyizJRK0HC9Nfd4uxMzR/QhFoaHb32yYz
         bXmw==
X-Forwarded-Encrypted: i=1; AFNElJ+CpVBvGm7eWyWLJuVwGTdGy15Kc+y/B3N4YiWHfFyS7hr9IIkXzWDucQOdORUahHUHlI4R8mRJsEKusw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl41q4A2KgjpliGzCP8s1LVU1XwDbpJvjOArbwVhNqoRnvbEoA
	e8M1SGoPvsLdxk8W5lKLIRXmBmaxi8fkxbP3/5qaCId3rHP00LACuAIsrv4i4WgXEK4=
X-Gm-Gg: Acq92OE2bIYaVSEsGSfcQA8AjmHyHLEbOOqqFlZ6WUwKvB69w+27B0qvZHAxbj+8O++
	TGEJPWYc/1tRND+imhxjxaO4OuXEYBGY/6MglXQXnirnLonym+dgVql7GIKNQhphGsP9Xp7gfoD
	lVR+cAdX+ldrcvsfjd8H25hDQK3e5AWqsi8zzhwN5zgTxbWjuGofXTs0DMKINkYAmtbYr89pvmx
	CScrw6MQhHz9vawTIy8hTChVJFs4Tx5pj7BVonGOgfJgamGUWjZ9r8RYG9124XNaeQcIt7Dt8oB
	T0Kj5U6+QKgZUvX910NQiaeiNDo4br4rMTx7q5h5Jut3J4pR96xfYYf2BfEpxR4z94Pehv6uxmf
	8RaViVcR5YUUnCi26fyHvr8TGvFOGboPXTKy3YP7cZ4YgjJEYlqSLFwpPTr3PAYw7+ULjBlWPc0
	JbB7V/cgt8yY0YNSxeXZwYu8+guYWC2Ru+I0/zDnV90NOYgUWrV9SrO0EO7RnGLCGBW502NGsVm
	b1TgBuWMEXpksM=
X-Received: by 2002:a05:6000:29db:b0:454:353e:3f4b with SMTP id ffacd0b85a97d-45d901e10bemr10265116f8f.3.1778861742344;
        Fri, 15 May 2026 09:15:42 -0700 (PDT)
Received: from localhost (p200300f65f47db047ce9331f6697a627.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ce9:331f:6697:a627])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0a1a22csm14956575f8f.19.2026.05.15.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:15:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jasmin Jessich <jasmin@anw.at>,
	Abylay Ospan <aospan@amazon.com>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Olli Salonen <olli.salonen@iki.fi>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ramesh Shanmugasundaram <rashanmu@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Petr Cvek <petrcvekcz@gmail.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Matt Ranostay <matt@ranostay.sg>,
	Eduardo Valentin <edubezval@gmail.com>,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kees Cook <kees@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	Sean Young <sean@mess.org>,
	Zhang Shurong <zhang_shurong@foxmail.com>,
	Shrikant Raskar <raskar.shree97@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1] media: Use named initializers for arrays of i2c_device_data
Date: Fri, 15 May 2026 18:15:28 +0200
Message-ID: <20260515161528.465621-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=81884; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=m9vEsqoFmoYYQYS+IK+vJ9/C14D2JldaFmUo8FuEZkk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqB0ag7HlFE4uzWB7khfsRUqPmyGLRIiisTEzdQ P9YFAQ8abyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagdGoAAKCRCPgPtYfRL+ TuvuB/9J6zqaNUl6P3I+Xb4hLq4vj7wKVLRL3R7XRGvG8pYOKhd3WNOhyxu0P0Z7M+2DnvPVWch 0vSL4NhPdiL/BpPh/3riag6A6aVQ/hPVJhUh/94UEJlzYpeMF5d3Dsc/S+KEjFArKPoBoYsgLQh //AfgCvCW+pSdpYZdrv+ubAoYhUu5vdXXxCPkaTaIv5N32e2of1vCmRnmiXtoCqURJXFNG2oYjP iL8YluyzTyjEHKAJ3I2Yn5gbGaOnFoyNriQzs7SFKKz14cPq5OmUBBik8YkdhiYgdmUFPFDrEWA VaBcy8J7cSp3ONbu8Ch5TXD56XBchr9jhVcewZrIFHFJ8AOF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D46C9553D30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61759-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[anw.at,amazon.com,gentoo.org,iki.fi,gmail.com,kernel.org,linux.intel.com,metafoo.de,ideasonboard.com,leopardimaging.com,pengutronix.de,jmondi.org,raspberrypi.com,samsung.com,intel.com,gateworks.com,bootlin.com,ranostay.sg,collabora.com,nextdimension.cc,vivo.com,chromium.org,foss.st.com,mess.org,foxmail.com,realtek.com,cse.iitm.ac.in,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cheri-alliance.org:url,baylibre.com:email,baylibre.com:mid,baylibre-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace and commas.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to i2c_device_id is the following:

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	
	 struct i2c_device_id {
	 	char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;     /* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
	index afa1d6f34c9c..64fc3a5315c7 100644
	--- a/drivers/media/i2c/tda1997x.c
	+++ b/drivers/media/i2c/tda1997x.c
	@@ -2274,8 +2274,8 @@ static int tda1997x_set_power(struct tda1997x_state *state, bool on)
	 }
	 
	 static const struct i2c_device_id tda1997x_i2c_id[] = {
	-	{ .name = "tda19971", .driver_data = (kernel_ulong_t)&tda1997x_chip_info[TDA19971] },
	-	{ .name = "tda19973", .driver_data = (kernel_ulong_t)&tda1997x_chip_info[TDA19973] },
	+	{ .name = "tda19971", .driver_data_ptr = &tda1997x_chip_info[TDA19971] },
	+	{ .name = "tda19973", .driver_data_ptr = &tda1997x_chip_info[TDA19973] },
		{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, tda1997x_i2c_id);
	@@ -2558,8 +2558,7 @@ static int tda1997x_probe(struct i2c_client *client)
		} else if (client->dev.platform_data) {
			struct tda1997x_platform_data *pdata =
				client->dev.platform_data;
	-		state->info =
	-			(const struct tda1997x_chip_info *)id->driver_data;
	+		state->info = id->driver_data_ptr;
			state->pdata = *pdata;
		} else {
			v4l_err(client, "No platform data\n");

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that.

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

Best regards
Uwe

[1] https://cheri-alliance.org/discover-cheri/
    https://lwn.net/Articles/1037974/

 drivers/media/cec/i2c/tda9950.c               |  2 +-
 drivers/media/dvb-frontends/a8293.c           |  4 +-
 drivers/media/dvb-frontends/af9013.c          |  4 +-
 drivers/media/dvb-frontends/af9033.c          |  4 +-
 drivers/media/dvb-frontends/au8522_decoder.c  |  4 +-
 drivers/media/dvb-frontends/cxd2099.c         |  4 +-
 drivers/media/dvb-frontends/cxd2820r_core.c   |  4 +-
 drivers/media/dvb-frontends/dvb-pll.c         | 44 +++++++++----------
 drivers/media/dvb-frontends/helene.c          |  4 +-
 drivers/media/dvb-frontends/lgdt3306a.c       |  4 +-
 drivers/media/dvb-frontends/lgdt330x.c        |  4 +-
 drivers/media/dvb-frontends/m88ds3103.c       | 10 ++---
 drivers/media/dvb-frontends/mn88443x.c        |  8 ++--
 drivers/media/dvb-frontends/mn88472.c         |  4 +-
 drivers/media/dvb-frontends/mn88473.c         |  4 +-
 drivers/media/dvb-frontends/mxl692.c          |  4 +-
 drivers/media/dvb-frontends/rtl2830.c         |  4 +-
 drivers/media/dvb-frontends/rtl2832.c         |  4 +-
 drivers/media/dvb-frontends/si2165.c          |  4 +-
 drivers/media/dvb-frontends/si2168.c          |  4 +-
 drivers/media/dvb-frontends/sp2.c             |  4 +-
 drivers/media/dvb-frontends/stv090x.c         |  4 +-
 drivers/media/dvb-frontends/stv6110x.c        |  4 +-
 drivers/media/dvb-frontends/tc90522.c         |  6 +--
 drivers/media/dvb-frontends/tda10071.c        |  4 +-
 drivers/media/dvb-frontends/ts2020.c          |  6 +--
 drivers/media/i2c/ad5820.c                    |  4 +-
 drivers/media/i2c/adp1653.c                   |  2 +-
 drivers/media/i2c/adv7170.c                   |  4 +-
 drivers/media/i2c/adv7175.c                   |  4 +-
 drivers/media/i2c/adv7180.c                   | 24 +++++-----
 drivers/media/i2c/adv7183.c                   |  4 +-
 drivers/media/i2c/adv7343.c                   |  4 +-
 drivers/media/i2c/adv7393.c                   |  4 +-
 drivers/media/i2c/adv7511-v4l2.c              |  2 +-
 drivers/media/i2c/adv7604.c                   |  8 ++--
 drivers/media/i2c/adv7842.c                   |  2 +-
 drivers/media/i2c/ak881x.c                    |  4 +-
 drivers/media/i2c/bt819.c                     |  6 +--
 drivers/media/i2c/bt856.c                     |  2 +-
 drivers/media/i2c/bt866.c                     |  2 +-
 drivers/media/i2c/cs3308.c                    |  2 +-
 drivers/media/i2c/cs5345.c                    |  2 +-
 drivers/media/i2c/cs53l32a.c                  |  2 +-
 drivers/media/i2c/cx25840/cx25840-core.c      |  2 +-
 drivers/media/i2c/ds90ub913.c                 |  4 +-
 drivers/media/i2c/ds90ub953.c                 |  6 +--
 drivers/media/i2c/ds90ub960.c                 |  8 ++--
 drivers/media/i2c/dw9714.c                    |  2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  2 +-
 drivers/media/i2c/imx274.c                    |  2 +-
 drivers/media/i2c/ir-kbd-i2c.c                |  6 +--
 drivers/media/i2c/isl7998x.c                  |  2 +-
 drivers/media/i2c/ks0127.c                    |  6 +--
 drivers/media/i2c/lm3560.c                    |  6 +--
 drivers/media/i2c/lm3646.c                    |  4 +-
 drivers/media/i2c/m52790.c                    |  2 +-
 drivers/media/i2c/max2175.c                   |  4 +-
 drivers/media/i2c/ml86v7667.c                 |  4 +-
 drivers/media/i2c/msp3400-driver.c            |  2 +-
 drivers/media/i2c/mt9m001.c                   |  2 +-
 drivers/media/i2c/mt9m111.c                   |  2 +-
 drivers/media/i2c/mt9t112.c                   |  2 +-
 drivers/media/i2c/mt9v011.c                   |  2 +-
 drivers/media/i2c/ov13858.c                   |  4 +-
 drivers/media/i2c/ov2640.c                    |  2 +-
 drivers/media/i2c/ov2659.c                    |  2 +-
 drivers/media/i2c/ov5640.c                    |  4 +-
 drivers/media/i2c/ov5645.c                    |  4 +-
 drivers/media/i2c/ov5647.c                    |  2 +-
 drivers/media/i2c/ov7640.c                    |  2 +-
 drivers/media/i2c/ov7670.c                    |  4 +-
 drivers/media/i2c/ov772x.c                    |  2 +-
 drivers/media/i2c/ov7740.c                    |  2 +-
 drivers/media/i2c/ov9640.c                    |  2 +-
 drivers/media/i2c/ov9650.c                    |  4 +-
 drivers/media/i2c/rj54n1cb0c.c                |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +-
 drivers/media/i2c/s5k5baf.c                   |  2 +-
 drivers/media/i2c/saa6588.c                   |  2 +-
 drivers/media/i2c/saa6752hs.c                 |  2 +-
 drivers/media/i2c/saa7110.c                   |  2 +-
 drivers/media/i2c/saa7115.c                   | 14 +++---
 drivers/media/i2c/saa7127.c                   | 10 ++---
 drivers/media/i2c/saa717x.c                   |  2 +-
 drivers/media/i2c/saa7185.c                   |  2 +-
 drivers/media/i2c/sony-btf-mpx.c              |  2 +-
 drivers/media/i2c/tc358743.c                  |  4 +-
 drivers/media/i2c/tda1997x.c                  |  6 +--
 drivers/media/i2c/tda7432.c                   |  2 +-
 drivers/media/i2c/tda9840.c                   |  2 +-
 drivers/media/i2c/tea6415c.c                  |  2 +-
 drivers/media/i2c/tea6420.c                   |  2 +-
 drivers/media/i2c/ths7303.c                   |  6 +--
 drivers/media/i2c/ths8200.c                   |  4 +-
 drivers/media/i2c/tlv320aic23b.c              |  2 +-
 drivers/media/i2c/tvaudio.c                   |  2 +-
 drivers/media/i2c/tvp514x.c                   |  8 ++--
 drivers/media/i2c/tvp5150.c                   |  2 +-
 drivers/media/i2c/tvp7002.c                   |  2 +-
 drivers/media/i2c/tw2804.c                    |  2 +-
 drivers/media/i2c/tw9900.c                    |  2 +-
 drivers/media/i2c/tw9903.c                    |  2 +-
 drivers/media/i2c/tw9906.c                    |  2 +-
 drivers/media/i2c/tw9910.c                    |  2 +-
 drivers/media/i2c/uda1342.c                   |  2 +-
 drivers/media/i2c/upd64031a.c                 |  2 +-
 drivers/media/i2c/upd64083.c                  |  2 +-
 drivers/media/i2c/video-i2c.c                 |  6 +--
 drivers/media/i2c/vp27smpx.c                  |  2 +-
 drivers/media/i2c/vpx3220.c                   |  6 +--
 drivers/media/i2c/wm8739.c                    |  2 +-
 drivers/media/i2c/wm8775.c                    |  2 +-
 drivers/media/radio/radio-tea5764.c           |  2 +-
 drivers/media/radio/saa7706h.c                |  4 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c |  2 +-
 drivers/media/radio/si4713/si4713.c           |  2 +-
 drivers/media/radio/tef6862.c                 |  4 +-
 .../media/test-drivers/vidtv/vidtv_demod.c    |  4 +-
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  4 +-
 drivers/media/tuners/e4000.c                  |  4 +-
 drivers/media/tuners/fc2580.c                 |  4 +-
 drivers/media/tuners/m88rs6000t.c             |  4 +-
 drivers/media/tuners/mt2060.c                 |  4 +-
 drivers/media/tuners/mxl301rf.c               |  4 +-
 drivers/media/tuners/qm1d1b0004.c             |  4 +-
 drivers/media/tuners/qm1d1c0042.c             |  4 +-
 drivers/media/tuners/si2157.c                 | 10 ++---
 drivers/media/tuners/tda18212.c               |  4 +-
 drivers/media/tuners/tda18250.c               |  4 +-
 drivers/media/tuners/tua9001.c                |  4 +-
 drivers/media/usb/go7007/s2250-board.c        |  2 +-
 drivers/media/v4l2-core/tuner-core.c          |  2 +-
 133 files changed, 269 insertions(+), 269 deletions(-)

diff --git a/drivers/media/cec/i2c/tda9950.c b/drivers/media/cec/i2c/tda9950.c
index cbff851e0c85..2bece4e63687 100644
--- a/drivers/media/cec/i2c/tda9950.c
+++ b/drivers/media/cec/i2c/tda9950.c
@@ -486,7 +486,7 @@ static void tda9950_remove(struct i2c_client *client)
 }
 
 static struct i2c_device_id tda9950_ids[] = {
-	{ "tda9950" },
+	{ .name = "tda9950" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda9950_ids);
diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-frontends/a8293.c
index 7c0963054a8f..52e3dc928327 100644
--- a/drivers/media/dvb-frontends/a8293.c
+++ b/drivers/media/dvb-frontends/a8293.c
@@ -256,8 +256,8 @@ static void a8293_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id a8293_id_table[] = {
-	{ "a8293" },
-	{}
+	{ .name = "a8293" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, a8293_id_table);
 
diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-frontends/af9013.c
index 75f3063c193e..d335bfd18e44 100644
--- a/drivers/media/dvb-frontends/af9013.c
+++ b/drivers/media/dvb-frontends/af9013.c
@@ -1553,8 +1553,8 @@ static void af9013_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id af9013_id_table[] = {
-	{ "af9013" },
-	{}
+	{ .name = "af9013" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, af9013_id_table);
 
diff --git a/drivers/media/dvb-frontends/af9033.c b/drivers/media/dvb-frontends/af9033.c
index 9a3a4d6513dd..01761861b01f 100644
--- a/drivers/media/dvb-frontends/af9033.c
+++ b/drivers/media/dvb-frontends/af9033.c
@@ -1173,8 +1173,8 @@ static void af9033_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id af9033_id_table[] = {
-	{ "af9033" },
-	{}
+	{ .name = "af9033" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, af9033_id_table);
 
diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index 58b959b272c6..9ae47ea3976b 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -768,8 +768,8 @@ static void au8522_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id au8522_id[] = {
-	{ "au8522" },
-	{}
+	{ .name = "au8522" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, au8522_id);
diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-frontends/cxd2099.c
index f95950a61307..e6110af1edcd 100644
--- a/drivers/media/dvb-frontends/cxd2099.c
+++ b/drivers/media/dvb-frontends/cxd2099.c
@@ -672,8 +672,8 @@ static void cxd2099_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cxd2099_id[] = {
-	{ "cxd2099" },
-	{}
+	{ .name = "cxd2099" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cxd2099_id);
 
diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index 3deefeff4bd1..fbbffe9e7251 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -723,8 +723,8 @@ static void cxd2820r_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cxd2820r_id_table[] = {
-	{ "cxd2820r" },
-	{}
+	{ .name = "cxd2820r" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cxd2820r_id_table);
 
diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
index f8fd23f60e3f..d36c163b772f 100644
--- a/drivers/media/dvb-frontends/dvb-pll.c
+++ b/drivers/media/dvb-frontends/dvb-pll.c
@@ -911,28 +911,28 @@ static void dvb_pll_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id dvb_pll_id[] = {
-	{"dtt7579",		DVB_PLL_THOMSON_DTT7579},
-	{"dtt759x",		DVB_PLL_THOMSON_DTT759X},
-	{"z201",		DVB_PLL_LG_Z201},
-	{"unknown_1",		DVB_PLL_UNKNOWN_1},
-	{"tua6010xs",		DVB_PLL_TUA6010XS},
-	{"env57h1xd5",		DVB_PLL_ENV57H1XD5},
-	{"tua6034",		DVB_PLL_TUA6034},
-	{"tda665x",		DVB_PLL_TDA665X},
-	{"tded4",		DVB_PLL_TDED4},
-	{"tdhu2",		DVB_PLL_TDHU2},
-	{"tbmv",		DVB_PLL_SAMSUNG_TBMV},
-	{"sd1878_tda8261",	DVB_PLL_PHILIPS_SD1878_TDA8261},
-	{"opera1",		DVB_PLL_OPERA1},
-	{"dtos403ih102a",	DVB_PLL_SAMSUNG_DTOS403IH102A},
-	{"tdtc9251dh0",		DVB_PLL_SAMSUNG_TDTC9251DH0},
-	{"tbdu18132",		DVB_PLL_SAMSUNG_TBDU18132},
-	{"tbmu24112",		DVB_PLL_SAMSUNG_TBMU24112},
-	{"tdee4",		DVB_PLL_TDEE4},
-	{"dtt7520x",		DVB_PLL_THOMSON_DTT7520X},
-	{"tua6034_friio",	DVB_PLL_TUA6034_FRIIO},
-	{"tda665x_earthpt1",	DVB_PLL_TDA665X_EARTH_PT1},
-	{}
+	{ .name = "dtt7579",             .driver_data = DVB_PLL_THOMSON_DTT7579 },
+	{ .name = "dtt759x",             .driver_data = DVB_PLL_THOMSON_DTT759X },
+	{ .name = "z201",                .driver_data = DVB_PLL_LG_Z201 },
+	{ .name = "unknown_1",           .driver_data = DVB_PLL_UNKNOWN_1 },
+	{ .name = "tua6010xs",           .driver_data = DVB_PLL_TUA6010XS },
+	{ .name = "env57h1xd5",          .driver_data = DVB_PLL_ENV57H1XD5 },
+	{ .name = "tua6034",             .driver_data = DVB_PLL_TUA6034 },
+	{ .name = "tda665x",             .driver_data = DVB_PLL_TDA665X },
+	{ .name = "tded4",               .driver_data = DVB_PLL_TDED4 },
+	{ .name = "tdhu2",               .driver_data = DVB_PLL_TDHU2 },
+	{ .name = "tbmv",                .driver_data = DVB_PLL_SAMSUNG_TBMV },
+	{ .name = "sd1878_tda8261",      .driver_data = DVB_PLL_PHILIPS_SD1878_TDA8261 },
+	{ .name = "opera1",              .driver_data = DVB_PLL_OPERA1 },
+	{ .name = "dtos403ih102a",       .driver_data = DVB_PLL_SAMSUNG_DTOS403IH102A },
+	{ .name = "tdtc9251dh0",         .driver_data = DVB_PLL_SAMSUNG_TDTC9251DH0 },
+	{ .name = "tbdu18132",           .driver_data = DVB_PLL_SAMSUNG_TBDU18132 },
+	{ .name = "tbmu24112",           .driver_data = DVB_PLL_SAMSUNG_TBMU24112 },
+	{ .name = "tdee4",               .driver_data = DVB_PLL_TDEE4 },
+	{ .name = "dtt7520x",            .driver_data = DVB_PLL_THOMSON_DTT7520X },
+	{ .name = "tua6034_friio",       .driver_data = DVB_PLL_TUA6034_FRIIO },
+	{ .name = "tda665x_earthpt1",    .driver_data = DVB_PLL_TDA665X_EARTH_PT1 },
+	{ }
 };
 
 
diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 1402d124544e..993280fefc2c 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -1101,8 +1101,8 @@ static int helene_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id helene_id[] = {
-	{ "helene", },
-	{}
+	{ .name = "helene" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, helene_id);
 
diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index b6a66e122ed5..f4a3136baea3 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2244,8 +2244,8 @@ static void lgdt3306a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lgdt3306a_id_table[] = {
-	{ "lgdt3306a" },
-	{}
+	{ .name = "lgdt3306a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lgdt3306a_id_table);
 
diff --git a/drivers/media/dvb-frontends/lgdt330x.c b/drivers/media/dvb-frontends/lgdt330x.c
index 19a4a05b3499..d90f642e9237 100644
--- a/drivers/media/dvb-frontends/lgdt330x.c
+++ b/drivers/media/dvb-frontends/lgdt330x.c
@@ -983,8 +983,8 @@ static void lgdt330x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lgdt330x_id_table[] = {
-	{ "lgdt330x" },
-	{}
+	{ .name = "lgdt330x" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lgdt330x_id_table);
 
diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index 44bee1f3c5e9..d79b88848a8c 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -2221,11 +2221,11 @@ static void m88ds3103_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id m88ds3103_id_table[] = {
-	{"m88ds3103",  M88DS3103_CHIPTYPE_3103},
-	{"m88rs6000",  M88DS3103_CHIPTYPE_RS6000},
-	{"m88ds3103b", M88DS3103_CHIPTYPE_3103B},
-	{"m88ds3103c", M88DS3103_CHIPTYPE_3103C},
-	{}
+	{ .name = "m88ds3103", .driver_data = M88DS3103_CHIPTYPE_3103 },
+	{ .name = "m88rs6000", .driver_data = M88DS3103_CHIPTYPE_RS6000 },
+	{ .name = "m88ds3103b", .driver_data = M88DS3103_CHIPTYPE_3103B },
+	{ .name = "m88ds3103c", .driver_data = M88DS3103_CHIPTYPE_3103C },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m88ds3103_id_table);
 
diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index 818c4e67364c..cc6bd17daf73 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -787,10 +787,10 @@ static const struct of_device_id mn88443x_of_match[] = {
 MODULE_DEVICE_TABLE(of, mn88443x_of_match);
 
 static const struct i2c_device_id mn88443x_i2c_id[] = {
-	{ "mn884433",   (kernel_ulong_t)&mn88443x_spec_pri },
-	{ "mn884434-0", (kernel_ulong_t)&mn88443x_spec_pri },
-	{ "mn884434-1", (kernel_ulong_t)&mn88443x_spec_sec },
-	{}
+	{ .name = "mn884433", .driver_data = (kernel_ulong_t)&mn88443x_spec_pri },
+	{ .name = "mn884434-0", .driver_data = (kernel_ulong_t)&mn88443x_spec_pri },
+	{ .name = "mn884434-1", .driver_data = (kernel_ulong_t)&mn88443x_spec_sec },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mn88443x_i2c_id);
 
diff --git a/drivers/media/dvb-frontends/mn88472.c b/drivers/media/dvb-frontends/mn88472.c
index 275c404ce286..42b78b9aba20 100644
--- a/drivers/media/dvb-frontends/mn88472.c
+++ b/drivers/media/dvb-frontends/mn88472.c
@@ -708,8 +708,8 @@ static void mn88472_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mn88472_id_table[] = {
-	{ "mn88472" },
-	{}
+	{ .name = "mn88472" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mn88472_id_table);
 
diff --git a/drivers/media/dvb-frontends/mn88473.c b/drivers/media/dvb-frontends/mn88473.c
index 40a0cb1d9c67..b7b11a000969 100644
--- a/drivers/media/dvb-frontends/mn88473.c
+++ b/drivers/media/dvb-frontends/mn88473.c
@@ -743,8 +743,8 @@ static void mn88473_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mn88473_id_table[] = {
-	{ "mn88473" },
-	{}
+	{ .name = "mn88473" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mn88473_id_table);
 
diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-frontends/mxl692.c
index 2d8eaa20723f..bca4a4c3dd66 100644
--- a/drivers/media/dvb-frontends/mxl692.c
+++ b/drivers/media/dvb-frontends/mxl692.c
@@ -1346,8 +1346,8 @@ static void mxl692_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mxl692_id_table[] = {
-	{ "mxl692" },
-	{}
+	{ .name = "mxl692" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mxl692_id_table);
 
diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
index f0ee7c38ee79..4c44e2d695f8 100644
--- a/drivers/media/dvb-frontends/rtl2830.c
+++ b/drivers/media/dvb-frontends/rtl2830.c
@@ -876,8 +876,8 @@ static void rtl2830_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rtl2830_id_table[] = {
-	{ "rtl2830" },
-	{}
+	{ .name = "rtl2830" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rtl2830_id_table);
 
diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index d8e1546aea5e..021f3188f6a5 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1125,8 +1125,8 @@ static void rtl2832_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rtl2832_id_table[] = {
-	{ "rtl2832" },
-	{}
+	{ .name = "rtl2832" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rtl2832_id_table);
 
diff --git a/drivers/media/dvb-frontends/si2165.c b/drivers/media/dvb-frontends/si2165.c
index 4170696af9f0..f1241b63aa5c 100644
--- a/drivers/media/dvb-frontends/si2165.c
+++ b/drivers/media/dvb-frontends/si2165.c
@@ -1281,8 +1281,8 @@ static void si2165_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si2165_id_table[] = {
-	{ "si2165" },
-	{}
+	{ .name = "si2165" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si2165_id_table);
 
diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 9c5bac8cda47..8bc3b6eb1dd3 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -790,8 +790,8 @@ static void si2168_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si2168_id_table[] = {
-	{ "si2168" },
-	{}
+	{ .name = "si2168" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si2168_id_table);
 
diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index 071c7371c699..63dec4b4fd2f 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -407,8 +407,8 @@ static void sp2_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sp2_id[] = {
-	{ "sp2" },
-	{}
+	{ .name = "sp2" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sp2_id);
 
diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index 657df713865e..932bbed5497a 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -5079,8 +5079,8 @@ struct dvb_frontend *stv090x_attach(struct stv090x_config *config,
 EXPORT_SYMBOL_GPL(stv090x_attach);
 
 static const struct i2c_device_id stv090x_id_table[] = {
-	{ "stv090x" },
-	{}
+	{ .name = "stv090x" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, stv090x_id_table);
 
diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-frontends/stv6110x.c
index 7506f39ead55..5075333d7ffc 100644
--- a/drivers/media/dvb-frontends/stv6110x.c
+++ b/drivers/media/dvb-frontends/stv6110x.c
@@ -470,8 +470,8 @@ const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
 EXPORT_SYMBOL_GPL(stv6110x_attach);
 
 static const struct i2c_device_id stv6110x_id_table[] = {
-	{ "stv6110x" },
-	{}
+	{ .name = "stv6110x" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, stv6110x_id_table);
 
diff --git a/drivers/media/dvb-frontends/tc90522.c b/drivers/media/dvb-frontends/tc90522.c
index f1343ba67b97..9a5ffb5f70fc 100644
--- a/drivers/media/dvb-frontends/tc90522.c
+++ b/drivers/media/dvb-frontends/tc90522.c
@@ -830,9 +830,9 @@ static void tc90522_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id tc90522_id[] = {
-	{ TC90522_I2C_DEV_SAT, 0 },
-	{ TC90522_I2C_DEV_TER, 1 },
-	{}
+	{ .name = TC90522_I2C_DEV_SAT, .driver_data = 0 },
+	{ .name = TC90522_I2C_DEV_TER, .driver_data = 1 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc90522_id);
 
diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
index 6e6c2e5c427e..7a635c86b86c 100644
--- a/drivers/media/dvb-frontends/tda10071.c
+++ b/drivers/media/dvb-frontends/tda10071.c
@@ -1230,8 +1230,8 @@ static void tda10071_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda10071_id_table[] = {
-	{ "tda10071_cx24118" },
-	{}
+	{ .name = "tda10071_cx24118" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda10071_id_table);
 
diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
index 8b6006635e49..8775083f4dd6 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -716,9 +716,9 @@ static void ts2020_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ts2020_id_table[] = {
-	{ "ts2020" },
-	{ "ts2022" },
-	{}
+	{ .name = "ts2020" },
+	{ .name = "ts2022" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ts2020_id_table);
 
diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index f60271082fb5..fcce2857b69e 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -347,8 +347,8 @@ static void ad5820_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad5820_id_table[] = {
-	{ "ad5820" },
-	{ "ad5821" },
+	{ .name = "ad5820" },
+	{ .name = "ad5821" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad5820_id_table);
diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index 391bc75bfcd0..177a6e8d7fb8 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -522,7 +522,7 @@ static void adp1653_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adp1653_id_table[] = {
-	{ ADP1653_NAME },
+	{ .name = ADP1653_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adp1653_id_table);
diff --git a/drivers/media/i2c/adv7170.c b/drivers/media/i2c/adv7170.c
index ef8682b980b4..812998729207 100644
--- a/drivers/media/i2c/adv7170.c
+++ b/drivers/media/i2c/adv7170.c
@@ -377,8 +377,8 @@ static void adv7170_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7170_id[] = {
-	{ "adv7170" },
-	{ "adv7171" },
+	{ .name = "adv7170" },
+	{ .name = "adv7171" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7170_id);
diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
index 384da1ec5bf9..f1caab8e2abd 100644
--- a/drivers/media/i2c/adv7175.c
+++ b/drivers/media/i2c/adv7175.c
@@ -432,8 +432,8 @@ static void adv7175_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7175_id[] = {
-	{ "adv7175" },
-	{ "adv7176" },
+	{ .name = "adv7175" },
+	{ .name = "adv7176" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7175_id);
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 669b0b3165b1..e5d11a6e6766 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1626,18 +1626,18 @@ static SIMPLE_DEV_PM_OPS(adv7180_pm_ops, adv7180_suspend, adv7180_resume);
 #endif
 
 static const struct i2c_device_id adv7180_id[] = {
-	{ "adv7180", (kernel_ulong_t)&adv7180_info },
-	{ "adv7180cp", (kernel_ulong_t)&adv7180_info },
-	{ "adv7180st", (kernel_ulong_t)&adv7180_info },
-	{ "adv7182", (kernel_ulong_t)&adv7182_info },
-	{ "adv7280", (kernel_ulong_t)&adv7280_info },
-	{ "adv7280-m", (kernel_ulong_t)&adv7280_m_info },
-	{ "adv7281", (kernel_ulong_t)&adv7281_info },
-	{ "adv7281-m", (kernel_ulong_t)&adv7281_m_info },
-	{ "adv7281-ma", (kernel_ulong_t)&adv7281_ma_info },
-	{ "adv7282", (kernel_ulong_t)&adv7282_info },
-	{ "adv7282-m", (kernel_ulong_t)&adv7282_m_info },
-	{}
+	{ .name = "adv7180", .driver_data = (kernel_ulong_t)&adv7180_info },
+	{ .name = "adv7180cp", .driver_data = (kernel_ulong_t)&adv7180_info },
+	{ .name = "adv7180st", .driver_data = (kernel_ulong_t)&adv7180_info },
+	{ .name = "adv7182", .driver_data = (kernel_ulong_t)&adv7182_info },
+	{ .name = "adv7280", .driver_data = (kernel_ulong_t)&adv7280_info },
+	{ .name = "adv7280-m", .driver_data = (kernel_ulong_t)&adv7280_m_info },
+	{ .name = "adv7281", .driver_data = (kernel_ulong_t)&adv7281_info },
+	{ .name = "adv7281-m", .driver_data = (kernel_ulong_t)&adv7281_m_info },
+	{ .name = "adv7281-ma", .driver_data = (kernel_ulong_t)&adv7281_ma_info },
+	{ .name = "adv7282", .driver_data = (kernel_ulong_t)&adv7282_info },
+	{ .name = "adv7282-m", .driver_data = (kernel_ulong_t)&adv7282_m_info },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7180_id);
 
diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index 25a31a6dd456..a04a1a205fe0 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -619,8 +619,8 @@ static void adv7183_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adv7183_id[] = {
-	{ "adv7183" },
-	{}
+	{ .name = "adv7183" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, adv7183_id);
diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
index b96443404a26..9b91d7073d3c 100644
--- a/drivers/media/i2c/adv7343.c
+++ b/drivers/media/i2c/adv7343.c
@@ -502,8 +502,8 @@ static void adv7343_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adv7343_id[] = {
-	{ "adv7343" },
-	{}
+	{ .name = "adv7343" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, adv7343_id);
diff --git a/drivers/media/i2c/adv7393.c b/drivers/media/i2c/adv7393.c
index c7994bd0bbd4..6f948ba02f86 100644
--- a/drivers/media/i2c/adv7393.c
+++ b/drivers/media/i2c/adv7393.c
@@ -446,8 +446,8 @@ static void adv7393_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adv7393_id[] = {
-	{ "adv7393" },
-	{}
+	{ .name = "adv7393" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7393_id);
 
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 853c7806de92..860cff50c522 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -2008,7 +2008,7 @@ static void adv7511_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7511_id[] = {
-	{ "adv7511-v4l2" },
+	{ .name = "adv7511-v4l2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7511_id);
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..b9fe5d2d2501 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3236,10 +3236,10 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
 };
 
 static const struct i2c_device_id adv76xx_i2c_id[] = {
-	{ "adv7604", (kernel_ulong_t)&adv76xx_chip_info[ADV7604] },
-	{ "adv7610", (kernel_ulong_t)&adv76xx_chip_info[ADV7611] },
-	{ "adv7611", (kernel_ulong_t)&adv76xx_chip_info[ADV7611] },
-	{ "adv7612", (kernel_ulong_t)&adv76xx_chip_info[ADV7612] },
+	{ .name = "adv7604", .driver_data = (kernel_ulong_t)&adv76xx_chip_info[ADV7604] },
+	{ .name = "adv7610", .driver_data = (kernel_ulong_t)&adv76xx_chip_info[ADV7611] },
+	{ .name = "adv7611", .driver_data = (kernel_ulong_t)&adv76xx_chip_info[ADV7611] },
+	{ .name = "adv7612", .driver_data = (kernel_ulong_t)&adv76xx_chip_info[ADV7612] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv76xx_i2c_id);
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index ea6966c0605e..3cfae89ce944 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3675,7 +3675,7 @@ static void adv7842_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7842_id[] = {
-	{ "adv7842" },
+	{ .name = "adv7842" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7842_id);
diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index ee575d01a676..cea46f01997d 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -304,8 +304,8 @@ static void ak881x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ak881x_id[] = {
-	{ "ak8813" },
-	{ "ak8814" },
+	{ .name = "ak8813" },
+	{ .name = "ak8814" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak881x_id);
diff --git a/drivers/media/i2c/bt819.c b/drivers/media/i2c/bt819.c
index f97245f91f88..da44100062fa 100644
--- a/drivers/media/i2c/bt819.c
+++ b/drivers/media/i2c/bt819.c
@@ -457,9 +457,9 @@ static void bt819_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id bt819_id[] = {
-	{ "bt819a" },
-	{ "bt817a" },
-	{ "bt815a" },
+	{ .name = "bt819a" },
+	{ .name = "bt817a" },
+	{ .name = "bt815a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bt819_id);
diff --git a/drivers/media/i2c/bt856.c b/drivers/media/i2c/bt856.c
index 6852aa47cafb..656719158bb4 100644
--- a/drivers/media/i2c/bt856.c
+++ b/drivers/media/i2c/bt856.c
@@ -230,7 +230,7 @@ static void bt856_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bt856_id[] = {
-	{ "bt856" },
+	{ .name = "bt856" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bt856_id);
diff --git a/drivers/media/i2c/bt866.c b/drivers/media/i2c/bt866.c
index a2cc34d35ed2..f5104c7d9f90 100644
--- a/drivers/media/i2c/bt866.c
+++ b/drivers/media/i2c/bt866.c
@@ -197,7 +197,7 @@ static void bt866_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bt866_id[] = {
-	{ "bt866" },
+	{ .name = "bt866" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bt866_id);
diff --git a/drivers/media/i2c/cs3308.c b/drivers/media/i2c/cs3308.c
index 3f2f993e16a6..ad37aeecf05e 100644
--- a/drivers/media/i2c/cs3308.c
+++ b/drivers/media/i2c/cs3308.c
@@ -109,7 +109,7 @@ static void cs3308_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id cs3308_id[] = {
-	{ "cs3308" },
+	{ .name = "cs3308" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs3308_id);
diff --git a/drivers/media/i2c/cs5345.c b/drivers/media/i2c/cs5345.c
index 3a9797a50e82..49b8020fbea2 100644
--- a/drivers/media/i2c/cs5345.c
+++ b/drivers/media/i2c/cs5345.c
@@ -189,7 +189,7 @@ static void cs5345_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id cs5345_id[] = {
-	{ "cs5345" },
+	{ .name = "cs5345" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs5345_id);
diff --git a/drivers/media/i2c/cs53l32a.c b/drivers/media/i2c/cs53l32a.c
index c4cad3293905..a894dcf6b5a9 100644
--- a/drivers/media/i2c/cs53l32a.c
+++ b/drivers/media/i2c/cs53l32a.c
@@ -200,7 +200,7 @@ static void cs53l32a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cs53l32a_id[] = {
-	{ "cs53l32a" },
+	{ .name = "cs53l32a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs53l32a_id);
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 69d5cc648c0f..8110d40931d9 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3989,7 +3989,7 @@ static void cx25840_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-	{ "cx25840" },
+	{ .name = "cx25840" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cx25840_id);
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 49aa5f4a172c..6abb5e324ae1 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -872,8 +872,8 @@ static void ub913_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ub913_id[] = {
-	{ "ds90ub913a-q1" },
-	{}
+	{ .name = "ds90ub913a-q1" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ub913_id);
 
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a8ab67f4137f..d4228e1134ff 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1347,9 +1347,9 @@ static const struct ub953_hw_data ds90ub971_hw = {
 };
 
 static const struct i2c_device_id ub953_id[] = {
-	{ "ds90ub953-q1", (kernel_ulong_t)&ds90ub953_hw },
-	{ "ds90ub971-q1", (kernel_ulong_t)&ds90ub971_hw },
-	{}
+	{ .name = "ds90ub953-q1", .driver_data = (kernel_ulong_t)&ds90ub953_hw },
+	{ .name = "ds90ub971-q1", .driver_data = (kernel_ulong_t)&ds90ub971_hw },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ub953_id);
 
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index d50e977cf6ce..15a9797b47ac 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -5266,10 +5266,10 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
-	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
-	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
-	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
-	{}
+	{ .name = "ds90ub954-q1", .driver_data = (kernel_ulong_t)&ds90ub954_hw },
+	{ .name = "ds90ub960-q1", .driver_data = (kernel_ulong_t)&ds90ub960_hw },
+	{ .name = "ds90ub9702-q1", .driver_data = (kernel_ulong_t)&ds90ub9702_hw },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 3288de539452..1d686b1d2fd7 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -307,7 +307,7 @@ static int __maybe_unused dw9714_vcm_resume(struct device *dev)
 }
 
 static const struct i2c_device_id dw9714_id_table[] = {
-	{ DW9714_NAME },
+	{ .name = DW9714_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dw9714_id_table);
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 50121c3e5b48..738e2801016a 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1485,7 +1485,7 @@ static const struct of_device_id et8ek8_of_table[] = {
 MODULE_DEVICE_TABLE(of, et8ek8_of_table);
 
 static const struct i2c_device_id et8ek8_id_table[] = {
-	{ ET8EK8_NAME },
+	{ .name = ET8EK8_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, et8ek8_id_table);
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 8ec78b60bea6..083c717b8e64 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1951,7 +1951,7 @@ static const struct of_device_id imx274_of_id_table[] = {
 MODULE_DEVICE_TABLE(of, imx274_of_id_table);
 
 static const struct i2c_device_id imx274_id[] = {
-	{ "IMX274" },
+	{ .name = "IMX274" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, imx274_id);
diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 604745317004..f2bf2b354000 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -978,10 +978,10 @@ static void ir_remove(struct i2c_client *client)
 
 static const struct i2c_device_id ir_kbd_id[] = {
 	/* Generic entry for any IR receiver */
-	{ "ir_video", 0 },
+	{ .name = "ir_video", .driver_data = 0 },
 	/* IR device specific entries should be added here */
-	{ "ir_z8f0811_haup", FLAG_TX },
-	{ "ir_z8f0811_hdpvr", FLAG_TX | FLAG_HDPVR },
+	{ .name = "ir_z8f0811_haup", .driver_data = FLAG_TX },
+	{ .name = "ir_z8f0811_hdpvr", .driver_data = FLAG_TX | FLAG_HDPVR },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ir_kbd_id);
diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 5ffd53e005ee..a77538d2343c 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1561,7 +1561,7 @@ static const struct of_device_id isl7998x_of_match[] = {
 MODULE_DEVICE_TABLE(of, isl7998x_of_match);
 
 static const struct i2c_device_id isl7998x_id[] = {
-	{ "isl79987" },
+	{ .name = "isl79987" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, isl7998x_id);
diff --git a/drivers/media/i2c/ks0127.c b/drivers/media/i2c/ks0127.c
index f3fba9179684..8c66be38adc3 100644
--- a/drivers/media/i2c/ks0127.c
+++ b/drivers/media/i2c/ks0127.c
@@ -677,9 +677,9 @@ static void ks0127_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ks0127_id[] = {
-	{ "ks0127" },
-	{ "ks0127b" },
-	{ "ks0122s" },
+	{ .name = "ks0127" },
+	{ .name = "ks0127b" },
+	{ .name = "ks0122s" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ks0127_id);
diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..10beb8167410 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -455,9 +455,9 @@ static void lm3560_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-	{ LM3559_NAME },
-	{ LM3560_NAME },
-	{}
+	{ .name = LM3559_NAME },
+	{ .name = LM3560_NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
diff --git a/drivers/media/i2c/lm3646.c b/drivers/media/i2c/lm3646.c
index 2d16e42ec224..9030cbe32afc 100644
--- a/drivers/media/i2c/lm3646.c
+++ b/drivers/media/i2c/lm3646.c
@@ -386,8 +386,8 @@ static void lm3646_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3646_id_table[] = {
-	{ LM3646_NAME },
-	{}
+	{ .name = LM3646_NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lm3646_id_table);
diff --git a/drivers/media/i2c/m52790.c b/drivers/media/i2c/m52790.c
index 9e1ecfd01e2a..f3adf8c2b27f 100644
--- a/drivers/media/i2c/m52790.c
+++ b/drivers/media/i2c/m52790.c
@@ -163,7 +163,7 @@ static void m52790_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id m52790_id[] = {
-	{ "m52790" },
+	{ .name = "m52790" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m52790_id);
diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index bf02ca23a284..1cc388b52902 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -1413,8 +1413,8 @@ static void max2175_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max2175_id[] = {
-	{ DRIVER_NAME },
-	{}
+	{ .name = DRIVER_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max2175_id);
 
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index 57ba3693649a..48b7d589df31 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -424,8 +424,8 @@ static void ml86v7667_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ml86v7667_id[] = {
-	{ DRV_NAME },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ml86v7667_id);
 
diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..413cfbc2dd94 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -874,7 +874,7 @@ static const struct dev_pm_ops msp3400_pm_ops = {
 };
 
 static const struct i2c_device_id msp_id[] = {
-	{ "msp3400" },
+	{ .name = "msp3400" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, msp_id);
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 7a6114d18dfc..0ade967b357b 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -855,7 +855,7 @@ static void mt9m001_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt9m001_id[] = {
-	{ "mt9m001" },
+	{ .name = "mt9m001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9m001_id);
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 3532c7c38bec..4e748080b798 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1384,7 +1384,7 @@ static const struct of_device_id mt9m111_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt9m111_of_match);
 
 static const struct i2c_device_id mt9m111_id[] = {
-	{ "mt9m111" },
+	{ .name = "mt9m111" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9m111_id);
diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index 2d2c840fc002..bd2268154ca7 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1108,7 +1108,7 @@ static void mt9t112_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt9t112_id[] = {
-	{ "mt9t112" },
+	{ .name = "mt9t112" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9t112_id);
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 055b7915260a..985517f1cff7 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -582,7 +582,7 @@ static void mt9v011_remove(struct i2c_client *c)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id mt9v011_id[] = {
-	{ "mt9v011" },
+	{ .name = "mt9v011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9v011_id);
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 162b49046990..09d58e8b1c7f 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1747,8 +1747,8 @@ static void ov13858_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov13858_id_table[] = {
-	{ "ov13858" },
-	{}
+	{ .name = "ov13858" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, ov13858_id_table);
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index d27fc2df64e6..50feb608b92b 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -1271,7 +1271,7 @@ static void ov2640_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov2640_id[] = {
-	{ "ov2640" },
+	{ .name = "ov2640" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov2640_id);
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 061401b020fc..7d8c7c3465a4 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1553,7 +1553,7 @@ static const struct dev_pm_ops ov2659_pm_ops = {
 };
 
 static const struct i2c_device_id ov2659_id[] = {
-	{ "ov2659" },
+	{ .name = "ov2659" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov2659_id);
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 85ecc23b3587..92d2d6cd4ba4 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3999,8 +3999,8 @@ static const struct dev_pm_ops ov5640_pm_ops = {
 };
 
 static const struct i2c_device_id ov5640_id[] = {
-	{ "ov5640" },
-	{}
+	{ .name = "ov5640" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov5640_id);
 
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index b10d408034a1..c772ef6e51d2 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1219,8 +1219,8 @@ static void ov5645_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov5645_id[] = {
-	{ "ov5645" },
-	{}
+	{ .name = "ov5645" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov5645_id);
 
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index db9bd2892140..3facf92b3841 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1278,7 +1278,7 @@ static const struct dev_pm_ops ov5647_pm_ops = {
 };
 
 static const struct i2c_device_id ov5647_id[] = {
-	{ "ov5647" },
+	{ .name = "ov5647" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov5647_id);
diff --git a/drivers/media/i2c/ov7640.c b/drivers/media/i2c/ov7640.c
index 9f68d89936eb..0fd90bc67e29 100644
--- a/drivers/media/i2c/ov7640.c
+++ b/drivers/media/i2c/ov7640.c
@@ -77,7 +77,7 @@ static void ov7640_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov7640_id[] = {
-	{ "ov7640" },
+	{ .name = "ov7640" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov7640_id);
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 0cb96b6c9990..b6d238ba0d53 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1997,8 +1997,8 @@ static const struct ov7670_devtype ov7675_devdata = {
 };
 
 static const struct i2c_device_id ov7670_id[] = {
-	{ "ov7670", (kernel_ulong_t)&ov7670_devdata },
-	{ "ov7675", (kernel_ulong_t)&ov7675_devdata },
+	{ .name = "ov7670", .driver_data = (kernel_ulong_t)&ov7670_devdata },
+	{ .name = "ov7675", .driver_data = (kernel_ulong_t)&ov7675_devdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov7670_id);
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 062e1023a411..be3ba284ee0b 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1546,7 +1546,7 @@ static void ov772x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov772x_id[] = {
-	{ "ov772x" },
+	{ .name = "ov772x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov772x_id);
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 632fb80469be..c2e02f191816 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1149,7 +1149,7 @@ static int __maybe_unused ov7740_runtime_resume(struct device *dev)
 }
 
 static const struct i2c_device_id ov7740_id[] = {
-	{ "ov7740" },
+	{ .name = "ov7740" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov7740_id);
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 2190c52b1433..122f411044ce 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -752,7 +752,7 @@ static void ov9640_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov9640_id[] = {
-	{ "ov9640" },
+	{ .name = "ov9640" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov9640_id);
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index c94e8fe29f22..5c85db8a4a38 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1567,8 +1567,8 @@ static void ov965x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov965x_id[] = {
-	{ "OV9650" },
-	{ "OV9652" },
+	{ .name = "OV9650" },
+	{ .name = "OV9652" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov965x_id);
diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index e95342d706c3..23352d71a108 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1413,7 +1413,7 @@ static void rj54n1_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rj54n1_id[] = {
-	{ "rj54n1cb0c" },
+	{ .name = "rj54n1cb0c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rj54n1_id);
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index ab31ee2b596b..551387cea521 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1728,7 +1728,7 @@ static void s5c73m3_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id s5c73m3_id[] = {
-	{ DRIVER_NAME },
+	{ .name = DRIVER_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s5c73m3_id);
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index d1d00eca8708..378d273055ee 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -2007,7 +2007,7 @@ static void s5k5baf_remove(struct i2c_client *c)
 }
 
 static const struct i2c_device_id s5k5baf_id[] = {
-	{ S5K5BAF_DRIVER_NAME },
+	{ .name = S5K5BAF_DRIVER_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s5k5baf_id);
diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index 90ae4121a68a..56bfa3d2604b 100644
--- a/drivers/media/i2c/saa6588.c
+++ b/drivers/media/i2c/saa6588.c
@@ -495,7 +495,7 @@ static void saa6588_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa6588_id[] = {
-	{ "saa6588" },
+	{ .name = "saa6588" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa6588_id);
diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 1c0031ba43b4..c6bf0b0902e8 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -770,7 +770,7 @@ static void saa6752hs_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id saa6752hs_id[] = {
-	{ "saa6752hs" },
+	{ .name = "saa6752hs" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa6752hs_id);
diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index 942aeeb40c52..652058b8f766 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -439,7 +439,7 @@ static void saa7110_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa7110_id[] = {
-	{ "saa7110" },
+	{ .name = "saa7110" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa7110_id);
diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 48d6730d9271..7cce90750c93 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1928,13 +1928,13 @@ static void saa711x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-	{ "saa7115_auto", 1 }, /* autodetect */
-	{ "saa7111", 0 },
-	{ "saa7113", 0 },
-	{ "saa7114", 0 },
-	{ "saa7115", 0 },
-	{ "saa7118", 0 },
-	{ "gm7113c", 0 },
+	{ .name = "saa7115_auto", .driver_data = 1 }, /* autodetect */
+	{ .name = "saa7111", .driver_data = 0 },
+	{ .name = "saa7113", .driver_data = 0 },
+	{ .name = "saa7114", .driver_data = 0 },
+	{ .name = "saa7115", .driver_data = 0 },
+	{ .name = "saa7118", .driver_data = 0 },
+	{ .name = "gm7113c", .driver_data = 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa711x_id);
diff --git a/drivers/media/i2c/saa7127.c b/drivers/media/i2c/saa7127.c
index a42a7ffe3768..fdf17f6fae67 100644
--- a/drivers/media/i2c/saa7127.c
+++ b/drivers/media/i2c/saa7127.c
@@ -797,11 +797,11 @@ static void saa7127_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa7127_id[] = {
-	{ "saa7127_auto", 0 },	/* auto-detection */
-	{ "saa7126", SAA7127 },
-	{ "saa7127", SAA7127 },
-	{ "saa7128", SAA7129 },
-	{ "saa7129", SAA7129 },
+	{ .name = "saa7127_auto", .driver_data = 0 },	/* auto-detection */
+	{ .name = "saa7126", .driver_data = SAA7127 },
+	{ .name = "saa7127", .driver_data = SAA7127 },
+	{ .name = "saa7128", .driver_data = SAA7129 },
+	{ .name = "saa7129", .driver_data = SAA7129 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa7127_id);
diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index 713331be947c..0536ceb54650 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -1334,7 +1334,7 @@ static void saa717x_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa717x_id[] = {
-	{ "saa717x" },
+	{ .name = "saa717x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa717x_id);
diff --git a/drivers/media/i2c/saa7185.c b/drivers/media/i2c/saa7185.c
index c04e452a332b..8e5c0eab907d 100644
--- a/drivers/media/i2c/saa7185.c
+++ b/drivers/media/i2c/saa7185.c
@@ -334,7 +334,7 @@ static void saa7185_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa7185_id[] = {
-	{ "saa7185" },
+	{ .name = "saa7185" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa7185_id);
diff --git a/drivers/media/i2c/sony-btf-mpx.c b/drivers/media/i2c/sony-btf-mpx.c
index 16072a9f8247..4c87de0fe1f0 100644
--- a/drivers/media/i2c/sony-btf-mpx.c
+++ b/drivers/media/i2c/sony-btf-mpx.c
@@ -366,7 +366,7 @@ static void sony_btf_mpx_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id sony_btf_mpx_id[] = {
-	{ "sony-btf-mpx" },
+	{ .name = "sony-btf-mpx" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sony_btf_mpx_id);
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index a0ca19359c43..fbd38bbfee03 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2358,8 +2358,8 @@ static void tc358743_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tc358743_id[] = {
-	{ "tc358743" },
-	{}
+	{ .name = "tc358743" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, tc358743_id);
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 5c6dda5338f5..afa1d6f34c9c 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2274,9 +2274,9 @@ static int tda1997x_set_power(struct tda1997x_state *state, bool on)
 }
 
 static const struct i2c_device_id tda1997x_i2c_id[] = {
-	{"tda19971", (kernel_ulong_t)&tda1997x_chip_info[TDA19971]},
-	{"tda19973", (kernel_ulong_t)&tda1997x_chip_info[TDA19973]},
-	{ },
+	{ .name = "tda19971", .driver_data = (kernel_ulong_t)&tda1997x_chip_info[TDA19971] },
+	{ .name = "tda19973", .driver_data = (kernel_ulong_t)&tda1997x_chip_info[TDA19973] },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda1997x_i2c_id);
 
diff --git a/drivers/media/i2c/tda7432.c b/drivers/media/i2c/tda7432.c
index 76ef0fdddf76..a0b65a595ba8 100644
--- a/drivers/media/i2c/tda7432.c
+++ b/drivers/media/i2c/tda7432.c
@@ -400,7 +400,7 @@ static void tda7432_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda7432_id[] = {
-	{ "tda7432" },
+	{ .name = "tda7432" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda7432_id);
diff --git a/drivers/media/i2c/tda9840.c b/drivers/media/i2c/tda9840.c
index e3b266db571f..b34d992777fb 100644
--- a/drivers/media/i2c/tda9840.c
+++ b/drivers/media/i2c/tda9840.c
@@ -182,7 +182,7 @@ static void tda9840_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda9840_id[] = {
-	{ "tda9840" },
+	{ .name = "tda9840" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda9840_id);
diff --git a/drivers/media/i2c/tea6415c.c b/drivers/media/i2c/tea6415c.c
index 0cd2e6c52e20..ea7730a7ee2c 100644
--- a/drivers/media/i2c/tea6415c.c
+++ b/drivers/media/i2c/tea6415c.c
@@ -141,7 +141,7 @@ static void tea6415c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tea6415c_id[] = {
-	{ "tea6415c" },
+	{ .name = "tea6415c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tea6415c_id);
diff --git a/drivers/media/i2c/tea6420.c b/drivers/media/i2c/tea6420.c
index 400883fc0c0f..bebb9a8095db 100644
--- a/drivers/media/i2c/tea6420.c
+++ b/drivers/media/i2c/tea6420.c
@@ -123,7 +123,7 @@ static void tea6420_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tea6420_id[] = {
-	{ "tea6420" },
+	{ .name = "tea6420" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tea6420_id);
diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index ff268ebeb4d9..fa5b9c884c1d 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -369,9 +369,9 @@ static void ths7303_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ths7303_id[] = {
-	{ "ths7303" },
-	{ "ths7353" },
-	{}
+	{ .name = "ths7303" },
+	{ .name = "ths7353" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, ths7303_id);
diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 686f10641c7a..808ef16ec3b3 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -487,8 +487,8 @@ static void ths8200_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ths8200_id[] = {
-	{ "ths8200" },
-	{}
+	{ .name = "ths8200" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ths8200_id);
 
diff --git a/drivers/media/i2c/tlv320aic23b.c b/drivers/media/i2c/tlv320aic23b.c
index 6f6bc5236565..7deeef317714 100644
--- a/drivers/media/i2c/tlv320aic23b.c
+++ b/drivers/media/i2c/tlv320aic23b.c
@@ -188,7 +188,7 @@ static void tlv320aic23b_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id tlv320aic23b_id[] = {
-	{ "tlv320aic23b" },
+	{ .name = "tlv320aic23b" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tlv320aic23b_id);
diff --git a/drivers/media/i2c/tvaudio.c b/drivers/media/i2c/tvaudio.c
index 6267e9ad39c0..f136310b899d 100644
--- a/drivers/media/i2c/tvaudio.c
+++ b/drivers/media/i2c/tvaudio.c
@@ -2086,7 +2086,7 @@ static void tvaudio_remove(struct i2c_client *client)
    detect which device is present. So rather than listing all supported
    devices here, we pretend to support a single, fake device type. */
 static const struct i2c_device_id tvaudio_id[] = {
-	{ "tvaudio" },
+	{ .name = "tvaudio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tvaudio_id);
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index f9c9c80c33ac..c8a1384e4353 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -1182,10 +1182,10 @@ static const struct tvp514x_reg tvp514xm_init_reg_seq[] = {
  * driver_data - Driver data
  */
 static const struct i2c_device_id tvp514x_id[] = {
-	{"tvp5146", (kernel_ulong_t)tvp5146_init_reg_seq },
-	{"tvp5146m2", (kernel_ulong_t)tvp514xm_init_reg_seq },
-	{"tvp5147", (kernel_ulong_t)tvp5147_init_reg_seq },
-	{"tvp5147m1", (kernel_ulong_t)tvp514xm_init_reg_seq },
+	{ .name = "tvp5146", .driver_data = (kernel_ulong_t)tvp5146_init_reg_seq },
+	{ .name = "tvp5146m2", .driver_data = (kernel_ulong_t)tvp514xm_init_reg_seq },
+	{ .name = "tvp5147", .driver_data = (kernel_ulong_t)tvp5147_init_reg_seq },
+	{ .name = "tvp5147m1", .driver_data = (kernel_ulong_t)tvp514xm_init_reg_seq },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, tvp514x_id);
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index e3675c744d9e..9c204f38935d 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2265,7 +2265,7 @@ static const struct dev_pm_ops tvp5150_pm_ops = {
 };
 
 static const struct i2c_device_id tvp5150_id[] = {
-	{ "tvp5150" },
+	{ .name = "tvp5150" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tvp5150_id);
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index c09a5bd71fd0..3979ccde5a95 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -1070,7 +1070,7 @@ static void tvp7002_remove(struct i2c_client *c)
 
 /* I2C Device ID table */
 static const struct i2c_device_id tvp7002_id[] = {
-	{ "tvp7002" },
+	{ .name = "tvp7002" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tvp7002_id);
diff --git a/drivers/media/i2c/tw2804.c b/drivers/media/i2c/tw2804.c
index 3d154f4fb5f9..713e078ff3da 100644
--- a/drivers/media/i2c/tw2804.c
+++ b/drivers/media/i2c/tw2804.c
@@ -414,7 +414,7 @@ static void tw2804_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tw2804_id[] = {
-	{ "tw2804" },
+	{ .name = "tw2804" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw2804_id);
diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 53efdeaed1db..617fcf7f0b45 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -753,7 +753,7 @@ static const struct dev_pm_ops tw9900_pm_ops = {
 };
 
 static const struct i2c_device_id tw9900_id[] = {
-	{ "tw9900" },
+	{ .name = "tw9900" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9900_id);
diff --git a/drivers/media/i2c/tw9903.c b/drivers/media/i2c/tw9903.c
index c3eafd5d5dc8..db063b885b09 100644
--- a/drivers/media/i2c/tw9903.c
+++ b/drivers/media/i2c/tw9903.c
@@ -246,7 +246,7 @@ static void tw9903_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id tw9903_id[] = {
-	{ "tw9903" },
+	{ .name = "tw9903" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9903_id);
diff --git a/drivers/media/i2c/tw9906.c b/drivers/media/i2c/tw9906.c
index 0ab43fe42d7f..079e2f49f38f 100644
--- a/drivers/media/i2c/tw9906.c
+++ b/drivers/media/i2c/tw9906.c
@@ -214,7 +214,7 @@ static void tw9906_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id tw9906_id[] = {
-	{ "tw9906" },
+	{ .name = "tw9906" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9906_id);
diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index f3e400304e04..872207e688bf 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -996,7 +996,7 @@ static void tw9910_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tw9910_id[] = {
-	{ "tw9910" },
+	{ .name = "tw9910" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9910_id);
diff --git a/drivers/media/i2c/uda1342.c b/drivers/media/i2c/uda1342.c
index 2e4540ee2df2..437726788ba0 100644
--- a/drivers/media/i2c/uda1342.c
+++ b/drivers/media/i2c/uda1342.c
@@ -79,7 +79,7 @@ static void uda1342_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id uda1342_id[] = {
-	{ "uda1342" },
+	{ .name = "uda1342" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, uda1342_id);
diff --git a/drivers/media/i2c/upd64031a.c b/drivers/media/i2c/upd64031a.c
index a178af46e695..670118c16872 100644
--- a/drivers/media/i2c/upd64031a.c
+++ b/drivers/media/i2c/upd64031a.c
@@ -219,7 +219,7 @@ static void upd64031a_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id upd64031a_id[] = {
-	{ "upd64031a" },
+	{ .name = "upd64031a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, upd64031a_id);
diff --git a/drivers/media/i2c/upd64083.c b/drivers/media/i2c/upd64083.c
index 5421dc5e32c9..e610dffa9e10 100644
--- a/drivers/media/i2c/upd64083.c
+++ b/drivers/media/i2c/upd64083.c
@@ -190,7 +190,7 @@ static void upd64083_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id upd64083_id[] = {
-	{ "upd64083" },
+	{ .name = "upd64083" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, upd64083_id);
diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index fef3993f4e2d..5bc7cee3d540 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -921,9 +921,9 @@ static const struct dev_pm_ops video_i2c_pm_ops = {
 };
 
 static const struct i2c_device_id video_i2c_id_table[] = {
-	{ "amg88xx", (kernel_ulong_t)&video_i2c_chip[AMG88XX] },
-	{ "mlx90640", (kernel_ulong_t)&video_i2c_chip[MLX90640] },
-	{}
+	{ .name = "amg88xx", .driver_data = (kernel_ulong_t)&video_i2c_chip[AMG88XX] },
+	{ .name = "mlx90640", .driver_data = (kernel_ulong_t)&video_i2c_chip[MLX90640] },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, video_i2c_id_table);
 
diff --git a/drivers/media/i2c/vp27smpx.c b/drivers/media/i2c/vp27smpx.c
index df21950be24f..21fcfdd4c163 100644
--- a/drivers/media/i2c/vp27smpx.c
+++ b/drivers/media/i2c/vp27smpx.c
@@ -172,7 +172,7 @@ static void vp27smpx_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id vp27smpx_id[] = {
-	{ "vp27smpx" },
+	{ .name = "vp27smpx" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vp27smpx_id);
diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 5f1a22284168..29bcbb5a5fbb 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -535,9 +535,9 @@ static void vpx3220_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id vpx3220_id[] = {
-	{ "vpx3220a" },
-	{ "vpx3216b" },
-	{ "vpx3214c" },
+	{ .name = "vpx3220a" },
+	{ .name = "vpx3216b" },
+	{ .name = "vpx3214c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vpx3220_id);
diff --git a/drivers/media/i2c/wm8739.c b/drivers/media/i2c/wm8739.c
index 72eb10339d06..db62bafb447c 100644
--- a/drivers/media/i2c/wm8739.c
+++ b/drivers/media/i2c/wm8739.c
@@ -243,7 +243,7 @@ static void wm8739_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wm8739_id[] = {
-	{ "wm8739" },
+	{ .name = "wm8739" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8739_id);
diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
index 56778d3bc28a..5db197bb6fda 100644
--- a/drivers/media/i2c/wm8775.c
+++ b/drivers/media/i2c/wm8775.c
@@ -289,7 +289,7 @@ static void wm8775_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wm8775_id[] = {
-	{ "wm8775" },
+	{ .name = "wm8775" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8775_id);
diff --git a/drivers/media/radio/radio-tea5764.c b/drivers/media/radio/radio-tea5764.c
index 156cca2866aa..d9547f625e30 100644
--- a/drivers/media/radio/radio-tea5764.c
+++ b/drivers/media/radio/radio-tea5764.c
@@ -502,7 +502,7 @@ static void tea5764_i2c_remove(struct i2c_client *client)
 
 /* I2C subsystem interface */
 static const struct i2c_device_id tea5764_id[] = {
-	{ "radio-tea5764" },
+	{ .name = "radio-tea5764" },
 	{ }					/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(i2c, tea5764_id);
diff --git a/drivers/media/radio/saa7706h.c b/drivers/media/radio/saa7706h.c
index 9572a866defb..bd8bd295a9ec 100644
--- a/drivers/media/radio/saa7706h.c
+++ b/drivers/media/radio/saa7706h.c
@@ -395,8 +395,8 @@ static void saa7706h_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id saa7706h_id[] = {
-	{ DRIVER_NAME },
-	{}
+	{ .name = DRIVER_NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, saa7706h_id);
diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index 3932a449a1b1..a1e570af9c59 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -28,7 +28,7 @@
 /* I2C Device ID List */
 static const struct i2c_device_id si470x_i2c_id[] = {
 	/* Generic Entry */
-	{ "si470x" },
+	{ .name = "si470x" },
 	/* Terminating entry */
 	{ }
 };
diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index e71272c6de37..0c0354566b0a 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -1639,7 +1639,7 @@ static void si4713_remove(struct i2c_client *client)
 
 /* si4713_i2c_driver - i2c driver interface */
 static const struct i2c_device_id si4713_id[] = {
-	{ "si4713" },
+	{ .name = "si4713" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si4713_id);
diff --git a/drivers/media/radio/tef6862.c b/drivers/media/radio/tef6862.c
index 3a6d7926e856..2596d7f4f3f1 100644
--- a/drivers/media/radio/tef6862.c
+++ b/drivers/media/radio/tef6862.c
@@ -173,8 +173,8 @@ static void tef6862_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tef6862_id[] = {
-	{ DRIVER_NAME },
-	{}
+	{ .name = DRIVER_NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, tef6862_id);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index c382e9e94c32..6e5fe402976b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -407,8 +407,8 @@ static const struct dvb_frontend_ops vidtv_demod_ops = {
 };
 
 static const struct i2c_device_id vidtv_demod_i2c_id_table[] = {
-	{ "dvb_vidtv_demod" },
-	{}
+	{ .name = "dvb_vidtv_demod" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vidtv_demod_i2c_id_table);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index ee55df4029bc..bd50b86e927c 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -385,8 +385,8 @@ static const struct dvb_tuner_ops vidtv_tuner_ops = {
 };
 
 static const struct i2c_device_id vidtv_tuner_i2c_id_table[] = {
-	{ "dvb_vidtv_tuner" },
-	{}
+	{ .name = "dvb_vidtv_tuner" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vidtv_tuner_i2c_id_table);
 
diff --git a/drivers/media/tuners/e4000.c b/drivers/media/tuners/e4000.c
index b83f37a77224..94abb3715401 100644
--- a/drivers/media/tuners/e4000.c
+++ b/drivers/media/tuners/e4000.c
@@ -719,8 +719,8 @@ static void e4000_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id e4000_id_table[] = {
-	{ "e4000" },
-	{}
+	{ .name = "e4000" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, e4000_id_table);
 
diff --git a/drivers/media/tuners/fc2580.c b/drivers/media/tuners/fc2580.c
index 75087d9b224f..b76fa1320f5f 100644
--- a/drivers/media/tuners/fc2580.c
+++ b/drivers/media/tuners/fc2580.c
@@ -600,8 +600,8 @@ static void fc2580_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id fc2580_id_table[] = {
-	{ "fc2580" },
-	{}
+	{ .name = "fc2580" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fc2580_id_table);
 
diff --git a/drivers/media/tuners/m88rs6000t.c b/drivers/media/tuners/m88rs6000t.c
index 0a724cdf0f6d..1addb3d229cf 100644
--- a/drivers/media/tuners/m88rs6000t.c
+++ b/drivers/media/tuners/m88rs6000t.c
@@ -709,8 +709,8 @@ static void m88rs6000t_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id m88rs6000t_id[] = {
-	{ "m88rs6000t" },
-	{}
+	{ .name = "m88rs6000t" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m88rs6000t_id);
 
diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.c
index ef3196e6bd30..c57233c7441a 100644
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -514,8 +514,8 @@ static void mt2060_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt2060_id_table[] = {
-	{ "mt2060" },
-	{}
+	{ .name = "mt2060" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt2060_id_table);
 
diff --git a/drivers/media/tuners/mxl301rf.c b/drivers/media/tuners/mxl301rf.c
index cfc78891ce03..1d84456cb19b 100644
--- a/drivers/media/tuners/mxl301rf.c
+++ b/drivers/media/tuners/mxl301rf.c
@@ -317,8 +317,8 @@ static void mxl301rf_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id mxl301rf_id[] = {
-	{ "mxl301rf" },
-	{}
+	{ .name = "mxl301rf" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mxl301rf_id);
 
diff --git a/drivers/media/tuners/qm1d1b0004.c b/drivers/media/tuners/qm1d1b0004.c
index 07ad84f42c9f..59d98681e674 100644
--- a/drivers/media/tuners/qm1d1b0004.c
+++ b/drivers/media/tuners/qm1d1b0004.c
@@ -243,8 +243,8 @@ static void qm1d1b0004_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id qm1d1b0004_id[] = {
-	{ "qm1d1b0004" },
-	{}
+	{ .name = "qm1d1b0004" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, qm1d1b0004_id);
diff --git a/drivers/media/tuners/qm1d1c0042.c b/drivers/media/tuners/qm1d1c0042.c
index db60562ad698..2d19cfdb67b9 100644
--- a/drivers/media/tuners/qm1d1c0042.c
+++ b/drivers/media/tuners/qm1d1c0042.c
@@ -434,8 +434,8 @@ static void qm1d1c0042_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id qm1d1c0042_id[] = {
-	{ "qm1d1c0042" },
-	{}
+	{ .name = "qm1d1c0042" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, qm1d1c0042_id);
 
diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 4d67e347c22f..d517a91e6fbc 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -1097,11 +1097,11 @@ static void si2157_remove(struct i2c_client *client)
  * all SiLabs TER tuners, as the driver should auto-detect it.
  */
 static const struct i2c_device_id si2157_id_table[] = {
-	{"si2157", SI2157},
-	{"si2146", SI2146},
-	{"si2141", SI2141},
-	{"si2177", SI2177},
-	{}
+	{ .name = "si2157", .driver_data = SI2157 },
+	{ .name = "si2146", .driver_data = SI2146 },
+	{ .name = "si2141", .driver_data = SI2141 },
+	{ .name = "si2177", .driver_data = SI2177 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si2157_id_table);
 
diff --git a/drivers/media/tuners/tda18212.c b/drivers/media/tuners/tda18212.c
index 5f583c010408..18d1850691fb 100644
--- a/drivers/media/tuners/tda18212.c
+++ b/drivers/media/tuners/tda18212.c
@@ -254,8 +254,8 @@ static void tda18212_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda18212_id[] = {
-	{ "tda18212" },
-	{}
+	{ .name = "tda18212" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda18212_id);
 
diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18250.c
index caaf5e0d0c9b..7bb945ba0989 100644
--- a/drivers/media/tuners/tda18250.c
+++ b/drivers/media/tuners/tda18250.c
@@ -868,8 +868,8 @@ static void tda18250_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda18250_id_table[] = {
-	{ "tda18250" },
-	{}
+	{ .name = "tda18250" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda18250_id_table);
 
diff --git a/drivers/media/tuners/tua9001.c b/drivers/media/tuners/tua9001.c
index c0aed1b441e2..fcdbf1a0c1d8 100644
--- a/drivers/media/tuners/tua9001.c
+++ b/drivers/media/tuners/tua9001.c
@@ -245,8 +245,8 @@ static void tua9001_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tua9001_id_table[] = {
-	{ "tua9001" },
-	{}
+	{ .name = "tua9001" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tua9001_id_table);
 
diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7007/s2250-board.c
index 567f851d5896..0901d79e827d 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -611,7 +611,7 @@ static void s2250_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id s2250_id[] = {
-	{ "s2250" },
+	{ .name = "s2250" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s2250_id);
diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-core/tuner-core.c
index 004ec4d7beea..1e130e6f903f 100644
--- a/drivers/media/v4l2-core/tuner-core.c
+++ b/drivers/media/v4l2-core/tuner-core.c
@@ -1401,7 +1401,7 @@ static const struct dev_pm_ops tuner_pm_ops = {
 };
 
 static const struct i2c_device_id tuner_id[] = {
-	{ "tuner", }, /* autodetect */
+	{ .name = "tuner" }, /* autodetect */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tuner_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
prerequisite-patch-id: 7779c63f16ef6f7247cdb71c89e66b27e299eb74
prerequisite-patch-id: 6f920b6f8c31dc0ad1689200c37680755c20ce8b
prerequisite-patch-id: 1fd68e883664147052540eea19769ea9e92d0138
prerequisite-patch-id: fff07090df18a39a361bbb091a3f17223b4606b4
prerequisite-patch-id: a935aab66aa9896437ab9d757ef9fdc859d22495
prerequisite-patch-id: d0d54f7acecd560cdeb6ea0c0e5ae77a50695d68
prerequisite-patch-id: d7876560b3bb9b05ac462d0a9b09b50efeb9b5e1
prerequisite-patch-id: 65531f0504ac1885c6c4ed6be0e6a206a9795d5b
prerequisite-patch-id: ec83e7e18d66da9ca677b5c8180a22bf3717c8fb
prerequisite-patch-id: e33193d1a91f5819128db924c080caf1c5198667
prerequisite-patch-id: c8862be402a445f30b9f5c91b07afdc840e7e21f
prerequisite-patch-id: 33c001d1b8ecaf57ebe53c321d82d671bc82b647
prerequisite-patch-id: a59a578f49eb5147623aab9fdcacba405b9c8353
prerequisite-patch-id: 5eef512b8a5a1ec1848a939928168dbb719ca72e
prerequisite-patch-id: 04746bfdfe146af71d0c41e225978fb42ce977f5
prerequisite-patch-id: f8aeb0b768ae718aa0dab188fbad671aa4c76501
prerequisite-patch-id: 8e0b48a5d5f8bb91933d440eda8f065590e5ca97
prerequisite-patch-id: 5ca261e980415013434edc099b6f741b7a96c7a8
prerequisite-patch-id: 912c3a7f7fa847c59d499e004965b805a63c8836
prerequisite-patch-id: acf784c7c03d3cd14a8a19610a6d8995e2b5da6d
prerequisite-patch-id: 09a95efff7875781ceed199c60204a2603960f4f
prerequisite-patch-id: 8051fbf0a60e5e9d34f5e7623a5159d32fbc511d
prerequisite-patch-id: c4897ca0762d01cd5e8cb6e761e5ad95eb9de918
prerequisite-patch-id: eb0120090b9fd1e1f668919cf1d81cdf1b684b20
prerequisite-patch-id: 239c0e25dae78755bb553eb9049190f6ed6c056a
-- 
2.47.3


