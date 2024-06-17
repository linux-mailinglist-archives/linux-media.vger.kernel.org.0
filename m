Return-Path: <linux-media+bounces-13449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BD90B3B6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89BF6283746
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57A5158DB3;
	Mon, 17 Jun 2024 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V6+L6VWw"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78274158D8E;
	Mon, 17 Jun 2024 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635013; cv=none; b=olBMdV60jWHqEKR1A5W9+9CUIDM1ZEJoHpzTXU+Bzjk5IvXg1jKIJFo1XqZjC9xufnxitiVyPH0RjKPbguO5fBpXCH04jZ0Hm572703/1JqaAy8SzQK1eZmMmX0to174ouu2oGdeQA8s8AcVkdGaMUEUQikt16kcSbj1KvotQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635013; c=relaxed/simple;
	bh=vquMLNYCLeCI9Wf+nwxmTjMd8kuzQP4DWSnz7pv0oHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lOJDqqxx7+1AMo0ZV39o95hR+kzwJeVe45lVekryPZukuckqB2yPEzK5ls2hZP2d4j/1I4l6yG0ofbEyLtU7UNMQt0iXXlrwZncjru1ANLiUcXzOlnEQwttQwR0MbEdWCEtvYySVEXFTTn91HPoG9jk1dwCtr42DvpTCXxI+TRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V6+L6VWw; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718635009;
	bh=vquMLNYCLeCI9Wf+nwxmTjMd8kuzQP4DWSnz7pv0oHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6+L6VWwlyaaV3yVJgRGErcMn95lCGol873uwmjukiIo921DkvVlRVGRwAs2dHpgC
	 IEeEfX5uR8ftWizbzLNRh4ht6eukICrQ3/zk5HFEdEtLhQ+uc6pjfkstGkGmcCzKiy
	 weFgPQ52wRlfmWUdcmmVZrE3ryZRO3NUJcVvaC74bE6HHTonivpb+CcVyYbBApgcjF
	 idGiTPPcTCi+cgFWLBuvba0uq5Wjh9a3cHwUQE0uEuip3uRejRkXe7zAH5vbtub0Hy
	 +ZytyAEloyRVgBkH3RDuxd82EE8UspR3n5ql8oyoXkKw+VjYhQn+bFfsJ5TclnzAoU
	 /edHXWh9eOG8Q==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C81FD37812FD;
	Mon, 17 Jun 2024 14:36:46 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject:
 Re: [PATCH 3/3] arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)
Date: Mon, 17 Jun 2024 10:36:19 -0400
Message-ID: <48773952.fMDQidcC6G@arisu>
Organization: Collabora
In-Reply-To: <f4c140a3-2b11-405c-bfd4-32e50180f6b7@kwiboo.se>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <3666279.iZASKD2KPV@arisu> <f4c140a3-2b11-405c-bfd4-32e50180f6b7@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4519294.Icojqenx9y";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4519294.Icojqenx9y
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Date: Mon, 17 Jun 2024 10:36:19 -0400
Message-ID: <48773952.fMDQidcC6G@arisu>
Organization: Collabora
In-Reply-To: <f4c140a3-2b11-405c-bfd4-32e50180f6b7@kwiboo.se>
MIME-Version: 1.0

On Sunday, June 16, 2024 5:17:31 A.M. EDT Jonas Karlman wrote:
> Hi Detlev,
> 
> On 2024-06-15 21:55, Detlev Casanova wrote:
> > On Saturday, June 15, 2024 4:25:27 A.M. EDT Jonas Karlman wrote:
> >> Hi Detlev,
> >> 
> >> On 2024-06-15 03:56, Detlev Casanova wrote:
> >>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> >>> 
> >>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> >>> ---
> >>> 
> >>>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
> >>>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
> >>>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19 +++++++++++++++++++
> >>>  3 files changed, 27 insertions(+)
> >>> 
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> >>> b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts index
> >>> c551b676860c..965322c24a65 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> >>> @@ -503,6 +503,10 @@ &pwm1 {
> >>> 
> >>>  	status = "okay";
> >>>  
> >>>  };
> >>> 
> >>> +&rkvdec0 {
> >>> +	status = "okay";
> >>> +};
> >> 
> >> Enable of rkvdec0 should probably be split out from the patch that adds
> >> the rkvdec0 node to soc dtsi.
> > 
> > Ack
> > 
> >> Also why is rkvdec0 only enabled on rock-5b and orangepi-5?
> > 
> > I only could test on those two but I can enable it on all rk3588 devices.
> 
> Because the decoder is an integrated part of the SoC the default should
> probably be that the IP is enabled, i.e. no status prop required for the
> vdec and related mmu nodes in rk3588s.dtsi.
> 
> >>> +
> >>> 
> >>>  &saradc {
> >>>  
> >>>  	vref-supply = <&avcc_1v8_s0>;
> >>>  	status = "okay";
> >>> 
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> >>> b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts index
> >>> feea6b20a6bf..2828fb4c182a 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> >>> @@ -321,6 +321,10 @@ typec5v_pwren: typec5v-pwren {
> >>> 
> >>>  	};
> >>>  
> >>>  };
> >>> 
> >>> +&rkvdec0 {
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> 
> >>>  &saradc {
> >>>  
> >>>  	vref-supply = <&avcc_1v8_s0>;
> >>>  	status = "okay";
> >>> 
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> >>> 0fecbf46e127..09672636dcea 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>> @@ -3034,6 +3034,9 @@ system_sram2: sram@ff001000 {
> >>> 
> >>>  		ranges = <0x0 0x0 0xff001000 0xef000>;
> >>>  		#address-cells = <1>;
> >>>  		#size-cells = <1>;
> >> 
> >> Blank line is missing.
> >> 
> >>> +		rkvdec0_sram: rkvdec-sram@0 {
> >>> +			reg = <0x0 0x78000>;
> >>> +		};
> >>> 
> >>>  	};
> >>>  	
> >>>  	pinctrl: pinctrl {
> >>> 
> >>> @@ -3103,6 +3106,22 @@ gpio4: gpio@fec50000 {
> >>> 
> >>>  			#interrupt-cells = <2>;
> >>>  		
> >>>  		};
> >>>  	
> >>>  	};
> >>> 
> >>> +
> >>> +	rkvdec0: video-decoder@fdc38100 {
> 
> To match prior generations the symbol should probably be called vdec0.
> 
> >>> +		compatible = "rockchip,rk3588-vdec2";
> >>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
> >>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> >>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>,
> > 
> > <&cru
> > 
> >>> CLK_RKVDEC0_CORE>, +			 <&cru
> > 
> > CLK_RKVDEC0_CA>, <&cru
> > 
> >>> CLK_RKVDEC0_HEVC_CA>;
> >>> +		clock-names = "axi", "ahb", "core",
> >>> +			      "cabac", "hevc_cabac";
> >>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru
> > 
> > CLK_RKVDEC0_CORE>,
> > 
> >>> +				  <&cru CLK_RKVDEC0_CA>, <&cru
> > 
> > CLK_RKVDEC0_HEVC_CA>;
> > 
> >>> +		assigned-clock-rates = <800000000>, <600000000>,
> >>> +				       <600000000>, <1000000000>;
> >>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> >> 
> >> iommus and resets should probably be added.
> >> 
> >>> +		status = "disabled";
> >>> +	};
> >> 
> >> The iommu node for rkvdec0_mmu seem to be missing, is it not required to
> >> be able to use memory >4GiB as decoding buffers?
> > 
> > I need to check if the current rockchip iommu driver will work for this
> > decoder. I remember that the iommu code for AV1 was a bit different, not
> > sure about this rkvdec.
> 
> The device tree should describe the HW not what drivers are capable of.
> 
> If there are substantial differences in iommu IP a new compatible should
> probably be added for that iommu.
> 
> >> I would also consider adding the rkvdec1 node(s), if I am understanding
> >> correctly they can both be used in a cluster or completely independent.
> > 
> > They can be used independently, yes. I'll add rkvdec1 for rk3588 devices
> > (rk3588s only has  1 core)
> 
> I do not think that is true, the rk3588s variant should also include two
> decoder and two encoder cores.

You are right, I had HDMI ports in mind. There are 2 decoders available on 
rk3588s too.

> However, the rk3582/rk3583 variants (rk3588s with one or more bad cores)
> may have 0-2 cores working for the decoder and/or encoder.
> 
> E.g on my rk3582 boards I have following different ip-state in otp:
> - 1 bad cpu core (ip-state: 10 00 00)
> - 1 bad decoder core (ip-state: 00 80 00)
> - 1 bad encoder core (ip-state: 00 00 04)
> 
> The general idea is that bootloader will disable or delete the offending
> nodes in the device tree to correctly describe the HW for the OS.

I see, so I will add both cores, enabled, in rk3588s.dtsi and let the 
bootloader disable the ones that are bad.

Should I also add compatibles for rk3582/rk3583 then ?

> Regards,
> Jonas
> 
> > Regards,
> > Detlev.
> > 
> >> Also on RK3582/RK3583 one (or both) of the decoder cores may be marked
> >> as bad, yet the remaining one can still be used independently. The idea
> >> will be that bootloader fixup the DT and disabled/delete-node the bad
> >> core(s).
> >> 
> >> Regards,
> >> Jonas
> >> 
> >>>  };
> >>>  
> >>>  #include "rk3588s-pinctrl.dtsi"


--nextPart4519294.Icojqenx9y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZwSeQACgkQ5EFKUk4x
7bZ8EggAsTziifxNj/1BKPe7QDXU3Ets7tahPfQ6vh0qIWmhwS+nUrIVjFRXa8na
o7EeZGv16j9/t/Qndj9DY7QrxywaqCPA1ovey9Dy07q3ap9QLWDyI/VYHwmPQAhk
hpxUtXK/ovHzDPAm6teUwB2dC2T+MpWXintbg6lRGjUuMOR9nmp9skHdERZglrWI
NnH8ZG5D+WKFOMZpS/rP2KkHkFsW8Ma5ypuAIM+uZq88ZEDUMhctYnrEpDU5C6Ln
U8PFrWFnTfRncd/JMWIwpCUD+01bZL1F7yebYOqRKdlhcEPZE5U1Z8VFwPjtIEGa
v//skwj2Ds7leldrEbGCnc2tgQ+dBg==
=vTzR
-----END PGP SIGNATURE-----

--nextPart4519294.Icojqenx9y--




