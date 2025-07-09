Return-Path: <linux-media+bounces-37179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C4AFE268
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 571791C4277C
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 08:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2422701CC;
	Wed,  9 Jul 2025 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F13w1w53"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9323B617;
	Wed,  9 Jul 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049329; cv=none; b=bljRkxYkawxRaAwo1VTzRngJFaGG2yMqvc4iJJhrqSgFg4pw3vNgH/a/T1DoDCPajilCYEMtQNZ3Y5DMsFD6So6Fmd5p/oIbEeX4W2sRWMnHHKTSIPTUs3PwfZUbClDm2JSsqxCyJA1+SflKcntVQlkHFDIC3T+9mxCp2Jy7TSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049329; c=relaxed/simple;
	bh=xPG52BTncWLJdHYh0LU1vnvuC53n+yvO3aaCWoTt3Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcVZsiIkGd8PZwgcTQFhSwpicHcghaHendkDfP7QVMGHwMIszE8oMl+Agy3Lm38eNlUasbq6gU7UD8hSmZOsYFsnkieuZZLTA224iMTAC2O5CNTi1t+/ZnC/EP37in5+Kd10+IObYgpRjvKs+i+aThi2CwlrGyZcga1v1LftJeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F13w1w53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B85C4CEFB;
	Wed,  9 Jul 2025 08:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049329;
	bh=xPG52BTncWLJdHYh0LU1vnvuC53n+yvO3aaCWoTt3Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F13w1w53GQZ4lBKvPLrYV2/FLjRdBTE4rcolvEZtDmup+x2oZ72CAxDyD0A95F9sF
	 OmM/ecsXM1ofjB15NolC+vy6tyuMwxahfsKmzun6eCaI9x7jt9AjbMGGPWiAjNwmvx
	 Yb0RAl/bW85bLydLeBlUHuRdHFFoi3nI3L+Ct7TXfhaaYnyMmUOPCjR7RpKcVBeSR0
	 7nLbDClsEYUGnJhMYf98pTPBZkMJ7kVdf+19pSpg0Q+5pJ09lkmAu0kPzIuo7+TD7+
	 ndm6P/ou65oPtapCENzqvWp33YG8BtIPn/6xNit88dL9p0p3QWPMp0gz1fe/CTfTB7
	 Bqqfc6oYpgR6A==
Date: Wed, 9 Jul 2025 10:22:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: add i.MX parallel CPI support
Message-ID: <20250709-magic-jellyfish-of-inspiration-e78867@krzk-bin>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
 <20250708-imx8qxp_pcam-v3-1-c8533e405df1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-imx8qxp_pcam-v3-1-c8533e405df1@nxp.com>

On Tue, Jul 08, 2025 at 01:48:42PM -0400, Frank Li wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Document the binding for parallel CPI controller found in i.MX8QXP, i.MX93
> and i.MX91 SoCs.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3:
> - use enum at compatible string
> - add ref to video-interfaces.yaml#
> - use cpi as node name in examples.
> - replace csi (Camera Serial Interface) with CPI (Camera Parallel Interface)
> in commit message.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


