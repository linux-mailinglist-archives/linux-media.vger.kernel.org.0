Return-Path: <linux-media+bounces-38476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BCB11F98
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 15:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A705A1EE0
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002641D5ADE;
	Fri, 25 Jul 2025 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9ZVuhXb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453722E36EC;
	Fri, 25 Jul 2025 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753451584; cv=none; b=M5aul3SZOHmP1wsX+j+ybB4QQXQhubDIX7I4JidpmU/y/rPXuRKm6nZHdH8y+7mZg87j3RPRCmGhRnKnShIa1DvJK6l1M3L5xsm6lRQrqKubGPqL91Pj6Is14opY6wKDKEOtfWVkiVqsfKLqBK8ICTk32E0MIWzFwMtSR7QLIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753451584; c=relaxed/simple;
	bh=oU729MW8v42O4+DLHvPxdMXGBdD9trCPOhSgmsjK+gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARkGOe/g29fUcex0NHCQrl8YtH+4BzPMwz7i4kTblGOwMYc7N4EhbOmD+LSS0pITHThRPye2kwRlSWpH0sgxQZle3lOVxEklE/Kj+ak03ZXxpqmLkGwjlkIV5WlSxatF4jxP8g+hjaejd+qxO9fU9RgrM6XmwnP3zrXRboK3AVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9ZVuhXb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9CEC4CEFB;
	Fri, 25 Jul 2025 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753451583;
	bh=oU729MW8v42O4+DLHvPxdMXGBdD9trCPOhSgmsjK+gc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b9ZVuhXbGKIHEtNeDQ409+eweWUsMpZy22RxH5IYVSgYVj0smXsczXCUASbR2zcHv
	 3ksOYLU+ClG7dHHSJ+Lt4FE/G7KvwGW0+pfW3u2UR/vDEetuGpKYDRCQ+lLQt4KCpf
	 sK9LLsM232lfRTuEIc4KqR8jtYKmE5vneCGZrXauSdJNasK2ZhoQgsDfQ3HXft6Ldj
	 EtCFba82wPZH9KWTOyHCA4J+0DnyTcHPPnNxE31XaHdXpcxGenB1C3uk02Ip1a0qst
	 CQoISiWdQmhMgYyObVkGbQmHyq/y6IRmfBxZr8XwBKpfXMbb2x+l4rVma25VSgvnh9
	 6afiH1EcbsCaQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae361e8ec32so357980766b.3;
        Fri, 25 Jul 2025 06:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMhMCWujJqn537gnq7cak26omRid2GFleXeDWTWHrunNR3zRE6H178amhSBr5ruMnM2RsckC792NRxzeeM@vger.kernel.org, AJvYcCUgLTvAZtfXHlQViZ2VjpnJPK4/kL5Rmspgiol237/bAubhy3RKi1OsW/zgcIH2a2Vh3dICiFnh6XfxJ11eEQJFkQ==@vger.kernel.org, AJvYcCVI45Cg8lw078u8p9MvKEzQTG7EyeUaxae8phMzKVK19GtcpPYJhMd0583w13zuysf1v6+3EYxl++2p@vger.kernel.org, AJvYcCWOH0KzHFFwtgin4FH0SONM+Ch1J7EWm0YmelhuFXqu2jgako29e1N5Rt97Xtm5ahVNpHnIzGCk42Y7ZVk=@vger.kernel.org, AJvYcCWmBlzJYZ3rkinc+3oCR5Kq7D8fslcaI5dXAu2KwffMw3iwIwUA8JXvAFP2nIc0mwRnVfB+yfAeGZsu1vfw@vger.kernel.org, AJvYcCWtcyGMVEWOCTA4Irv5zy+L0CMJUUtuZSzSVGDaVPFwDh7yUpHXN4PqvxEgzLU5WOlYPgxG423ZHUYmCGk=@vger.kernel.org, AJvYcCXdzMcXc/sFr6/dnQ/Eu6iJgvMgTt4ebrM0bqC6UqJfMWAujjArUjSEdyh9vs7RT2bbJ1v8kb8qkls2Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XhWrW65cPhv8grzlW2yx+k7Q7tzqpGPcVE9rnW/4A0X3Xq7j
	aIWM+rSiYcFgqBAI79BwoC/yu0476cqnbHEpgEfUVeZIoBhVh+9VjfsU1kSedAhh16jsa+nlRIN
	/eDT0KxGsg3qb6ACh5OgvOWLIXNeBXg==
X-Google-Smtp-Source: AGHT+IGMwaL+rmBfPzDJz4oey1pCXFPHKKw91Bot2wKSkFx4bXMvOHLEpxJUfZntcXB0BI+C/DLMALjqO45Bu9z0YRA=
X-Received: by 2002:a17:907:6d0b:b0:ae3:5da3:1a23 with SMTP id
 a640c23a62f3a-af61750a50dmr235368466b.21.1753451582011; Fri, 25 Jul 2025
 06:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Jul 2025 08:52:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGNdp3Z0sXaEXWY8nqXD+0kSCo+BYCkcGstE7zcVVcXw@mail.gmail.com>
X-Gm-Features: Ac12FXwKwOUzIhM63V196in4PCS6Bf2k_E9MkYLnnuY9m0IymXlzSXNHAMKf4rk
Message-ID: <CAL_JsqJGNdp3Z0sXaEXWY8nqXD+0kSCo+BYCkcGstE7zcVVcXw@mail.gmail.com>
Subject: Re: [PATCH 00/38] MediaTek devicetree/bindings warnings sanitization
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jassisinghbrar@gmail.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org, 
	kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org, 
	lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org, 
	mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com, 
	houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com, 
	andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, 
	shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com, 
	eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com, 
	jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org, 
	fparent@baylibre.com, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:39=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> As Rob pointed out, MediaTek devicetrees are *poor* in the dtbs_check
> tests, and got an infinite load of warnings.
>
> This series starts attacking this situation.
>
> I didn't really count how many warnings I have resolved - it's a lot
> of them anyway - and I think that this is a good start in any case.

40 out of 125 (on arm64) fixed! Thanks! FYI, here's the ones that
remain (first number is number of times the warning occurs):

     29 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any
of the regexes: '^pinctrl-[0-9]+$'
     29 failed to match any schema with compatible:
['mediatek,mt8183-audiosys', 'syscon']
     29 failed to match any schema with compatible: ['mediatek,mt8183-audio=
']
     27 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match
any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
     22 (mediatek,mt6359): '#sound-dai-cells' does not match any of
the regexes: '^pinctrl-[0-9]+$'
     14 failed to match any schema with compatible:
['mediatek,mt8183_mt6358_ts3a227_max98357']
     12 (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a
required property
     12 failed to match any schema with compatible: ['mediatek,mt8173-mdp-r=
sz']
      9 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0],
[0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too
long
      8 failed to match any schema with compatible: ['mediatek,mt8173-mdp-w=
rot']
      8 failed to match any schema with compatible:
['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
      6 failed to match any schema with compatible:
['mediatek,mt8183_da7219_rt1015p']
      5 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4],
[0, 198, 4], [0, 199, 4]] is too short
      5 failed to match any schema with compatible:
['mediatek,mt8183_mt6358_ts3a227_rt1015p']
      4 (mediatek,mt8173-mmsys): 'assigned-clock-rates',
'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
      4 (mediatek,mt8173-disp-ufoe): 'mediatek,gce-client-reg' does
not match any of the regexes: '^pinctrl-[0-9]+$'
      4 (mediatek,mt8173-disp-od): 'mediatek,gce-client-reg' does not
match any of the regexes: '^pinctrl-[0-9]+$'
      4 (mediatek,mt6360): #interrupt-cells: 1 was expected
      4 failed to match any schema with compatible: ['mediatek,mt8173-vpu']
      4 failed to match any schema with compatible: ['mediatek,mt8173-mdp-w=
dma']
      4 failed to match any schema with compatible: ['mediatek,mt8173-mdp-r=
dma']
      4 failed to match any schema with compatible: ['mediatek,mt7622-pcie'=
]
      3 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any
of the regexes: '^pinctrl-[0-9]+$'
      3 (mediatek,mt8173-thermal): Unevaluated properties are not
allowed ('bank0-supply', 'bank1-supply' were unexpected)
      3 (mediatek,mt8173-pinctrl): 'gpio-line-names' does not match
any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
      3 (mediatek,mt8173-dsi): Unevaluated properties are not allowed
('ports' was unexpected)
      3 (mediatek,mt8173-dsi): ports: 'port@1' is a required property
      3 (mediatek,mt8173-dsi): ports: 'port@0' is a required property
      3 failed to match any schema with compatible: ['mediatek,mt8173-rt565=
0']
      2 (mediatek,mt8192_mt6359_rt1015p_rt5682): 'model' is a required prop=
erty
      2 (mediatek,mt8192-i2c): Unevaluated properties are not allowed
('clock-stretch-ns' was unexpected)
      2 (mediatek,mt8186-spmi): Unevaluated properties are not allowed
('interrupts' was unexpected)
      2 (mediatek,mt7986-tphy): usb-phy@700:reg: [[0, 1792], [0,
2304]] is too long
      2 (mediatek,mt7622-pwrap): 'regulators' does not match any of
the regexes: '^pinctrl-[0-9]+$'
      2 (mediatek,mt7622-pciesys): compatible: 'oneOf' conditional
failed, one must be fixed:
      2 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is
a required property
      2 (mediatek,mt7622-audsys): audio-controller:clock-names:
['infra_sys_audio_clk', 'top_audio_mux1_sel
', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp',
'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_
src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div',
'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', '
i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck',
'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_c
k', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck',
'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_
out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd',
'audio_a1sys_pd', 'audio_a2sys_pd'] is too sh
ort
      2 (mediatek,mt7622-audio): 'power-domains' is a required property
      2 (mediatek,mt7622-audio): clock-names: ['infra_sys_audio_clk',
'top_audio_mux1_sel', 'top_audio_mux2
_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel',
'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_sr
c_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div',
'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2
s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck',
'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck'
, 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck',
'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_ou
t_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd',
'audio_a2sys_pd'] is too short
      2 (mediatek,mt6795-mmsys): 'assigned-clock-rates',
'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
      2 (mediatek,mt6795-mmc): Unevaluated properties are not allowed
('pinctrl-names' was unexpected)
      2 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
      2 (mediatek,mt6795-mmc): 'pinctrl-1' is a required property
      2 (mediatek,mt6795-disp-ufoe): 'mediatek,gce-client-reg' does
not match any of the regexes: '^pinctrl-[0-9]+$'
      2 (mediatek,mt6795-disp-od): 'mediatek,gce-client-reg' does not
match any of the regexes: '^pinctrl-[0-9]+$'
      2 failed to match any schema with compatible:
['mediatek,mt8183_da7219_max98357']
      2 failed to match any schema with compatible:
['mediatek,mt7622-scpsys', 'syscon']
      2 failed to match any schema with compatible: ['mediatek,mt6797-scpsy=
s']
      2 failed to match any schema with compatible:
['mediatek,mt6380-regulator']
      2 failed to match any schema with compatible: ['mediatek,mt2712-pcie'=
]
      1 (mediatek,mt8516-topckgen): compatible: 'oneOf' conditional
failed, one must be fixed:
      1 (mediatek,mt8516-apmixedsys): compatible: 'oneOf' conditional
failed, one must be fixed:
      1 (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a
required property
      1 (mediatek,mt8186-cci): 'proc-supply' is a required property
      1 (mediatek,mt8183-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3',
'i2c4', 'i2c5', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'pwm1',
'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the
regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
      1 (mediatek,mt8183-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3',
'i2c4', 'i2c5', 'i2c6', 'keyboard' do not match any of the regexes:
'-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
      1 (mediatek,mt8183-pinctrl): bt-pins-wakeup: 'piins-bt-wakeup'
does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
      1 (mediatek,mt8173-pwrap): 'power-domains' does not match any of
the regexes: '^pinctrl-[0-9]+$'
      1 (mediatek,mt7622-pinctrl): 'asm-sel-hog' does not match any of
the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
      1 (mediatek,mt7622-audsys): audio-controller:clocks: [[2, 2],
[18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18,
91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18,
104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38,
4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40],
[38, 0], [38, 46], [38, 17], [38, 18]] is too short
      1 (mediatek,mt7622-audsys): audio-controller:clocks: [[2, 2],
[18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18,
91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18,
104], [18, 105], [18, 106], [37, 8], [37, 9], [37, 10], [37, 11], [37,
4], [37, 5], [37, 6], [37, 7], [37, 14], [37, 15], [37, 39], [37, 40],
[37, 0], [37, 46], [37, 17], [37, 18]] is too short
      1 (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81],
[18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18,
95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105],
[18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5],
[38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0],
[38, 46], [38, 17], [38, 18]] is too short
      1 (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81],
[18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18,
95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105],
[18, 106], [37, 8], [37, 9], [37, 10], [37, 11], [37, 4], [37, 5],
[37, 6], [37, 7], [37, 14], [37, 15], [37, 39], [37, 40], [37, 0],
[37, 46], [37, 17], [37, 18]] is too short
      1 (mediatek,mt7531): 'interrupts' is a dependency of
'interrupt-controller'
      1 (mediatek,mt6357): 'adc' does not match any of the regexes:
'^pinctrl-[0-9]+$'
      1 (mediatek,mt6331): regulators:compatible: 'oneOf' conditional
failed, one must be fixed:
      1 (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of
the regexes: '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$',
'^ldo-(avdd32aud|vauxa32)$',
'^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$',
'^ldo-vcam(a|af|d|io)$', '^ldo-vgp[1234]$', '^ldo-vtcxo[12]$',
'^pinctrl-[0-9]+$'
      1 (mediatek,mt6331-regulator): ldo-vcamio:regulator-name:0:
'vcam_io' does not match '^vcam(a|_af|d|io)$'
      1 (mediatek,mt6331): 'mt6332-led' does not match any of the
regexes: '^pinctrl-[0-9]+$'
      1 failed to match any schema with compatible:
['mediatek,mt6779-audio', 'syscon']
      1 failed to match any schema with compatible:
['mediatek,mt2712-scpsys', 'syscon']

