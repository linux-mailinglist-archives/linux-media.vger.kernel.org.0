Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAAC3A2452
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 08:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhFJGQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 02:16:35 -0400
Received: from ni.piap.pl ([195.187.100.5]:59880 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhFJGQe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 02:16:34 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 8D15E443166;
        Thu, 10 Jun 2021 08:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8D15E443166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1623305674; bh=xrBsq3MH+xFTU3NQYMsHqFUPF2E/FqDBLg+Y3x9Dmfo=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=ZpA6oJ78T/8xf/1afo0ZvqWE9l0l7HpqvV+EkhqbtcU7NXXQnaXGxIaHGT1iScW2A
         /tbCwvPMvsEOt2tWef4eBEDB3Sa/eq7U2VxyMpeYhAiB9dlzZDRDwKgAbT4vuIc0rm
         ELgiCKR9REdujEEcZEzBmoiDZ4iSOPtHj32H7hxY=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESENT] MEDIA CODA: Fix NULL ptr dereference in the
 encoder.
References: <m3k0n6gciy.fsf@t19.piap.pl>
        <7ff9ab255bc95ae7400b77bef6e0a2949858f04c.camel@pengutronix.de>
Sender: khalasa@piap.pl
Date:   Thu, 10 Jun 2021 08:14:34 +0200
In-Reply-To: <7ff9ab255bc95ae7400b77bef6e0a2949858f04c.camel@pengutronix.de>
        (Philipp Zabel's message of "Tue, 08 Jun 2021 11:55:03 +0200")
Message-ID: <m34ke68cvp.fsf@t19.piap.pl>
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

Hi Philipp,

> I don't think this is required though.

and

> This is already fixed by [1] in media-tree/master.

Ok, thanks, sorry for the noise.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
