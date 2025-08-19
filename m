Return-Path: <linux-media+bounces-40283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DBDB2C62F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 15:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D2CF1888512
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 13:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7E53431EC;
	Tue, 19 Aug 2025 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htFVzjby"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E3A2EB84D;
	Tue, 19 Aug 2025 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611363; cv=none; b=VUIk95Lqm6OP0ppzSfyjibX1Lbz9sUc1KYPIY75eS0N/X5ONatE7eg24UP+iGHFvLwZoHSqAh/+Ud9aEy0Pa0swJ0EXID6vMpiI6mGTDHYEsXsgm0mu2rlGFKU+mpavQ0+pwo34rlxINMMxjxEE3I9dLdkhmKMAE24VOveRfhnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611363; c=relaxed/simple;
	bh=pAa6+fogJNC9Vf/6kvb+kw13f83SMQh7YyuSr8yp6CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiE2BGlkIE8b5dgvTwH9e0hYQVmb5fN9f6oFN+EoH0jUBSpNkw/9SOdCtDWbMDGq9aPViYhyG6nxEZlc5IemcP2Catsl72BPOsaY4UK/iMV9Q2vRXjL79HV/76p2Cz9mIeu5jNdCyRSOgx9WF8IK8p06Ab8Vm8w/s0O+tZm5A9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htFVzjby; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4789C4CEF1;
	Tue, 19 Aug 2025 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755611363;
	bh=pAa6+fogJNC9Vf/6kvb+kw13f83SMQh7YyuSr8yp6CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htFVzjby+ptCXERI+Lu1EFm7PWmsWbCkgpy++eEM1lWil6JxmJvktmfFobmbGUkCR
	 lvmL8AmBHBygSX4digY7VVW0PdpYnH9EIhl9QmDzJMICeo5FqLlT55QYvo/ZwpCa0j
	 bcx5BBNzjKkAO48VpLwHfDiOF+6bu3eKH8/0/C3N2fLP0OWs8eS94YkktT5vvFTa2j
	 UCLLJGE4F8LS86x/yKwwILSe5OqsHzYWdOpNbZvpHyvpD2rSC8x9+SeHOImb4ZglTN
	 /Hktw0BFZEQFMXYOz/J+cRrBD3an3LEek+zYYm/le7Whc3BW3PVYbMfRfKekbXyW0s
	 Pk6TXH+rqLW5g==
Date: Tue, 19 Aug 2025 08:49:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] media: dt-bindings: renesas,rzg2l-cru: Improve
 documentation
Message-ID: <175561136132.114786.9601783480091957851.robh@kernel.org>
References: <20250819074849.18696-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819074849.18696-1-biju.das.jz@bp.renesas.com>


On Tue, 19 Aug 2025 08:48:42 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Drop CRU prefix from clocks and interrupts description.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref: https://lore.kernel.org/all/20240909143358.GA2013-robh@kernel.org/
> v1->v2:
>  * Updated commit description
>  * Dropped CRU prefixes from clocks and interrupts description.
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


