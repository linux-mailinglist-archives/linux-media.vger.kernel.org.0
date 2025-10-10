Return-Path: <linux-media+bounces-44175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983EBCCD93
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 14:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76682354B47
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 12:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90322868AC;
	Fri, 10 Oct 2025 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eA8120ha"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B08F48;
	Fri, 10 Oct 2025 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760098553; cv=none; b=fE4+z1MTain13CCQSEXdKkVny6aWDnJw+cLeY47aMvvm/XjTNo1QcqaF4uvYIAbufl7E4PaswSoOFowxervqEnzRfuurSbZqH9XoUVHhZRo/7jsMS/TlFpg507hrsSl4O7ArRn5qcM+mijbO4rZC7DOPoxKDcFgkViaoB/j1XcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760098553; c=relaxed/simple;
	bh=hWBv5TGNZvVjCplP/ev/k4nohO6E6ZrobfMvadwzZhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnFEv7PzJhQqWmUOF6u8ZEOqZ7aF4F4DDgAg5ED5/4H3n15Gn0LCEqkbQu7Sj1ZHtZ/rNlVWYr100LQbm8JUSuV8v9jYOyWys3VEWnsB+T+iRoGKzAkYJ1gVJcnUlOJ8Pn6/iEbAc005GaqvhnutAFpgy7pUX2LjQAcrCtdMDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eA8120ha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65215C4CEF1;
	Fri, 10 Oct 2025 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760098553;
	bh=hWBv5TGNZvVjCplP/ev/k4nohO6E6ZrobfMvadwzZhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eA8120haZolGu2WcpY2s4wKkm7jIqYjmTNsW6RQKUhowq4qQyINP9dOJ+ZniDOlSB
	 esvPlGsEZRJKcMHu615Aao5qvsXhrR8i3lOj94g+kVpWkaD0BJNvitbXrVIf6JDwfc
	 nPLSZUIQEP5Y5s1xYp8MG96JJMZbu4kDiT+e+aB7ryAXALV+wUxAzZwoceAe2tbOqM
	 BNiMMSyNPNZZTpKi77b7T7efoeOsvnNtmPov0/7EoQiVrvz1+WOBhhGIxXkfU2h/h/
	 nrC4zLTlRR4SHdXAcqTKu6r57v7q0DEuQDq1ASmTt+HX7DlUvDYzBJ4Bg/SioGE01B
	 4cBdSncQrOx6w==
Message-ID: <88b1dcda-be2d-4c57-b042-c1809ef1dc97@kernel.org>
Date: Fri, 10 Oct 2025 13:15:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/17] media: rockchip: add a driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <HSTnNzc6MTLHGWih5qjlI2nvVECP8FVdcQVeBON4KlWYLtEaWIlNmEpKTU_vlqitbIIHMpabKnvnmpEQFqHYxQ==@protonmail.internalid>
 <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> For example, the PX30 Video Input Processor (VIP) is able to receive
> video data via the Digital Video Port (DVP, a parallel data interface)
> and transfer it into system memory using a double-buffering mechanism
> called ping-pong mode.
> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
> DVP and a MIPI CSI-2 receiver that can receive video data independently
> (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> The v11 of the series adds a media controller centric V4L2 device driver
> for the Rockchip CIF with
>   - support for the PX30 VIP (not tested, though, due to the lack of HW)
>   - support for the RK3568 VICAP, including
>      - capturing frames from the DVP
>      - capturing frames from the MIPI CSI-2 receiver
>   - abstraction for the ping-pong scheme to allow for future extensions
>   - abstraction for the INTERFACE and CROP parts to allow for future
>     extensions
>   - initial support for different virtual channels (not tested, though,
>     due to the lack of HW)
> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.
> 
> The driver can be readily extended to provide support for the RK3588
> VICAP variant. In order to keep things simple, however, this extension
> shall be submitted separately.
> 
> Looking forward to your comments!
> 
> To: Mehdi Djait<mehdi.djait@linux.intel.com>
> To: Maxime Chevallier<maxime.chevallier@bootlin.com>
> To: Théo Lebrun<theo.lebrun@bootlin.com>
> To: Thomas Petazzoni<thomas.petazzoni@bootlin.com>
> To: Gerald Loacker<gerald.loacker@wolfvision.net>
> To: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> To: Markus Elfring<Markus.Elfring@web.de>
> To: Sakari Ailus<sakari.ailus@iki.fi>
> To: Laurent Pinchart<laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab<mchehab@kernel.org>
> To: Rob Herring<robh+dt@kernel.org>
> To: Krzysztof Kozlowski<krzk+dt@kernel.org>
> To: Conor Dooley<conor+dt@kernel.org>
> To: Heiko Stuebner<heiko@sntech.de>
> To: Kever Yang<kever.yang@rock-chips.com>
> To: Nicolas Dufresne<nicolas.dufresne@collabora.com>
> To: Sebastian Reichel<sebastian.reichel@collabora.com>
> To: Collabora Kernel Team<kernel@collabora.com>
> To: Paul Kocialkowski<paulk@sys-base.io>
> To: Alexander Shiyan<eagle.alexander923@gmail.com>
> To: Val Packett<val@packett.cool>
> To: Rob Herring<robh@kernel.org>
> To: Philipp Zabel<p.zabel@pengutronix.de>
> Cc:linux-media@vger.kernel.org
> Cc:devicetree@vger.kernel.org
> Cc:linux-kernel@vger.kernel.org
> Cc:linux-arm-kernel@lists.infradead.org
> Cc:linux-rockchip@lists.infradead.org
> Signed-off-by: Michael Riesch<michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch<michael.riesch@collabora.com>
> 
> Changes in v11:
> - rkcif: split large driver patch (6/13 of v10) into smaller
>    patches (6-11/17 of v11) (Bryan)
> - rkcsi: replaced devm_reset_control_array_get_exclusive with
>    devm_reset_control_get_exclusive (Philipp)
> - Link to v10:https://lore.kernel.org/r/20240220-rk3568-vicap- 
> v10-0-62d8a7b209b4@collabora.com

I believe it is the case and please feel free to correct me if I'm wrong 
that you've dropped a long list of sob/co-develop-by, I think we 
discussed that too, because of the level of change, it seems reasonable too.

On question on that, are these people aware of the change and cc'd on 
the list of recipients/contactable/agreeable to the change ?

---
bod

