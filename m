Return-Path: <linux-media+bounces-34174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3EACF9AB
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 00:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E753AF8DD
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 22:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFE727F164;
	Thu,  5 Jun 2025 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m92S0lHC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2B916FF37;
	Thu,  5 Jun 2025 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749162565; cv=none; b=bv88NEiezmGn9b3gET2LdZyDvmc5o9QWextz1rDDbdZSUAtYma4pf6W/4EBG9sLcFofULlUhPOhAtoVX43x5fjA0hi9r5h0myTgLAIFWI6du1EonLxfBhbKfPaFIqHzIPZXt2zQ8ReGYsQPe3yFUtyIXQyWqfet6hMw8TVyX1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749162565; c=relaxed/simple;
	bh=Ck2ndFVIwRbrisoQU2Pk8lYEwr1mAg0XCBxIp4O43tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFoHLqhqA7MCef74OP1FvBA37kHq6pwRaDCIOdwSmv7pxovPr1r67OkLofIMDAMd6RMn7LI47YeEtSgBy4l3kbiJBRs30zcjzofWcJVSpSiNNhEcTg7BL4AqQnCR4gcrsH90utGbR9s2rk2/G7jVONErxpqpnqoF9ss6opAF11k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m92S0lHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CFAC4CEE7;
	Thu,  5 Jun 2025 22:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749162564;
	bh=Ck2ndFVIwRbrisoQU2Pk8lYEwr1mAg0XCBxIp4O43tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m92S0lHC2gBK/PnDONZNqUrlQ9ADLbPOY2E734Auygx1bQ2cLH0rkvp6pWfCJsxOq
	 d3AZh/AJDlb7S1X0xG/DIPTfM06sDBfCvQKOy727cWUXPj8/hZoEaCjrjP7xZ1Di6W
	 wagiJYxQ5w2reU31AeIMOgubPDARp82Yik9snG26eDciAfEuMfiBBtFG3xhx8WIpOO
	 9oYgvfoKX7mmwrJHn8XjHMIzAPS8asNK7/Jk3DvLm4Dsk8061nUvU5P0nOMyVnl52E
	 LFBQXE8fGNeuZKeuxrXdTpVD6KXSxljPp4ifi5tPY+SZVDn2hPL7hoUyC8IZD7XyrR
	 BL9Iu+W0wmHHw==
Date: Thu, 5 Jun 2025 17:29:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dt-bindings: media: renesas,vsp1: Document
 RZ/V2N SoC
Message-ID: <174916255889.3368230.11517795815112299741.robh@kernel.org>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Fri, 30 May 2025 16:41:48 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The VSPD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/V2N SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


