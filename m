Return-Path: <linux-media+bounces-39052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B65B1D897
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC893B97FC
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B48725A2DA;
	Thu,  7 Aug 2025 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="A3HO4KpX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1193A258CD0
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754572111; cv=none; b=Whakbs4pKbSZXr8Wdc1hR4A5MDoDZGfbyCumYzihu82OW1WS1jzw1mhbF//bIb5wGXT4kHKfhfnxguWX7GBWftJ7SbtXByql9J9UaXY9HA2P7ZpPzNjsCAriczIoIPZgU64GyhlNkbgbTmbAq6Rj9NSnK/t2YwKGgrdpBPiTVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754572111; c=relaxed/simple;
	bh=8w8yPFnkgU36+XtrdOCZHK/xGSd3mLnvZaUMM/N9K/M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUQ2HKJ79LhXfi1M+xFAVjD2scvHtyIMs5fKtomQuVEjm9+OrFT2Uu02ERftjMVJ56bpkK0mZrP9BqD9QVuCJIE/c5Ng7LPl1Y32P7bTw4nPQs6WJ9GUU806j0khIebhHM1GZkHezO9Zhjwd+2JgOXG+FN4p4RrWH8jaeES+Noo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=A3HO4KpX; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70875cc3423so10593176d6.0
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1754572109; x=1755176909; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8w8yPFnkgU36+XtrdOCZHK/xGSd3mLnvZaUMM/N9K/M=;
        b=A3HO4KpXG1hAU2Fo7qsMEO7U1EB3t/aUL9HDNyQSWm8tsP2ziMgXb0pa1v5duMcVUl
         XRjXPWzCJu+Hpw7RJJm4i26UfCpYee4mX1wjSoYhBF7pQKeHNRBXmXz1FG+68Ws2jI6N
         h86LhIjTRA8G2XO3ZpxXHQ6YW+86+dpT3ayF/drRLDdXdM30OvBGVqUSo+xYKmgAh8H9
         VojRWzYAlCNx4ezs2SZt/RMTlH1bd7/F9DBn9XxGfHUsTiqVYs0DrmCnfKr9Fmx5Qxk/
         U/QUpf6myfKoK1jjrzIDjitXN4VF/pEliDARZYGvCYzOpetulR19/Br4N5LMKm6omksg
         jLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754572109; x=1755176909;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w8yPFnkgU36+XtrdOCZHK/xGSd3mLnvZaUMM/N9K/M=;
        b=wjTQ2QQrItvQRpxKbrpT0NA9xDev/0HYUt+HBEFQlfq1dJOS8BUjrk7psE0dJ1Rfsc
         rumGHISixQHD3sXaFrjsWzMuiJjyLlkcruhp/h4JhAy3QB/sNN/azDrRmVSjphnDUCrO
         WA4B+I7yO0R2yChAgPHr4MOxN5Sqgw3BexTyYR4WrxI2ESb50zPfPrJXy8DIHLO8RYps
         rKwsS55dAMqjaw1bY7Pwyes1QdXb9lESDhMYEULIFZzteugt9cEhmV9+FbFRcwwzkLvF
         tM4rxRv/JLMzjiCDHOI48H9Jjo0Y3LYn2RJucxn99r2DLVsiEKkKqgHkkEaf5fN5Rx1U
         FHgw==
X-Forwarded-Encrypted: i=1; AJvYcCXuHWRQMoIHzXIfJA9zU3eA4jK2yhQDitA98YveZPhQGoYJxz8n4YWfFk40d+FeqKnqBQjlpXVrI55H5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1eIYrnhgB+fTRElxy/Iq5HfDQIRVIQtQUUwiKNo/wGvyIVsA0
	cTcWRGxGfsgkG07JBvGZp/3fNnDHCoF6+Msojj41gxeUulOmryqrLXfmTgOHL8YxdEA=
X-Gm-Gg: ASbGnctofHmCBNZGq8gt4aF8QzzyDSl4tAGdmlYrEDTXGYuw3cLRuxG9LDroILSp4D3
	S4RyrPH9NZ/UTz+a1wPvQdCK4ZiPYNxyUfFI4yzGHCDLfJc2l9DlzM0nYVd+6TgVw2SXZ+lryZv
	f8pbiZUD/N1sBsjFJWWFTUX6dYzHj4m2fZZtDeXlRhbfBpiolCtxE/FqJZB0PNjrKsPqnkvIrvP
	kNFukX1ctbZu9Xhb9mYpCEBfToULUdGZxUV+XRLtua9nyzMA1FarZ2aVBOEkP9FrDNCnDqTlGjC
	TdfXM5hJaaJU3VE/1vQpaitZUZ1i++wPygvdUQ+wY2j3cuwYasRC8KwpSYe4rr/YuW+mED9IRO8
	d21Vq5h7tPKYNk5PcI63pYHrqTJQ=
X-Google-Smtp-Source: AGHT+IH6e08dKUtjiZTNdxPWxqnHGFaNEPekKg/nzHQYuJs3fq2137smmdHiE6UIgf3GqH/z8l6Law==
X-Received: by 2002:ad4:5fcd:0:b0:707:24af:a738 with SMTP id 6a1803df08f44-709893c6f3cmr51967096d6.16.1754572108574;
        Thu, 07 Aug 2025 06:08:28 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ca073f9sm97547666d6.20.2025.08.07.06.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 06:08:27 -0700 (PDT)
Message-ID: <c22e2fdb669f0f1558c74d446a98c755fae1bf03.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 1/3] media: v4l2-core: Add support for video device
 state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Heiko Stuebner <heiko@sntech.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Dafna Hirschfeld
 <dafna@fastmail.com>, linux-media@vger.kernel.org
Date: Thu, 07 Aug 2025 09:08:26 -0400
In-Reply-To: <175454978334.269012.560122713345103297@freya>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
	 <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com>
	 <3yifjhhqjrryg2fnfep6yqpxlvc3y5drh54smwajptfzy75tuu@dfsl6g5ktxbw>
	 <175227804873.3930831.3557651361410884449@freya>
	 <20250714171632.GA13846@pendragon.ideasonboard.com>
	 <175454978334.269012.560122713345103297@freya>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x6Vzp6vEe7h3PIVIrH8n"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-x6Vzp6vEe7h3PIVIrH8n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jai,

Le jeudi 07 ao=C3=BBt 2025 =C3=A0 12:26 +0530, Jai Luthra a =C3=A9crit=C2=
=A0:
> Quite a few of those are VBI or test drivers. But some relevant cases are
> encoders/decoders or ISP drivers that may allow changing resolution or
> format mid stream.

I checked up a subset of the reported codec, and they pretty much all seem =
false
positive. They simply use a different state to fixate the format at a certa=
in
point in time. Sateful decoder do that once the stream header have been
received, and most of them don't allow any change of capture queues.

That being said, we don't want to return EBUSY while streaming on stateless
decoders. Hantro supports changing resolution without flushing the referenc=
e
frames (heteronegeous reference frame, used in VP9 and AV1).

Nicolas

--=-x6Vzp6vEe7h3PIVIrH8n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaJSlSgAKCRDZQZRRKWBy
9LxtAQCsJaf9gyTaskKM6yASMIlAAKmeJzE7ucVF+kR/cJ/kuAEAqutw8SQDQbto
hhh5eHHRN0lKBF311OOuKmeBnenMXwA=
=OIWq
-----END PGP SIGNATURE-----

--=-x6Vzp6vEe7h3PIVIrH8n--

