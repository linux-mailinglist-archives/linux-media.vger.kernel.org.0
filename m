Return-Path: <linux-media+bounces-39716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD2B2400C
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 675CC3BEDC4
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 05:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678BC2BE056;
	Wed, 13 Aug 2025 05:10:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C818DF8D;
	Wed, 13 Aug 2025 05:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755061810; cv=none; b=IRiQKPQtL1/E4JAudX7MrH674CkQpfyhIcP1NmVvlextdU/rWd3KlyI23g6jS4/+LkpdhNFFXaCX1kCNNSfkNyVC3BuPuGtVa4nqTlZKjGQY6hzJ09qF7fdAiK6uqQVL4NtO3v4hnJ2bHGIrRilXR1J17GsDydWMuIA+58RYWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755061810; c=relaxed/simple;
	bh=78z1kuRSWutMg/Hy75bF++4O7lZJqDUQoV9YvjD+Wtw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s7OIqG2m9NBi6MUIosjGuJ912Up25Adn3GpG98i6sN9ADtOVkF1R78o6P4bOFrINQtsxSryG96QlYgPBeV7sSe+1wfGzd0o1YrmfMwV4hu+i7yWu3Fe2oeQWMvCxPAr2qmF+eARU6KT6R/ko6wyqNmHTL6tbdQzY3LwmVFWgc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id C17F5C3E4DE7;
	Wed, 13 Aug 2025 07:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl C17F5C3E4DE7
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Adam Ford <aford173@gmail.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Dafna Hirschfeld
 <dafna@fastmail.com>,  Heiko Stuebner <heiko@sntech.de>,  Paul Elder
 <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
In-Reply-To: <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
	(Adam Ford's message of "Tue, 12 Aug 2025 13:22:54 -0500")
References: <175308758352.3134829.9472501038683860006@localhost>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
	<m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
	<m3a545t789.fsf@t19.piap.pl>
	<20250812103243.GK30054@pendragon.ideasonboard.com>
	<175501095338.74722.11604545949710100799@localhost>
	<CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
Sender: khalasa@piap.pl
Date: Wed, 13 Aug 2025 07:10:03 +0200
Message-ID: <m3v7mrst78.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Adam,

Adam Ford <aford173@gmail.com> writes:

> I was reading through the data sheet (not the reference manual), and
> it lists a few limitations for the clocks:
>
> For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
> clock in the Nominal/Overdrive mode.
> For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clock.
> For dual Camera, both MIPI CSI can support up to 266 MHz pixel clock.
>
> If you're running dual cameras, it sounds like you're capped at 266
> MHz regardless of whether or not you're in overdrive or nominal.

Right. But these are pixel clocks, not ISP clock. At least theoretically
entirely different stuff.
For example, I'm using (at most) two IMX290/462 1920x1080p60 sensors in
12-bit (Bayer) mode, resulting in:
- 148.5 MHz pixel clocks
- 1782 Mb/s total bandwidth (for each sensor - 12 bits)
- 445.5 Mb/s per lane (each sensor uses 4 MIPI lanes)
- 222.75 MHz MIPI clocks (MIPI uses DDR, the double data rate)

So I'm well within specs. Though I don't know if the people writing the
datasheets did really mean what they wrote, or maybe they meant ISP core
clocks as well. Why? Because ISP blocks (and all such logic blocks)
require a certain number of their core clocks for a signal rate (in this
case, a pixel rate). And maybe what they specified in the datasheets was
a calculation of this (unpublished?) required pixel/ISP clock ratio and
the max ISP clock rate (specified incorrectly at 400/500 MHz).
Anyway, this is only a possibility. Another one is that ISP2 simply
cannot reliably run at 500 MHz, for some "analog" reason, design bug
etc.

> My understanding is that the imx8mp.dtsi is pre-configured for
> overdrive mode, so if you need to run the ISP in nominal, the clock
> updates should go into imx8mp-nominial.dtsi.

It seems my modules are setup for overdrive mode.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

