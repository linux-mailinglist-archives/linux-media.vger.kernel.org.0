Return-Path: <linux-media+bounces-42494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D8B56E21
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 04:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7CD43A91C7
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 02:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F0F21FF48;
	Mon, 15 Sep 2025 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBYdeh9P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4B1EA7CF;
	Mon, 15 Sep 2025 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757902209; cv=none; b=Lk0YHv48ADUsDM39RjQRVQUykBw8uQdCvX1Mx37riXz3EtwI1UZyhqmNukTxeYcNLPPDcb3BW8IPiLEg4vNPJB+hIDkUhSj+YgU7coVO8U0nQrpnIMdhs304mIQ/caGavWEvs0But7v13cy2S5U+cXJxCsd8tlZRHibJywjI/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757902209; c=relaxed/simple;
	bh=rEX1fVC1mzbS+16jNs5mhKp7yx2T9TgN8z5RmGbee3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWjzK9Lmmf0lV/AQv5LT9kSDGtWVRRbBGiELO6+8Ddcb9S/dHtGunkP9jZOOfQB908R0HomKvd7wxDw4MM4Tk0u8X/nD3EsMyeYUPAYZy2Mwflw0V3WaVTWzhedG7ol0ow92gfmsGWVfiq5eEy/y4c0WzJRyNG3lxi0LU769OqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBYdeh9P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27DEC4CEF5;
	Mon, 15 Sep 2025 02:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757902209;
	bh=rEX1fVC1mzbS+16jNs5mhKp7yx2T9TgN8z5RmGbee3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBYdeh9PBwMXjlnJAb1wjcbHGAoDImxAKz47bXpWHiTAF6Gp8EauznbQt9qDxeWTo
	 blkoEnPrhyCmUb4m/GYU3hPZzp3Y3W2hgr5C3WTGfw8/lQ+yzKK/3YxFzx9qe7acbg
	 PskOFVcpDncUc3NbasdGobRA1wY8Prit4tipzUQvfuCTB0hDdShA89C6dTc+CMk3mt
	 DXTW+imC6kCD3Y2zZRUnPf1rrtfqLEGJLKmlcVn9FezSjLOnEuG3dyzdfZAnZ+Km7/
	 3WvPPB176fsKr99FA62BZUZwcaewfZC9D9JWMXd6xWvesN8ypzu9JrDQz+ZxPvz00/
	 /WHzAVBC1Rl2Q==
Date: Sun, 14 Sep 2025 21:10:08 -0500
From: Rob Herring <robh@kernel.org>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: ti,ds90ub953: Add third cell
 for GPIO controller
Message-ID: <20250915015309.GA2329507-robh@kernel.org>
References: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
 <20250911-ds90ub953-v2-1-03ee76eb6b59@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-ds90ub953-v2-1-03ee76eb6b59@nxp.com>

On Thu, Sep 11, 2025 at 04:44:22PM +0800, Guoniu Zhou wrote:
> Add third cell for GPIO controller to select GPIO output source. 0 to
> select output source from local GPIO data, 1 to select output source
> from remote compatible deserializer GPIO data.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 +++++---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 4 ++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..de759413a36060d3be6f2c3b67de48ee6e4d29f2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> @@ -19,10 +19,12 @@ properties:
>        - ti,ds90ub971-q1
>  
>    '#gpio-cells':
> -    const: 2
> +    const: 3
>      description:
>        First cell is the GPIO pin number, second cell is the flags. The GPIO pin
>        number must be in range of [0, 3].
> +      Third cell is GPIO output source(0 for local gpio data, 1 for remote
> +      gpio data from remote compatible deserializer).

Changing the cell size is an ABI break unless 3 cells was supported in 
OS before which I don't think it would be given GPIO cell meaning is 
pretty standardized. You could just all a flag to the 2nd cell I think. 
Or if 0-3 are local GPIOs, then make remote ones a different range.

Rob

