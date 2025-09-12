Return-Path: <linux-media+bounces-42431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D0AB5504D
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE0927C0B28
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6371E30F556;
	Fri, 12 Sep 2025 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BypA0bHt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0903093D3
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685819; cv=none; b=fSsQmlIBIITUb/oidRbAWuZ7qSljWPpuXKeIXJyhSw7I9SWYPzOvcNLnr7jkDj6sANqnyg5RktndDkAqJSovfJualX4Z5pnq+4LJ60H0Aa4Aw6lXUYMNt3uwbcrRebqXmTPEpznSENiwc5OsJBdEoZ5CzI0nnozMYu8LLWvmYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685819; c=relaxed/simple;
	bh=I9n2pVmu6LmPD6zvLHRAM5ekmJJV3HNaSaih80Ri9aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StJ5sXjaPzSnHkzB3laN+Uu5t75fe3Cbzm9+XdRvDwuMCqbpwdVDlPYEoyXicBDBBUedQAMUvUNkTn3xoaQraXtye2k22XU5IBEwmS9IxXxV8FdUmaBmsQJVtxlGQoFtyVxuHu+uE7A4I5pCOjtTX7gDhlmH5qNcoP0+xHAnBZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BypA0bHt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso19053655e9.1
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757685816; x=1758290616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/awESVZkJ9K+JfRYd9Rjr/yLS5bHXWrAEyFkBSavtRk=;
        b=BypA0bHtW8dc/9jFOduQ+R25ll0YATGAEaWEVnPnqn7pWbwrmTbEVvtGUj3ynHfroY
         s2PSNRHk2yNthP/TF1iOjTqEwoxDVOAghcPZ3vjw1FWt9hMoAnl+5lfMRMpxuy/EXJWO
         YhdsLY0KSNR626866tS4QUcTkkJpj6xiywYTSX7VZ3jt0VnCFg8U0pjZNhVNiA/8TbTv
         hBAdGcw03C0DJkYipsJsoMP7HjjVbjBQ+g5EXZJHQCu7WYjNpJdTB70hiVt7mW1yrdpd
         7nubU2A9S0bZfSTfEXoDrLOegDyhwcQrhclEMFmg0jvKFJC7OIXm78GDYb1aj/eEzhud
         40Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685816; x=1758290616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/awESVZkJ9K+JfRYd9Rjr/yLS5bHXWrAEyFkBSavtRk=;
        b=XQQLpRMIGZLdA0AyZ5CYGYPA3UyoLn90/prh+Ez3Yn2huI9Ea4lgLw9DMQm3RzUNsL
         OChmryPEpDz1N508S8n8Ep+bVk8YUtvLAxx9TiRn1QIfrHMfJPZxQp94DN8AQv/I+JiF
         4i2BtQB6eNbUGwcypYS9hko6Zl+/ZxoKBUwwgpb2RyCNEytDNwD9LnZQuMwc9yc6ATbR
         aCAJBqiETyfwt9VPNmcUktFnGJyd8PoxLu5U627Txb1j5kfYULBbBzb2ry+akCjoNUcE
         2X4RQ4CCKkEZ7iWznfSWIEwfZQMUbijIZxxctHOi/0sXh1G1rvjJqB8or+cV9le/YMhS
         uirw==
X-Forwarded-Encrypted: i=1; AJvYcCX+MVF5Q5SERBkalUj6yb/bbVTCm0fN65ZoGS4fXBs06sMdTGeLtD8ybynennrVxWBjI0MwFS72VuBmuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6QDrCoQK4hCZ3pbHQQryfdaFqX0rrEkq1jzW8n710DczTIHso
	3+JgSt1J2+IfiIKQkQmaH8CPI9NXyxkAGJkR3J0sJm/6g/Q1p1zTny2l
X-Gm-Gg: ASbGncu1kk1/O+cVkd+90gRLgD/MfLCMuHtBtkjFzcTiVG5N9fCmlr6YbgPCKJvruuF
	f2SE0jOW8cNTOrLZ7AVkg+7Lp076fcTPUbxCfiXaI1N2XIuO8BjX/XHFeUwcxGy1t99bQOxnvvw
	ghodFnRyup2pbLVy/X5d1BD6xmX3JKQcXlMTxdRZMLT/l8B0NWA0dJg7pLBapt4KI7MhyL4b+Z0
	mabXIP73gAcISevdSt05S4z917rS2zz3jNleXG/93qInYQpad0vRf0ivT7MrlxFIsZxNYXivrPT
	9EniU+Eca0Lzd686CyFXKSm+nP/9c0nThy7CJvZpm7YUZivXF6fZTL6+ALeyjtAjKZvCaksLPce
	WNs7yG8RgrBtWfQgHpJo4kT4rOyxnQHGHXcAn6LOG5Q==
X-Google-Smtp-Source: AGHT+IFrFziaROE6t7OvfnHw1fSxmStjyRsw0iDsiUclaiLc+LNP4gi88MN0nbdrnjXQvf8i78gTdw==
X-Received: by 2002:a7b:cd0b:0:b0:45d:dbf4:8880 with SMTP id 5b1f17b1804b1-45f211efda6mr20357825e9.27.1757685815284;
        Fri, 12 Sep 2025 07:03:35 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01832af1sm35682985e9.3.2025.09.12.07.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:03:34 -0700 (PDT)
Message-ID: <0c088460-da7e-4443-92e3-23f160415ce8@gmail.com>
Date: Fri, 12 Sep 2025 14:16:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/38] arm64: dts: mediatek: mt6797: Fix pinctrl node
 names
To: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org,
 daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 olivia.wen@mediatek.com, shane.chien@mediatek.com,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
 airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au,
 jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com,
 chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org,
 conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de,
 arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com,
 mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org,
 eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org,
 fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org,
 linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org,
 krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
 <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/07/2025 12:56, Fei Shao wrote:
> On Thu, Jul 24, 2025 at 5:48 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Change the pinctrl node names to adhere to the binding: the main
>> nodes are now named like "uart0-pins" and the children "pins-bus".
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> 

Applied, thanks

>> ---
>>   arch/arm64/boot/dts/mediatek/mt6797.dtsi | 40 ++++++++++++------------
>>   1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
>> index 0e9d11b4585b..be401617dfd8 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
>> @@ -135,71 +135,71 @@ pio: pinctrl@10005000 {
>>                  gpio-controller;
>>                  #gpio-cells = <2>;
>>
>> -               uart0_pins_a: uart0 {
>> -                       pins0 {
>> +               uart0_pins_a: uart0-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO234__FUNC_UTXD0>,
>>                                           <MT6797_GPIO235__FUNC_URXD0>;
>>                          };
>>                  };
>>
>> -               uart1_pins_a: uart1 {
>> -                       pins1 {
>> +               uart1_pins_a: uart1-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO232__FUNC_URXD1>,
>>                                           <MT6797_GPIO233__FUNC_UTXD1>;
>>                          };
>>                  };
>>
>> -               i2c0_pins_a: i2c0 {
>> -                       pins0 {
>> +               i2c0_pins_a: i2c0-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO37__FUNC_SCL0_0>,
>>                                           <MT6797_GPIO38__FUNC_SDA0_0>;
>>                          };
>>                  };
>>
>> -               i2c1_pins_a: i2c1 {
>> -                       pins1 {
>> +               i2c1_pins_a: i2c1-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO55__FUNC_SCL1_0>,
>>                                           <MT6797_GPIO56__FUNC_SDA1_0>;
>>                          };
>>                  };
>>
>> -               i2c2_pins_a: i2c2 {
>> -                       pins2 {
>> +               i2c2_pins_a: i2c2-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO96__FUNC_SCL2_0>,
>>                                           <MT6797_GPIO95__FUNC_SDA2_0>;
>>                          };
>>                  };
>>
>> -               i2c3_pins_a: i2c3 {
>> -                       pins3 {
>> +               i2c3_pins_a: i2c3-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO75__FUNC_SDA3_0>,
>>                                           <MT6797_GPIO74__FUNC_SCL3_0>;
>>                          };
>>                  };
>>
>> -               i2c4_pins_a: i2c4 {
>> -                       pins4 {
>> +               i2c4_pins_a: i2c4-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO238__FUNC_SDA4_0>,
>>                                           <MT6797_GPIO239__FUNC_SCL4_0>;
>>                          };
>>                  };
>>
>> -               i2c5_pins_a: i2c5 {
>> -                       pins5 {
>> +               i2c5_pins_a: i2c5-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO240__FUNC_SDA5_0>,
>>                                           <MT6797_GPIO241__FUNC_SCL5_0>;
>>                          };
>>                  };
>>
>> -               i2c6_pins_a: i2c6 {
>> -                       pins6 {
>> +               i2c6_pins_a: i2c6-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO152__FUNC_SDA6_0>,
>>                                           <MT6797_GPIO151__FUNC_SCL6_0>;
>>                          };
>>                  };
>>
>> -               i2c7_pins_a: i2c7 {
>> -                       pins7 {
>> +               i2c7_pins_a: i2c7-pins {
>> +                       pins-bus {
>>                                  pinmux = <MT6797_GPIO154__FUNC_SDA7_0>,
>>                                           <MT6797_GPIO153__FUNC_SCL7_0>;
>>                          };
>> --
>> 2.50.1
>>
>>


