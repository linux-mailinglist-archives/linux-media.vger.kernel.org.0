Return-Path: <linux-media+bounces-41545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F5B3FB9C
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E7248063C
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7AF2ED85F;
	Tue,  2 Sep 2025 09:59:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EC72EFD8A;
	Tue,  2 Sep 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807187; cv=none; b=pJTJrh3G8DDpmN0vFtCrJSNXWSGH9Q7oY7VAsroxTLB+rLuoMrTwSC2P10UfE9FN07myBzcj9Qy/BAj1R32d85glAfaWMzTtwCQ2PNkQdAyveo0mDfgLcWpIkYb3Ykw9MbNVJ6ERWLT0Q9alaXsoufKWLB2WLo4BdC2ybbC98Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807187; c=relaxed/simple;
	bh=GNCNaMiPJDXvB/7iEX4grRokMrqO0VUFGnAoYlmBZNk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=spscc8hEe82YSf/usC5ulpFKzVRZJrURI/lm6MkQe727YkmJkTNHZWIlwFCxHh3NuF+qa6xtK8YhvJZx1p5d/F6oFuAmYf0SsbMZBFqx8SDluoYJ7y36GD1dmu70BNJDDCU9ZzD47q1Ai0beECh8ycs3W4f1pOZlyY1/TLbunAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 16763C3EEACD;
	Tue,  2 Sep 2025 11:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 16763C3EEACD
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
Date: Tue, 02 Sep 2025 11:54:27 +0200
Message-ID: <m31popxjqk.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

summary:

I've done a few additional tests and it seems the MEDIA_AXI clock is the
problem. Reducing it to 400 MHz while still running MEDIA_ISP at 500 MHz
produces no errors.
MEDIA_ISP at 400 MHz and MEDIA_AXI at 500 MHz produces errors, though
(register address errors while reading and writing from/to ISP MI
(memory interface) registers, only on the secondary ISP (isp1), and
generally only while streaming data from the ISP).

What is driven by MEDIA_AXI clock root? MEDIAMIX: ISI, LCDIF, ISP, DWE.

According to both datasheets (industrial and commercial), MEDIA_AXI
is limited to 400 MHz in normal mode and 500 MHz in overdrive mode.
All my hardware is setup for overdrive mode, though (two manufacturers,
both using the same PMIC setup).

Since no hardware in the official Linux kernel tree (DT) uses the second
ISP... Should we just add a warning to the imx8mp.dtsi and be done with
it?
Out of tree hardware using isp1 (csi1) obviously exists.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

