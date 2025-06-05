Return-Path: <linux-media+bounces-34173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B2ACF994
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 00:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8012E17A894
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 22:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DE227E7DD;
	Thu,  5 Jun 2025 22:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJw+PBRM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B7C27FB1C;
	Thu,  5 Jun 2025 22:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749161626; cv=none; b=g5xWSPbV48g64xW1jKYOXlsNGgBDNX49xCrGjSGnP6NnjdSDk3vwHnERAVh/qZ1PXal8s1bcCxhdd84nCa6DLlF/p/OUdJ6XJin39pFLmatxYZUfwQu4XngeW8/hludFicvuWyI1l8dgbkIa/DubcpslFtM6B8kVWYVdtFmiX5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749161626; c=relaxed/simple;
	bh=cfHM7XuTG41wIRtaxWjzm2YjOMYLF8fMqisoZCSZk7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEquvEEMKOBY4AuwovhSWh+LEQ7aJsi30N2zZo4pe+qFXZkos8gt2+9ITVBlwuokIhTa6B1FY7EFqqwd/a43U5XY2ZWc91MgwvOwLt1v7sovtgjHEaVRN+mXmNcj9lfQCPpppnMv7J281zbVJxIfsDEwJ+ikf8FFWaCdYusxlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJw+PBRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E499AC4CEE7;
	Thu,  5 Jun 2025 22:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749161626;
	bh=cfHM7XuTG41wIRtaxWjzm2YjOMYLF8fMqisoZCSZk7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJw+PBRMFw92BE7hNxXJZo9PqDA7lNFV/hf+VHlE10nLkLNQw9zelPZy01JCrm30c
	 1p3rwG7iiOC0ql4f4cFbBDxYVW0K0P9dL+H9m1KefnBvLRn0ErVe9MJXhmVPvC/eQt
	 AsnXL0bbSGhllAw7NAfwjYHAZmFYjPmoG3+IV6h57vd+gxEaBDLvbuYUAsZD9VpiLW
	 80w3bTRmrTRwFi3wOYEMrgEO41uVf5YENhjrAUI072EzRaYwMy7tcN1LGh5tpF4sPg
	 Jav5CtstyRcVyaZNDSb4YpnK8aLSyAPwz6kad5D1WaK4Va99vY9mnxk9ZA9RXjtEbZ
	 MhXurP0PaUahw==
Date: Thu, 5 Jun 2025 17:13:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: renesas,fcp: Document
 RZ/V2N SoC
Message-ID: <174916162021.3346206.14465790950010300605.robh@kernel.org>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Fri, 30 May 2025 16:41:47 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The FCPVD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/V2N SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


