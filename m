Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4633B133B
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 07:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFWFab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 01:30:31 -0400
Received: from ni.piap.pl ([195.187.100.5]:44546 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229660AbhFWFa3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 01:30:29 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id B38F04A000D;
        Wed, 23 Jun 2021 07:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B38F04A000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624426091; bh=t48Nx1nCTXxqM7Gk6oUvqx0157Xr9DcRpKbDqx5JVd8=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Cbv3Uw/lFBkgMq2kEbkgm9+QjRethFE4Pe4ShCtfiCyYcrdxdd1DeKQJrnigQi9Qi
         gm/Xtqi95i1JHaAhU2s3ofUhJfInKEAovoXsrTKGzSiPpzOVekkHUyqTjxpTaM8Yck
         4RwY8hWFXdB8+DRRe8y+PxGl7A2Om97TMF32vMJ0=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3wnqm5eqo.fsf@t19.piap.pl>
        <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
        <m3r1gt5hzm.fsf@t19.piap.pl>
        <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Wed, 23 Jun 2021 07:28:11 +0200
In-Reply-To: <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Wed, 23 Jun 2021 07:31:18 +0300")
Message-ID: <m3mtrh5evo.fsf@t19.piap.pl>
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

> How does a lack of an SoB line prevent someone from doing exactly what
> you've described above ?

The work is not published under GPL.

> Maintainers usually understand these issues. They may fail to notice,
> but if you point out a patch that would steal your work, that would
> prevent it from being merged.

I'd like to believe this as well. Unfortunately, it doesn't work like
that. See the "tw686x" (an SD TV frame grabber) case.
I didn't even request that the other driver wasn't merged. I only wanted
it as a patch on top of the original one - so the history could be
visible.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
