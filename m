Return-Path: <linux-media+bounces-35781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3FAE6582
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DB183BD844
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368B829A9ED;
	Tue, 24 Jun 2025 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZkfhBzq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89632281510;
	Tue, 24 Jun 2025 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769543; cv=none; b=opwIyLheKv8N6PQFOtDjlC9tpKZyw2XvCJRkUnA/L0t8APAr90oDTxW8+D+Kp/hqhRyvX1g/5o2G/nIf86FzWwvbe+B32IiMvuiYCXDer7U+SkQtZFN5RfPG5qCYwqLhiqGB6YFjc6eQjffcWcuofvXoCCpI7HR53J7XKrwdbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769543; c=relaxed/simple;
	bh=vC1tckTgRedvyr0rPpm+r7oBgh21zwhGiKUVHt+D02k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=er8DKEWxEEJK/JTac0oZ4cV0BWJY00pNS2zK1uGen2ZXpcgSFtHk9VHPi42nRxS5PiEtQt9xsiUqXEK3BGW45fL8AiKb+vo7FKL85WE59YXCvsLTbL3PSziunPd+uDbd8hgbnF3AOJc08Z841XBNA3BtwJZHkXCBBpiZ8PVE+v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZkfhBzq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3463CC4CEEE;
	Tue, 24 Jun 2025 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750769543;
	bh=vC1tckTgRedvyr0rPpm+r7oBgh21zwhGiKUVHt+D02k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GZkfhBzqWveKHHpzUUrcpuFc9Q/OXCqSpTO+F4fz6E/0A77Mhndx5sH4V4yKsDLI1
	 VY9LNPK/x85Bjky3MmHfhZjU4/5IkVtTukDS0Ivs0JC2cG0E2ThHYf45CDUsGFbPgS
	 IRFtdPiGxwpmdoi1u6NzRQnnTja4VQkGl5ifiuM4zXrxQGgLNZvrXf1o6DjSme0SOt
	 laUDX5c9F+yh3FO5396GhpBx2z6HfLj/tciGqX1Z9pPFKstO05P7DCS5/FwQljdUL9
	 X/UvAU8UV8+YObwgUYjZ3oiinKLeTN4cMR6DYIHbbP/zKIq1V62rcsXte8G3bOLLFN
	 cSE6bkvL24qTg==
Message-ID: <145fbca0-bb55-4809-9c13-cbfa50e5b1ec@kernel.org>
Date: Tue, 24 Jun 2025 14:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add Input Video Control Block driver for RZ/V2H
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2025 14:35, Daniel Scally wrote:
> Hello all
> 
> This series adds a driver for the Input Video Control Block in the
> RZ/V2H SoC. The IVC block transmits input image data from memory to
> the ISP core (on this SoC, a Mali-C55 ISP). The driver registers an
> output video device for userspace to queue image buffers to. One
> noteworthy feature is that - because it is not a part of the main ISP
> drive - the IVC driver also registers a subdevice, which connects to
> the media device created by the ISP driver through the usual v4l2
> async framework. This requires delaying the registration of the video
> device until the .registered() callback of the subdevice, so that the
> struct v4l2_dev pointer the subdevice connected to can be set to the
> video device.
> 
> To facilitate communication between the ISP driver and the IVC driver
> we use the new media jobs framework that was posted recently [1]. The
> series is also based on top of the latest version of the Mali-C55
> driver [2] and some updates to rzg2l-cru [3].
> 
> Note that this is not quite ready to merge, as there's an outstanding
> bug that sometimes causes the driver to hang. The device should fire
> two interrupts per frame; once on completion of data transmission and
> once on expiration of the blanking period. The second interrupt seems
> sometimes not to arrive, and at the moment the problem is worked
> around with a timeout in rzv2h_ivc_send_next_buffer(). We're working
> on that issue, but because the driver lends helpful context to the
> media jobs and mali-c55 series (and is probably otherwise ready for
> comment too) I wanted to post it.
> 
> Thanks
> Dan
> 
> [1] https://lore.kernel.org/linux-media/20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com/T/#t
> [2] https://lore.kernel.org/linux-media/20250624-c55-v10-0-54f3d4196990@ideasonboard.com/T/#t
> [3] https://lore.kernel.org/linux-media/20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com/T/#t
> 
> ---
> Daniel Scally (3):
>       dt-bindings: media: Add bindings for the RZ/V2H IVC block
>       media: platform: Add Renesas Input Video Control block driver
>       MAINTAINERS: Add entry for rzv2h-ivc driver
> 
>  .../bindings/media/renesas,rzv2h-ivc.yaml          | 103 ++++
>  MAINTAINERS                                        |   7 +
>  drivers/media/platform/renesas/Kconfig             |   2 +
>  drivers/media/platform/renesas/Makefile            |   1 +
>  drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  15 +
>  drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 237 +++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 379 ++++++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 678 +++++++++++++++++++++
>  .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 133 ++++
>  10 files changed, 1560 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250624-ivc-833d24376167

That's b4, right? So where is the changelog with lore link to previous
version?

Best regards,
Krzysztof

