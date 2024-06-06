Return-Path: <linux-media+bounces-12680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA9D8FF626
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 22:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921221C21A37
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 20:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB34613C67B;
	Thu,  6 Jun 2024 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4wTivRz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDFB139D1B;
	Thu,  6 Jun 2024 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707324; cv=none; b=DdIFstBF+PhXIRzhqk9oRsr9TXiATg86dZ5gqBjPxWsq0x1VVuQhdDCAR6St9uh3N4VY83vsiMBmLGeTASZFdt8z8xHzFpthEfRK2Rww8987CRmA6TZcat86AbEoiHHDWlKRG5KqgSKgsHd1EuqvE7DYS4/Sym2nRHQe9QY9R/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707324; c=relaxed/simple;
	bh=TgOQgGUpNTBqd9y1OH101hAljlKLssmD0iAqE3VpFbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6AEDlUzsJkNnEmjhhzzAnhQG1wYt7oBV1DNVtxTF7pHFXMnL/2neN83KKgaYN/a1P1ju6IVPf1z28Ytco5eX/Tck/hLmG3jzFtKTK1cmUgrACbsjSFF5OoLv+9rz41saW8ZjRGaPv6qYVC//KE5eMpobg+rLBKUP1Dp3lSVXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4wTivRz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DE7C2BD10;
	Thu,  6 Jun 2024 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717707323;
	bh=TgOQgGUpNTBqd9y1OH101hAljlKLssmD0iAqE3VpFbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4wTivRzn9CfjvSU1lYGLq47Lgu/zBLmgij4j/j3lJblgbvN4h9i2USAE1MpF2kTS
	 iKn7o+LUUBt0siXWWxj7O+pSaHdq5pthh9AODIx/l3S3v+XgcpUyVUzBTtTXCvkQQQ
	 DP6NMIvZda5yCsanaSTsc/iv3VQTBXh3FfM4VQw1mLiCwoPRvzYkIeB3ULy8rktIH5
	 bjZu3YtDN8pUHAGel2l98zBqPIOkx6ZaUiOiBWzkvfnTcU0HfP8fpH7zUBDaw6Mth8
	 J0AKBLyq8tWoju2uItxG+NMbPjbzbw9c+6M6BsAKa3tn+Qs9ERAURLGyfTWMPGR/p5
	 N1klVHdB+lFKQ==
Date: Thu, 6 Jun 2024 14:55:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 RESEND 1/2] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/G2UL CSI-2 block
Message-ID: <171770731936.3845029.16595074004713971401.robh@kernel.org>
References: <20240605154115.263447-1-biju.das.jz@bp.renesas.com>
 <20240605154115.263447-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605154115.263447-2-biju.das.jz@bp.renesas.com>


On Wed, 05 Jun 2024 16:41:14 +0100, Biju Das wrote:
> Document the CSI-2 block which is part of CRU found in Renesas RZ/G2UL
> SoC.
> 
> The CSI-2 block on the RZ/G2UL SoC is identical to one found on the
> RZ/G2L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v3 resend:
>  * No change, just rebase.
> v2->v3:
>  * Added Rb tag from Geert.
> v1->v2:
>  * Added Ack from Conor Dooley.
>  * Dropped driver reference from commit description.
> ---
>  Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


