Return-Path: <linux-media+bounces-27777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D980EA55365
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 18:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AF043B34D5
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F351325C708;
	Thu,  6 Mar 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ptToXzUw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51321480E;
	Thu,  6 Mar 2025 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283266; cv=none; b=jhxdujpDdRWJTaOu0No6A1bQnIPvQxQZw0DA6nCZVyPODXfj6njPWhs+bloNBNU86/xdPyDFDW3ZuxE8PSyFAVCVSn9A9iwsADfO2K9gj+NINQNsyl+MYQwhD1t/QxEljq8NYKQQGE8SH4DSg/0OFLQXm7aOHXrxyev1q14vohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283266; c=relaxed/simple;
	bh=vLYpv2pNjYOdh5O6HeK/ePYCVyI3JgI8QCiLliFyZBI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=u7T9/5ghRyi0WRpFE0V0wX5h8rcjrYOq/fF2CtIybk1LnoRDRlc6oon3Z/Hnzh8Wt2ezfiH6GxLOBlaA7qdNsV0aHcOiXq8q2mN2H87n871zS80ToXm8w/306po46rS/Aq/8/ryT0bq8We6YHgjhEJofUINRROWFL4TbfF9NRas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ptToXzUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C6BC4CEE0;
	Thu,  6 Mar 2025 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741283265;
	bh=vLYpv2pNjYOdh5O6HeK/ePYCVyI3JgI8QCiLliFyZBI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ptToXzUwYt/ACtzyfBCHKIux4Wmgsh77p4jdAvYm6bHcHi51dDoYDI7QegezkukwS
	 LwtVTUhq0hd43i+dG+v8FEmhOSBXVNeBJrQUPA9tn9BnGtGGLMfoRR5g5DPWLtBMwO
	 wFlCc7WzmNDG+MZlss5UTMtvr6t96OLVn9b9g/tSWQAhkn9BY9pn0T0SHfhBRnRd+B
	 s/pFz6rKoWX38fOjdxwe8vJvVUmjIKSm9NFDiwiNPe3aYy9/57uSxvqViQ182JgqXk
	 RJFCMNYy1Iem7rxiY3pyUa0R/JUsYW+RbaXDPsMCcxKSh10TPnEKjrzvHHhsc/ADC6
	 BIGjagzLNQ/0A==
Date: Thu, 06 Mar 2025 11:47:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tim Surber <me@timsurber.de>, 
 kernel@collabora.com, nicolas.dufresne@collabora.com, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, nelson.costa@synopsys.com, 
 shawn.wen@rock-chips.com, jose.abreu@synopsys.com
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
References: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
Message-Id: <174128292021.549217.1931417772861083999.robh@kernel.org>
Subject: Re: [PATCH v14 0/3] Enable HDMI RX controller on RK3588


On Thu, 06 Mar 2025 10:28:39 +0300, Dmitry Osipenko wrote:
> Hello Heiko,
> 
> This is a follow up to the v13 of HDMI RX patches [1]. Hans queued the
> driver into the media tree. Now the DT patches are left to apply, could
> you please take care of this series if it's good to you? Thanks
> 
> [1] https://lore.kernel.org/linux-media/20250304085819.108067-1-dmitry.osipenko@collabora.com/
> 
> Changelog:
> 
> v14: - Re-enabled LOAD_DEFAULT_EDID=y option in the defconfig and
>        added ack from Hans Verkuil fot that patch.
> 
> Sebastian Reichel (2):
>   arm64: dts: rockchip: Enable HDMI receiver on rock-5b
>   arm64: defconfig: Enable Synopsys HDMI receiver
> 
> Shreeya Patel (1):
>   arm64: dts: rockchip: Add device tree support for HDMI RX Controller
> 
>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      | 18 ++++++
>  arch/arm64/configs/defconfig                  |  2 +
>  4 files changed, 91 insertions(+)
> 
> --
> 2.48.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250306072842.287142-1-dmitry.osipenko@collabora.com:

arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']






