Return-Path: <linux-media+bounces-40791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6EDB32070
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 18:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7AE18929C4
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEA027F195;
	Fri, 22 Aug 2025 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejd9VJuX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219FE27AC41;
	Fri, 22 Aug 2025 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879750; cv=none; b=TSpbdKX2gF2apSI+8FAKRdpFrPWvFmVPIYYDAHxRzMXoEVU32xiAnlmxOe4C/8WS0JINNnyiDU8v/3Iie1qfCHiQWg2Obx69Tk90mrg2wAeNCtWz28dql3YOQUhQapVUFvvSaHXmTe1TxJNrbaub4BJYo+lV4/W1UUypquoSmwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879750; c=relaxed/simple;
	bh=/JoebXJvqQP+5fzM4Z53QXgeBnVowtfVhyaNMmLl2ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuhroLjIzcEP+oefI21e8pEwhB++JQFdQIcfXx7bjmvIvqct8QtIbb21UAtAefu40ZL5UCSDou1hiFPeJe0Ip4e46d7iw/WIl7V6bc9XXuvwwdnnWyPbhN1hCDQPl4fKukMJMn6VDdoCc5K6MYUGlh8nmSHhSwCBG0oAQOkFsiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejd9VJuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B083C4CEED;
	Fri, 22 Aug 2025 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879749;
	bh=/JoebXJvqQP+5fzM4Z53QXgeBnVowtfVhyaNMmLl2ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejd9VJuX/njk4d24jNGTQirEhNLT7FYWnMqI6BdZX4e5TXJBlZ8NpiWCnutsKyI/D
	 F0yR/7ronXiUSFfjq4clk7bz+uyE+3RaFJr0Mjx/LyQL52wTrukLmHphcJlxN/+2AV
	 qW3BMLcCFudN5EQkkNEv/yKdJKYaX0ht0pfanPODaIlU+l8U/DaCe2U0FZwpsRoi5c
	 BP3NzFUa7kCM7pfBwDonqyMxpz6WknT8JXmbzeevsPBob58kCbVzsTNswmcs12uK8t
	 Pn8797MM8qOUbXZDueqWDn4mO0wGgdJ9PgjSR0FC+ht3osuVw+gVuxGPKUhCTp9keQ
	 rGfBdLHacy67w==
Date: Fri, 22 Aug 2025 11:22:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OG0VE1B
 camera sensor
Message-ID: <175587974815.3948715.12011410705104160279.robh@kernel.org>
References: <20250820224646.130270-1-vladimir.zapolskiy@linaro.org>
 <20250820224646.130270-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820224646.130270-2-vladimir.zapolskiy@linaro.org>


On Thu, 21 Aug 2025 01:46:45 +0300, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation for OmniVision OG0VE1B camera
> sensor.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,og0ve1b.yaml      | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


