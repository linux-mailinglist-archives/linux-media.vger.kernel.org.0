Return-Path: <linux-media+bounces-45049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CADBF2002
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 17:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0227318A1882
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 15:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9845B2522A7;
	Mon, 20 Oct 2025 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=michaelestner@web.de header.b="KzzXpjOF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9924467E;
	Mon, 20 Oct 2025 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972803; cv=none; b=u4iqedB0OA8IBxk/Chv1dcg3waD1zgwE2sSzmIsHQh+WEGP+NiB0RNfQXRO0RHrY0/k1NAoTTn/7UqrdOMqAQ3/Ys9jqeH4G6H9fHGoQjcQxPiG+jXk/aVH3DC+tU+Zup+7XntjIcd0gXfh5NOZ19hmBc6+am82VK9ClNiS3PKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972803; c=relaxed/simple;
	bh=2jMSVJTF1poRh0K19N7YblJFrFzergqpXQmoiiRaqds=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WGi96hoWprXRedp7j0CHAXuU0yGdL6+BiqyHZSAx+scPGAKprOXJRMvSt4ayCOAe9HkVLYXcLomyQksRW6TmIAKesjTik6V2WbY6pFqLyyG5PEGVtYHQpsCAF2cPBNo+bL5CAAAp27YuLR7kT8qj8SZC0KeCqeqMfys/AEVIDIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=michaelestner@web.de header.b=KzzXpjOF; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760972794; x=1761577594; i=michaelestner@web.de;
	bh=53b3mHSERYf36/M5MmU49S1ikzeUcWhVTXTyu7ud/eo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KzzXpjOFvOhjydE6W37FPu+Y9zYIbQxpTfFs3SAnYdq80YIXAztCDEdgLrPYeZWk
	 Ozwi1CEUniqdod7Dg5PmrNvm48/hWjlJyteTT7cbdQVFZrZeg3c0k3SqFQLSzmH8g
	 MhEEerwAXdbIgNQLPGT1sEZcLZqEMoN7g2qMP0oHm8PIQNKZW1vsDPtCj4fpdf/DJ
	 6lJFvQduLHHPm/rMG6Lfo61yVixxR6gz3TA0UBUYNbZwjfAgghGsBLSPsd6aPLmaF
	 QDvaf8lvR3Qblc5HaTlURoYDrBBM7i0f4WSoKIyguupXk2PcwsmWCE90doUWGl8sB
	 KLqPYY1G01JyjFejtw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from del01453.ebgroup.elektrobit.com ([165.85.213.15]) by
 smtp.web.de (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1McIkg-1uct5q036C-00jIEf; Mon, 20 Oct 2025 17:06:34 +0200
From: Michael Estner <michaelestner@web.de>
To: linux-media@vger.kernel.org
Cc: Michael Estner <michaelestner@web.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH]: USB cx231xx: Remove unused var assignment
Date: Mon, 20 Oct 2025 17:06:14 +0200
Message-Id: <20251020150616.994029-1-michaelestner@web.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+4Y9RJTtCLI5ecauLq1NF6yAJVGP6P/IiRG5rcmwiDBPpn74WPR
 91PEqHu9ZZc1lFWJNTnmVLZskAbm/fHGTnrBn0kIY01pZxslvNUas2mOSVrenIqyYRELYwf
 SjshuwdiK1TlMP7TmAsmgMbxvCwPpvN4S81M/d64H/ff4tBSCQSGQ8Kv1VhnBlFkVALmuAW
 8ugDUfc73Q3YAgc7XVZLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bLPsQNX71II=;U1mQveNQkaBzFoRxt46BADjuNFe
 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

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


