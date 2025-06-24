Return-Path: <linux-media+bounces-35803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A06DAE6C1B
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C56B3A8FE0
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC3F2E1728;
	Tue, 24 Jun 2025 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tbkrkWh8"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BE3074AB;
	Tue, 24 Jun 2025 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781304; cv=none; b=t6NzqAC5+QaxkpZ8iOHQqxn+9l7lmyQshKsN49/BJrr7qkPvmM2TByjtwE4OnZR1OSrvk4bJ81BKPZvHXPK5PrYiy4O8V3cLH/5HD6p+JmRq8E/X3Y1YmlSZU7ViceYc16pWXrtNjMZyuVUKp/WP+DC1WEBguZs3U/KNG5WeMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781304; c=relaxed/simple;
	bh=dGDy7723AWOaTqF87rRCu+aGoEbfN89qctKkTl+2NGY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=tHmTb3Wtm03/SN6raZ9ubrCugGwMvk8zLsllfvQ3DcTfcfMoQPXvr55zJ/ZwFLxpM6cRgE4yWKlmQRSbEDvMMhJ4KiIvFNzhEWXRCEv7fV8+ywQqNozxFjZxLGg0uotxO6ewzdtW+UOZo8bUE16mgEMTktvWra5uH5dvXocIFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tbkrkWh8; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750781290; x=1751386090; i=markus.elfring@web.de;
	bh=LIz+Gs3OoNV1tgFUUpNSCOZ7x4lBrgEp+Yw76AYGwic=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tbkrkWh8OFp+rmR/DBdGqwEcTmL9qJnFtUVF5weYBr+MOcx7IuF28ISlwTpdLhw7
	 z4mI6uXq4x430WOJaYE6zldCT4X6l6BSLRrFMSQOD9Hnd4IA5RMJFZEettq/IaG5q
	 Vq/v5xl+8lSmIoInjzKF83IkTmEAIcl+WVPvnPlSi5vdK3J/V47NeOvHQNnds5HoC
	 9iwBzNa5cAJ81vOuldVtUrm6m5nMioT2rhjPtJSj86Uie8jPOE+DC43Huez11P0dt
	 0Ew/2wBWN1zWV0u/53eIRkbhrk/6noGW/4cfhcDVhi941hoZ+5om/o1gPP9KbCQkp
	 vw9R8m1WXUSnn9ta9A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.200]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmhjw-1vCXc41Xfy-00ZDVr; Tue, 24
 Jun 2025 18:08:10 +0200
Message-ID: <12d8197c-1b8c-4c87-a3c8-945515c2c9a7@web.de>
Date: Tue, 24 Jun 2025 18:08:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: stk1160: Use usb_endpoint_is_isoc_in() rather than
 duplicating its implementation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2HS4V5dBM2c8kOkQlaWHeOknCPlDC5X7VD1kJ7OwCI5hAca+iPF
 eUWJMl3tQD510YHzLMAcoqMjtK8DvjhfGZs7CbQ2zySgi7TICa0TOIFbYWrzjJlMwICNUU4
 VyqGOx0RnWDr0phjc7K1YmKJvGVQAIwbDyUg8lK2Xhr/l4Y9DFbzMKGqVYwsCTSeNNVOYom
 bTc+Zb6CKwQsxz/CAy2yA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ni1yJOm1h0A=;lIk3zQEOmmOBPdb2E6le3ezrGL9
 r6h+0uwP6QPUpx91YspsMvo280pNO+TD3w7pYVsPJEivoY0sZrnZ59OBDgN9G5IBpuZqKrQfr
 o/A/L2jSyccs3udyIJu+DNnIOwk95sljDBKd4tEEoVlTOFnxXfnxndffIPCjrqfI/YqeWiTBQ
 qNDdnyaxvZs94SI9r6EZuhvtN+3NepxMl8DyznegLD6wTCwgqUKbeB6HvB1qEkC9tq+XShLeC
 fdMwml8RyQvfu9n7nqxm+AaxGVAbSo6vrNVCPnjTMCn+NJpKUGSztpvQGlKrDx4AYhXIxt0it
 YtC56bb3T/ShdgvepQhKqMgILpOvQ3bDdiaeO93lVnjBZM61cvm73Ed89emLTeW5jC5ziCD5L
 G0QEQ8g1+2gRtz8mSTBwfGZ0j3BQrsp0HemYa0xbEteFlFAVdLlSIU+plEzxUlBspifkqMmcV
 QCDh/WohOdOFcXYjSQFWahSYCEaL0mLIMJyIeq4vuK5Rx3kyrzmQre4MUKckQACR8fxZzUK4J
 Xp8ETvOGoqfnX8NvTW97oBnuhslaC1OumSfDMYucSFfcsWgWAJPHZGB3hPOe0e449RsgDnKFY
 skjpNGL031AwJYmooFVQHFi8yYE9QIuR8BxKXJ2NrrFdWnp/TpzGsjhgc1eOvwerYDMB8ZynW
 qlitUOuKJ3dGmLP3HmdE1zvhGfeT9Cf+bu4Fdcun4dz/aDu+DjOL8MIwjMNYu++zG01j8LxST
 JRRKV2YfyyWmxPb2ZQX7F4p7W9uOR1aJt7W8IgDXpH9zvB8anBPYlWJ5XJJcJd/CWjIPv8kdy
 zG96Sv+M8+5Op1FZS3vTtcHGT2ud7SgevfNEznbNDfW4dcZyG1VUDBgbU/D9w9uq7Qn318HSr
 bHwF49yMp0L7BDJcVJ1iaenH6Dq81sQ05YVi+tHzZxRFgu5Val1eCjPSMPVXuWuIYraOjR05p
 OGYpr0RFHBoFbCp2mmWxZvkSJbpVPbBVG1uL0Bzo7B3S1KJoULFsIOLKnZBnMicAvLKPD8c2F
 LD0WUPL+FC3jszjh927ShZC+9D/B2ga5Kcf6YT0jkcHnAjfNotkLHps1OONR53IODtxfllLhj
 z6e6hN7V/hqU7sCfrFfDXYVezhUwJzIMRgD+Zpqttxch5ws0i4egNXz8YOGHNS7fpXWf6d2Ue
 lgJYaWRVSSWy0HmwKVAwFgG/OsEA74BhznMstRi82WDTnZWQSAF1w0uQ8QJ+YGEzjIPogSEc8
 nBLPsR/1hqQXfa4aMnzsMXQI/f4l0vFhGDq3a0sSshJ3l8er/vsTkE1vuqxwGy5cBiRSfM2ux
 ESTcdS2iyZZ+H04wua/bHF3eJbAEuTrgXFg3gSiAJxhPqza5hx5ZRWjBcDVi1fnhSyKwiP7Pv
 imiI6b/0jSZv7QxYBeVfHexGlkilBRPndWe+koSfExuehZkvRfiCpLWgtB5FYisnAXFlUDiC1
 WwMar2KotTaif0Bn3IOTQEuof/2pbjQHE7yuZ1vT/Xo+nps5a/un+P1zVEH6zIpjwpy7kBHxb
 gV7Rut9sDI5PaYIEPYgdkN55xDCCX6QwIwS7Y81OqUHoulpa/hRYFzeB6WJrL1IN8UQ8kbMTq
 f+q4RJpxZ/c9taSU0pytJ7UXTskAf6/cjcHEhwA5tVLOBM/pHxZyVNdKICUYQm3ktuOv3FTYa
 tEaBmuhigSivLvTdOVjdi/V6lJQOHZQdMDok74R8zxDLVAGOle85sU/D5T8ZmhSthIVN0FcoB
 v3TCUwjLp0sxNpE/PVSdARX74BijCjGnGOlr4igCMvltsQjeqHLI2VaAYeVTaOjDuE/aWnm7x
 L71KulLESCk9ZcaYcc5prYZfwxKa1HEeqMvT/RyV12upR8gH6t6oQFTmbDf7dr9RvOcjSJ2+W
 9bbdZSCjjUs1ayEpTxf8oIQ6GZ415RUNgArUcMrBjgYvYonJz7L8qSSVbfinuXHsRoXym3vk/
 /X+7+rDI3As4lBkJfAN84nF9i6Pj/p84MsUFUDWu13kBpnFCEogzY2WvwD1RXF9nopNimnhOT
 IDJ/QjTUM0vqTvp36pjsDnfMnwApNt8gTX9fl5jkdLhTdmhKdD6S6tKgSk33yj5gYtNl4ZeWJ
 Bvi8wiLhw3v4nxM+PtKK6Ak9slYrS4VQHtB0BqGGFj3ybUJHmfFcSc4VOfvq/LyXwfjRwjMFx
 HWCJogFQpaKEgxZRn4vMxV0DgUhajXew4cH3IKSWQdzxTYmkokr5NAduJz8Ze4JI6TedZSKSq
 oODFCMglWUmALwxJjIp9wc4ZC8IyYJPVNBHugA2MtiFKgat6BenSEHiXzgDuuXzBIPXXf7EkT
 IqnO0fznK/exR9asY90BeGGYPZziIuDGAOnl5316s+8zaCsoRmtaC1bbXftHyWFZZap1iTSuj
 6i6421UsK8FTaED+RwR72WSdtuVoMA3A6DJ3Kqyj4ROc8Hm5WyBZm0qk9lZdg4y7G2pcXj1UW
 tiL0yO3uEnhNzPO/GjjCOp53OT9X62Ck5MEsbWCH6c58xefmyRzgVlF9NXOmu3pUDEbqODHYm
 iLFqoHBqOWNRnkIgpWk9iD1rEcIke51FpVIDA5ZLDYlizJLJKpBlejA6jWu5ItuF68QLx/GUI
 OBS/jhYC7mkb9l8FIGS8wehOAHNsKx3osavFi9YWAAhtLQ3Udo3M49SCFrRPiONqFTxi3FebV
 M14C44Adrtbfki5k9FbMcb9WuUrDOH9OW7PKbesYZXZeQen+dy0vuUCgx2+Tz4EwrZE1y8hVZ
 o/CCWhd8519EvElUtvwkC1oLaMdYL0mw4p3f7viKKwbABcoQf2KwrQLqPWBEqmJPzw3bddeoy
 RwoYKin8GuGTR7MPUwQcUY9RFNNI7CVxqkCg1B3Gc5EdfxdWjZj5r2qQ6iWNNurZW3wHEsbZJ
 2yICZTygo3TioBEi7L6teIpmTZF/QyFtnY5NiQVURoXPx8TAR73Tpk0RsN35/wdS/7QN85b8c
 ARbssMKE30sDtUL71L+B7WZBWVCmooDCL/1hoyQEx8heDcJpATfFFmc5KR5TFdPDy/ybw2MVG
 AsfTAH//o8H8xTzQvGy8HPhw388uekTdVYLRJrG+jurA7tfAh9edgBYp67VGpam0fQE65nvfa
 f8c9uxwlZyC7U1lzRFNSGoGVgXwAl0MChJvlZIHO2nW35dDE2fz1P0Ae599GzN52rOPEdRofS
 HmnZwSDbmc7BR3WOtFM5gBeIYXToZrePWnP0588dT9S/RFT5YaYTvEKa5jQL8TuqUshXVFVZ+
 ozq6YRQFpvs5XVB8O2M14Hvku0LnTNjFBiHaO+fipc1zzO1aF2rCgDmiI4yVtO0ga+mLyJDBb
 Ilcw64kX1cfTUIGA71Z2I0rts2dQFZ8Ror4cnZhn+xFLIFruPIsDNNyaHSq16hNawh5mNEgH8
 HONXncin1RmJD9/BearpttWb84JgKRamHI2fjQ1L0f1B5kkaUyG5rfIu/GBZxx3DGow5m8aK3
 5/2+W9A2a23ZeYLKrKofMCjivN0sngLjJjq5YEueVJu7Wam1X3Gu97+LxrG13eB/z8FPTLOG1
 XPu5OgVzMUhTqaEfBRVnsIrckPlniESQN0zDPTaZxJYk

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jun 2025 18:02:42 +0200

Reuse existing functionality from usb_endpoint_is_isoc_in() instead of
keeping duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/usb/stk1160/stk1160-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-core.c b/drivers/media/usb/=
stk1160/stk1160-core.c
index ce717502ea4c..25d725c2ab3c 100644
=2D-- a/drivers/media/usb/stk1160/stk1160-core.c
+++ b/drivers/media/usb/stk1160/stk1160-core.c
@@ -195,8 +195,7 @@ static int stk1160_scan_usb(struct usb_interface *intf=
, struct usb_device *udev,
 			if (udev->speed =3D=3D USB_SPEED_HIGH)
 				size =3D size * hb_mult(sizedescr);
=20
-			if (usb_endpoint_xfer_isoc(desc) &&
-			    usb_endpoint_dir_in(desc)) {
+			if (usb_endpoint_is_isoc_in(desc)) {
 				switch (desc->bEndpointAddress) {
 				case STK1160_EP_AUDIO:
 					has_audio =3D true;
=2D-=20
2.50.0


