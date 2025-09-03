Return-Path: <linux-media+bounces-41622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44CB4118B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00B6C1890635
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 00:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A381419E968;
	Wed,  3 Sep 2025 00:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M09Ujxba"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FF14EC73;
	Wed,  3 Sep 2025 00:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756860977; cv=none; b=Pl9IMCQo2I4tBXl3zN2F44VF+xXqinMqzr5ABnKxKpnNOtdqbYuAuPyQWhXHcz1Tx+AbdaXrhc8izZNoeB3x1wyPQU5Vn3pL2kx5rtlxN8kg0qQbjhXjvWxf1Y/Gc/bYpRN1GidH9RHPmuTVCcvfN30gkH47j0JTR70zz2OrghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756860977; c=relaxed/simple;
	bh=vMUBpOspAwuRbk3s8zYi5ml7mvtL6cW/MHTRA4NY7ro=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jtKv0tmEl6CYa7iVLFTIut8937Qxa1gK50eSOXyETu/tcPzunse9DiImME+We7ZQFNHmV4Qpd8+foOIs/+mVI8tCuOq8Lh9Tos6J97VLLiOlZHn6YTDftPWp/odENVYOLxStL5OcU+ytH0juuU6V5EZnguR34SA2OcjBtPKJhCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M09Ujxba; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:30ba:ee2f:ad96:6665])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 111D3162B;
	Wed,  3 Sep 2025 02:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756860902;
	bh=vMUBpOspAwuRbk3s8zYi5ml7mvtL6cW/MHTRA4NY7ro=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M09UjxbaNl4O7Aq5tpPeCiAvMeaYwv5r0yOTL0GZdgx+4CItYw64sXEQszZXQYdYP
	 0GJ1Y1XRYj0p3daiEop57gWfDtU6YT1+OVvMuYMJLP4WyXuxJx5jJUhSz3QSvrOFlC
	 XQxrbiuL8S0iIyk2o/nCeDhN+ir2y/Mf2w+OunwY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m31popxjqk.fsf@t19.piap.pl>
References: <175308758352.3134829.9472501038683860006@localhost> <m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl> <m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl> <m3a545t789.fsf@t19.piap.pl> <20250812103243.GK30054@pendragon.ideasonboard.com> <175501095338.74722.11604545949710100799@localhost> <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com> <m31popxjqk.fsf@t19.piap.pl>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Adam Ford <aford173@gmail.com>, Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Wed, 03 Sep 2025 09:56:04 +0900
Message-ID: <175686096405.1542294.2802960782852730947@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Hi Krzysztof,

Quoting Krzysztof Ha=C5=82asa (2025-09-02 18:54:27)
> Hi,
>=20
> summary:
>=20
> I've done a few additional tests and it seems the MEDIA_AXI clock is the
> problem. Reducing it to 400 MHz while still running MEDIA_ISP at 500 MHz
> produces no errors.
> MEDIA_ISP at 400 MHz and MEDIA_AXI at 500 MHz produces errors, though
> (register address errors while reading and writing from/to ISP MI
> (memory interface) registers, only on the secondary ISP (isp1), and
> generally only while streaming data from the ISP).
>=20
> What is driven by MEDIA_AXI clock root? MEDIAMIX: ISI, LCDIF, ISP, DWE.
>=20
> According to both datasheets (industrial and commercial), MEDIA_AXI
> is limited to 400 MHz in normal mode and 500 MHz in overdrive mode.
> All my hardware is setup for overdrive mode, though (two manufacturers,
> both using the same PMIC setup).

Thanks for the investigation!

>=20
> Since no hardware in the official Linux kernel tree (DT) uses the second
> ISP... Should we just add a warning to the imx8mp.dtsi and be done with
> it?

afaiu we can't yet use the ISI and ISP simultaneously, so the ISI is
enabled by default and you need overlays to enable the ISP, so
technically nothing upstream uses either ISP. To my knowledge, there is
hardware where you can use both though, such as the Debix SOM A
(imx8mp-debix-som-a-bmb-08.dts) [0].


Paul

[0] https://debix.io/hardware/debix-som-a-io-board.html

> Out of tree hardware using isp1 (csi1) obviously exists.
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

