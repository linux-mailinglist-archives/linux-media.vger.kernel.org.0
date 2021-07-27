Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BE83D7361
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236243AbhG0KgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:36:25 -0400
Received: from ni.piap.pl ([195.187.100.5]:39858 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236104AbhG0KgY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:36:24 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 537ADC369558;
        Tue, 27 Jul 2021 12:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 537ADC369558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627382180; bh=xrp6HjZNt5fuhmpqSLgJecqDApFe/ZteKo0bn4DP8tc=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=bsCQIAo9ER90npjCybE3VUTe4pLXOPqObwMTF2c0nnG+dWRahkpPsdvsxVOrCxWbQ
         9rvb0nLrpbONdQ5A3hs8N4XW/ET4wsVjuZD8GwoT58+mgPLixgYcpXQp24UuaObKUR
         CUS6wmSntxcJu2pONUggyC91mO/m52Yo3/1NLbvE=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC v3] dt-binding: media: document ON Semi AR0521 sensor
 bindings
References: <m37dhkdrat.fsf@t19.piap.pl>
        <YP9ccgd7WNpHuLgG@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Tue, 27 Jul 2021 12:36:20 +0200
In-Reply-To: <YP9ccgd7WNpHuLgG@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 27 Jul 2021 04:08:02 +0300")
Message-ID: <m3o8aoavrv.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165267 [Jul 27 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;t19.piap.pl:7.1.1;127.0.0.199:7.1.2;piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/27 08:44:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/27 08:46:00 #16963359
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> +        properties:
>> +          data-lanes:
>> +            anyOf:
>> +              - items:
>> +                  - const: 1
>> +              - items:
>> +                  - const: 1
>> +                  - const: 2
>> +              - items:
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
>> +                  - const: 4
>
> As the sensor also supports an HiSPi output, I would add the bus-type
> property:
>
>           data-lanes:
> 	    const: 4

Is there any example of this? I'm not sure how should it it look like.
Something like the following?

        properties:
         data-lanes:
            anyOf:
              - items:
                  - const: 1
              - items:
                  - const: 1
                  - const: 2
              - items:
                  - const: 1
                  - const: 2
                  - const: 3
                  - const: 4
          bus-type:
            data-lanes:
              const: 4

And... HiSPi would need additional code in the driver. And preferably
some testing. I think I'd prefer to have DT and the driver staying in
some sort of sync. Also, I'm uncertain about the syntax and the meaning
of such, apparently redundant, construct. Nor about its relation to
HiSPi. An example would be welcome.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
