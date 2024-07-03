Return-Path: <linux-media+bounces-14590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F592634A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 16:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED24C1C2034C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 14:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B0917B50C;
	Wed,  3 Jul 2024 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="gS9lErmN"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8017965E;
	Wed,  3 Jul 2024 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720016569; cv=none; b=Cb9RliE8vro+kD170LSsHg7UHfixaI8rTTSiNGwdmvmUD/KryzS8XldF2nSazun77hN/8ajFKsTF9D87xG3XpJzgmzjx+zEa5DVLenlN+zIA1KdGis0Rg18m65N3dwHJqQn3G/F8KyZKjAF+spf+fge+mi8HZycZQfKiRHZGtXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720016569; c=relaxed/simple;
	bh=T4yKvc+lELzYxYMsH81tgHi+E5UPTZWagiGiUK6QmX8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=k5tL2YAAEytcqR16jBAMkDeh6cULN28lLmgiDWNnsxuZr+yQd7JD6QFtVs7Qfuzp/uqpCFBiukD729oWzxndXDCjhAT8zDWy4twsgKgWZyAyIsIuk3ZpK1l9DHQRJEQ7mUsybOgi9GwlHmfHP6uGrMclDCMDiER0MVRyJxlfjRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=gS9lErmN; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720016532; x=1720621332; i=markus.elfring@web.de;
	bh=c5lTrDrm1hXARYh2GRtk5/VrYRUhLUaho/B5U9nuKNA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gS9lErmNl5vam2RQWajiqIHwn5LvqfFI56M/NAfvGJbbpQU1GOZ5fs9FBYHJ3lyR
	 EVZrtz1DIrHVM3nU4YO6RE2Y7x2e755Yy4PKtEobECQbILq90ImSNbuZCk3zqpfyu
	 RUv/mu18/giUs0ZfHUIa6cc2LY7Y2XM1ecowvs/b6dxYRxWAyNKYXU0TF+IXdLFXN
	 t6dbMLfm1JxqD0ItcaFVqDjNqIYFrNGnU8PteBo9NWpEaSE7y150aDut5lUDky9UO
	 ZsaYrg0NvorFAuSk4spEfoPp6ZuTNJmWhK4+FE8WEUEjiyNLQNmSIWbyGqh98P7KU
	 H3HsIn54KwrYhtUU7w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdfCN-1rpg7Z1p7B-00otu0; Wed, 03
 Jul 2024 16:22:12 +0200
Message-ID: <20e989df-0a63-4a07-b164-f213405d62b3@web.de>
Date: Wed, 3 Jul 2024 16:21:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Junlin Li <make24@iscas.ac.cn>, linux-media@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240702175023.3921-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drivers: media: dvb-frontends/rtl2830: fix an
 out-of-bounds write error
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240702175023.3921-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EoluFemJE7z7gOT0PW5yGSaUvKc7zIT6Nwvg7Mzwt2EVM+EpL44
 QXmEbT/ymdcqnp4zolFzN1/ugkzO4CPc9ZnKga7zp4c4D0OvtjJMMd1q9exeKCJvQWKjtnt
 WljoNs0e52U+VlBrG/u5WtHZi936iMWhpU6pDqfP/B45pp0top74x2h5Po1wjF9NY0+beaV
 fjKBhIn/dLqYZB48g0fzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OuVp94A9e5Q=;ZLsMdpoS4/jKg+kBdB3ynJpdNhq
 q8mwd6McDAAOLmo1yoI1HRYOMPCeLOhvaFBXqtOUzv75yFFaHBPUz9Awj4lGZLlGOC2Q89K1x
 PODOlRFumlqQIUF+AC5AqJoDz3ca5azTf7ZIQTCz63kVivQIUcsizbbxENmh+f7PqDaE3aPXO
 WKf6fi/kjT4psu+esjwYMI6yNyKrcjJiShAsrAPxWGzMdWmVdxOH04rEp+zCbidyrLO2GDYMP
 wgGXVafHecnFOQMlnk4+IpuI9ILFlXrFR61UiUHODDVSwe/z487fHlwr8HbMex1Udw0mlfbER
 JzINidaFwTB1UfqJFPyWpeTfhFYLEu5Wjj40GYNxdFIjT1TKnzti4JrMXG/ddiu8yEpPSucCC
 JS2k2CRd4BoV0yGnDZOUdanKGF1yIPgvd0mh4ysJ8/9Lv/HqoayJL6o7acScb/l5I1/KW2iPt
 L4lyOvn79kUZsJm2YlRvrcagCTNl/Ioa1AEyYUWrN9Lnb1mBtUWF8fVick3UZ5/26A8vIywR5
 K+2vUq4vfGNgaCI0bDP+CO43Z+4c1LivjrEV1zweHqPriCfpmpAkMakav2kGeTQM7m5I57meE
 ZI//98fblCbYAPrE68juynDd588hw3TLdj9E8jSd1tW5q7/9ZLWdqHOQpACp+FMCkjV2Sv2hm
 scdUSfgXJLRhMNgW+VRzIAvSQ3lForVQKdXYINRdGEc79zNWabtZ6iidDB4rIyKn9ZDpEV/IG
 PW8hHutX/YO10M7KM7tAit+t86Z+/8J9Y2j2miPd/842zuU5Gf+OPDkJHzaG2zD8S4DgyBL9E
 jwCvUb2c6krlLknzdy4aMQSOW1U5+v8woDwHaEe0jucEM=

> Ensure index in rtl2830_pid_filter
> does not exceed 31 to prevent out-of-bounds access.
=E2=80=A6

Please adjust the word wrapping.
You may occasionally put more than 51 characters into text lines
of such a change description.


=E2=80=A6
> Signed-off-by: Junlin Li <make24@iscas.ac.cn>

I find it interesting that another personal name is presented here.

* How many contributors (besides the names =E2=80=9CHaoxiang Li=E2=80=9D a=
nd =E2=80=9CMa Ke=E2=80=9D)
  are connected with such an email address so far?

* How will requirements be resolved better for the Developer's Certificate=
 of Origin?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.10-rc6#n398


Would you like to omit the text =E2=80=9Cdrivers: =E2=80=9D from the subsy=
stem specification?

Regards,
Markus

