Return-Path: <linux-media+bounces-25435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A135A230AB
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 15:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E89C3A6114
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8451E9B12;
	Thu, 30 Jan 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbthnF1L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053C1E5732;
	Thu, 30 Jan 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248868; cv=none; b=gYSou1u83+TpIG6EUDAwMZVwhRdLPNYVvsDOb6Z4CRDzdKWobPfrClt8WthE81kdHKSoVG1Q6r9WkrACA0P4oMLJkQ8zp5vS3jrvDQUU/qPceXiNaad6bJuhG3v4lp69Omy1HJxsiQpNqXCuXuo79vgMiwYmpOEsJ42BGcqMehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248868; c=relaxed/simple;
	bh=ePC6fMP+mBRkjMGGu/8MplwouXSIvjGXh2QC88juEJc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YSKtlNZxCpjzkdFByMgmgv4WcY38cvq2P0PD6LGF1UBpOP/xP5FGtJjwp7SyrAhQl8GuX5WBvwUlHWsZiNbC9XpJJv95sNStiHt69fGynKNoH/h56ThJHqfgIV/gKRJFhvE6TeIZT1F7AVmLowFZxL8mm1oj0YZjnWaYrdPwvb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbthnF1L; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab2e308a99bso160138166b.1;
        Thu, 30 Jan 2025 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248865; x=1738853665; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbp4EtOkuC+0iVMNyfHjqvPw/lKMjNnZSdESNc6UztA=;
        b=FbthnF1LsUW411h9WxtobR5s/W72HYF9CZOx3koegv48amw23E6H8vWMu7FAqR6/e2
         RTfft1d/34MW4JB1MwYaJWIrm0O3DjhUCWMh9ST+vTMf4NqWT5g4NNA0zAtRqrsiuYcu
         tlXkdH2pSOCm+JbRO/LE3kFPyFVYy0kU49wOHduQ9ZdNYjtWoAG5ccEa0XeHf8aCu/J8
         CPLdlutxDG2b6TLUYjeKDn5ceR+o84he0JApwM+Dxmn3AnryEvpU8qSUSGizdue9WJzv
         Ygwxg1ujbjCoZH2xIrMMRhsrsVuN1CecPvCYmv0iimmZdRoaXutzZBVnfwv7vDa7ot67
         zpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248865; x=1738853665;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbp4EtOkuC+0iVMNyfHjqvPw/lKMjNnZSdESNc6UztA=;
        b=abMr/kwLlERf0/Qq+RPggU4b3HRL/tMQtvIkvmKTM3fJx8foB3IB2aovUAv+T01jkI
         ZvxLTDrh5yS/onxWDUYZCWMnu5SVVFqYUIR9xy7PODKFNhaSak2k6xfUur6GB0P9TTxM
         lX8ca3YB4ecN3aE5gGNo3QIp/uOpadJI7hPpq3V0Pse0226UNp4IXlCBTDdq8/sUnV/I
         ObylAHd/cwUeHohtapYMp8f6rxgWOiFXOnXB/L5hURltFp72P1N+DvvrVWTe06nwiIXf
         Mu8a35XV3Yx2dU6JBfsdarU7vn2kcVEJBL8k/jC4f6wH59pSAoT+sq9PqL1oFR92Q/Cr
         HEdA==
X-Forwarded-Encrypted: i=1; AJvYcCVfgfAfARg2qq+oHOU4X/XYoW3DSyoXCpQUmHNO1yaJQHWM7HBcvPQ4ubS066iUCp4NdV9vDYIpjjAo@vger.kernel.org, AJvYcCVqlfc3rAM7aIkmr0Xsq9J9z2mkZztFNyE7/boG/o/3Hdr8f9qCqOisJ4ShbyaziJmYFfr5IvaRwFqNAv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdjWkOmwwHf11yAFzNyYR7YjtJARLbm8rZiQVFsAytjQkPu18e
	3owrZSY9z+vsQAvh9lU0qzcMAE49swwExBzO0ImrSHkAKrXk9p1thbDaXg==
X-Gm-Gg: ASbGnctvZ+/mjASrpJUq5nlGefngWGRgKa+rXr9bdTDicnilAvNGBDP/WWBXoeVU99M
	dI+ApqnekOL9KN10u+0PgzhMOrN/fa6b5g3WIhSZjxI/ar0mqgwyI9axy0ChGhH10DiwngjvjcF
	t/Vm+NX4H5xHOzsOICHLkcba6SyyBTANH109Ryp119bhfO9hLKvZWAaT3gAhgIPCuCv7JfdFW6Y
	9aX97MTq0c34udaWc6pUCq9oWQ513NWs4m/Atzx5mTs3Y6GYUpTt3I1SGYKWgSPoRVG+SR9euR/
	rqYonkhG3RU13LvmF8E6hqhUap32jbn6o0sbSdyJj7w4yErKPS9tbcMmx3c8vR8eRdGqkval
X-Google-Smtp-Source: AGHT+IEscLo+ZglJ4iQ8yhcikhYDyTBbGC16YkQrOwamLjmGj9mpYIbrbWr8u+H0RMfLebwCb6ojRw==
X-Received: by 2002:a17:907:1c13:b0:ab6:8bb8:af2e with SMTP id a640c23a62f3a-ab6e0cc500cmr358429766b.26.1738248864471;
        Thu, 30 Jan 2025 06:54:24 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2fe78sm129297166b.125.2025.01.30.06.54.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:54:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
Date: Thu, 30 Jan 2025 15:54:10 +0100
Cc: linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8B4C7CF-B2C4-48CE-84AD-52DF6002D17B@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <8541055.T7Z3S40VBb@trenzalore>
 <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

Update to my last email:=20

> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 30 sty 2025, o godz. 11:46:
>=20
>=20
> I=E2=80=99m using:
> =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
> =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a
>=20
> I see there is: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu
> Let me update iommu code to above branch and report back here how it =
goes in 3588 and 356x

I updated to =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu and basically i see no change (the same iommu errors on 356x; 3588 =
all clean)  =20

>=20
>=20
>>=20
>> You can also checkout YUView (https://github.com/IENT/YUView) to get=20=

>> information on media files structure, but I have had issues with HEVC =
support=20
>> lately.
>=20
> oh great. will do and report!
>=20

Huh - here in need to switch to Linux as on maxOS i have issue with =
ffmpeg ver. mismatch in YUView
Will report next days=E2=80=A6.
=20

