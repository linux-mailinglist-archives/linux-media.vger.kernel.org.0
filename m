Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0FD3B12A1
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 06:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFWEXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 00:23:20 -0400
Received: from ni.piap.pl ([195.187.100.5]:39818 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhFWEXT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 00:23:19 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id AF8094A0008;
        Wed, 23 Jun 2021 06:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl AF8094A0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624422061; bh=dc0AdCJ3GWlBhYu6e7z1vyh5kOzTKmCdDcLpyRY5OHE=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Yk0s/FNHapdi6eG/mNecBxue3REmTvhZp3LXBJyOpeu2ZT2GUUVYf22GFI7q4dvng
         5T+NoW3bbXz5EhWGeNV8X/us4bOK/TRXRIpKmQvIW9iOuVLx5PvzZt9MZMXOu0ht/2
         csi0Db0vIwxbHam2pz4/4JzMOxXHJkcF6RKS0iGo=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3wnqm5eqo.fsf@t19.piap.pl>
        <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Wed, 23 Jun 2021 06:21:01 +0200
In-Reply-To: <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 22 Jun 2021 14:57:00 +0300")
Message-ID: <m3r1gt5hzm.fsf@t19.piap.pl>
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

> To spend time reviewing this code, I want to know it will be mergeable,
> and that requires a SoB line. That's a blocker I'm afraid.

So how do you propose to solve the situation, in which my driver is
rejected, but another persor takes it, makes changes (btw breaking it),
and presents it as their own, and it's accepted? This is a paid work and
I'm required to put in my employer's copyright over the code.
I could have made this error once - but no more.

The code will be mergeable, as I already wrote. Why would I bother
otherwise? But I cannot let that history to repeat itself.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
