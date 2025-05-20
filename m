Return-Path: <linux-media+bounces-32919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF046ABD843
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 14:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CC531B657BF
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447C81A08B8;
	Tue, 20 May 2025 12:35:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918719E966;
	Tue, 20 May 2025 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744524; cv=none; b=psAJov8QiGJ2znpBmeDvR7fRvVMLJ4CZeYHnBq4qgcfH4Ofj3GNEKatwRtR9LYla5K9sPC7TFg2lu5MiEBh3kOGsmKYL16DJ7yXI/J6VWNlw6bEgJ/DxdL1LbzA0tmdG0zcAKFRjJbeBMpdrmhTVgLyn5r+mcDR+0fi6YOgl5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744524; c=relaxed/simple;
	bh=4yYh+52kFZWGuy7sYSIaRe8+zSWmoKcHoy3cEoyEaXQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V7Bh8d78YwAOxy1jjFf/W13lykQnJRsGCmZoX1vn4Wf/xBrDkHzZjYNrC28uNHhjk3P+ZdAjr8cc3D+56yAOg+h7ucdy+H5FL2WUqTzrfDi3oL4U3YU9zHedfdnJNJ0cbhP83ONIsTiU7c9uLK2xHyj5PiQxG0odlGDnszjdPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id A255FC405A49;
	Tue, 20 May 2025 14:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl A255FC405A49
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,  Martin Kepplinger
 <martink@posteo.de>,  Purism Kernel Team <kernel@puri.sm>,  Mauro Carvalho
 Chehab <mchehab@kernel.org>,  Shawn Guo <shawnguo@kernel.org>,  Sascha
 Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <20250509103733.GE28896@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Fri, 9 May 2025 12:37:33 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date: Tue, 20 May 2025 14:35:18 +0200
Message-ID: <m3o6vn8np5.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>> @@ -654,8 +654,7 @@ static void mipi_csis_set_params(struct mipi_csis_de=
vice *csis,
>>       val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>>       val &=3D ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
>>       val |=3D (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
>> -     if (csis->info->version =3D=3D MIPI_CSIS_V3_3)
>> -             val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE;
>> +     val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE; /* enable filtering by DT =
*/
>
> The condition was added because the CSIS in the i.MX8MM doesn't
> implement the INTERLEAVE_MODE field. We can't remove it unconditionally.

Is this confirmed (and not just an incidental omission from the docs)?
Same version (3.6.3), and even earlier version (3.3) has it... It would
mean MM can't work with those sensors producing extra packets.

I wonder what version is shown in the #0 register on 8MM (8MP shows
3060301).

> You mentioned i.MX8MP, that's a platform where I'd like to see proper
> support for *capturing* embedded data, not just dropping it. Have you
> looked at how this could be implemented ?

I had a brief look at it, but a) the embedded data is not very
interesting in case of my IMX290, b) I don't want to interleave it with
my image data (DMA buffers and what not) and I don't see a way to store
it independently.

If you want to store it along the image, the currect code does that -
more or less correctly. This is the problem.

The RM says "13.5.2.6.6 Null and Blanking Data
For both the null and blanking data types CSIS V3.6.3 ignore the content
of the packet payload data." which is half-truth, e.g. it needs the
MIPI_CSIS_CMN_CTRL_INTER_MODE to do that, otherwise it messes it up.

Several CSIC registers are named XXXXXn, suggesting more than one
register, but the docs say only #0 exists. Nevertheless, the actual
hardware seems to contain 3 packs of registers (the 4th one is weirder):

32E40000:  3060301     4705    F0000 DEADCAFE
32E40010: FFFFFFFF        0        0        0
32E40020:       F0  900001F DEADCAFE DEADCAFE
32E40030:      1F4        0        0        0
32E40040:       B0  4380780        0 DEADCAFE <<< ISP_CONFIG0
32E40050:      8FD 80008000        0 DEADCAFE <<< ISP_CONFIG1
32E40060:      8FE 80008000        0 DEADCAFE <<< ISP_CONFIG2
32E40070:      8FF 80008000        0 DEADCAFE ???
32E40080:       B0  4380780        0 DEADCAFE <<< SHADOW_CONFIG0
32E40090:      8FD 80008000        0 DEADCAFE <<< SHADOW_CONFIG1
32E400A0:      8FE 80008000        0 DEADCAFE <<< SHADOW_CONFIG2
32E400B0:        0        0        0 DEADCAFE
32E400C0:        0 7FFFFFFF        0       E4
32E400D0:        0        0        0 DEADCAFE
32E400E0: DEADCAFE DEADCAFE DEADCAFE DEADCAFE
32E400F0: DEADCAFE DEADCAFE DEADCAFE DEADCAFE
32E40100:     22E1     22E1     22E1        0 <<< FRAME_COUNTER*
32E40110:        0        0        0        0 <<< LINE_INTERRUPT_RATIO*
32E40120:        0 DEADCAFE DEADCAFE DEADCAFE

This is the first CSI. The 3 frame counters are visibly active as well.

The manual states (MIPI_CSIx_ISP_CONFIGn) "NOTE: Not described types are
ignored" and even if not, I can't see what could we do with this extra
data.

Perhaps the CSIC internally has 3 output ports, but only the first one
is connected to ISI and ISP?
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

