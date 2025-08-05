Return-Path: <linux-media+bounces-38918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296BB1B25C
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9002716E4AC
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE5B24166E;
	Tue,  5 Aug 2025 10:59:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722E3AC22;
	Tue,  5 Aug 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754391564; cv=none; b=r5tmjLBNcsyO0bz66PAjcji30L/kXj9lhAcCieFNvh8U4NX53XbPtEjji1LklqFvEPOF0ev78lS1r1xRp2ayEPXL++LiMd86oyax53oH0ORIU22Uwxb/kdxEsmTHF/6PGRQ3NyclBeD2nQY7NYgExdTl019sSrRsRRmZ+aZ5uKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754391564; c=relaxed/simple;
	bh=JHDNbmOk6IeK+fJ4GGkS3gEg17jUkRH0OkVSzRfGV0w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a5fQ5GpmatyWf0aTewOrSQz0nlw9NXPaDEeuCZE3UIIQzbS+4S5n5Uexp862Y9VisLteyi1vcSpN3iYYx7s2qVhGS/o4Ee5lcsS1qK9VoGyT9GyA+ah+2pE+gGf3RAwFBFciUeqTTA463r19uvBatXVNaPgSg+UPF/DsLbIjY5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 31BA4C3EEAC9;
	Tue,  5 Aug 2025 12:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 31BA4C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <m3cy9futcj.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Fri, 01 Aug 2025 14:19:56 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
Sender: khalasa@piap.pl
Date: Tue, 05 Aug 2025 12:57:07 +0200
Message-ID: <m34iumujcs.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

just in case someone finds it helpful:

SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
CPU: 3 UID: 0 PID: 40083 Comm: devmem Not tainted 6.15+ PREEMPT
pstate: 60000000 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
Kernel panic - not syncing: Asynchronous SError Interrupt

What did i do? Wrote 32-bit value to an ISP register (0x32E22E2E4C =3D
a histogram-64 register) while repeatedly reading other ISP
registers (in userspace). The video stream was active.

This ISP apparently has its own problems.
--
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

