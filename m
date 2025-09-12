Return-Path: <linux-media+bounces-42448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EEBB5512C
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C6B1CC12A8
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255B4314B61;
	Fri, 12 Sep 2025 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhVKhYi/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782BF314A8A
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686911; cv=none; b=EL1JZjTPwfuqKy2QSz3fin4mt1aH3nyGjrpr+bMxEdFmc8g0Oqa+QzAsnzUIXWGFJahJanFDyZlqpsqNJRuyft7VsEzTWPewxc2UFGR/fock3M3gtu5bXza1TIA/l/7eiOhETHHWXYQC8GqY78hIuR+VaaZ/k1i1+/x3FwUXoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686911; c=relaxed/simple;
	bh=NtRDNbeLjTDC3CT97h+W4zsYhcQLmQ6/UM0W+/QIo0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCMud3jJ/XG8TQB7nMxYG43YRdUWy31EIM6WR6RwqGQmpehDIc3rWrkeyKrVAhQ67LgCOxBzshjIF4RbSJaAbwHJx5bMUMQHC94Uz1euVARJWOuVYlWjtCM1WdoalslXfBQeKXsxkE025WpOoJuYrlJ6AzDKhxIhyyN4SgfQfmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhVKhYi/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3dae49b117bso1580809f8f.1
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686908; x=1758291708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+KppJeNuL2l4XFhCz5C6gp2p8nOC2OrHHCEgzAlkaVM=;
        b=VhVKhYi/oNpBr7JueSqgxrr03TywBb5Wi6iz9qHsR62vZUKwPXu2t2oBcB/QIyDUZ+
         zNWslDBUMdBbkq+H5YA6msU/QBCY1eG8FRHDiKYPNgI3+/IavuAz55c/XlU9QfgTdTrM
         aQqUyqXd072ENnXvYDxK+NgtESP8Zy8IkUgo6t6xig2NOGaEmCAneNhj8wcwZPwQ1doM
         itm2rchKJsZZY7plC9YQYcIr8E6ir5UhdTfk1b8czbL8s6c/A3+qk8yFc6YBetnvLgAr
         OcaU52Bqn1C401FHdDYcYkMCtd91eRPApIXLtatTbIR2JIQ5KjA9evxFnUJ3Vav3+/hk
         jvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686908; x=1758291708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KppJeNuL2l4XFhCz5C6gp2p8nOC2OrHHCEgzAlkaVM=;
        b=avwBNoTODOZXop6cRodcaISBFa8Gffy0FaU1slMzAhIqZluzlxaT7QMcsxyIcyUJ5b
         aqc+xYWaCbJR4dpOJW8QDCkn5Q3qKLCvRXTrFVBiJjJirBwYCDfY0L1FRtlqh9XEt1O8
         TPvJRQ4KorYN8SiaiVy1c0trvVUta7/g1W4aYC2X3/XFWe881HdqaUZSS3IafJ0m6q1D
         6w1e5zePFCl4DszcdHriDl/tphqD8cNmfhy8rwu9O/FCmmjHt6R3ZvUIkNpzmjlUxgff
         ZkkqIu6Dd8V2N4Xm+K4uMXImvqRfrtLe3Gn1y9gvry6B/PlQAWlXIg80Lakiwjns6e/O
         4dKA==
X-Forwarded-Encrypted: i=1; AJvYcCWRHuDonvBoJVa0rs8EX5n6hKjzB76E75lDkLHQ1RO9PNJ+F9fheVND8ya9fLRYLzROlymqYXyqLo9lzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KUVZCl9UuMxEbI+xmUBrXrZLxxZ4tZZvqDh238zdWx6n5RR2
	Hsdhjtuh1QZ/K5vGWaVbZbz/W+G85G1YSVT+xtmS9tWryH7RdcfYEChE
X-Gm-Gg: ASbGncuurZ033wiMjaelJK3jXaAotucoMx1011oaNlxgLHAmE5wQ0CrZacZCViwH8mq
	fwneAHpxl6s2ad73uuZ7VRxxxPVvRkB9RA9X6gqGWkbgxvbSu+uq87cVBgwj/MGeI17V+mikvzy
	w4PVwWB9wICKUqVrfePqeg97M46GNgOOvOMe2qBr7MmaLeS3xdlY7kngjjP9EuFDJ7/DUZN08vO
	hCF2A+NrKsmxTsK+FrkYresbxuz0SfiHr3mkv3a83L5yHv7KzGkhkbvOzF4aRAcNBaQCNg9guXW
	3ss3RMP7dyx0TjlCs9JvVm75bx8S2zZr6hpHa7Pi6fc/d77LChpHQBIvsxkbQLadznSJXd4Zv8T
	XpbVUCr4CKFfrhOklCQ/Zoezjpso3QACgM/Iwttc2vg==
X-Google-Smtp-Source: AGHT+IHK+0hgrlM5khWk8t6nwTLMx7U+gfNVKxXIvA5zlpQsQiXJ7qzJDVelD4juWa0MBJUTJJKGyg==
X-Received: by 2002:a05:6000:2910:b0:3e5:47a9:1c97 with SMTP id ffacd0b85a97d-3e7659fca68mr3020779f8f.43.1757686907585;
        Fri, 12 Sep 2025 07:21:47 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607878c9sm6750010f8f.26.2025.09.12.07.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:21:46 -0700 (PDT)
Message-ID: <8550b468-dca5-47f3-a608-a9b4b134131c@gmail.com>
Date: Fri, 12 Sep 2025 16:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel
 node to machine dtsis
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
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
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> Not all of the kukui machines have got a real DSI panel, infact,
> some of those have got a DSI to eDP bridge instead: this means
> that the address and size cells are necessary in the first case
> but unnecessary in the latter.
> 
> Instead of adding a bunch of /delete-node/ which would impact on
> human readability, move the entire panel node declaration to each
> of the relevant Kukui machine dtsi: even though this introduces
> some duplication, the advantages in readability surclass that.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
>   .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
>   .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
>   5 files changed, 83 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index f2afca63c75a..1b74ec171c10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
>   	};
>   };
>   
> -&dsi0 {
> -	status = "okay";
> -	/delete-node/panel@0;
> -};
> -
>   &dsi_out {
>   	remote-endpoint = <&anx7625_in>;
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 472d4987615a..d71972c94e42 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -61,6 +61,33 @@ &bluetooth {
>   	firmware-name = "nvm_00440302_i2s_eu.bin";
>   };
>   
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;
> +		backlight = <&backlight_lcd0>;
> +		rotation = <270>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &i2c0 {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 1b21e3958061..b702ff066636 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
>   	};
>   };
>   
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;
> +		backlight = <&backlight_lcd0>;
> +		rotation = <270>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &i2c0 {
>   	status = "okay";
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a85c73b43195..b6cfcafd8b06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -45,6 +45,34 @@ &bluetooth {
>   	firmware-name = "nvm_00440302_i2s_eu.bin";
>   };
>   
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;
> +		backlight = <&backlight_lcd0>;
> +		rotation = <270>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &i2c0 {
>   	status = "okay";
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8f3a0e85b4ed..4ac0a60fdd24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -252,29 +252,6 @@ &cpu7 {
>   
>   &dsi0 {
>   	status = "okay";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	panel: panel@0 {
> -		/* compatible will be set in board dts */
> -		reg = <0>;
> -		enable-gpios = <&pio 45 0>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&panel_pins_default>;
> -		avdd-supply = <&ppvarn_lcd>;
> -		avee-supply = <&ppvarp_lcd>;
> -		pp1800-supply = <&pp1800_lcd>;
> -		backlight = <&backlight_lcd0>;
> -		rotation = <270>;
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&dsi_out>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi_out {
> -	remote-endpoint = <&panel_in>;
>   };
>   
>   &gic {


