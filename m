Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D1D3B26A3
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 06:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhFXFAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 01:00:19 -0400
Received: from ni.piap.pl ([195.187.100.5]:59546 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhFXFAS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 01:00:18 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id CBC724A0053;
        Thu, 24 Jun 2021 06:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl CBC724A0053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624510675; bh=1+x2vyCs8rgYAY9/WSnCwIrmAShCjXegb413Mj6W5Cw=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=CoW8UcETb1paLYhduyr8kVucKF7ICfcneHVWcRorzic2HQNMplzE6D8RKMcFgrUYF
         Cqfet2S2dzW5wXaYsqfylyrRcx2aIHS3v9vnSDNL+kmNTSBLabKO8h3yYYp1uEtkUt
         o2lRz8PzhnLi1pu9lBLbOPbwR8S2Fk6qK2JtxG9s=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3wnqm5eqo.fsf@t19.piap.pl>
        <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
        <m3r1gt5hzm.fsf@t19.piap.pl>
        <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
        <m3mtrh5evo.fsf@t19.piap.pl>
        <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
        <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Thu, 24 Jun 2021 06:57:55 +0200
In-Reply-To: <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com> (Kieran
        Bingham's message of "Wed, 23 Jun 2021 15:27:09 +0100")
Message-ID: <m3bl7v6er0.fsf@t19.piap.pl>
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

Hi Kieran, and others,

Kieran Bingham <kieran.bingham@ideasonboard.com> writes:

>>> The work is not published under GPL.
>
> This seems like an odd thing to say when your patch explicitly contains:
>
>> +++ b/drivers/media/i2c/ar0521.c
>> @@ -0,0 +1,1060 @@
>> +// SPDX-License-Identifier: GPL-2.0

Such tags have meaning only in the kernel context, when signed-off etc.
Alone, they aren't legal statements, especially when I explicitly state
that it's not signed-off-by me yet. Nevertheless...

Obviously, this code was always meant to be GPLed and it seems really
crazy to me that we even have to have such conversations - about
a non issue, at least from my POV.

The fact is that 6 years ago I wrote driver for a SDTV frame grabber -
and another developer "took" the development from me, and published as
his own. This wasn't probably illegal - after all my driver was covered
by the GPL from the start. But was it really how we all want things to
work in Linux? With such experience, is anybody surprised I want to
avoid this history repeating itself?

For other patches I don't care about such formalities, but this driver
is a work paid by an external entity and it would be unfortunate to
end up the same way as the tw686x driver.


I stated multiple times I will sign this code off when it's accepted.
Is it really a problem? Really?

If so... perhaps there is some other way?

I'd hate to think that the next time I'm to keep my code unpublished.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
