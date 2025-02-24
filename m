Return-Path: <linux-media+bounces-26853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C14A42999
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B7D1886828
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 17:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8D6265CBC;
	Mon, 24 Feb 2025 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIOMoRER"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B14F264F8F;
	Mon, 24 Feb 2025 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740417932; cv=none; b=mvrBL3TbEwbLof17maniOpG5JVNiRi2p2FTqsJGWWqAQq03EpPOKZE32L59soI4T5THgM12ao7JGMjaF0q+zB6lQLTKds6C5wzUH8tViAaV5aVLwJGl2ImeKkEJbX8WX9MyXfzCvPgK7Vmr3KNyClAhJiKCfHOIfbu9arCnMDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740417932; c=relaxed/simple;
	bh=qYcMN3Ko28heWw5Ads1GTJbnXl6xOvUbYMWAixU1XM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFm/HvQXkVYIXthvVsrIT2++hZpFu0Pd/AZzj8LEj6bKa2+wyGm2uaqPGINEG/aIR6lDgTqUyi2tCWgHXT6Ocoy5Evz4w0/NO2iwDbOOk6ATJryNMwWONizvPE7NsvF1vcnl+FTGtwCYrdivRjhoFsxXo/lKS1Bd20t1TLw8S6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIOMoRER; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29D3C4CED6;
	Mon, 24 Feb 2025 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740417931;
	bh=qYcMN3Ko28heWw5Ads1GTJbnXl6xOvUbYMWAixU1XM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIOMoRERrJFPSG7+QM9vYAhik6+MyPDcdC8vt1hxWWLg9brUlbTz6qJx72MrtiLPG
	 EU+BWovufRrv1X+sYwsyFr98SeGPtj8BLhnu62yrTIM9HgRB9jVxOr6iKVsWFBi9Sq
	 CuYzrQ5goFMXRQPZ7bBupPNpDiBpCMFKb/Txub8y+yvF8TDKYiF1annfxSsCcBMM8A
	 Hie7HroceCapFgCwkF+scAkX60I5A7iL5RrYB0RP+PF2eHkbYMDVTAWaS1x2c2bvqB
	 HqYzm7p8rlvLyzRt16TCwRuexlvt/bcwAd7F2pmsWSsdJSoY4mfiCC7WY2kTl/0e6P
	 axQfoT7PuUZ2g==
Date: Mon, 24 Feb 2025 11:25:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: devicetree@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/V2H(P) SoC
Message-ID: <174041792821.3555548.17117557422413514673.robh@kernel.org>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>


On Fri, 21 Feb 2025 16:55:15 +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> found on the Renesas RZ/G2L SoC, with the following differences:
> - A different D-PHY
> - Additional registers for the MIPI CSI-2 link
> - Only two clocks
> 
> Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v1:
>  - Dropped empty line as suggested by LPinchart
>  - Fixed minItems into else conditional block as suggested by RHerring
> 
>  .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
>  1 file changed, 44 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


