Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391603D0A24
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 09:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhGUHPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 03:15:41 -0400
Received: from ni.piap.pl ([195.187.100.5]:58262 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235610AbhGUHPe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 03:15:34 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id BD8F9C3F3EE1;
        Wed, 21 Jul 2021 09:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl BD8F9C3F3EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1626854165; bh=6XM2XjK5JFDUc84MNpO08XUn/FAW916r/iYKVjQami4=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=EbZPojY2/DaJbX3BOKfbHueepNx5GHr72BdDLYhYAhB/3COMWYM2Ux0+Hw5vGiATb
         imPfCDkwkfA7tpsR50R5Ckk7M00SD6xGoVAuYqhEijDcO+eWu32MBRBT95ByqES+zU
         Bznuoj9RMobStG1bJfqB3sNKcPQ25RxjDB++zEPw=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
References: <m3k0lmejlw.fsf@t19.piap.pl>
        <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl>
Sender: khalasa@piap.pl
Date:   Wed, 21 Jul 2021 09:56:05 +0200
In-Reply-To: <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl> (Hans Verkuil's
        message of "Wed, 21 Jul 2021 09:12:08 +0200")
Message-ID: <m3a6mgdrsa.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165154 [Jul 21 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17, {Tracking_from_exist}, {Tracking_arrow_text}, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, t19.piap.pl:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/21 05:08:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/21 00:56:00 #16933345
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Hans Verkuil <hverkuil@xs4all.nl> writes:

>> --- a/drivers/media/i2c/tda1997x.c
>> +++ b/drivers/media/i2c/tda1997x.c
>> @@ -1092,66 +1094,71 @@ tda1997x_detect_std(struct tda1997x_state *state,
>>  		    struct v4l2_dv_timings *timings)

...

>> +	if (!timings)
>> +		return 0;
>
> This check isn't necessary, timings is never NULL.

Well, the tda1997x_irq_sus() does this:

	if (debug)
		tda1997x_detect_std(state, NULL);

Perhaps there is a better way, but I think I will leave it for now.
Also there is the issue of ignoring tda1997x_detect_std() return value,
but I can now see it's only a case in tda1997x_query_dv_timings(), easy
to fix.

Will post an update shortly.

Thanks for your comments,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
