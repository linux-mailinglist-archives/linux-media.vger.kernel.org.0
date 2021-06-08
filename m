Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FA039EDD7
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 06:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFHE4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 00:56:51 -0400
Received: from ni.piap.pl ([195.187.100.5]:60968 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhFHE4v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 00:56:51 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 6393344423B;
        Tue,  8 Jun 2021 06:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 6393344423B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1623128097; bh=/stu7ctuibAfiv1X5o6r5DPEF2P5U2Vh+/K/Hb/4FvM=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=FIKygQWJu7fMFBf6d2M45Okhkz3JID53xc9dg9C8iWmgROrfAFR2kUhJaKq9IQWCj
         bLM/O/lt/QQe6YI/9Nbu3L0VsdnrVReJwytj4FGxiAMUJhgoZx3z7ZeR9RvZngIleK
         wLZJLQ1l890AEDuztyTcvurxCubX2c443vHM0dWo=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] TDA1997x: enable EDID support
References: <m3sg1uq6xu.fsf@t19.piap.pl>
        <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl>
        <m3eeddhora.fsf@t19.piap.pl>
        <CAJ+vNU0E_0pB-1T+VpdmjJNVirAwCUNjKVbEV4wEbqHOzURj_A@mail.gmail.com>
Sender: khalasa@piap.pl
Date:   Tue, 08 Jun 2021 06:54:57 +0200
In-Reply-To: <CAJ+vNU0E_0pB-1T+VpdmjJNVirAwCUNjKVbEV4wEbqHOzURj_A@mail.gmail.com>
        (Tim Harvey's message of "Mon, 7 Jun 2021 08:48:19 -0700")
Message-ID: <m3k0n57y72.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tim,

Tim Harvey <tharvey@gateworks.com> writes:

>> I'm looking at the previous version of this driver from Gateworks and it
>> contains:
>>
>>      /* Configure EDID
>>       *
>>       * EDID_ENABLE bits:
>>       *  7 - nack_off
>>       *  6 - edid_only
>>       *  1 - edid_b_en
>>       *  0 - edid_a_en
>>       */
>>      reg =3D io_read(REG_EDID_ENABLE);
>>      if (!tda1997x->internal_edid)
>>          reg &=3D ~0x83; /* EDID Nack ON */
>>      else
>>          reg |=3D 0x83;  /* EDID Nack OFF */
>>      io_write(REG_EDID_ENABLE, reg);

> Not sure where the source above is from (this was all so long ago) but

That's your gateworks_fslc_3.14_1.0.x_ga branch (3.14 is the kernel and
1.0.x_ga is IIRC some Freescale versioning) :-)

> my guess is that 'internal_edid' meant an EDID had been provided via
> software and the else case meant there was no EDID available.
> There is no support on that chip for an external EEPROM.

Right. I guess the else meant it was available and &=3D ~83 meant no
EDID... Anyway one could simply drop a 24c02 or a similar chip directly
to SDA/SCL HDMI lines, that's what the monitor makers had been doing for
a long time. Then, I guess, you would need the internal_edid =3D 0
(otherwise the TDA chip would be fighting the EEPROM on the SDA line).
Not that I know of any such design using this driver, I guess we can
safely skip this part.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
