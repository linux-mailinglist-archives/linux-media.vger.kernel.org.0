Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360E139DBCE
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 13:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhFGL6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 07:58:19 -0400
Received: from ni.piap.pl ([195.187.100.5]:55290 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230177AbhFGL6T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 07:58:19 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id E3B25444267;
        Mon,  7 Jun 2021 13:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl E3B25444267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1623066985; bh=RThC5tsnWT+d2Y9LB+HdF4WLkbKitBQLeYlAH9yKOcs=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Aybt25zqljokccbujawefkQKfJ6iY4bViRwqLV0EYtQzSC4SWv8+3ebzw61WC+OBu
         nU5qtWc1SoBf7pLChw7+dPWqzh+maORn3bj0vuGYRLQ/1NvuFFdYH2oSxJJHStsz50
         ZSUcPZg7lQIazxTP7HDQUEyUZGfXIpi1cgk4hqD0=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] TDA1997x: enable EDID support
References: <m3sg1uq6xu.fsf@t19.piap.pl>
        <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl>
Sender: khalasa@piap.pl
Date:   Mon, 07 Jun 2021 13:56:25 +0200
In-Reply-To: <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl> (Hans Verkuil's
        message of "Mon, 7 Jun 2021 13:11:54 +0200")
Message-ID: <m3eeddhora.fsf@t19.piap.pl>
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

Hi Hans,

Hans Verkuil <hverkuil@xs4all.nl> writes:

>> Without this patch, the TDA19971 chip's EDID is inactive.
>
> Was this wrong from the very beginning? How can this ever have been tested
> without an EDID?

It seems so. I suspect it might have worked in tests because this
register isn't cleared on reboot. I.e., setting it once after power up
makes it work to the next power up.
Or, maybe, the HDMI signal source didn't need EDID.

I'm looking at the previous version of this driver from Gateworks and it
contains:

     /* Configure EDID
      *
      * EDID_ENABLE bits:
      *  7 - nack_off
      *  6 - edid_only
      *  1 - edid_b_en
      *  0 - edid_a_en
      */
     reg =3D io_read(REG_EDID_ENABLE);
     if (!tda1997x->internal_edid)
         reg &=3D ~0x83; /* EDID Nack ON */
     else
         reg |=3D 0x83;  /* EDID Nack OFF */
     io_write(REG_EDID_ENABLE, reg);

Not sure what the "non-internal" EDID could be - a separate I2C EEPROM
chip? I'm using this on Gateworks' GW54xx boards and I can't see any
such EEPROM in the vicinity of the TDA19971, but I don't know how it is
wired - perhaps Tim has some idea?
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
