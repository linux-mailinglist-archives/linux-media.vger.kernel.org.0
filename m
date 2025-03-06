Return-Path: <linux-media+bounces-27733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42618A54FBC
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DAEC162751
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 15:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F6A21147B;
	Thu,  6 Mar 2025 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="IFT+T9RM"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043321019C;
	Thu,  6 Mar 2025 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276536; cv=pass; b=NIV3Xa2wyVXcJrU1ysFIJhBEFZr5fXqddgCcMJruas6Tqi3zQSUcwpyqOCnOcO8mSENSRPitatsgDpnFjGMlY7ApGKmXDHETsWdyeAREAXJJSMormZvpBUA4/zlYfi24frQg7XYEvJBLct750uhJnuJ7etzBiNj3zwm7ubZHb28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276536; c=relaxed/simple;
	bh=S7UdvqQ+NuldeVect8SwxPaxgZ9/tghmkzdLEa0GTFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SH233vqk9UYsTE+DwR7Qycf3TEmNsLQ45hNnZRbCL86SaERqtphoa0zPMOCAe9vu46va1Sxg2jRc+uS+1hZ2jY4nawjSxkNFM+zvUainz74B9L8/x1Fwe3r6BhYJifL+0pJ0dX7y2bh/6/bmvdxRxIbKPx9qEcDDKgBYXJVlRZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=IFT+T9RM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741276436; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UzUgJMyXzSDXVYt2rs1iZca/mHvJEFZnEALrzOL6YY0LSaZqATV+TpzjPG/OCAjtOwUu0XAUwbtxIs7KVYi9/gWLFzAdGWw31J3eDxoQrkWTS1a+MhM0VATiv+Q0rvTHKwx+a9dZYfmTZJQLA7PzRH4mDzqFoFaZzPbLm2AtiuA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741276436; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9RLMymZvzrB2rucmHDCFIoCm3hDd8BfOl7cSA/Mw3JA=; 
	b=fRYWhOkLgqZuM38ZHBcI2YsQbR+90T/v1F4QXy9QdTYmyxpXbxcOhQBVal8D0NwnqPRzmGt5fhyIXoQIAuLBsXDtfDUyw+1X0QEeGesZr8usohSMjB7GWurRv0wi9gZ7G10EP4zq3L1kQIwn37X+AbDnK+ydFtFpp12vq/LED0U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741276435;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9RLMymZvzrB2rucmHDCFIoCm3hDd8BfOl7cSA/Mw3JA=;
	b=IFT+T9RMj0Zx3DB3tASzcDIV7qS2QbE6EzXiKgP8gaalo8lEaKMtrpI7czRuewbe
	AbAaGtB/X4D7K1xuRWQVGpwEtZtKGKTEwj9HlO0uYNEeZTjqVYoBVYc+bw047oKzVdD
	i9IAEYPP8yQLU4L/5ssTzF9yeSavOGQb+fRrhFsY=
Received: by mx.zohomail.com with SMTPS id 1741276434441715.0460931361157;
	Thu, 6 Mar 2025 07:53:54 -0800 (PST)
Message-ID: <f5f3dd36-0f90-47dd-bc12-1e2f0207fe7d@collabora.com>
Date: Thu, 6 Mar 2025 18:53:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/3] arm64: dts: rockchip: Add device tree support for
 HDMI RX Controller
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
References: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
 <20250306072842.287142-2-dmitry.osipenko@collabora.com>
 <9489391.T7Z3S40VBb@diego>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <9489391.T7Z3S40VBb@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 3/6/25 16:06, Heiko Stübner wrote:
> Hi Dmitry,
> 
> Am Donnerstag, 6. März 2025, 08:28:40 MEZ schrieb Dmitry Osipenko:
>> From: Shreeya Patel <shreeya.patel@collabora.com>
>>
>> Add device tree support for Synopsys DesignWare HDMI RX
>> Controller.
>>
>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
>> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
>>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
>>  2 files changed, 71 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
>> index 7f874c77410c..2d4b9986a177 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
>> @@ -594,6 +594,20 @@ hdmim0_tx1_hpd: hdmim0-tx1-hpd {
>>  				/* hdmim0_tx1_hpd */
>>  				<1 RK_PA6 5 &pcfg_pull_none>;
>>  		};
>> +
>> +		/omit-if-no-ref/
>> +		hdmim1_rx: hdmim1-rx {
>> +			rockchip,pins =
>> +				/* hdmim1_rx_cec */
>> +				<3 RK_PD1 5 &pcfg_pull_none>,
>> +				/* hdmim1_rx_scl */
>> +				<3 RK_PD2 5 &pcfg_pull_none_smt>,
>> +				/* hdmim1_rx_sda */
>> +				<3 RK_PD3 5 &pcfg_pull_none_smt>,
>> +				/* hdmim1_rx_hpdin */
>> +				<3 RK_PD4 5 &pcfg_pull_none>;
>> +		};
>> +
> 
> what's the reason for duplicating these pinctrl entries?
> 
> The base-pinctrl already contains a separate set of pins (and also a
> variant for the m0 set of pins), so why not check and use the already
> existing ones:
> 
>                 hdmim1_rx_cec: hdmim1-rx-cec {
>                         rockchip,pins =
>                                 /* hdmim1_rx_cec */
>                                 <3 RK_PD1 5 &pcfg_pull_none>;
>                 };
> 
>                 hdmim1_rx_hpdin: hdmim1-rx-hpdin {
>                         rockchip,pins =
>                                 /* hdmim1_rx_hpdin */
>                                 <3 RK_PD4 5 &pcfg_pull_none>;
>                 };
> 
>                 hdmim1_rx_scl: hdmim1-rx-scl {
>                         rockchip,pins =
>                                 /* hdmim1_rx_scl */
>                                 <3 RK_PD2 5 &pcfg_pull_none>;
>                 };
> 
>                 hdmim1_rx_sda: hdmim1-rx-sda {
>                         rockchip,pins =
>                                 /* hdmim1_rx_sda */
>                                 <3 RK_PD3 5 &pcfg_pull_none>;
>                 };
> 
> 
> Having multiple sets (even with differeing settings) will cause confusion
> later on.

Will try this variant, thanks!

>>  		/omit-if-no-ref/
>>  		hdmim1_rx_cec: hdmim1-rx-cec {
>>  			rockchip,pins =
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> index 4a950907ea6f..b7d06f93c8ce 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> @@ -135,6 +159,39 @@ i2s10_8ch: i2s@fde00000 {
>>  		status = "disabled";
>>  	};
>>  
>> +	hdmi_receiver: hdmi_receiver@fdee0000 {
>> +		compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
>> +		reg = <0x0 0xfdee0000 0x0 0x6000>;
>> +		power-domains = <&power RK3588_PD_VO1>;
>> +		rockchip,grf = <&sys_grf>;
>> +		rockchip,vo1-grf = <&vo1_grf>;
>> +		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		interrupt-names = "cec", "hdmi", "dma";
>> +		clocks = <&cru ACLK_HDMIRX>,
>> +			 <&cru CLK_HDMIRX_AUD>,
>> +			 <&cru CLK_CR_PARA>,
>> +			 <&cru PCLK_HDMIRX>,
>> +			 <&cru CLK_HDMIRX_REF>,
>> +			 <&cru PCLK_S_HDMIRX>,
>> +			 <&cru HCLK_VO1>;
>> +		clock-names = "aclk",
>> +			      "audio",
>> +			      "cr_para",
>> +			      "pclk",
>> +			      "ref",
>> +			      "hclk_s_hdmirx",
>> +			      "hclk_vo1";
>> +		resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
>> +			 <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
>> +		reset-names = "axi", "apb", "ref", "biu";
>> +		memory-region = <&hdmi_receiver_cma>;
>> +		pinctrl-0 = <&hdmim1_rx>;
>> +		pinctrl-names = "default";
> 
> hmm, this might be better living in the board dts?

HDMI RX controller is a part of the SoC, it's not specific to a
particular board. If you meaning move it into rock5b.dts, then we
definitely shouldn't do it. It's like moving PCIe controller node into a
board DT :)

-- 
Best regards,
Dmitry

