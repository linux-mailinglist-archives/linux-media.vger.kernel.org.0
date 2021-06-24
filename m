Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E693B3121
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 16:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhFXOTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 10:19:49 -0400
Received: from ni.piap.pl ([195.187.100.5]:50994 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhFXOTt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 10:19:49 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 828554A007F;
        Thu, 24 Jun 2021 16:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 828554A007F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624544248; bh=Rnf0ABC9pxPhm1eu9IeRLu9i9k/XWznp2dgKd4/rwfw=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=INmtnc8ZCH0f8pYlKO90++q/3SVj6OfiaO5bAPvoiduUlChufVTPnPkRUCyGxoqOq
         9KgGL43CkWncOSJ8J31058qhytpWP6l3C0AgIwmiwfFoCZRfSRwCQU3JCqQQgYgCMO
         zQqJ1OQhLSKM2eInGLIgMtk2YOa3AyAUH6ExfLLo=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
References: <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
        <m3r1gt5hzm.fsf@t19.piap.pl>
        <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
        <m3mtrh5evo.fsf@t19.piap.pl>
        <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
        <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
        <m3bl7v6er0.fsf@t19.piap.pl>
        <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
        <YNR9CS/PfG7s1e71@kroah.com> <m3wnqj4ct3.fsf@t19.piap.pl>
        <YNSIqSQeefzai4fW@kroah.com>
Sender: khalasa@piap.pl
Date:   Thu, 24 Jun 2021 16:17:28 +0200
In-Reply-To: <YNSIqSQeefzai4fW@kroah.com> (Greg KH's message of "Thu, 24 Jun
        2021 15:29:13 +0200")
Message-ID: <m3o8bv4a9z.fsf@t19.piap.pl>
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

Greg,

Greg KH <gregkh@linuxfoundation.org> writes:

>> How about a book, e.g. describing a patch submission process (but not
>> a copy of kernel's Documentation). The same?
>
> That does not make sense, please explain.

Why not? I can put such a text on a book (say, an e-book) as well.

I'd say you're right with the absence of indication to the contrary -
but if someone explicitly states something is not (e.g. yet) under GPL,
then how one could say SPDX-something has legal precedence is beyound
me.

>> Also - in all countries? Most of them?
>
> Yes.

I assume the latter and not both :-)

> S-o-b is a DIFFERENT thing entirely.   Please go read the DCO for what
> you are agreeing to there, it is a declaration for what you are doing.

Well, that's my position.

>> From my perspective, the SPDX-License-Identifier is only meaningful when
>> the file is actually a part of the kernel, or if, at least, it's been
>> presented for merge, with Signed-off-by etc.
>
> Not true at all, sorry.  Same for a Copyright line.

The difference seems to me a copyright is regulated by international
agreements and various national laws. A big part of the world doesn't
need the "copyright line", the "protection" is automatic.

But yes, I will remember to ask our lawyers about it. Now that I know
I need to.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
