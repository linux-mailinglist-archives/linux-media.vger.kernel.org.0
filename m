Return-Path: <linux-media+bounces-45103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058BBF4A89
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 07:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8B0118C3C66
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 05:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2771B258EDE;
	Tue, 21 Oct 2025 05:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=michaelestner@web.de header.b="S9D+2WUt"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364AB2AD16;
	Tue, 21 Oct 2025 05:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761025443; cv=none; b=Ukgn3gqAG3YEoSOrqEM+KHZj858srgNW1UtuIqxV46hTBs2b6Cpi19rYEpueApEXCvD2/mHNwYbBAUPm3kOzZODA55cuDrbznuFQwyEeBdQXu4TI9qKQk1VGbNTfOrlbeYFOYCBJuCu/NwHfjTgdYsvgH3r2jyd0pcUHfeW0lGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761025443; c=relaxed/simple;
	bh=2jMSVJTF1poRh0K19N7YblJFrFzergqpXQmoiiRaqds=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ahl4JyCvHLmq7iUCDew35d6azvVtgWw9T9ojBzyQqiiXc1T9QiXiokXEEuuYeRvsfWbngAN+nvwOGeOoVf6f/batfZZkEvY/yNtz7+PattFvg+NEQkUfxfqfHnXBDPdPr3NPIt0umFvuRVWX2QaIEFkGI/sNaOI8gIYnCqUQoEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=michaelestner@web.de header.b=S9D+2WUt; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761025433; x=1761630233; i=michaelestner@web.de;
	bh=53b3mHSERYf36/M5MmU49S1ikzeUcWhVTXTyu7ud/eo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=S9D+2WUtGhBIWTqIs6tMD5+RJggAkiCiCju4syU17Cv7yjAUhangpHNeQvhVaeE8
	 hiEsR3u0XhA5TOXS0iPYq+v4lzqw0sl/kGkZtg1vTTY1ulZNwI4sfBds5E/jC0ric
	 ZLoLjQ1921fwlcT7g12T6kdyJCxwyHDSjlbiHbVXTtdE29CB4YnHsS5BeMjlr3ALg
	 qhccjJ7iGDBuGxdOhWP+AZyJjFhK6ozMz65u9SSp3S/Oj75RXdRulwu4MyWyON5y5
	 IaQil16tz397Z07dyg2aLHKfLQtVdBGmm+hhnmE/kVbsv5+hyrvmyqA743ct4vnzC
	 NUlXaj914fqXdtg2Ng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from del01453.ebgroup.elektrobit.com ([213.95.148.172]) by
 smtp.web.de (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1N7gXQ-1u6lIZ2s8w-00x5Sa; Tue, 21 Oct 2025 07:43:53 +0200
From: Michael Estner <michaelestner@web.de>
To: linux-media@vger.kernel.org
Cc: Michael Estner <michaelestner@web.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH]: media: USB cx231xx: Remove unused var assignment
Date: Tue, 21 Oct 2025 07:42:15 +0200
Message-Id: <20251021054217.16005-1-michaelestner@web.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tyJKk6qGhgGqBY8H74Bhzc6GasI3Tudg9mgGOnn4QLICYajj1zQ
 TDIpeFhcH3xQFva1+zOymR5jgZptPrbaaMu+qlU80Dsig6Va/BlZ6PmqZQ0dD+XkjdDIlQK
 dFh3HhAUW6xyTw2VFsdZcRlJ1aJ4K9a+pzx5rWeELFtO1sixemYUzyb4utxuSfRDQOSHTLT
 ZDdaB0993yTYLKAMjwgpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XNW2pNEfipo=;/BlYl9YNqbNpZThjrirzjt2XsbD
 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
 ckQGWNKcBWaqWHFbHNGxflnLf4=

* Remove unused variable assignments.
  The status variable has multiple assignments which are overwritten
  before used once. With this patch this unnecessary variable assignments
  get removed.

* I got the issues out of the report from:
  https://scan7.scan.coverity.com/#/project-view/55309/11354
  The exact findings are:
  * Issue=3D1226885
  * Issue=3D1226861
  * Issue=3D1226879
  * Issue=3D1226878
  * Issue=3D1226866

Signed-off-by: Michael Estner <michaelestner@web.de>
=2D--
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/us=
b/cx231xx/cx231xx-avcore.c
index 1cfec76b72f3..d268d988123e 100644
=2D-- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -760,7 +760,6 @@ int cx231xx_set_decoder_video_input(struct cx231xx *de=
v,
=20
 		status =3D vid_blk_write_word(dev, AFE_CTRL, value);
=20
-		status =3D cx231xx_afe_set_mode(dev, AFE_MODE_BASEBAND);
 		break;
 	case CX231XX_VMUX_TELEVISION:
 	case CX231XX_VMUX_CABLE:
@@ -910,8 +909,6 @@ int cx231xx_set_decoder_video_input(struct cx231xx *de=
v,
 			if (dev->tuner_type =3D=3D TUNER_NXP_TDA18271) {
 				status =3D vid_blk_read_word(dev, PIN_CTRL,
 				 &value);
-				status =3D vid_blk_write_word(dev, PIN_CTRL,
-				 (value & 0xFFFFFFEF));
 			}
=20
 			break;
@@ -1092,7 +1089,6 @@ int cx231xx_set_audio_input(struct cx231xx *dev, u8 =
input)
 		ainput =3D AUDIO_INPUT_TUNER_TV;
 		break;
 	case CX231XX_AMUX_LINE_IN:
-		status =3D cx231xx_i2s_blk_set_audio_input(dev, input);
 		ainput =3D AUDIO_INPUT_LINE;
 		break;
 	default:
@@ -1865,8 +1861,6 @@ int cx231xx_dif_set_standard(struct cx231xx *dev, u3=
2 standard)
 						0x1befbf06);
 		status =3D vid_blk_write_word(dev, DIF_SRC_GAIN_CONTROL,
 						0x000035e8);
-		status =3D vid_blk_write_word(dev, DIF_SOFT_RST_CTRL_REVB,
-						0x00000000);
 		/* Save the Spec Inversion value */
 		dif_misc_ctrl_value &=3D FLD_DIF_SPEC_INV;
 		dif_misc_ctrl_value |=3D 0x3A0A3F10;
@@ -2702,8 +2696,6 @@ int cx231xx_set_gpio_value(struct cx231xx *dev, int =
pin_number, int pin_value)
 		/* It was in input mode */
 		value =3D dev->gpio_dir | (1 << pin_number);
 		dev->gpio_dir =3D value;
-		status =3D cx231xx_set_gpio_bit(dev, dev->gpio_dir,
-					      dev->gpio_val);
 	}
=20
 	if (pin_value =3D=3D 0)
=2D-=20
2.34.1


