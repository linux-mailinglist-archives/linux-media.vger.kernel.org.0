Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4935636723
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 00:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfFEWAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 18:00:07 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:38188 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEWAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 18:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559772004; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xywClfAbICtmWsTPN9rFrgnFtGpCJiSZnGd/4G/sFDU=;
        b=dgEscgVUN2r30uwN1R3XaCqyqJkLsVj0tUVaV9fmT+7mxuvLtMGzDak4rtnsK05vthIyLm
        ccfvUwbQNVVu8riTlKwCgXHRlszCXz9vXOs50psbPAFRBvcKKgy2NkNQ5LArLgUwZQjjPE
        A7NZODVmTXGvqxsvgXaUwW5bsnkmaFo=
Date:   Wed, 05 Jun 2019 23:59:58 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/3] media: uapi: Add RGB bus format for the GiantPlus
 GPM940B0 panel
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hansverk@cisco.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me
Message-Id: <1559771998.1972.0@crapouillou.net>
In-Reply-To: <20190605112645.5b357630@coco.lan>
References: <20190603153511.24384-1-paul@crapouillou.net>
        <20190603153511.24384-2-paul@crapouillou.net>
        <20190605112645.5b357630@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Le mer. 5 juin 2019 =E0 16:26, Mauro Carvalho Chehab=20
<mchehab+samsung@kernel.org> a =E9crit :
> Em Mon,  3 Jun 2019 17:35:10 +0200
> Paul Cercueil <paul@crapouillou.net> escreveu:
>=20
>>  The GiantPlus GPM940B0 is a 24-bit TFT panel where the RGB=20
>> components
>>  are transferred sequentially on a 8-bit bus.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>=20
>>  Notes:
>>      v2: New patch
>>=20
>>      v3: No change
>>=20
>>      v4: Add only MEDIA_BUS_FMT_RGB888_3X8, as we don't have to care=20
>> about
>>          endianness
>=20
> Same comment as on version 3:
>=20
> You should also patch the documentation text at:
>=20
> 	Documentation/media/uapi/v4l/subdev-formats.rst
>=20
> In order to describe the new format that will be included.

Ouch. Sorry. Will do.

-Paul

>=20
>>=20
>>   include/uapi/linux/media-bus-format.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>>  diff --git a/include/uapi/linux/media-bus-format.h=20
>> b/include/uapi/linux/media-bus-format.h
>>  index 2a6b253cfb05..16c1fa2d89a4 100644
>>  --- a/include/uapi/linux/media-bus-format.h
>>  +++ b/include/uapi/linux/media-bus-format.h
>>  @@ -34,7 +34,7 @@
>>=20
>>   #define MEDIA_BUS_FMT_FIXED			0x0001
>>=20
>>  -/* RGB - next is	0x101c */
>>  +/* RGB - next is	0x101d */
>>   #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>>   #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>>   #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
>>  @@ -55,6 +55,7 @@
>>   #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
>>   #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
>>   #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
>>  +#define MEDIA_BUS_FMT_RGB888_3X8		0x101c
>>   #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
>>   #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
>>   #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
>=20
>=20
>=20
> Thanks,
> Mauro

=

