Return-Path: <linux-media+bounces-41099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD9B3791B
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 06:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997A93BE088
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 04:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337B92C033C;
	Wed, 27 Aug 2025 04:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRLLcXC/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E527D274670;
	Wed, 27 Aug 2025 04:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756268911; cv=none; b=I8PIU1jgq+SjDXr8rJK3dVqGWv8ybWF3EzGwxax6g0OGJ2f30f+D4qDil19Bk2dghgp7HVz3LR8kNml1Q40ocqdzY9YGma+3gnqdTwp/gdouQ7/jQb7d3bW//KOQqc50+fQLfmEIYjzmVmMbEtdsjQF19CUxaAkYG/8u1QlfzIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756268911; c=relaxed/simple;
	bh=/X4cG8A8n780jxD0ghQ5x/C/JrFopH/89LH/Zgv8NPo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tC5TowaHA+BF9+FZtGDbZs1bFMdGTkXQA+7Vs49AI8pPMgrSvD6sOQ5ihFcpCw9aRWvsJdYBZ0VzrZvVgyzM8AZu0q0wf59lzJDHlSNVhS4/flblpAoVYLl/j76saXQtewqS97sjW8sfHv/Utlps4FOJVaVGOkKU74Jeczn408o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRLLcXC/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afe84202bb6so348447066b.2;
        Tue, 26 Aug 2025 21:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756268908; x=1756873708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8PzH67qVhc1HJfhL/IUyEczDHRosqco9gYe1CLUj17w=;
        b=gRLLcXC/lZDISdjKytdJgx0GQYWk0DO/2JNSNhSr1AYVE4mHTUhcq9uZ2LWoTS+1xK
         A4tDHwmzi23SDxa5LviDbOxpdxbyJ0UaL2ZMpsyvi3pOFIbUemUm1mLW48AybNbxlBCK
         qjaGavZKv7tpWDxioIa7621VAfYe81J14ypgOVyuZGJo5Qqd5DD+XC/Nr2iQZiRz3lRO
         tTwpTsjIyQTYn0KBWFMVbtmQkUw7GQCaAZ5CY8rY5P4Pbqvt7HHUrkHtg9+1GP89BF9k
         dA3Y7kFsZALaPTG6vJjCQBKfVz8cCXtuS+wRqQvb042+C6xGgkBpTjDt8F+ZwTp7t4VH
         0hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268908; x=1756873708;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PzH67qVhc1HJfhL/IUyEczDHRosqco9gYe1CLUj17w=;
        b=SVTTx1OeJeSkPM9kRCItVFb86/9Qs9UUwA8TGcZMFfvJh45BjMKzqHgV2ZJgZ/gmHc
         zIZ61o/27r4LXIFzz1wsqXLsd7JCBDtwG9bLzbaPGFXildmLcjnRJfvOvcLGeqlFWtpH
         bO4vL0FnonYy+c6zfFH1SbmmyLptL3pMAxUAPWqDjeViStHyyD/aPd3geQ8fZAkKwBaD
         32qlMEhkb7KsOLC8mftRRv/qcg9zhLJjvBq6BWWUN7BEjv1jylH8R6Y2tl7A+7m1ry7j
         v3bh++Md1SudLAf4etoyZvxJCwLIBIK5K9xHTEtKwjKj3GpglRPsZIf2Ut2W2CdiGChW
         YkOw==
X-Forwarded-Encrypted: i=1; AJvYcCVB1sSauB9I1pGOyFrW7ps5IQAZuxNw+SjUBnlxn50ESgdel8Yy6N0grVmc9aAg2qzN8s4GYC6B6XAW/+k=@vger.kernel.org, AJvYcCWubgUt2K1PwWve+vOSgNO6yw75aZNrEXxAYZ5DT7hh1QjO0W6XJOHh/SPqnBLnmV0BL0lQC/YwNwle/W2v@vger.kernel.org, AJvYcCXANa4RTqy6EWIr1FvsHenZdrAN+nJ9L0h7vdi8RGWpXiQMro+ec9sOto5m7H8JxoI7fzAeK+1cWm/Z@vger.kernel.org, AJvYcCXYV3sKMyEJaHioVzeiYJQmRYowcK9GbaG1TOyV2E+Llt9FTkP3X1m2wt+RyvH6eGqJywx/TsOZagKn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37jJRf+8QKlfzFtGwgrUJ5KURf9NRL3Ac7ytnUQjjp07G28EH
	Fczxos8rOOZx5sjNhrZQgJ4D3vkEfu5+G9B7FJsLAo5n060vkUP8X3vf
X-Gm-Gg: ASbGncsFo5loYOOhhlBWfT4jpqllUpP0okALme5blmzBPzwe3H2epOIBt78lLLmYfqH
	kfXRbpou3om09+3BsXKbg7ftbAosQJXQVjY108xyZhiqwFw790Ff5tdHM7wlUvdiZmgWvMJo0uz
	LgTF7BF2bzdYGprEvN+ZROlAt9g4bWVYWyikUieeoySAHlTJ64VDt7qvCypgsWqeIpssfRFM0Ti
	omQLFbvI40970GsJ9XUvocIJtj/jfRC6tjkHK219EGGoykltx0fTJxa37AVSi907XQ1V02acEGJ
	ZsGaQfqV4X5+360mgKkFihEcrC0LejHItfLtFd1rXYZzxQ84fguTqbcI6WgWCXY+DkseSPKox3m
	Y26z8b6wa+sk50KSPkwzzxxYMrcZrPOESHVw=
X-Google-Smtp-Source: AGHT+IExRye3++0RibNpkbuBt9GdpOdlAkhvl85P7LOJTrQQyRm+u65q2iKB4iA790zlmhnpjTVnfg==
X-Received: by 2002:a17:907:3f29:b0:af9:a4de:f092 with SMTP id a640c23a62f3a-afe294c768emr1670874966b.55.1756268907959;
        Tue, 26 Aug 2025 21:28:27 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afec096c7a0sm88309266b.43.2025.08.26.21.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 21:28:27 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:28:26 +0300
From: Svyatoslav <clamor95@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
CC: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_02/19=5D_dt-bindings=3A_cloc?=
 =?US-ASCII?Q?k=3A_tegra20=3A_Add_IDs_for_CSI_PAD_clocks?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2451218.NG923GbCHz@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-3-clamor95@gmail.com> <2451218.NG923GbCHz@senjougahara>
Message-ID: <268A6593-1FAC-4A4D-925A-801FB6FEE9F6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:19:39 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 register=
s=2E
>> Add ids for these clocks=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  include/dt-bindings/clock/tegra30-car=2Eh | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/include/dt-bindings/clock/tegra30-car=2Eh
>> b/include/dt-bindings/clock/tegra30-car=2Eh index f193663e6f28=2E=2E14b=
83e90a0fc
>> 100644
>> --- a/include/dt-bindings/clock/tegra30-car=2Eh
>> +++ b/include/dt-bindings/clock/tegra30-car=2Eh
>> @@ -271,6 +271,8 @@
>>  #define TEGRA30_CLK_AUDIO3_MUX 306
>>  #define TEGRA30_CLK_AUDIO4_MUX 307
>>  #define TEGRA30_CLK_SPDIF_MUX 308
>> -#define TEGRA30_CLK_CLK_MAX 309
>> +#define TEGRA30_CLK_CSIA_PAD 309
>> +#define TEGRA30_CLK_CSIB_PAD 310
>> +#define TEGRA30_CLK_CLK_MAX 311
>>=20
>>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
>
>The commit message refers to tegra20, but contents are tegra30=2E
>

My, bad, it should be tegra30

>Regarding the CLK_MAX define, I agree that it would be better to get rid =
of=20
>it=2E Perhaps you can check if it would be reasonable to calculate it=20
>dynamically in the driver, but a define and sanity check in the driver wo=
uld=20
>work too, I think=2E
>

It is not unreasonable, but moving this elsewhere may cause issues with ad=
ding new clocks=2E Addind new clocks would require updating not only header=
 but also a place where max clocks are moved to and ai am not sure how can =
I dinamically calculate amount of clocks in the driver without updating bot=
h header and driver with each new clock added=2E Maybe you can propose a me=
thod?

>Cheers,
>Mikko
>
>

