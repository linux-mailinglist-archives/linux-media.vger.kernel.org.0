Return-Path: <linux-media+bounces-41281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2371B3A73B
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 19:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76EE3BE104
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 17:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF61335BCE;
	Thu, 28 Aug 2025 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMOeyPGv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925D033470B;
	Thu, 28 Aug 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756400455; cv=none; b=ue18p7frdej2Z9wR1RUDQVxzdBhXTedYQpnG+oylHrOpE9BxMe27Vj40XNmiSTTFlX1PK7SwnhT5efeMLBUZ1poaFw1+99mpGnKi+jW6cN8fNbb5Fj+vhiooCtKLtF6rSsM5or5fQKLX+4lJg0IDCN91Np+nod33CNC9TtkneXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756400455; c=relaxed/simple;
	bh=//O+mO239rbm+LnveaWrTvT/GmXTeux1783FhcLa9ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzXZCtw0cEBspjBy0tXvcXXB5fI0XrwtNer3Sz/2zpD7amBaujTxAfUg445D8YuaOUpurIaqx2gSAknloSH7tuGgIwbv76eDQcpyr+AvhpkVDHF5d5n1wwslxWbXA2szJ6PrBJVAoqS+Ye28+nr+KuuYIU17OGeud6huGHsutfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMOeyPGv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7d485204so4964635e9.0;
        Thu, 28 Aug 2025 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756400452; x=1757005252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHazwvzqQleWI6O1/KTpT1C/C6a9cxsETHfJfO54AA8=;
        b=nMOeyPGvnyNZVVElRV5QxsyYgyJfUsGul5YizIAKxyOojfc4yPo2LCGpmt2/BfULQ5
         GUN+DakmirgNqp66CS08m6gfR+OZfEqhdHV7qWiR+q/76oxp4KIGjBHqkwehRaMu43V0
         cp9E11I4WNbp2ZtcpRqldGZmUqisy6muJRVbSqiUTHqJe6zLIYH6XVmDOfyzt51M736T
         ouuq5rb2zrSuIpZ/0t2z8HKrNh6vRX18loLmmYsJsKu0IknIgldotHo8Fyo8kNa8sAbu
         4Za5gJDSztfOvSigycmfHikY2L+5fIoqLmWADlRGBjLVYqz55jcWXguBqlmgFl/dkBEM
         sHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756400452; x=1757005252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHazwvzqQleWI6O1/KTpT1C/C6a9cxsETHfJfO54AA8=;
        b=drb1gmPvbvBaaCf+FS5XImsSllijzM0/ZoTBBLn0+sZtu2yZexkw86JuvGfG3SR6ky
         bsV0dYpdYMiZMc2EwHvLRPD6sbgkwPZlXC0Hi+GeZnZ0VS0IJO15EYdoNcD84lzJ/L5w
         CoiNX8QSBgY52m0IrHehoUCGaqkGXiBaE92N6fnek61QDYhOCK2GC2mTDjzfA/MreaI+
         PpD3q0w02RiVFh5oV44FIfq/SLDtwAGDtzOAIrdoi3E1PaFUIwX2O3x/B6/HRZQEHCDO
         YC3VaoPadrzpK95+QH9ze9WjiIMAgv+5gxyxa3raQj8/KeB1mOzea+BU5doCcqoD/SOG
         MGRA==
X-Forwarded-Encrypted: i=1; AJvYcCW5b0ftI47O2Xa4UPshcUXYhy+jBxpugeHNPDBE8UKbe0kX7P6VGjMNyqpenFIrWcwLo3YbIOtaK1ef@vger.kernel.org, AJvYcCXV5v61KRDqgsqfWeAqKQ6KmXJTVvEHhRnTCf8qhR4UgFjF+jaormaf2TEDEfSP56PtDz/Wxbi4qXCwQBE=@vger.kernel.org, AJvYcCXXQAT7GGw5RcY+rV7qtcLgT1cLp3Dj/rFWoHu3SpWydxvLV6M05PB3T8RcvRb0+l2QEKzRvsOOE8WIkRyU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4n2gKVnm8XiQHI4QWUEhy9EPtp1/tBPNkAxGDN+zcj3hII9m
	1M7GEbctKgJval+DoGAizWezPV0y3On64064xhUtfpNJUoeXW4fYbp6QAKF96Cysy/F7EAqV5AB
	977ymlTmO2v4mt9kvcIdf2fPouKEf5ToNUw==
X-Gm-Gg: ASbGnctMzEAm2jTqAO9j9YuSsw+W8E4RQAxkI5vpM+W49hNaNLoR5/y8NBt5gz8n8bh
	F0wQcXjTdlW7sW7E6vI3VSbGsvA/BNIZR0bo/J4Pm/7whB9Yp1L04UlPsJoYIRI92ZjxHd3Uwwe
	keAZAoLJ3dsdIoXEWoWrBf4YglszZB6vZhmVm+I2MSCO8uk/SRoOVzqi1Zbvvvc0p3vf/2E9vX+
	ycNlkZm
X-Google-Smtp-Source: AGHT+IHokBvNBbzg8lMe6n4+kF0IcSoZohtx+/w6T1Fm720VTZmzvUQOta1qIavkEDCzL6hndg6mCNLBmIIfvncRSuo=
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id
 5b1f17b1804b1-45b51799428mr195134335e9.7.1756400451883; Thu, 28 Aug 2025
 10:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819120428.83437-1-clamor95@gmail.com> <aLB_7YS9HsfzfadI@kekkonen.localdomain>
In-Reply-To: <aLB_7YS9HsfzfadI@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 Aug 2025 20:00:40 +0300
X-Gm-Features: Ac12FXwaQJQCsuHIAeBGe6_yvEK8W5uLR5UtBdqqwTPmkvqhoOH3VYvUKkJ8RUg
Message-ID: <CAPVz0n0CB6OkKcEuCcR27f-UJiveMPD=1S3rfDkaoJZZQ=7EXw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] media: i2c: add Sony IMX111 CMOS camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 19:1=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslaw,
>
> On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
> > smartphones.
>
> Thanks for the set.
>
> I wonder how would the sensor work with the CCS driver. The register layo=
ut
> appears to be very much aligned with that (I haven't checked whether ther=
e
> are MSRs that depend on the mode).
>

It seems to be compatible, moreover, I have a few modules which should
be compatible as well. If you had not answer I might never found this
driver, maybe you, as its maintainer, could consider adding module
names into compatible with fallback to mipi-ccs? Something like

compatible =3D  "sony,imx111", "mipi-ccs-1.0";

This would allow more people find this driver by grepping their sensor
model through source and reflect hardware installed in the device
better.

> --
> Kind regards,
>
> Sakari Ailus

