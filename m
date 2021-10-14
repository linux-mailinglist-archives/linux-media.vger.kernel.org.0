Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1D142D747
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhJNKpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:45:34 -0400
Received: from ni.piap.pl ([195.187.100.5]:51270 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230168AbhJNKpb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:45:31 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id E4F64C3F3EF6;
        Thu, 14 Oct 2021 12:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl E4F64C3F3EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1634208205; bh=wy76QmHD0Gdua8DnltaLzMFS+mHTmw/fUZaGxzMCgvg=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=iGQFi0OHnl82CcXlETPZMtEB890a1wyFPdWyN1wR4aR8cNMP/ZcQENSMHYK/nRLrw
         SgiK2UmGjS3J/zrkVNx08QfC4fbJhxDjLBG2UV2v9pXYekRmlebXQ4zy7zEX4fMuLS
         Do/6gI7uAVDpoLWeoGC/KGW8Zdfw+R8EUQfzEqwI=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
        <m3mtnflpna.fsf@t19.piap.pl>
        <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
        <m3a6jel9ce.fsf@t19.piap.pl>
        <20211013082634.53zh5j26gucddome@uno.localdomain>
        <m3y26xjd7p.fsf@t19.piap.pl>
        <20211013151400.i2s3gcshb3xvuy2e@uno.localdomain>
        <m3tuhkjh5l.fsf@t19.piap.pl>
        <20211014075955.xxbv2bzrx73v45bo@uno.localdomain>
Sender: khalasa@piap.pl
Date:   Thu, 14 Oct 2021 12:43:24 +0200
In-Reply-To: <20211014075955.xxbv2bzrx73v45bo@uno.localdomain> (Jacopo Mondi's
        message of "Thu, 14 Oct 2021 09:59:55 +0200")
Message-ID: <m3lf2vkhtf.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 3
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> writes:

>> This is BTW completely orthogonal to the -EBUSY on set_fmt(). The
>> effects will be exactly the same if the e.g. geometry changes come when
>> the sensor is not streaming.
>>
>
> No, this isn't true. Your s_fmt() implementation stops then restart the
> stream. It has an undocumented side effect and will cause undefined
> behaviour.

It will cause *at*most* a corrupted frame. On a MIPI link. That's right.
Such a corrupted frame will *at*most* cause some transient IO error - it
must not cause anything serious, because corrupted frames on MIPI can
happen for multiple reasons, some of which simply cannot be avoided.
BTW I will see if it's actually the case - chances are, there is no
corruption, but I tested it years ago and haven't yet checked my notes.

In fact those set_fmt() in other drivers may - or may not - cause
corrupted frames just the same.

> If your s_fmt() has to stop and restart streaming to take effect,
> it means userspace should instead stop the stream, change
> the format where opportune in the pipeline, and then restart the
> stream.

Maybe. This is a sensor driver - not userspace.
If the userspace uses it as a part of "frame grabber", it will certainly
do exactly that (nothing else would make sense in practice).

Unfortunately this all will have to wait a bit, so thanks for your help,
expect a new patch in few weeks.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
