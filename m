Return-Path: <linux-media+bounces-41102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA1B3792A
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 06:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED15A364897
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 04:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998A72C3263;
	Wed, 27 Aug 2025 04:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ2WOR/7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FD83BB44;
	Wed, 27 Aug 2025 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756269153; cv=none; b=Jl3X52VDmhOG01Ixnt8oN5R1fjFTATOexUPVE2nvicEWFywEtmwkH4q7IVz86/SQeM4D+hDkzZDvJMpoABy5a4w6oY+ariZdwoi6rL7yD2hLyGxWBCsVHd0lD8u85x0g6YrTcmGviSXYhZYXvYECElf1GH/Lomb2ZVIBt0ZhkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756269153; c=relaxed/simple;
	bh=P9yK6j01vQIjUrDmFztN5hiPanzCry8mwLN54etanfw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HcNSWwAQMOXaF+iL7Gz9RmytdsWODmKUQoHGUifg1/dmrqmbOpPOZvTfA3VQ2yNI/l0EXlDqwXaLkgjELutswarfmOsl2XdASILIBcuCfxA7bZng9C2k03XGJTU7uM12+qteJI6APkAD1ngHiDftj+tAqSbMofPVQg0OhJP0PZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ2WOR/7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61c266e81caso5608219a12.3;
        Tue, 26 Aug 2025 21:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756269150; x=1756873950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nPT7S7ck2OMPXfBxc+RzMc8Kxenf3tVh8lBsVSZT310=;
        b=YZ2WOR/7kAG7rb0/cIiOc5bhpgQaf+JOgI7BQ5zTaO+eVxgh3LNrmiMrSUd7RdvJWC
         xchm22x2ERkHufCg7gsUFNPaj+xliMUXdF08O6OCRu5/VaTdwy7Fguz/4NkDyP0/OeQi
         9cBy1kXu3LuozSe8qBECPAjJpNQNQ7Y9o/rQBLv32xfVgPnUD7KV2I6qQ9CxJNbNnUDB
         ZdCL4ZvRYX+oRkNYMcEziv0p+43+URM7jaCQUFxJyur/Lrex2qkEhcQAIZ+iA3BGbmK6
         NUk5PkD6PyN2OegUYss1b8OHDgsqH3w/tcaaUQJLeI/A6OKk9AdWYaIuqD7FEbf15Pvd
         nTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756269150; x=1756873950;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPT7S7ck2OMPXfBxc+RzMc8Kxenf3tVh8lBsVSZT310=;
        b=Fw/8G295UrQkYYZadPRl8pOVOKf9SPNAlbAyoSKnYnDYn7PNYcusAgCghJ21cWXpZH
         J5FU1Pi4AaK2c+vxZkw4ycH1iKhuy420oBEQYNCz09phjnLzvOIfwXDTYUr/2t2Z310Y
         7C7XcuDyYWlgof8sGbEdLHCiCmFDKTvHwYF1O/zNu9SuDhtgexc+06bD3aJV+1xxw2ua
         38Vh8CLJsoXbP+BbiuyMLjvoTn+cMJgHc80s6St0rikaXbf1wN6++60PwhLD9XLi+1tT
         u6vuwLx4yKMbbNyVZEbyyYLs4dlYvSxWEEObn+QXDJM7WkMKaCJiVFfLsG7YAbJbBoJs
         YaQw==
X-Forwarded-Encrypted: i=1; AJvYcCV5CJ2TwtQQisEfdUbYe/6aSoM3xBca5imh5uzbaGIbHWdHdEt9OPubaP2DW1Gmc3vK/hfTF/ibTPqlnzU=@vger.kernel.org, AJvYcCW0wBj4q5rXthLM7K/wIZ77PGyDW5UcERQ2qctO0hB5uLrhQoBH8q7rZ3INUo6V+S2tQDA8kAOO2ZncFmq8@vger.kernel.org, AJvYcCW8MPtjnSV0fU72OxhcrKiu+eyjINi1KR0mUd7LY/FGo1awyd9HKSydxHmBffnuN46jadSlvuhk7bMJ@vger.kernel.org, AJvYcCX58Uxr/4vLhd4IgJMQ4MeARbWVO01zlOcrBPKPgS4nmIt/Qg+ENeH5EajYHBRBzLC/UT7pNOEpbDWI@vger.kernel.org
X-Gm-Message-State: AOJu0YxS65nbI4jtNQx604vNQ33Ay806ha2Gy39oWNQhNhbBdeHwG2Ms
	BVGz0+kMAXwduhyeU8/abTMm5Wny/XV1Kl197wjngTPHp+lC3dWCsPim
X-Gm-Gg: ASbGnctJGM5qNG2ht99BN7PNsaCvaQqmO5dVMPQ8Q3hVJS5HwHlxEs/gE0YKAswxcrC
	T0YnObEyUqh63mVj9T24lZM9VCtFRRkErh98P0FUxtBMQr4o/uP0d1q7UjwF7Okr4dwGezI79jj
	kj8hLHjSbpdclca6pDsCsUU4IHxpix0MN7w/cTthczzmvZAsUdWzJa/yUcGvLMdsniFR6M23H2H
	taI6Y9tn5mzJ3YGMbXYtc8Y5nTwr1zbs2d0YGC/sDFua+TBJc8v1+wZGXID7cNxx4gqjq5sl2F2
	nQzLSTor2GbZQCmASxq9/Fkgm+P+E/yq5EJuM6DIqnyr0C7f0Ho6AzOFC0vtqDWTnb6t4tinGY3
	/CqP7jFwtpCrnBQ==
X-Google-Smtp-Source: AGHT+IF+5wxPF37wRl5q6Zpcp5YXeXsq5X1FBZFa1yIqF0zMTpeqok9u42a8ivFBmKB0sTZEfjjT5A==
X-Received: by 2002:a05:6402:13d4:b0:61c:4c77:cb8 with SMTP id 4fb4d7f45d1cf-61c4c771153mr10662557a12.15.1756269149569;
        Tue, 26 Aug 2025 21:32:29 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c78e49ca4sm4263216a12.47.2025.08.26.21.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 21:32:29 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:32:27 +0300
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_01/19=5D_clk=3A_tegra=3A_ini?=
 =?US-ASCII?Q?t_CSUS_clock_for_Tegra20_and_Tegra30?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1909286.atdPhlSkOF@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-2-clamor95@gmail.com> <1909286.atdPhlSkOF@senjougahara>
Message-ID: <76B1EB6D-B149-43C2-AA56-A15C9DCCA3AF@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:09:45 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> CSUS clock is required to be enabled on camera device configuration or
>> else camera module refuses to initiate properly=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  drivers/clk/tegra/clk-tegra20=2Ec | 1 +
>>  drivers/clk/tegra/clk-tegra30=2Ec | 1 +
>>  2 files changed, 2 insertions(+)
>>=20
>> diff --git a/drivers/clk/tegra/clk-tegra20=2Ec
>> b/drivers/clk/tegra/clk-tegra20=2Ec index 551ef0cf0c9a=2E=2E42f8150c611=
0 100644
>> --- a/drivers/clk/tegra/clk-tegra20=2Ec
>> +++ b/drivers/clk/tegra/clk-tegra20=2Ec
>> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
>>  	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
>>  	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
>>  	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
>> +	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
>>  	/* must be the last entry */
>>  	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
>>  };
>> diff --git a/drivers/clk/tegra/clk-tegra30=2Ec
>> b/drivers/clk/tegra/clk-tegra30=2Ec index 82a8cb9545eb=2E=2E70e85e2949e=
0 100644
>> --- a/drivers/clk/tegra/clk-tegra30=2Ec
>> +++ b/drivers/clk/tegra/clk-tegra30=2Ec
>> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
>>  	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
>>  	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
>>  	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
>> +	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
>>  	/* must be the last entry */
>>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
>>  };
>
>I looked into what this clock does and it seems to be a gate for the CSUS=
 pin,=20
>which provides an output clock for camera sensors (VI MCLK)=2E Default so=
urce=20
>seems to be PLLC_OUT1=2E It would be good to note that on the commit mess=
age, as=20
>I can't find any documentation about the CSUS clock elsewhere=2E
>
>What is the 6MHz rate based on?
>

6mhz is the statistic value which I was not able to alter while testing=2E=
 I have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6mhz=
=2E

>Since this seems to be a clock consumed by the sensor, it seems to me tha=
t=20
>rather than making it always on, we could point to it in the sensor's dev=
ice=20
>tree entry=2E
>

Sensor device tree uses vi_sensor as clocks source and sensor drivers don'=
t support multiple linked clocks=2E

>Cheers,
>Mikko
>
>
>

