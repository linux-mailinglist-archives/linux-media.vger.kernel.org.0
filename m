Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F8A3B2FEC
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 15:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhFXNZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 09:25:09 -0400
Received: from ni.piap.pl ([195.187.100.5]:45460 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhFXNZI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 09:25:08 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 3C3E94A007F;
        Thu, 24 Jun 2021 15:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 3C3E94A007F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624540968; bh=UsDh/IJPYJff3yt6zKCVvTurJG0QrYahYd5eIUIqSMg=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Y6jXQqfhM4XLXqiAmer0t2lvAx/3Tl5MBQjZAJ3LtRtv9jAGJ8/UW/kOPzMP2M876
         aXttucDrQh7b26M2tKHBi1kccjPKzHcnyZxEOkmJz+cgQyrq3uLhp6O9TTKfErwPp8
         Z5UBpS8CQQwBy/qGH85A33g/BHLuCbRSK/jh6GNs=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3wnqm5eqo.fsf@t19.piap.pl>
        <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
        <m3r1gt5hzm.fsf@t19.piap.pl>
        <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
        <m3mtrh5evo.fsf@t19.piap.pl>
        <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
        <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
        <m3bl7v6er0.fsf@t19.piap.pl>
        <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
        <YNR9CS/PfG7s1e71@kroah.com>
Sender: khalasa@piap.pl
Date:   Thu, 24 Jun 2021 15:22:48 +0200
In-Reply-To: <YNR9CS/PfG7s1e71@kroah.com> (Greg KH's message of "Thu, 24 Jun
        2021 14:39:37 +0200")
Message-ID: <m3wnqj4ct3.fsf@t19.piap.pl>
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

Hi Greg,

Greg KH <gregkh@linuxfoundation.org> writes:

> +// SPDX-License-Identifier: GPL-2.0

> Putting the above line on a file _IS_ a legal declaration that the file
> is released under GPL-2.0.  It's pretty simple :)

Do you think putting this line anywhere, in any file, does it?
That would be crazy.

How about a book, e.g. describing a patch submission process (but not
a copy of kernel's Documentation). The same?

Also - in all countries? Most of them?

Come on.

Then why would we need the Signed-off-by?
From my perspective, the SPDX-License-Identifier is only meaningful when
the file is actually a part of the kernel, or if, at least, it's been
presented for merge, with Signed-off-by etc.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
