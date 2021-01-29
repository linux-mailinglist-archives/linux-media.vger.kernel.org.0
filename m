Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5773090CC
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 01:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbhA2X4X convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 29 Jan 2021 18:56:23 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:51522 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229676AbhA2X4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jan 2021 18:56:21 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-29-6edYh7Y8NwSD3Bzf9GiMrw-1; Fri, 29 Jan 2021 23:54:41 +0000
X-MC-Unique: 6edYh7Y8NwSD3Bzf9GiMrw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 29 Jan 2021 23:54:41 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 29 Jan 2021 23:54:41 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Emmanuel Arias' <eamanu@yaerobi.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: allegro-dvt: Use __packed sentence
Thread-Topic: [PATCH] media: allegro-dvt: Use __packed sentence
Thread-Index: AQHW9nn+Eu7GW6k8EESnigV6OI4+Q6o/RrGQ
Date:   Fri, 29 Jan 2021 23:54:41 +0000
Message-ID: <63a4ed5c2ef54c09b2df9d6234b68711@AcuMS.aculab.com>
References: <YBRpstkOi685uHef@debian>
In-Reply-To: <YBRpstkOi685uHef@debian>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emmanuel Arias
> Sent: 29 January 2021 20:02
> 
> Fix coding style using __packed sentece instead of
> __attribute__((__packed__)).
> 
> Signed-off-by: Emmanuel Arias <eamanu@yaerobi.com>
> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-
> dvt/allegro-core.c
> index 9f718f43282b..cee624dac61a 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -670,7 +670,7 @@ static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
>  	struct {
>  		u16 length;
>  		u16 type;
> -	} __attribute__ ((__packed__)) *header;
> +	} __packed *header;
>  	struct regmap *sram = mbox->dev->sram;

Does this actually need to be packed?
The only reason would be if the structure could exist on a 2n+1
boundary.
But that is only likely if part of some binary sequence.
In which case I'd expect it to be marked __be or __le.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

