Return-Path: <linux-media+bounces-26115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B0A33A62
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8F5168A6F
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D726120C48D;
	Thu, 13 Feb 2025 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eag25fEU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29862142E7C;
	Thu, 13 Feb 2025 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739437023; cv=none; b=OVJTkHEn2lobzIEQ1NM87RPQAgwmOWDO8l9l0FyqIbI/cjKW5Jq6a0SMgA3YeqPa/kNrap+PntB+jCREEYB4gxKSphvqLAVjtJAMaGdbXhIAFYznmdWU3lKB7/O4MhTMBAxOyZTmmCeQJOQcN7gwAG8DBmKadKpVVVt6/U2NxIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739437023; c=relaxed/simple;
	bh=leKGUcxLQ1n/vdRAq9/d6YNeVQSfxTGQLV+QXytthp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEBPB+4DyLusJ9wmQ+vXwuIfZTmeaMrGiW/dGkJpUIuMbHV7LWG80V4PqqRashasS0kFwygTI87Ge6g5EUNPBFm3ZJSH16AWmKVXaIx+DUNmOCX8BKm+r2dfIndWLDIvDu0lNqMQPzdtWmcYWzwelQHLoj4wfHE9aWMxxgqBwz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eag25fEU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA55C4CED1;
	Thu, 13 Feb 2025 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739437022;
	bh=leKGUcxLQ1n/vdRAq9/d6YNeVQSfxTGQLV+QXytthp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eag25fEUgVVPMYFmgP7IvMPUyjIm8y6mfwhJVJtng1ubP5b6yqYYE0TCiqTMBthlM
	 rraVe/yCxWBMpg0oDrBjDzwl3xUNaRS0qtATGlA9+72jMQ7YvbfJE+zAmlflnpHVnh
	 5/xlpYWjRokYrq3VQmhxhdXJxvcgrnd1gu8qGkQliAQGan9WNMyb5sMWXce+2iyXOc
	 NQfioJb012pWkkhHoJjefTEKq9YI6P/6XmihgODvOwBhD8c0h9AAD8VqGIu0n8pADa
	 ydQllKA9uo3ab6ysGnMUC0fz+jKUJcnsTalzhA4RALsWUcQnD75qqkdJ0Xrx4gr3J1
	 Vpo6UKHGidqOQ==
Date: Thu, 13 Feb 2025 09:56:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G3E CSI-2 block
Message-ID: <20250213-lovely-parrot-of-realization-ff3ae2@krzk-bin>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-4-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-4-tommaso.merciai.xr@bp.renesas.com>

On Mon, Feb 10, 2025 at 12:45:35PM +0100, Tommaso Merciai wrote:
> Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
> SoC.
> 
> The CSI-2 block on the RZ/G3E SoC is identical to one found on the
> RZ/V2H(P) SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

From/SoB mismatch.

Best regards,
Krzysztof


