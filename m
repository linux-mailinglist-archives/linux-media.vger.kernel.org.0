Return-Path: <linux-media+bounces-41347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86739B3C13A
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 037A27A2CCE
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0108933EAEC;
	Fri, 29 Aug 2025 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2d3bcUX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50D33CEA8;
	Fri, 29 Aug 2025 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486364; cv=none; b=o0BBHE04i1FQFB+SnNtg49YV5yODIYvrj1L90iLpVaeqgOPVrvem88hx+OFK3haOhT/mn5c3etn8JwIvuNzu3WWkbTDEleoBd9ln6xRAVjpkKS/RWGuny0//4KqE7Ho8nLP6/yFvQFy9xbLv0FAPiP9og/21M8bIDg3ocaUmv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486364; c=relaxed/simple;
	bh=6iWGrg8lIE6nrEWZVFb+ILIqRczqtE/L08CgEe7QCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOJeuSZDCA107Q0Rvh3rfggZaNzoSOqeibUPOXdjATJeb9V2oKD39r9iYlW63vLALSohvoM3F7J73NU6eEnNuvDs4gnQGAQMyZEfzgOLsz49/7gzZdErL9c601iH9ti02IRnLLJg/1s010mGfwvS2ya25yEdeQH4iD1rP3nW1Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2d3bcUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AB4C4CEF0;
	Fri, 29 Aug 2025 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756486363;
	bh=6iWGrg8lIE6nrEWZVFb+ILIqRczqtE/L08CgEe7QCUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2d3bcUX/2RhJdXetaddzTQO02hP9VwrPcQso0CRpQvKQdP9+CyAtzqP1k/HSEGLR
	 UtumUOS8iUDpHtALhCG2luwbWk6D+3MYxWyOD29qGF++reAJNvWSIkMWAs8EPx9g0d
	 pgdIw+9t5kmi96kckiRZGIgk3wgisX8SW9a9LDZqGgtmbmZeEXs4wr57qehb/2zzSh
	 Iuqme5uiaaTcxcWtO3kNsYwtyEaQKmzpAwWDAo29O6NcDsiTY72byM9R9jlAc1wKLK
	 gNjMJOZikYCLvyaFaoM4ZuuUhkha4nyUA5TEbZDpTkrp8WmIvOgj6MrRaY0JOjz6YM
	 Q13vby9mAELkA==
Date: Fri, 29 Aug 2025 11:52:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, devicetree@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use
 unevaluatedProperties for endpoint
Message-ID: <175648636241.1003708.4368545914280443801.robh@kernel.org>
References: <20250827194919.82725-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827194919.82725-1-Frank.Li@nxp.com>


On Wed, 27 Aug 2025 15:49:18 -0400, Frank Li wrote:
> The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> additionalProperties with unevaluatedProperties to allow use common
> properties.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


