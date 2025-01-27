Return-Path: <linux-media+bounces-25303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 673CEA1D1B3
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 08:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 916A31883EA1
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 07:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D311FC7E1;
	Mon, 27 Jan 2025 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a96NsVws"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E2F86340;
	Mon, 27 Jan 2025 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737963947; cv=none; b=P3767Hz6AX6cyAtqzK1zsnjqltuvCP2b4gOjS7KD/LZ8j7A9bkNM6l1Jg5dzoKsxXiWVF+NJv6TrCiYjqwOqESCBsT+WPslL3Rg8e+/gI2JnijYT6sN6MU4Fmsj5An46K1jOO0pdibbz9cOk2SoJ/CtF5DybRmrlC6TJXdn6CYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737963947; c=relaxed/simple;
	bh=1seX6KcPTZeSJOHCdm+TRnON88ZHdXtD+WYjwa8HEwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Omsc3i57mtuY9pMzxDcmSBHmmMJi49rBhVWZ4ylQN06Nv1xQ0yOFj/WmSeuFqROmwGwNxG4S5UJqcNz7F/vwKcwy+7OTq/52FIwluUQkWpowunLbBw8+7bN/Dl2p5QW1s24ITToQWrxvDc9whayMVTOPSpQCMI3Ddq6OeJVfTVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a96NsVws; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28406C4CED2;
	Mon, 27 Jan 2025 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737963947;
	bh=1seX6KcPTZeSJOHCdm+TRnON88ZHdXtD+WYjwa8HEwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a96NsVwsCpQRG54wb0Sg9eGNwtpf5HKVHrAw8r81upePQcPcsMwXIZ8CF3imvxoVC
	 63L3tf71UZe0xP8OPDbwuE5dFs3qI+DW/C+Uz6kqpiYVaHjl4NOLEWiFMJdoWKDumB
	 b47GPH+CqJf4uhqntXcP/kDHhnmE6G0A6p7XjmaPtuD+WSV3QDJEE00cNtD5j5Dbs2
	 pfVYOlQukLIDoVCT5ec/kekS+X1EL5b+KAZ4fXH1rrQPp5GolbQK59jU6QBN21yy3r
	 F1qjnfIwK4oPsWJXD1WneDda97Ck2h78GCc7dXblWf0zLmPQwbKQ/8Fyn4t7EMKgLX
	 zvclPaRHckChA==
Date: Mon, 27 Jan 2025 08:45:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 18/22] media: dt-bindings: ti,ds90ub960: Allow setting
 serializer address
Message-ID: <20250127-aquatic-herring-of-speed-29a59f@krzk-bin>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
 <20250124-ub9xx-improvements-v2-18-f7075c99ea20@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124-ub9xx-improvements-v2-18-f7075c99ea20@ideasonboard.com>

On Fri, Jan 24, 2025 at 05:17:55PM +0200, Tomi Valkeinen wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> The serializer's I2C address on the FPD-Link bus is usually communicated
> to the deserializer once the forward-channel is established. But in some
> cases it might be necessary to program the serializer (over the
> back-channel) before the forward-channel is established.
> 
> This can be used e.g. to correct serializer configuration which
> otherwise would prevent the FC to be enabled. To be able to communicate
> to the serializer before the forward-channel is up, the deserializer
> driver neds to know the default i2c address of the serializer.
> 
> Allow setting the serializer i2c address using the 'reg' property. This
> is optional, and usually not needed.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


