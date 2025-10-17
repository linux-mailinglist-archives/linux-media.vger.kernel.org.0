Return-Path: <linux-media+bounces-44918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B19DBE93AA
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 16:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15BED4FEFBD
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 14:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB49E3396F3;
	Fri, 17 Oct 2025 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="D/qU9q5w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD232C928
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760711775; cv=none; b=TW8r4ZjrMjnb7XhuIFBIf1CASbrWYFLD+T4rsLLJrIyiZRiUsi3rfKW6oBzctPJtAtRBaTuV76NfU4MCZ/uJhlJyqh14lU4Xq7Mai44btDKoSbydT+Fyf6B8MyN4vDf4fuuA0kDJLRcGWp7YBBzqRjgMnH0vkioFdQPAbiR3Pgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760711775; c=relaxed/simple;
	bh=TvfE3jIufmn7EKFPgqdSlHbomRAbci7T8yCTwdTDcAg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gqBq9WtYNgGZYOR4GdVa7i+i3vnLiN7Jg2wz9khGW/gr4p/WYRWIUyw2WVoQIfPBFYioVZRYNA42fXEwvtBMHqCmYh6lXwdaXU8ganmpofpgLZPRokLSE9V5h6HOHrAZfQvrBIGveJWoxNfML+B8y8rzVrKwioZJoAW/O9M1/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=D/qU9q5w; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-891667bcd82so58261985a.1
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1760711771; x=1761316571; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TvfE3jIufmn7EKFPgqdSlHbomRAbci7T8yCTwdTDcAg=;
        b=D/qU9q5w8CUgxP4UEk6nrfO197jYA3ehG1FIrGwxd3872m6fDBXzNwdCraNrGBSPI3
         VU+f0huvQThD9aXod6O8JwHngfIDdZ0EUr23b0+9ohjHR5mDzf7Hp94zINvyT5A4ipTm
         0wGxNevZOuPzY/jiD2qGMSOSaJSvyvqQLi1JjOo4xheci4HYQ6tkgOpSaIOQ91S+gh+2
         LWSK4nlDZJv5TzxAtzJ9E5wB/EtHEzi3cflHVkCLoSnMoIN0gtLgrUL5EqoE9GaFhzsr
         066y4gtayV81KAu2bnQa/WlxAFDFrpMg+lvTLO0NSnB8xNv65fS8kSRsN6O+xAAX51qc
         nrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760711771; x=1761316571;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvfE3jIufmn7EKFPgqdSlHbomRAbci7T8yCTwdTDcAg=;
        b=LCcJpI2B0XbiDy3Gy9U4FSYQqgskfBJGgeTjvw80/vcBl0Kzh9M9T1JWjTiak/k8Ij
         5J/A77kUAebzy/Bj+WbFgYIKn5lZ8Xy1KGP0Yzd5Eem16VFAMMBm/MSDPX02Vn6qMPkO
         F3Zby6UjTbRGN+fXQ2M2OA48m9uUCfIkUMrHuvf2CgbyD/ollMNmyvCc4kW3aWN0XUqp
         hSII0r5T2Z1nY9e7FSkUEv84WxnopD5C8oR6kjkmOD1UvvpAfznFh7dniNslSKocI9+c
         4i6dF3PL5Q1aRAdKltVZlA6xY9nWdjGXdsJj/bmy40UZfb5/fBE0ogUSTYbeModAXmGJ
         qF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7jY/zqvHe45N+gcV8vO5LN60jHazCs2ad4MldWyO7PsjpGmryLu8+WU05GiedZy6ySOutVb7C/Ptrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz027vKX5MRUtGzOYQDPpZ7hlulddMlTBybQlgBXyETuuBecgtt
	tkj9s2fvxHdDQCUmoT/FWQeeGfeu8fmyBKlcja4prXQ5g49hD9IHlDH1r7xhCxY7HL+F8WwACfp
	5PBSl
X-Gm-Gg: ASbGncuAO2lSSPiSkS0/JnjwIL6kZA8eNYpj9RhwKPNiiWyn3iwhotxihLjbUzpOGvS
	6ytXrzP+pX1KfFpzWQ5YCqPK36OTWy29QJ8g3F5Rea9P7rwgwsyk9bhBvUNqjCaPejgvwHaG1fr
	lVKgRdzoklO7B5EvhUIikXBblYRwIf4HBVv3lLZc2ij9S5crTySzivj2WzPvZnzkjjArC0pE0qa
	o//1ck0HaExM052lUGIduCfGuzXn5HJMKf9n+uLvD4XTWFy9xMeijNAz8sqxvjOQFaV5p7K99y9
	HW9BXvL5gdVxXN/P8KaMZULYtkv49PWGdvSwTgt7jpzL4TiCdD2RRpEhUSh49NpPkHVT8GxMrAX
	tag3CWR7glhb2jQevkXkD2vg0udc8DLABFPsORByhvgmo354dZ8akXqUZ2q+UVVeDJqzTWE2HaR
	NRIybSJkY+K2dBVjx8
X-Google-Smtp-Source: AGHT+IHi/mFj4rQowrhpz1pz3z8NarVLI7Dlm9kFP0p+CIVB1xwRK+F//hOQ051257IZW6rlPkbzfw==
X-Received: by 2002:a05:620a:7113:b0:87d:9a55:7566 with SMTP id af79cd13be357-88f10d7c9a9mr1209741485a.28.1760711771181;
        Fri, 17 Oct 2025 07:36:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f35c65b58sm450649585a.24.2025.10.17.07.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:36:10 -0700 (PDT)
Message-ID: <579c8667827cb1ac5778b48077f4f84e875b69da.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/8] media: iris: add support for video codecs on
 Qcom kaanapali platform
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Dmitry
 Baryshkov	 <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vishnu Reddy
	 <quic_bvisredd@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Oct 2025 10:36:08 -0400
In-Reply-To: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-t4DPcDu1lQ31oMUQcqQn"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-t4DPcDu1lQ31oMUQcqQn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vikash,

Le vendredi 17 octobre 2025 =C3=A0 19:46 +0530, Vikash Garodia a
> [=C2=A0 350.438406] qcom-iris 2000000.video-codec: invalid plane
> [=C2=A0 350.447079] qcom-iris 2000000.video-codec: invalid plane
> [=C2=A0 350.458821] qcom-iris 2000000.video-codec: invalid plane
> [=C2=A0 350.465860] qcom-iris 2000000.video-codec: invalid plane

Just a highlight, the driver should only print stuff on default log level i=
f
something is malfunctioning. uAPI miss-use should only be trace on loglevel
manually enabled by the developers. Mind fixing this up while at it ? Hopef=
ully
this will be obvious to you next time you encounter it.

Nicolas

--=-t4DPcDu1lQ31oMUQcqQn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPJUWAAKCRDZQZRRKWBy
9KzlAQDdDixE+QpSwmBHXNI30CUJthgEf/U+j0OzH6rs/h816wEAmctKiaWyNDSL
20vzRt5oLgTPjX8nYcQyvtRFzq1KDA0=
=zgKR
-----END PGP SIGNATURE-----

--=-t4DPcDu1lQ31oMUQcqQn--

