Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89F73B3081
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 15:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhFXNxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 09:53:30 -0400
Received: from ni.piap.pl ([195.187.100.5]:48610 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhFXNx1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 09:53:27 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 43AFF4A007F;
        Thu, 24 Jun 2021 15:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 43AFF4A007F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624542667; bh=iZokXqKYXfRMHlzzc+3WHHQK5qezOQnwsWK0rYBbXYA=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=g7rd6tIHansD8tP7LG+4RPKWObdH+H/ofDKOoWXJzSl1mYWXnWnubLEepHVxXyce8
         3Te9LYLUHulpPzOWEPEC8F7cNzVQFqefIjHALaEJNnUF0jftjpHkljAzMeWymy5cfK
         DLhR7rBsOuEH89La42VAhKKdpXvJc2HtltZ4eyOE=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3wnqm5eqo.fsf@t19.piap.pl>
        <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
        <20210624131048.1272f272@coco.lan>
Sender: khalasa@piap.pl
Date:   Thu, 24 Jun 2021 15:51:07 +0200
In-Reply-To: <20210624131048.1272f272@coco.lan> (Mauro Carvalho Chehab's
        message of "Thu, 24 Jun 2021 13:10:48 +0200")
Message-ID: <m3sg174bhw.fsf@t19.piap.pl>
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

Hi Mauro,

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> Media maintainers need a SoB in order to be able to review, as
> driver review takes a lot of time and efforts from reviewers, and
> the time they spend reviewing a driver prevents them to do their
> (paid) work.

Then how do you propose we solve the problem?

For example, how about a declaration: that if somebody is working on
a driver (in this case) and has actually presented a (possibly not yet
mergeable) patch, then versions of this code from other people will not
be accepted at the same time instead. Please note that I don't mean
abandoned code, I mean a code which simply needs some work and thus
a bit of time.

Those other people can always apply their changes once the original code
is accepted, right? And the changes may get a chance to be examined :-)

Or is it too much?

> That's said, on a very quick check, it sounds that this driver requires
> some work. For instance, it is based on an v4l2_subdev_pad_config,
> which was recently replaced upstream.

Well, TBH drivers/media is a fast moving target... But it's something.
I will obviously update this when I'm back from vacation.

Thanks.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
