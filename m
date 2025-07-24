Return-Path: <linux-media+bounces-38310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B45B10371
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 10:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D12518868D8
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 08:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435F72749F8;
	Thu, 24 Jul 2025 08:21:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8042749C3;
	Thu, 24 Jul 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345311; cv=none; b=OXyy2lIUD+fngR2GSgpPtMkmX7uGmalLmDr4drpFz8e2JflOq+1WsxsKeY5uqyHXyWcO1bdVWWq5cSTJaY0j2XO0qJJc8/2nE4cHc7FrN0jgv0GH+FKFAiWu4s5+30YJyVapl+Fcpc+C13Egf99ZjZv06H7vIhGnHt/cZicXa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345311; c=relaxed/simple;
	bh=Yd25df4jbjRGJNzeO2UBwuKhBUHy+gLpWmU9wNKmASQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qWZJIJAkiWBWSx77JhyZ6ZaOJHZt5RkF6iZCVOwTUFptpV9z6Xc6jWDywAYFrir0GSKF+Bx9fJsCLkZ4dqurE1aE0ISH6S5/OUD8ChWvbaWJjDRbyXf6QoVgSWnM04Xj7lm6SDTO41MwcM4uZ7FM2hHbPdlueekyY641SQLKvlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id C245CC3E4DF2;
	Thu, 24 Jul 2025 10:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl C245CC3E4DF2
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <175326599663.2811177.16620980968274114885@localhost> (Stefan
	Klug's message of "Wed, 23 Jul 2025 12:19:56 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
Sender: khalasa@piap.pl
Date: Thu, 24 Jul 2025 10:21:45 +0200
Message-ID: <m3h5z2vw12.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Just a quick heads up. I ran the tester and so far no unexpected
> results. I'll run it from time to time after a reboot to see if I ever
> hit that condition.

Is your camera(s) connected to the first CSI?
I cannot reproduce the problem on csi0, it seems only csi1 is
affected. It would be consistent with NXP's workaround commit text.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

