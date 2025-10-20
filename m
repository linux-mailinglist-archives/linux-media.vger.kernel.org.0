Return-Path: <linux-media+bounces-45095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E82BF39FD
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 23:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0AA3189497B
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A052E264C;
	Mon, 20 Oct 2025 21:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouIobFV1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4707B2DAFD8;
	Mon, 20 Oct 2025 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994182; cv=none; b=cWEegAObMjsbD7+zp7FzXzpKpAzXM6RtCIhozTzoaMh5iSoyeDGGMOLK7pWyvzj/NJOVANaqPn7sZorZQy0Xii9NEyh5rsTbkplAqk9Fn684v1bmClJTqozjRGoDzXV/ADLsvJ3vKWCNqlGhNty7sYP3S19KttOAXH2q3fyOb3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994182; c=relaxed/simple;
	bh=rl73LAPbGGpQy7mrVVA+/INyZcf/ngN3OHEiLJHKOyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdKsUNXU/eYlexcbSCZntkl2JfZw28nwmVKF69E5H/VHuWXj4zUaoU+anvWHjJJKgFrjQ3iT3Vz+rsNAPgpi8y99xvicID9nM+ItzvGZiN9GjKacqemjoSEnXAduFC0jqkXrQMEHNK7Tx5RC7QDMHrZrVrAdXPPAEFTP4lMzRAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouIobFV1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C28AC116C6;
	Mon, 20 Oct 2025 21:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760994181;
	bh=rl73LAPbGGpQy7mrVVA+/INyZcf/ngN3OHEiLJHKOyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouIobFV1as3wMda6uinjBFim60/TLrtZBzdBaPYle29anpuOkOsF9JdzA1trGarLd
	 tl2iE9I17y6Lx1UxAuU7G9qfiL3fH2e9+fRZwbZMlu1zhZLq2WrvAfihurVHZhuDFo
	 Np6wr4T316XQCHoZiz/pUIn29o1IuLeAl3SaHuxv6ggXklExTb4k9IglCcrPW4DpaC
	 lqwrLkWAlwoa3XXlbsAciYXP6OIDqAmeJ4ce221bxkytn2v4Ieei/0J5luCL0xBb55
	 AlLApvXI0UTV+fqb6Ca7LsKbF3ONvg9sfhsa7kk3+soyEF2iE33Z5hSYRd5snlXFHn
	 NupzmCoh5JWYA==
Date: Mon, 20 Oct 2025 16:02:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: media: convert nxp,tda1997x.txt to
 yaml format
Message-ID: <176099417892.1821164.3923406811640179986.robh@kernel.org>
References: <20251015154817.2500601-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015154817.2500601-1-Frank.Li@nxp.com>


On Wed, 15 Oct 2025 11:48:11 -0400, Frank Li wrote:
> Convert nxp,tda1997x.txt to yaml format
> 
> Additional changes:
> - update audio width to 8, 16, 24, 32.
> - keep one example only.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add empty line
> - add description for matrix's col. add limit for first index. But not
> sure how to limit it to unique id.
> ---
>  .../bindings/media/i2c/nxp,tda19971.yaml      | 162 ++++++++++++++++
>  .../bindings/media/i2c/nxp,tda1997x.txt       | 178 ------------------
>  2 files changed, 162 insertions(+), 178 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


