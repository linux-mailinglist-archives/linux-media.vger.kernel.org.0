Return-Path: <linux-media+bounces-4639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2484864E
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 13:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2806FB212D8
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 12:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92ED25D757;
	Sat,  3 Feb 2024 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="X6nX1vFp"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C45417C77
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964536; cv=none; b=RakWKWxQx4Y6yNOiU1kzfcunK70NduTpwj89xgKp2OX2LC2A6cd46AoEZYLbXRa38oIBHl314CEUWSKeMoNo2R12O1y605QWcZUQWaod++f48a3GC4n/e7m0KCIq0dDnu9uiaape4XawVLQYvWGADtuzDaJPbtgyUk8D0/KQPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964536; c=relaxed/simple;
	bh=bQdgxq7JKkTQMVcemcI0Q30F+V3xBLEtQBlbbYzuY7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gTQ2J8hdOOHx8LW9Ts+galbhmdzrI71ojz+0Ito1vU4AirWCtnXcZbiOubOuJovhP04Mlg+XRBxyPrOj5C4g+AYBl95Eq7i/faQPYO+xZlwBY6yDwOCbEFOHI33GCh87pW9TaZ0VEYYoX72m3/yjbBUxXcDt+iYuIHuVHjbVT04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=X6nX1vFp; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706964528; x=1707569328; i=nils.rothaug@gmx.de;
	bh=bQdgxq7JKkTQMVcemcI0Q30F+V3xBLEtQBlbbYzuY7Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=X6nX1vFpW3zP3NP5epstYOmo7Mni+I/zQgx/270omWwugbUixle/T3moJ7Y47rDi
	 paQXYPb0Vcv/l3uwUeCD9MoK9c+Q6q59SFPEoRwQtGOPtoC8xawdvrBzi1YYIlfE9
	 xuNgw9NNbgd4kBqLZUnOSXKgprnxCpdqPnA3SjSuSIGsfESrM5HQ1ct007W96UCU1
	 +7D4L423prMMdpqe/jWSa8E96vB0rtDT44TgJEhmHUV1jtELIHgrHeEAbvZDm0i07
	 4lbpchZhArcCtJF3V3Pt3/511h6GlYSZeQxKU/xe5jmVo/G9A/wz1hHo2xbqsBL02
	 96qvG4SxolDMVB8yLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MeCpR-1qvoAh0zhf-00bIFU; Sat, 03
 Feb 2024 13:48:48 +0100
From: Nils Rothaug <nils.rothaug@gmx.de>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Nils Rothaug <nils.rothaug@gmx.de>
Subject: [PATCH 3/4] media: em28xx: Set GPIOs for non-audio boards when switching input
Date: Sat,  3 Feb 2024 13:47:44 +0100
Message-Id: <20240203124745.10257-4-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240203124745.10257-1-nils.rothaug@gmx.de>
References: <20240203124745.10257-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D2sDkVqz42yz0REyFPGmSt9dcl6T3Lp4KTkTlVLX34sHv4hw8sg
 5YgsljCH9vygvobi1obXY4aKO7fHOXtJHJOV+XAcZ5lcAoXXPJ8IRFTFQOeFg4GyEnATJ14
 /rV1ZwCRh+oLy3cR/EsuBtNYtBQcsOsBJGjGf6mQqScQBTncUN/wx2o7zwIdo8fSqHvWLKE
 t1IMisY2b5CWvsOGiaEJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vI+udklihIc=;VMbrgWjyWIzhfLR0gT77IvMOYn9
 EbiyPNQrl5KqrFcC7zrZcAV+q+Ka1oxRau5oNnYxGugD8Yhc6OOdqsrH+0msHYgEb5CjPGCI+
 zjFyvf9urb/u0TdNjkYNNVBXWXuc1+X1TYzYVw2biaegE2yIVYUSvw9z2F2Jlzo6IKNsn8wYp
 lF9D4Ih59B/2pz7zmUBXg3LfKQFbrQiDwjaLPl7rssUUfky8ygMcpt8F/HGe0CiFeO6jtmp7J
 rss9vVlj9dBEvg9ZrdLKrTywoAq8S8Uqz4brybTcB5LHiuZk2aZ1IjZ1bDSgb5p4C4HitpL9o
 QPVgyj+1WZlYxCSwCojE47xDcA+QkhzJ3+CInTP0k6Q1XR7zDIOro93xm7SWOTQxIHuG9F+r+
 R246DycWoaDSWoM1qNvV3hEcr7k44bhHUfFiZ5R55v1HGYWERHNkQ/0DZfjBdLff5dUS72omL
 kRRFBKFXhX05WRZvqPvUeS0ywpfholoXsmBH6Hz5kM2yPtjpNbGoH6AzUlgEJKQyrQGuokaRX
 euEgGTX5gNfQj9MHXU/+5gXdJzw0ycGb7yKd4boucG7Ves9u8etP2ubGOSp1EyNcBENrs6idD
 Lxk+zkQGLOX1zTxdWmZ8Bin/Otc/K11rNUi7A3Cw0k9EnrEo2sovwlpw18m6Y/biglfFIqvee
 h1SFLj4MVn1fVqRnoOlHqHfn1xOWxg7V92O+bCOb8ahbMWlKwH39yUKF2YNQT9LtLl53i8DIk
 jHqaCwBZLLMm6I/rrbCbzpeeRW15cnRxjjhtfw3YGg94gMktz4QXEf13QTA7z7C30PqheKQze
 KixFDWRwAgDIk33leg5A55UUaSkPr5iL5/vvbr9IMOirM=

Fixes changing the Line Out audio source with the video input on MyGica UT=
V3 board.
Previously, GPIOs were only set in em28xx_set_audio_source(), which only b=
oards
with USB audio support reach.

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 drivers/media/usb/em28xx/em28xx-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em=
28xx/em28xx-core.c
index 61d7bf701d5..e390138f57e 100644
=2D-- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -416,8 +416,9 @@ int em28xx_audio_analog_set(struct em28xx *dev)
 	int ret, i;
 	u8 xclk;

+	/* GPIOs are set later for boards with audio */
 	if (dev->int_audio_type =3D=3D EM28XX_INT_AUDIO_NONE)
-		return 0;
+		return em28xx_gpio_set(dev, INPUT(dev->ctl_input)->gpio);

 	/*
 	 * It is assumed that all devices use master volume for output.
=2D-
2.34.1


