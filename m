Return-Path: <linux-media+bounces-36944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DBBAFAC02
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 08:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FBB7177E3A
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 06:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45AB279DDD;
	Mon,  7 Jul 2025 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3S/D9bT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799F2797AB;
	Mon,  7 Jul 2025 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751870368; cv=none; b=Sru9uR4wWkfqE17fh3U4C8bnFDGSmAgvVc2rsCRx814f6GFuYd8m3FEoRUepTwpnyB1p+rXDM2z76ppjHvSGKHHcfbhPqKuRsoJH6xyHxTF8Vc51+fKOECswWGtGBJq+ZrM1dU5lJw2LmRXYC2I2FSOlk4TvFDYxgdvFX+erlRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751870368; c=relaxed/simple;
	bh=TzPlmqHpksjD59XhoQtmdhooADnrGWbSHrXKQOKWSZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9dQe0Xa1b8TAaRlJ1KV3qfDuWkY83MP1GhnW0DlCy9VLYdjWwBesqmJF8Ie/SjE7UBs3ZbFRMYuD+prv6wVmHLm4UOkon/V3m8ebEE9RM1saXsFZboeReUibqAEKNv8UJP/0alJkdEFEflVDsxL44Zia9s9qXPdFefg77GEyBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3S/D9bT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32552C4CEE3;
	Mon,  7 Jul 2025 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751870367;
	bh=TzPlmqHpksjD59XhoQtmdhooADnrGWbSHrXKQOKWSZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3S/D9bTsim26m6M33vF5H5dTanb5LpqP4DnbtLz7JyXMqYTyfgSQcGd5JpVQCcfs
	 ZSmjwR+gpxsSvj3IPJWsQpOMTpfCEfuvZIGtbJZSa1H4Rgz91Iw/b5MRf8Qk9FRX/a
	 H3W9chYoO7AA1aDCY/1izHPPCAmxqP6PH+ST24nJZ8wIkPNggnv4y8HmgkkWmNQO5e
	 jc0cGZ1JrDQPNHQpVWMl0CVy24US0Zu62JL/NviEvu26RWFphh9D1JacqySJj9ozLd
	 nJ1hMrA1WG1iryYEjtXuLCzv41jDyY0CaxYEKFbYzgDgpyVhdqC+tryJdIxzMXdubb
	 Bmm9B24IvOXJQ==
Date: Mon, 7 Jul 2025 08:39:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add bindings for the RZ/V2H
 IVC block
Message-ID: <20250707-sweet-delectable-chihuahua-bafce0@krzk-bin>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-3-5c45d936ef2e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704-ivc-v3-3-5c45d936ef2e@ideasonboard.com>

On Fri, Jul 04, 2025 at 12:20:20PM +0100, Daniel Scally wrote:
> +  resets:
> +    items:
> +      - description: Input Video Control block register access reset
> +      - description: Video input data AXI bus reset
> +      - description: ISP core reset
> +
> +  reset-names:
> +    items:
> +      - const: reg
> +      - const: axi
> +      - const: isp
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output parallel video bus
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint

This endpoint here should not be needed, because it is already in the
port schema and nothing more can be added to the 'port'.

Anyway,

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


