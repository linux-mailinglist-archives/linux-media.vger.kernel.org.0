Return-Path: <linux-media+bounces-28315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8DDA634E3
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 10:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A64916EFC5
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 09:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2250119E998;
	Sun, 16 Mar 2025 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UTlYTmBa"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747D19D082;
	Sun, 16 Mar 2025 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742118792; cv=none; b=oFevxF+CM9xQoKIs4AL4a24yPlT0D+TkWA1SxsjO4rzxby8Uzd2PK1wdErGknBmb5YoJsZZdq2WX7Q5mBNTzmqn2zqVYg+rc2lR8PdemzZVhXAJfNbLiRdRxNFv7z51rlz/x7y01rpqgJP3IurDvDvF+L40uEIOdEJBVwTLvwHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742118792; c=relaxed/simple;
	bh=GvX4DXkXOVyGXM5iC5+hqvP5Cpidw97YzNo6kd6AN+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oX9UGURDtBuw0hvt9B+7qX5lUUbgrc711kKhFyGo7WZ8mG9WJcGxy/A7998eyq+W8yfKtpn2jRh+zMJVgv1NTEl9B39QgVlIKl18DV6KM+S/sOxOtmFVgZ9CsD6gLYCXH5JX7Tfm8aLJjZRc2IoSgw+8W1Xlj/XF5RAd50RerQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=UTlYTmBa; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1742118783; x=1742723583; i=wahrenst@gmx.net;
	bh=waqk40he1Aos8eWly4RCtuqg/j6badeXprlfS9WCE6g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UTlYTmBaE9UfJMFm0fBosxWdLtUjXglbyF3YhhSElrZh+xdXrxtsP6baRRhMtkSQ
	 GRrpIHkZwHgd5O0CvNInkBIxNWSPnSTCL1aZM75x/rSbX5j22gqnUed/3mK1sSF55
	 z3vHYjPFQNpGVFs5ppLzQluxh8vB0/RIoQlet/k81G/5TItwYxBEEEZOKkC7Nez5h
	 JdBEOAdXSnw6aq//5b6lbixiISXJY0/EPPDL8uerlW0t13RoLvnlVyjiv67DstsMp
	 FgxuklKwKhbyRH4As7X52oJAvsNylwXyQHgBWP8mkVjwpD9vw+lTbRTbxVNTmBQky
	 lsO3Fg9Mv4NUl7F2ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1tFRqH2yRe-00bvvv; Sun, 16
 Mar 2025 10:53:03 +0100
Message-ID: <9a23c31d-e26f-4bc1-9759-5b6b4340a588@gmx.net>
Date: Sun, 16 Mar 2025 10:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
 <20250206-media-rpi-hevc-dec-v2-5-69353c8805b2@raspberrypi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-5-69353c8805b2@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W2pLMWrKNN8dtTF7L8PthwX1uIuTiOYSHJ9N6pqTNo+4n30bD5F
 llud2RqIz07G4rVMxz5XxgahMcXaq7qE2YaPepJ1LxKCvK/5rSTb4rNY7JGzbqSK6CPM0l2
 GbENGZCekzGiRSFbEv4+kNy/FmVTHMJMii9KQb9c2PCDveNBxHZT2XCrFkcyWAGyWxpAg2x
 a6HS9rhO8qHbeLyHho6sA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aTOBw0LTolI=;JbWdY10KwOeKZNbXmN8ynmnfgna
 KLDq8pSkz9JsOn+QNMZV70MZpCzEJL1KeBK6Mbk5mEb6uCXl1MLEHiN7pgOX/sExk4GMUqKmA
 Rr/HnvTC3dhsTwzAVmGkbtgWiLcskjtoHDp9ftXySaPKUkXv7lG3Qr7pk1QnFMYTDXBPSyt8d
 mzYI/YxteOQxdZ0sT8PgNsMbAU16xdDLClJ44lfBfTqeAjNUB0B/1kbVQf6SktWiZyARWXi1/
 pBicjOC41z20t06GeQATe4GZFTBk/Pkzgnp+510Wg6oq85bnspuYDsFgy7EQgiMr0cAP5LFJD
 It7R14rVAEmsLKcwo2rSDj35zMvd15kNE6ebw9Eu6HTPgtp5YirQ0N/EF5twF11DkjEGlT4Am
 BY0Et7GnNMqa5a3bzX8cE4dKwGBuzoE2ZHpW6E5hVEyaGHxG0ppdHqf2h2dogU7DbrrTv1U3q
 04p/9BC3yO3Z2kM/SwbLlMPYN2oN/P2xAkEqEOWEmmG8IDGWqiK4hxzGriJCju8QIQpsNod1G
 7wtvUZyWHG4PATIv+k7xSKuV8x0QM2X2E9UQSjXb5co1H0BTHtIUmmV/g+JeOiTs5kItjqjJr
 O1szBTBBSN8SIKaCApYUOYtijlus5Vp+HkwC4jYjd+VMXZI7etxCLcQDb048/Kt+uEwv2IT7Z
 YIvX+tFNILBPYGXGBUnbzDMNdJkNank1Kuz5YvXRpqfPqoMczXy1+CqEBRMnVhzU7F3TzB5vj
 ZJGj8F3tCbsJGFetfV3Ivre2qQE7/PBerpAdfdiVmK1ZJIOyKRCvbuneWQrjqSYtm+APt2O/z
 LPPTruRyyvbyxKXIGPWsIuLXEtPiffDyMmE04MFnj1K1lFqDnONAg7zpgKa4+tY5ILLE0rFmv
 5cG0SdG1geaP2oaKkbv+GDyHzU/7bTj39AgNfdoQ+1SQSIDtlCrzv4EJUk8dMgOuSGZy77WsO
 1yi3qxrYuxI7b2hcNcP2PBDp0UMdThV7YHuq3Ifl6kfmBLWdk92K5BOzaQ9b5tsrzVtzu1qkt
 Kz5RniDCa7ZrJA5C2VOBSSqINx0En6gIQIWCmbVouZaXtHk7hOKMmBbObc5A6LQOPBDTEbsNJ
 SYW/GlpQlqCzLrzo18wKJoZNfSDOjgUgqZcqaM4q2IxophDgzY50FCilzS3QwJwkg/tIgB3q8
 xEZTpVLmGngXeu6/wi5nnwlVNQh/BiBpLwqYAagK+8pRGfnMyUhJ2xfbDeSkB0dIzekYkaj93
 I/T14flkmyxhIBGxeNqxXY3WnUAU/TosvVcC3C9HeAqyJqBfWXpDMfb3L9CfFBTQF2vyALLVV
 vCrgqaJLzRxZFJl0omfyrsX7kOpklsY61s0cX6Lh0f4QOiHfTL28ez332iZkjIVHKy2e/rHxU
 p7NMKH0S5M9bYcy3g1sgsEXleEirqZV9uYh7uR7chejXK2RJPTd5vK7bee3+we8gypFrAz3wO
 +YtzF0vUycY3ixxmGtiur9HE/LUg=

Hi Dave,

Am 06.02.25 um 19:02 schrieb Dave Stevenson:
> Add the configuration information for the HEVC decoder.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>   arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
>   arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot=
/dts/broadcom/bcm2711-rpi.dtsi
> index 6bf4241fe3b7..56c633005941 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> @@ -105,3 +105,7 @@ &vchiq {
>   &xhci {
>   	power-domains =3D <&power RPI_POWER_DOMAIN_USB>;
>   };
> +
> +&hevc_dec {
> +	clocks =3D <&firmware_clocks 11>;
> +};
the node ref should be in alphabetical order, so please add after hdmi1.
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts=
/broadcom/bcm2711.dtsi
> index e4e42af21ef3..2931d93ba184 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> @@ -628,6 +628,15 @@ v3d: gpu@7ec00000 {
>   			resets =3D <&pm BCM2835_RESET_V3D>;
>   			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
>   		};
> +
> +		hevc_dec: codec@7eb10000 {
Please put the node before V3D to keep the register order.
> +			compatible =3D "raspberrypi,hevc-dec";
> +			reg =3D <0x0 0x7eb00000  0x10000>, /* HEVC */
> +			      <0x0 0x7eb10000  0x1000>;  /* INTC */
Since the reg-names are provided, there is no need for these comments.
> +			reg-names =3D "hevc",
> +				    "intc";
> +			interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>   	};
>   };
>
>


