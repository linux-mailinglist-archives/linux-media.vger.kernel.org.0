Return-Path: <linux-media+bounces-13985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 369399139A9
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 000B2282738
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEF612EBE6;
	Sun, 23 Jun 2024 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="RkqxKllT"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD812E1DE;
	Sun, 23 Jun 2024 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139648; cv=none; b=JiUyACGOar9pc9AaToOEzbisX+n1g//S4ZJ1EdFNgSHFy9bCfgpK3v/Na2oC55ISYtbPQn85ja09VoMBHKub+87Gx2xvAwoxE+ajkp6X3wyMIvZFjPMdKWqFENvtxhq8ygfCeKBqiVPzJSnjrbBgT2V9sYBryv5tLoANe/hBk5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139648; c=relaxed/simple;
	bh=m6arXT4GDbumWRlA0AunZOdHCUdv3iERn8bZu7xUXao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qF8TJwi722Doh2gqgLHMDLyYh+6k3iKxgESXjH31oRI33jPDz0hvrpi3cnvYlxjiLWCnYi00IE0h5br3b/jZTzjU/qStrjeeIf7XUlKzBwDoDemPCqYQvHRuc6EtRT8pCDiZHrVbc9WswdfAnJqBOK3fo74oDLXIi5Z4Yyw3R2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=RkqxKllT; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719139641; x=1719744441; i=nils.rothaug@gmx.de;
	bh=aIuqGElgpNfIxpmIK6owpSmAHJS5jLpXs1KY3iJsh8M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RkqxKllTXDb2t35HCVmx820y8wQhfzwM+mu9qILRZG0oY/Xp+n97qDBVHZY4eOx9
	 mJCNttJuhx8w6GSNTA0LZS0/SFps8gYZPOqfDt9gcAOarLnYQKHzK41Uw5fOIPe0Q
	 nemNSOG2EQW9VK+V0SRRO8BnxsXOpO/l8rhzNjtoV9igMvp6dpIPCoPM4GFGJv80v
	 xdB0qiiXzoBAauiw8SE2jm1avSlAuvJFjRrIjRqBqd7L8NmJqNtfs5QD3mdNpESCj
	 9e6y0BS3JCx9uoTY+1g909N9Wt/4bb5N20sSLJFDIBcJEKJEhFAr5x4pe8mkHqFIL
	 dP+MVJk0HUVe3nUnsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M7b2d-1sHjBF3bAr-00Amz0; Sun, 23
 Jun 2024 12:47:20 +0200
From: Nils Rothaug <nils.rothaug@gmx.de>
To: hverkuil@xs4all.nl
Cc: sean@mess.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	mchehab@kernel.org,
	nils.rothaug@gmx.de
Subject: [PATCH v2 5/5] media: em28xx: Set GPIOs for non-audio boards when switching input
Date: Sun, 23 Jun 2024 12:46:47 +0200
Message-Id: <20240623104647.7697-6-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240623104647.7697-1-nils.rothaug@gmx.de>
References: <20240623104647.7697-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hLwCfQorBE1RdUHVn/1Yn8Q3PJiGdP7IC3A/JIy8pByzqhcjhOQ
 vq3NcGFNMJghyj+lUK7if/+p48mWwHukwDBT0C0tESVOaV9QEB5p3apDCFV038g8mwZut8R
 ZMAVEEa4hzwndjoG0bLr/Hr73kimHm9uX4U9dngmzVvlv8dT8zApVY0Tgcdoyqc2rqRwWQJ
 wHtaakwQLN5gK63AOjtHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GqxfqAqaHtg=;sY0PJVJQcP3ELeHB8o2wySzq5a4
 Djq3OxrqWcmUGyGl2TCAUwEKP/dU27e1HIZJg9GjVpaQ3eHRUKHpyo72lse3+NR5OuQDnBpIt
 +PIg6R+Of5ZhL+n1wcP87gJU2X3ehaC1mqKNarsQj2VRfBlUjp3FkttY3bhsExlpwTBDDkY1t
 7J6lqdyCNb9doso4QU6jHMOIPKQ2V/JwGdB7KK6tCkQyiKKrboHFpZ2eapl9Y5XAVBr641zsj
 DyQjIBCBLd1lV4alFFb4vhD7xPZRnmg8ss5FwonpdZbAhbqVbIR7qQ3ZAv51ZpNwT54bSm2/T
 3MMGgQ9tbCRCamgVY/SnnzQ2AZN2FUVmaE+5UEQ8+vrR8ZQocWksM9pDO+O31dEybTsosrFKa
 7p6zaBIg+FB8WcFkZBZWGxUnkvN9Zniv22vCYULmAe4/xe5G/2pn0gLxaJAFJjQzFyacG60Dz
 Hgs6dMBVTN/V1pxsXtIlUKLWNpMZ68cwo4Mw3iBzri6yh2I0DJ8fAiJPavmixVjFcrcljfSb5
 miln8SQHqLTO+QiEarkTGmCygjYKcHyX49c7JaSkR0/e7Nm2hVY9B2RHuAmqQMA22xqxQ6OVw
 qJ2B1UU4HGYKzVDJiwlABo4ZabGpktmWZlsy9Lf0A6gLQcCsS83T2kFrTnPwPeZdv8HoOPngR
 Yt6lpZ28YIqlvqXEAJEo3e8w+Btimyv8PVpkfS1EYuT3N6orUD41vWvlIvfppsUZ53r86jkkw
 vlWi4snYxqjsOS1fpgowztUJFR2cfUcwji+65aLbKyZT/alx999GUGXZ7Fy+7fzSILhx+dI0b
 SKKIWkerKVePtS0FY7K7UYtm0zUqRp0wyiSGaAHRaGRPw=

Fixes changing the Line Out audio source with the video input
on MyGica UTV3 board. Previously, GPIOs were only set in
em28xx_set_audio_source(), which only boards with USB audio
support reach.

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 drivers/media/usb/em28xx/em28xx-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em=
28xx/em28xx-core.c
index 61d7bf701d57..29a7f3f19b56 100644
=2D-- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -416,8 +416,9 @@ int em28xx_audio_analog_set(struct em28xx *dev)
 	int ret, i;
 	u8 xclk;

+	/* Set GPIOs here for boards without audio */
 	if (dev->int_audio_type =3D=3D EM28XX_INT_AUDIO_NONE)
-		return 0;
+		return em28xx_gpio_set(dev, INPUT(dev->ctl_input)->gpio);

 	/*
 	 * It is assumed that all devices use master volume for output.
=2D-
2.34.1


