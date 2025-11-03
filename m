Return-Path: <linux-media+bounces-46204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7CC2B785
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 12:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699CD1881B84
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 11:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4536A3019B8;
	Mon,  3 Nov 2025 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haXVNmXG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FC321CC55;
	Mon,  3 Nov 2025 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170085; cv=none; b=gcIjuyjVsyHUKKL5Qs+vupxa/unw8cymxGjfgOmrQeirpf7/uQhckt5vh65i1q5XL63E7JjGnF3hZ1hTluwvaZtiBmii1/N8ClgUe67d+gkze0yYmE+o/A2gIl6RQmtIGewigUOfWeoHL/s0iOd9oTo5QjWcu3Cyh5bMlRRKFfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170085; c=relaxed/simple;
	bh=83zk57cNtetxfYb8EbrdA3sau3Z5AXIe3hta2oRve9k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jz9b/P0TksAU8/EkSF3TLU3CeGkrkzgxtulN3HpvDeL3t3Ma/CHq8aZGefCzkBwlKAbsJ0SH+u1T5D0eHCtaF0Aj+QUucgiW2shEm0JoeerGbA9sOL84u3DoP4UUv+WNl2fp5AXMqEnDN7gKq5TnDclyr0fYR1iQkYk98gysiEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haXVNmXG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2831AC4CEE7;
	Mon,  3 Nov 2025 11:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762170085;
	bh=83zk57cNtetxfYb8EbrdA3sau3Z5AXIe3hta2oRve9k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=haXVNmXGZGW+D/M8k3qq8seaVPQHUvd/znza8FIdpOoK3zE20O6uiU6tjM/5lamEx
	 v7yHWeWUqpGaCJKzSLh5ruy0PdAr5ZVuUqJBZYxjz6lJGAN8BjkDiYF4jD6rv0OzXd
	 3o5BrsbvWWF3zpYP8o3LwLwFtJ+DcHqM5jsEqY5aQiTE8BTDIqsJGpeCOtvrRNOHqm
	 GyJVz5HxddleqczfZpL+rrJIfmsgTYQ7a94z76hCzdBQ5/tF5D+sfHTLaR9I85UfVX
	 IgF02OF8U8FH0gTC2DavMiEGmX8yRNcqFGZAhILPjPCPCmgzlIOx+o7CEHW41w38Sx
	 hcYA09K63Ix7Q==
Message-ID: <27b5eef1-f59f-4556-897c-f0cec7689d14@kernel.org>
Date: Mon, 3 Nov 2025 12:41:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH V5 0/4] Add support for TI VIP
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: sakari.ailus@linux.intel.com, bparrot@ti.com,
 jai.luthra@ideasonboard.com, dale@farnsworth.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, u-kumar1@ti.com
References: <20251024094452.549186-1-y-abhilashchandra@ti.com>
Content-Language: en-US, nl
In-Reply-To: <20251024094452.549186-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2025 11:44, Yemike Abhilash Chandra wrote:
> This patch series adds support for the TI VIP. VIP stands for Video
> Input Port, it can be found on devices such as DRA7xx and provides
> a parallel interface to a video source such as a sensor or TV decoder.
> 
> Each VIP can support two inputs (slices) and a SoC can be configured
> with a variable number of VIP's. Each slice can support two ports
> each connected to its own sub-device.
> 
> Changelog:
> Changes in v5:
> Krzysztof:
> - Drop VIP node's label from the example in DT bindings
> - Fix indentation of the example in DT bindings
> - Get the phandle args directly through syscon call using syscon_regmap_lookup_by_phandle_args()
> - Use devm_platform_ioremap_resource() instead of platform_get_resource() and devm_ioremap_resource()
> - Drop struct resource *res from vip shared structure since it is now unused
> 
> v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/8d68342247da38d6ac59625f8eaf41c2

v4l2-compliance is too old:

v4l2-compliance 1.28.1-5233, 32 bits, 32-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

It's always best to compile v4l-utils from scratch using the git repo: https://git.linuxtv.org/v4l-utils.git/

v4l2-compliance is continually improved, and also kept in sync with the latest media
git repo (https://gitlab.freedesktop.org/linux-media/media-committers.git), 'next' branch.

Since there are kernel messages interleaved with the v4l2-compliance output I
recommend to write the output to a file and show that.

There is one failure for 'test Cropping'. If that still occurs with the latest version
from git, then that needs to be addressed.

Regards,

	Hans

> v4l2-compliance output with -s: https://gist.github.com/Yemike-Abhilash-Chandra/1dfa740a34e0e3d77a315b245e61b9ec
> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/e44c4504d596f24e7c93a4c0b59f5316
> DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/a7eb1308df2d4a167baeec62bc744335
> (No errors related to ti,vip.yaml)
> 
> Link for v4: https://lore.kernel.org/linux-media/20251015054010.3594423-1-y-abhilashchandra@ti.com/#t
> 
> Dale Farnsworth (2):
>   dt-bindings: media: ti: vpe: Add support for Video Input Port
>   media: ti: vpe: Add the VIP driver
> 
> Yemike Abhilash Chandra (2):
>   media: ti: vpe: Re-introduce multi-instance and multi-client support
>   media: ti: vpe: Export vpdma_load_firmware() function
> 
>  .../devicetree/bindings/media/ti,vip.yaml     |  152 +
>  MAINTAINERS                                   |    1 +
>  drivers/media/platform/ti/Kconfig             |   13 +
>  drivers/media/platform/ti/vpe/Makefile        |    2 +
>  drivers/media/platform/ti/vpe/vip.c           | 3731 +++++++++++++++++
>  drivers/media/platform/ti/vpe/vip.h           |  717 ++++
>  drivers/media/platform/ti/vpe/vpdma.c         |   51 +-
>  drivers/media/platform/ti/vpe/vpdma.h         |    6 +
>  8 files changed, 4672 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
>  create mode 100644 drivers/media/platform/ti/vpe/vip.c
>  create mode 100644 drivers/media/platform/ti/vpe/vip.h
> 


