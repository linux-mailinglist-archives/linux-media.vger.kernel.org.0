Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806983B1359
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 07:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhFWFsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 01:48:43 -0400
Received: from ni.piap.pl ([195.187.100.5]:46118 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFWFsn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 01:48:43 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 340E54A0008;
        Wed, 23 Jun 2021 07:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 340E54A0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624427185; bh=3xyG1FSrnZAwvVu0JGJn6EiNIO8EpTdIEwQkEUEeVjg=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=nCLg1Tyi6VZw10NVWugc/ylesgZUFfx6Q5F024NYhtqRDqnXOAUnXZEI/TljiCYux
         WWHmkeL+3KPgaauE8EQB2YNqef4zNrdHIOCKEmANkzp9GE7dNTadLlL31fcwTB1XdM
         mGADIV9PGY+jn7vm6Gvm/lNx7u7cIuZ0vzkGQnfE=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] dt-binding: media: document ON Semi AR0521 sensor
 bindings
References: <m3y2b25er8.fsf@t19.piap.pl>
        <YNHVbFp2+Ow8CyCV@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Wed, 23 Jun 2021 07:46:25 +0200
In-Reply-To: <YNHVbFp2+Ow8CyCV@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 22 Jun 2021 15:19:56 +0300")
Message-ID: <m3im255e1a.fsf@t19.piap.pl>
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

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> The question still stands: is there a way to reliably put national
>> unicode characters into:
>> - commit messages for patches submitted via email,
>
> This shouldn't be too much of a problem, as long as you MUA and MTA
> don't mess up encoding.

Maybe it's better now. I had mixed results in the past, but maybe it was
10+ years ago. Then I stopped using non-ASCII as they weren't very
essential.
Apparently there was no such problems with drivers/net, at least from
the time I started using non-ASCII characters.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
