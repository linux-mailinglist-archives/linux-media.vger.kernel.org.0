Return-Path: <linux-media+bounces-18437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE6297E3A4
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2024 23:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC1F81C20A97
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2024 21:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B609763EE;
	Sun, 22 Sep 2024 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwHP4ZuY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F356F077;
	Sun, 22 Sep 2024 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727039205; cv=none; b=bGvB8NlntVVelq1pgtQLJCdxwvu56fwfhYjtSYs+iKxG0HBgZAttxHkk17+i0yc3+N6Ua6Ig267zk5DMDaUGDfow672Us20Ue64CkQSspRtKvo6VtMPit6hL6atBfa6hA2P6RX/HIz90fV/UBWwi4Vm3vHGcqBcosIC65FTFE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727039205; c=relaxed/simple;
	bh=0bDiEHTafhursfduV1ZVpisNLRB9KGIhx0y0NnN6AjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqXExLKm47Gt7imj3T1h+z+o4MdxzDKp80tXdq7MNhnIwQLu7kMOPxiT3m8yh8UZAXRpRDrKrfS5Yx65hFeZ+8VPPAb0kCsJuqjNxbjduxGRCAkDACOeVuQ1OBMc18k2O81dbGAXyo/Lw86KVW+Zmz/Q3knrLvVQ8O0btDw5xVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwHP4ZuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD47CC4CEC3;
	Sun, 22 Sep 2024 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727039205;
	bh=0bDiEHTafhursfduV1ZVpisNLRB9KGIhx0y0NnN6AjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwHP4ZuY6eBkiRqe8LeJ2m3tW/AxQwbx8HLRQixK5kVIogeBscRaJHLfRIjLr2MPy
	 klvPp+YGnTbg/YTts6+uG0hDynh6ZC053skZGVhYyFPMcWVquQua9d12VG31guEIHl
	 TplWt/4+aY2Uno6Kqr5nx5ho0ZcBwjonv0YYRo6AVvxhMJ0+vDp4UlmvJ68O4XM5Ux
	 MNbZUcV7QUPoSMetR8CaIWsF4ochvtL1loTE7EOVtYw/A3WeOmTw8ZB9gpSzvHzkLo
	 D7OZag84YxHKmEL0g33ZjEfnQCg+37pOBBWvnxct1UcGmmUxw4IdSqY+X4F8GurJx0
	 J3lvS0n06w36w==
Date: Sun, 22 Sep 2024 23:06:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: media: renesas,isp: Add binding for
 V4M
Message-ID: <bni2gdpp65cigjnodckebirahmwacjzb2so5a42lthagcrjmuh@g4nqyanuz3gr>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240826144352.3026980-6-niklas.soderlund+renesas@ragnatech.se>

On Mon, Aug 26, 2024 at 04:43:51PM +0200, Niklas S=C3=B6derlund wrote:
> Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
> This device is compatible with the CSISP module on the other Gen4 SoCs.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Add to commit message that V4M is compatible with other Gen4 SoCs.
> ---
>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


