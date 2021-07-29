Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAA33DA1C2
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 13:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236244AbhG2LIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 07:08:05 -0400
Received: from ni.piap.pl ([195.187.100.5]:58946 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232135AbhG2LIE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 07:08:04 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id A7FFCC369544;
        Thu, 29 Jul 2021 13:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl A7FFCC369544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627556877; bh=X7gZQ2nKkMDKLvWi02KX4C5ud6ugo22cktC2Z8oZa8E=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=aJ/hSYI4e/nvTJSHJmdnHzPwN4VQ0QeZBbgauPgLKLmO3h0yowmulL/bHkuYS6tPP
         Zn7cPYvWr/PQZK6KLjuXiZCm/No0fCNrSeVlSbYR34xTzZQThvOKo/u8ZzT9Mc4q7+
         UQD/Vt2RB8r35iftonBVYbW43weTQZmnuLxkbxcw=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] TDA1997x: fix tda1997x_remove()
References: <m35ywxcq1l.fsf@t19.piap.pl>
        <a1f99432-f11e-fd4d-4956-ae2864f08a2a@xs4all.nl>
Sender: khalasa@piap.pl
Date:   Thu, 29 Jul 2021 13:07:57 +0200
In-Reply-To: <a1f99432-f11e-fd4d-4956-ae2864f08a2a@xs4all.nl> (Hans Verkuil's
        message of "Thu, 29 Jul 2021 11:55:47 +0200")
Message-ID: <m335rxbcoi.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165310 [Jul 29 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_arrow_text}, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, t19.piap.pl:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/29 10:23:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/29 07:19:00 #16977611
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

Hans Verkuil <hverkuil@xs4all.nl> writes:

>> +++ b/drivers/media/i2c/tda1997x.c
>> @@ -2771,6 +2771,7 @@ static int tda1997x_probe(struct i2c_client *clien=
t,
>>  		goto err_free_media;
>>  	}
>>=20=20
>> +	i2c_set_clientdata(client, sd);
>>  	return 0;
>>=20=20
>>  err_free_media:
>>=20
>
> Actually, v4l2_i2c_subdev_init() sets this, and v4l2_i2c_subdev_init() *i=
s* called.
> Does it really crash in tda1997x_remove() without this patch?

Yes, the pointer was once invalid (IIRC), and in other cases NULL.

> If so, then I suspect something else is going on.

I'll investigate further, then.

Thanks,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
