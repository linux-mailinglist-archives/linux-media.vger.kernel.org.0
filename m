Return-Path: <linux-media+bounces-38296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5AB0FF80
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 06:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9494A586D63
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 04:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B051F462D;
	Thu, 24 Jul 2025 04:20:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475798F4A;
	Thu, 24 Jul 2025 04:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753330845; cv=none; b=VNaWoVazwF38j1P5QydLPJPI693zsTzdiAUTH8XJzEI/Eoyo/jCbwIPVYM2234qZTeDR5yas6VD9W0lLF7D2whotxa468qdZyMiXgbx2a8O+Y75Nu/SZm19pOzSv45J9YH938kGSsJ9XWwc3A/xyZjZRK3L526BNdMSIdCCPCUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753330845; c=relaxed/simple;
	bh=y4SI2yNCu1eSTJHgHKnhttRt5TtRhKqyyKUhIBS/gjo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q+35Fqvx4WscIGgvJ+9zFtAou3VnY/qH1QMoY9cLGmV3rxmFhedJCAj4znYomkLCKF4VouACgvNHJHE9oi2M5wEkoZbl8hBsp48jY/R8168hGNY9kOIlYfVCg7w1hJo9fATGUZuVrQa7qvUCF6W2nrSRQwHvjaJhTrZxB2lTLoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 5ADAAC3E4DE9;
	Thu, 24 Jul 2025 06:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 5ADAAC3E4DE9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,  Dafna Hirschfeld
 <dafna@fastmail.com>,  Heiko Stuebner <heiko@sntech.de>,  Paul Elder
 <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <20250723120942.GB10291@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Wed, 23 Jul 2025 15:09:42 +0300")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3seinw1po.fsf@t19.piap.pl>
	<20250723120942.GB10291@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date: Thu, 24 Jul 2025 06:20:39 +0200
Message-ID: <m3o6taw76w.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> There's a crossbar switch in the ISI, but the connections from CSI-2
> receivers to ISPs are fixed.
>
> Have you tried reporting the issue to NXP ?

No, they know about it, there is that workaround code (working most of
the time) in their driver. For now, I want to better know the problem.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

