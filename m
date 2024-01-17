Return-Path: <linux-media+bounces-3829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECE830D2A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 20:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB43287124
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 19:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC4E249E6;
	Wed, 17 Jan 2024 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="uIU3qzWg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ADA24205
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 19:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705518803; cv=none; b=lARhBnmRm/qvT5Xme4ID87vB9rJ65SKpbKExzi+Trp5KoZT9+c5zp3VgDcUUBGA/oYXYph1mWZJprygdj4T7zEMUJ6QI8z3Sd3w+ZMqPSBSBcQuSO2l6v6WsC6ZmlGddAkqwRJ97zNbAD5QTgvEdgPmHgnu2qtlRvrjMDIb9edQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705518803; c=relaxed/simple;
	bh=1Wc2lCngWybR9QP2B8d+dj4Ww7Dmyi2mHT516O1RWj0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Autocrypt:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version; b=Mf9mypkj0CJ2Ml1NCg1e9nzkheXNJRHG5MJfn3QonBqoeZ0BbBPL1TL/YFqme9/V3ITSV7quy83NhZa3+yDbnUir2TKaLehBIBWUUTgZ83YK766XIQAwS+b/XbWyA0Ma+L1Az3DewaInyHxViGn45u4diS8FIbbJxEPkGAG9LhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=uIU3qzWg; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7833a51a1aaso652044285a.0
        for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 11:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1705518801; x=1706123601; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bV2ObK4Gn6zBfHyaALWYuYvkHMTPFOM7kyZ+I5+TgvA=;
        b=uIU3qzWgWQ3KnTpzejJT/4oNC/x/uVfe3GZKXSgQwjkReeghzO63mK6v+8jMDrp6N5
         djWi85oZL2zfg6nEKn+xKjQ0yPYF3mao83clUY6/xflgfrLpLoOrIZ12/wLq18hECyA1
         LPSCBxTTh8iHktk/wj5gARJgDqsKf0zD3l/QVky58SUEwUXX3Tn5/daMSLupkreDbcLv
         WZAwoo/glnJ7da71w0hAo9+kXywoBT+Vxh4S0GoTFsAa9xmJHh05vIjyqyVAoCiv5YDW
         H4aWjKL4oUoKeSZhwgDdnN2y2MFF4OAeRbFMmDe78ImKuGwIaOeQySQnNXmgOoe/9xIF
         OA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705518801; x=1706123601;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bV2ObK4Gn6zBfHyaALWYuYvkHMTPFOM7kyZ+I5+TgvA=;
        b=dman3J7eABI14zHUs6y0/t2FPL17H7uAX9JMwYUamBfZwgAjCAhMkPe4dlJqO/TXI+
         GVzP43aQhHNiV6cqyx90vVKf5coFRMkQ/JdpExtv2kW54KzWrXPo6iP2lE3tXh+iK4ZP
         Nb2wonX0aOYn/EwnjgzDpEHTLpO+9xdXTfDpwL+l3wm880T9uTdbQjN2U6WovMcbZaTD
         nYW4nsNP4S2tKdfT+3+MGxASvXSAopmv6y6A1i6/z6siiucGcyKMCx9DEJ951eJgnP1l
         1iSMHyX5oGWHHjJu1w1ALaN938nQo4mZtnFtClnDtqDYRSFKRyc+qJ+t6aaARX2AuJbe
         c1Pw==
X-Gm-Message-State: AOJu0YwZ66Gb31FvO1n2SPsow6gTNfXtiT7veehQu/NUlYuR6t5lXftP
	3kcyf7rCHpCHLcC3+BSsiCiT1wQvx2I/sg==
X-Google-Smtp-Source: AGHT+IG73tqD/icOIiDqu1zoHWcRrz4j9u5/SPw8nh8PdpyyAo+kwFkgCZy+NiroIxfP1GwDgXR5Lw==
X-Received: by 2002:a05:620a:44d1:b0:783:3ea4:e39d with SMTP id y17-20020a05620a44d100b007833ea4e39dmr10686331qkp.146.1705518801111;
        Wed, 17 Jan 2024 11:13:21 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id i16-20020a05620a249000b007832c2e3b80sm4633406qkn.132.2024.01.17.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 11:13:20 -0800 (PST)
Message-ID: <e01c9ab69f3e120cdb9b70fbacebbab32d5abba4.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/2] arm64: dts: rockchip: Add Hantro G1 VPU support
 for RK3588
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, heiko@sntech.de, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org
Cc: sfr@canb.auug.org.au, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sigmaris@gmail.com,  knaerzche@gmail.com
Date: Wed, 17 Jan 2024 14:13:19 -0500
In-Reply-To: <20231231151112.3994194-2-liujianfeng1994@gmail.com>
References: <20231231151112.3994194-1-liujianfeng1994@gmail.com>
	 <20231231151112.3994194-2-liujianfeng1994@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jianfeng,

Le dimanche 31 d=C3=A9cembre 2023 =C3=A0 23:11 +0800, Jianfeng Liu a =C3=A9=
crit=C2=A0:
> This patch enables Hantro G1 video decoder in RK3588's
> devicetree.
>=20
> Tested with FFmpeg v4l2_request code taken from [1]
> with MPEG2, H.264 and VP8 samples.

In general, we ask submitters to share a fluster [0] score (this is just to
demonstrate that the integration has been well validated). LibreELEC commun=
ity
have patch to enable this ffmpeg fork. I don't expect any surprise here, an=
d you
can just reply to my email here.

Alternatively, this test tool is shipped in latest Debian, and with the
appropriate GStreamer packages you'll be able to run the VP8 and H.264 test=
s.

Nicolas

[0] https://github.com/fluendo/fluster

>=20
> [1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multim=
edia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
>=20
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/=
dts/rockchip/rk3588s.dtsi
> index 5fb0baf8a..ab2792162 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -640,6 +640,26 @@ i2c0: i2c@fd880000 {
>  		status =3D "disabled";
>  	};
> =20
> +	vpu: video-codec@fdb50000 {
> +		compatible =3D "rockchip,rk3588-vpu", "rockchip,rk3568-vpu";
> +		reg =3D <0x0 0xfdb50000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&vdpu_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	vdpu_mmu: iommu@fdb50800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdb50800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clock-names =3D "aclk", "iface";
> +		clocks =3D <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
>  	vop: vop@fdd90000 {
>  		compatible =3D "rockchip,rk3588-vop";
>  		reg =3D <0x0 0xfdd90000 0x0 0x4200>, <0x0 0xfdd95000 0x0 0x1000>;


