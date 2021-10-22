Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4474371FE
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 08:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhJVGof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 02:44:35 -0400
Received: from ni.piap.pl ([195.187.100.5]:59198 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230295AbhJVGof (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 02:44:35 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 066B9C4919A6;
        Fri, 22 Oct 2021 08:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 066B9C4919A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1634884937; bh=UcfEjk8DBNDpRG6uthQ/iHYz4huVJ4WRfk9x2Wd4HPk=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=FWyTCVFdx0rGJ0MatR2ACAZ308n1P9w+EEdOnsl4V2BriH6i8GWA1g59XP27A8OsL
         8XE7zY9iBWyoRTFmdmCiKZ3Jko403K7lPb7FWBYc2SAOlGVuIX0TeZzhP+HHra0huY
         bWOJ1HVd+Hi4wYUlqfd+aPuS7986zg4olkcqB2Zw=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
        <m3mtnflpna.fsf@t19.piap.pl>
        <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
        <m3a6jel9ce.fsf@t19.piap.pl> <YWXwSAm3OO/WTkOL@valkosipuli.retiisi.eu>
        <m335p5lc04.fsf@t19.piap.pl> <YXBjX2vUwrKVOd78@valkosipuli.retiisi.eu>
Sender: khalasa@piap.pl
Date:   Fri, 22 Oct 2021 08:42:16 +0200
In-Reply-To: <YXBjX2vUwrKVOd78@valkosipuli.retiisi.eu> (Sakari Ailus's message
        of "Wed, 20 Oct 2021 21:43:43 +0300")
Message-ID: <m3bl3hd0hj.fsf@t19.piap.pl>
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

Hi Sakari,

> The drivers you're looking at are based on register lists so they usually
> support just a single frequency. The sensors are not limited to this
> frequency however, which is why you see the frequency in DT bindings, too.

Does that mean that drivers supporting a frequency range (rather than a
single frequency) don't need the range (nor single frequency) in DT?

While it's true that the AR0521 driver can (and has to) work with
different frequencies (on different systems), I think I can specify
a single frequency per system. But - should I really do that?
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
