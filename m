Return-Path: <linux-media+bounces-12681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 894938FF629
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 22:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12B12B219FF
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 20:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA0312AAC9;
	Thu,  6 Jun 2024 20:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LD+YRfhG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B6139D1B;
	Thu,  6 Jun 2024 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707334; cv=none; b=oIPjZx3sJq+KYlprSTNQiSji0g0gnVBGF1Q+8zYfx1/fcTuqvjHPSwhq/cdL3h07+xg6C+zdEyd9s3c+RDz0WYjqiExNPYk858sf70foojKH135VbzLlDahTb1ol3Q+pA28QHWhT1poeTZ+o+LQ/4ny+IZPC6TURpJpwUbxqnF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707334; c=relaxed/simple;
	bh=u9RtisMmMn+ZjG24IzqsOIUtptEDDk6+MSwxHBsnOug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U68gYfFzetE4Eemc5POJKcVx9Esi+JZ4+SVjwLwDIWAzb9WEhdlGhd7+WdrQw4dhbKKn2lLFSl1X+MXDUU25NtazUYb5dL4wkwRUFJ3Ut69OsY/5MInbj7cPR62nuiWhcoc/2G21KkG/3Ix5ddLjY71UoeK0xFOrk6QQrGWlFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD+YRfhG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A6AC2BD10;
	Thu,  6 Jun 2024 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717707334;
	bh=u9RtisMmMn+ZjG24IzqsOIUtptEDDk6+MSwxHBsnOug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LD+YRfhGkDfFakzg/UaP1WUMAk9eHSA09cjLeimfUSNvXbi2XErpJDBM57Orf4UwG
	 A/Pe8xgInNrDbFLX/nj0DkRcJfxb/lzzHiVSoBYHlWSycGxu1K4ITvn4xt/wnkYnWa
	 CjxRgb4ze6zjfv+QYDslWfRyEjkmXNCdRfamTOCcYy8lAZsUgnoz1+NuPM/mTb8mJg
	 qPfdbPvY0F17gh0hJcurL1Qcco0i6dI9137gOxMk30027JCt8D8X+lJch81JJar8vp
	 /flKi8j0yuNT8eGZS4UtgeipnVO5GRA8ThLVc+TdgJISqF05Y8cglZmVZWjIlY2yAN
	 y7g8c299YZJdg==
Date: Thu, 6 Jun 2024 14:55:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 RESEND 2/2] media: dt-bindings: renesas,rzg2l-cru:
 Document Renesas RZ/G2UL CRU block
Message-ID: <171770733075.3845428.16512040484618942138.robh@kernel.org>
References: <20240605154115.263447-1-biju.das.jz@bp.renesas.com>
 <20240605154115.263447-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605154115.263447-3-biju.das.jz@bp.renesas.com>


On Wed, 05 Jun 2024 16:41:15 +0100, Biju Das wrote:
> Document the CRU IP found in Renesas RZ/G2UL SoC.
> 
> The CRU block on the RZ/G2UL SoC is identical to one found on the
> RZ/G2L SoC, but it does not support parallel input.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v3 resend:
>  * No change, just rebase.
> v2->v3:
>  * Added Ack from Conor Dooley and Rb tag from Geert.
> v1->v2:
>  * Dropped the description from if/else block.
>  * Dropped driver reference from commit description.
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 

Applied, thanks!


