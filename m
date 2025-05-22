Return-Path: <linux-media+bounces-33197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23DCAC13BC
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73A92502587
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F7A1E0DB0;
	Thu, 22 May 2025 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="BoIzuC8V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCE1DF261
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940025; cv=none; b=TnnJv2kRrYdtCFD1wIbc2YcH7aOgpAgcLTl/dpZ2YKYoTGOt4vj8utAay2MrnJ0wlCjIUXnMVxiR4GModjlNt68RVZT18KrRJvXMNUtVfKlMvUYOdcvvjDFmT9GEgKiQ8Y6gpMPJ7S5jspeo0brQJaf+y0L27CrCmAzdReBJgQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940025; c=relaxed/simple;
	bh=Eu2HcWA+aiYLO3NyXIZi/n8WZASZoNLIVISYYmVLfhw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rgClOfPHYejCOR3VYwgenVYOY2J6z6ZwwWBtbtyjHgu3UkfnJ2jijH03qATlWH0pT1Y0hEm12flfJjPCuKd/eoghXiWF6Fgwv2wwFe3wvy475wh1MkQlJ+jMynXnZbQZnXsjNFTpcXnuJw+COSgTFvMw4ZpBMjs1Uvd2xZdwBxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=BoIzuC8V; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c7913bab2cso842781485a.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940022; x=1748544822; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EB9YLdrTTEzpsGMLMd/YlkLlxPbz4lYAAaOaN9yn4eU=;
        b=BoIzuC8VKbkfPfldNunMdqJZelkOPxroIPR9hJJfKDJajYFsUyf0BfFufbO046SzGm
         OhP/pE31v0POwA69mG9rmL+Cfql3ZBKKuHbHWuSz7OsVz3j/uNfdQtskxJ4STDq0bYGr
         Tqpp55vKgw3Ha6Uf+AoMJ81WaB4hUrHn1Lc68t9tPUAnrbLeEzWYaoclI9zQT9aqXjuV
         gKUDKdB99+3gb73bgaS3TbD05Qk1Qowcg5KkTXplCTY0sni8M8pHgkqVqwaK71pRAb7v
         UjvQ0rGcI+edJn40RYz3bEkyk7aJhkAcJxeHGmhljTqsoczqhTKUxnChWQAG+m8RyFOm
         IZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940022; x=1748544822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EB9YLdrTTEzpsGMLMd/YlkLlxPbz4lYAAaOaN9yn4eU=;
        b=S6iBCzAP8rWLDCq33QBxu+U6Wnz0ItVT1E528OYsAbH9Ye6EVkwMgOVo9RtgredUd4
         xdWhRiS3BG+9LdaxRwhAeStWX6BflMQapkfuYZv6fgksegyMIxvngsGT4kCswkHvaFlc
         08fWclnqDMS69VbDxUhpGNtE/LfAWuYM4PevAbTevve1ZyPl3Bm/IpzHbYVgll57OPmF
         ZKTcCs+5TIXGa9Fp7jIR3tMdSaA2sPIkm25/FaS930G8UV6tG4HZocno48VTs2UJ5PsY
         BNV1QpNzVMdUFiFKwHQepEweXNOCSbZWCAeayGYi7/4KvRDeC1D57A1jZR4pncFwL2TN
         Wgjg==
X-Forwarded-Encrypted: i=1; AJvYcCUec6vXoAygvNnC60uKEeKSdgG+olUwEqYwhOj9MoZxcesowXabEVveAcen3VwCokG3ExB43qdPnJL4Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uN/TPRpelrkhy/R1h4ltWZQemP1cHbXGX3dqmE8Z9yv3lMVP
	1PGKYJzpv+d8ms/XB5SMWcMxXaoJWCMtg4fln+jaAy+tnsGlcjV6jUDclzlZEidM6rY=
X-Gm-Gg: ASbGncucLKYtfMysf2KO25SBEuyj/U//X1CFZh+SeiHYXqRXKrxHtplAPR7Hw8Os/tY
	69qbA+b3YUh+ARX7y2NujGYL5lIJfiYq6JONqcRcKShuENCEjL34Wb1s2VtIBh+l2wNH+VeOidX
	Rwx2iBlRZiHYHiJ5g0o6qpuNzQPC7nTSXvKJkuoiDwFW9fuC+avx1bB1kk7S+foEho2pufmQSQz
	uPlFpcpqHYhoTh6+7nDLH7pQ4NSoWl0u3+bRRd1EfY2V6u1RWhZFI0BMfT2vR6edUuJ2TAPh8kB
	UalW82MTm5AKIt5YXLEHv4SJhPa5s4ncl5XDlMGI4yHji3y3sTDibHx/
X-Google-Smtp-Source: AGHT+IH3qyTjY1nSRxUskWCorD7Lljuzn31tpE7McTqghbYGYZzq4YIUZsnhBxuZNoogCdQBXZTN3A==
X-Received: by 2002:a05:620a:d8c:b0:7ca:ca00:735 with SMTP id af79cd13be357-7cd47fc5846mr4211717985a.41.1747940022040;
        Thu, 22 May 2025 11:53:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bc7aesm1063496685a.24.2025.05.22.11.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:53:41 -0700 (PDT)
Message-ID: <1a182116a2e4a9cc18842426db2c3008b6b4d987.camel@ndufresne.ca>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
 to initialize video codec
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Renjiang Han <quic_renjiang@quicinc.com>, Stanimir Varbanov	
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 May 2025 14:53:40 -0400
In-Reply-To: <20241219-add-venus-for-qcs615-v6-4-e9a74d3b003d@quicinc.com>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
	 <20241219-add-venus-for-qcs615-v6-4-e9a74d3b003d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

looks like your patch has been forgotten, hopefully this can be resolved. I=
f
it does not get pick in a week or so, feel free to resend.

Le jeudi 19 d=C3=A9cembre 2024 =C3=A0 11:11 +0530, Renjiang Han a =C3=A9cri=
t=C2=A0:
> Enable the venus node to allow the video codec to start working properly
> by setting its status to "okay".
>=20
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

> ---
> =C2=A0arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/d=
ts/qcom/qcs615-ride.dts
> index a25928933e2b66241258e418c6e5bc36c306101e..de954ede27f0942397d982f9a=
a725e59a8de9657 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -237,6 +237,10 @@ &usb_1_dwc3 {
> =C2=A0	dr_mode =3D "peripheral";
> =C2=A0};
> =C2=A0
> +&venus {
> +	status =3D "okay";
> +};
> +
> =C2=A0&watchdog {
> =C2=A0	clocks =3D <&sleep_clk>;
> =C2=A0};

