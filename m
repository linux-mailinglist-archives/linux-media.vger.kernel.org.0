Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD433D39D8
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbhGWLQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 07:16:39 -0400
Received: from ni.piap.pl ([195.187.100.5]:35942 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234451AbhGWLQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 07:16:36 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 7AE0CC369544;
        Fri, 23 Jul 2021 13:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 7AE0CC369544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627041426; bh=vuAgIbn22S6VoWGus1J/IkA7Gg1Mflh/eOqFu0Jq2jw=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=FRTLrB5o3jmt0cVDDTY9OmYIAsp/mc8oi/aLBlithBkkpDvhk2pkdxwWM+BHMk8hl
         bYq1i3NNxMb1TCNFDxY9eoCKDAHv5qIMVOoSMvZ0BnFDm1Ki5c04fnq7gVzP/wLF4q
         Ck600txfPGD7w1QLUrEDoqaep/iMNwTglE7FCwuw=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
References: <m3k0lmejlw.fsf@t19.piap.pl>
        <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl>
        <m3mtqedfsg.fsf@t19.piap.pl>
        <798b2128-24a6-1a62-f98c-f228134e8d5c@xs4all.nl>
Sender: khalasa@piap.pl
Date:   Fri, 23 Jul 2021 13:57:06 +0200
In-Reply-To: <798b2128-24a6-1a62-f98c-f228134e8d5c@xs4all.nl> (Hans Verkuil's
        message of "Fri, 23 Jul 2021 10:49:01 +0200")
Message-ID: <m3eebpckfh.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165191 [Jul 23 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, t19.piap.pl:7.1.1;127.0.0.199:7.1.2;piap.pl:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/23 10:01:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/23 07:07:00 #16947255
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Hans Verkuil <hverkuil@xs4all.nl> writes:

> The tda1997x doesn't have any method of obtaining the sync polarities?
>
> HSync and VSync are, as you say, using in-band signaling, but the 'polari=
ty'
> still matters when it comes to detecting timings. All HDMI receivers I ha=
ve
> ever seen have a register that reports the polarities. I find it *very* h=
ard
> to imagine that this device doesn't support that.

I didn't know that HDMI serializers send the logical levels of those
lines, I thought some frame/field/line start/end codes are sent instead.
I will have to have a closer look at this chip, then.

> Do you have a datasheet for this device?

No, there is only the current driver and also the old one (in Gateworks'
Freescale/NXP kernel). Tim may have something perhaps under NDA, maaybe.

I will see if I can find these bits in the registers.

Thanks.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
