Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8B439F148
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 10:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhFHIru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 04:47:50 -0400
Received: from ni.piap.pl ([195.187.100.5]:35046 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231278AbhFHIrt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 04:47:49 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 736B344426B;
        Tue,  8 Jun 2021 10:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 736B344426B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1623141955; bh=1ssAuGc37YgsCuK3ii+Tsnzzdd2ubaNvVoRXSIkosQE=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=fA/vwDBrraA2VFHZCDFTsKgMAs5rmrQAj4xWvyHcHrhuuaBcCc6rIDeRjFLwcSP1k
         md5WfcXHCUx74MJ/vxyBA4W2v9Rj0RDn0joZ+Qi2s8DEQkgasHk9XRc3aw5QfXWbvU
         rIBcBY0k7goXtXCrxEyJanPIQr1E8kWlAa/xnAaQ=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] TDA1997x: enable EDID support
References: <m3sg1uq6xu.fsf@t19.piap.pl>
        <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl>
        <m3eeddhora.fsf@t19.piap.pl>
        <CAJ+vNU0E_0pB-1T+VpdmjJNVirAwCUNjKVbEV4wEbqHOzURj_A@mail.gmail.com>
        <m3k0n57y72.fsf@t19.piap.pl>
        <e9acc316-54c4-0387-eaaf-18dfb4dce34e@xs4all.nl>
Sender: khalasa@piap.pl
Date:   Tue, 08 Jun 2021 10:45:55 +0200
In-Reply-To: <e9acc316-54c4-0387-eaaf-18dfb4dce34e@xs4all.nl> (Hans Verkuil's
        message of "Tue, 8 Jun 2021 09:27:24 +0200")
Message-ID: <m3czsw922k.fsf@t19.piap.pl>
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

Hans Verkuil <hverkuil@xs4all.nl> writes:

> OK, I think the history is clear. Can you post a v2 with a Fixes tag and
> comment a bit on why this was not caught before?

Sure, will do. That "Fixes" tag... since it's from the beginning (the
Gateworks' branch was never a part of the official tree), do I still
need it? It would have to point to the initial submission of this
driver.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
