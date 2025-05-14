Return-Path: <linux-media+bounces-32485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F03AB6CBF
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37A3416BDDB
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7EF27A12C;
	Wed, 14 May 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWZzg668"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0846F2A1C9;
	Wed, 14 May 2025 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229553; cv=none; b=b/8YNa87MXUsOHY0R8rHv/BbECanTK4dXCNVc9noDGlE4/Y7rNi9oYnhNCLUHujWKtIfyCeZkcDolfI4Pgj1gZJ2gRFjA82ZLbEIT3rd7CQ0rA+tCFZTajdvPIerl9gI92By66iG7YsHain52UaQgcGCydqsAbvmntjpwi2vfV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229553; c=relaxed/simple;
	bh=cnnq57g94l54UnjM46fdpfPBPk8H3QBqNMpDVR2kO/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFGx+V3xD4pjpjG3D1elOIiWgQe1waAdlN2poSjR5zk5P1iWtZfG27g1CG4fO7Ny6KHCgf4HArytN6KyehtmFViQBxi32f3POLp6UpsJvVK3S5fJxDY72/zsRzV+G7Da98vaWHkrawzBtrzBTyN0Y+ERs4xbqSKaP9kWWoBkK6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWZzg668; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B90FC4CEE9;
	Wed, 14 May 2025 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747229552;
	bh=cnnq57g94l54UnjM46fdpfPBPk8H3QBqNMpDVR2kO/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWZzg668kc++3/BpAQC3ilffvDISZ1Hj1LhRW4V1mYZx6OMfJ/0AZI4Be1zmls6zB
	 MVFYRMg/CPcKqx7rmKkAidY96gk03122DZgKd3Aw76aLK6SGkzcOdK+Jr0DcA3VSG9
	 fyP1ZN9r6X+kVlE59GKc4f5NTN5VhIUhBTIfLVYgbE9j4jVPka+8X3lRCH/viClELd
	 XxrL4QlnLuJCHpt6B3retc3bF8aKlOrRfhpHpEuM/kRK8YszkQ/JgUtgGnzY8Decb9
	 G3wilNcOHoFwTvmjW4IhahXhYfYS9MZXPfzPtyJdoDVRBaiuH6xypKOrww3uhtcOhi
	 +jOrtTKd4bOnA==
Date: Wed, 14 May 2025 08:32:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] media: dt-bindings: renesas,fcp: add
 top-level constraints
Message-ID: <174722954894.1965813.472880271049107566.robh@kernel.org>
References: <20250501173411.134130-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501173411.134130-3-krzysztof.kozlowski@linaro.org>


On Thu, 01 May 2025 19:34:12 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Resending because for three months these were not picked up by media
> (still in "New" state).
> 
> Changes in v2:
> 1. Add tag
> 2. Move clocks description to top level
> ---
>  .../bindings/media/renesas,fcp.yaml           | 23 ++++++++++---------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 

Applied, thanks!


