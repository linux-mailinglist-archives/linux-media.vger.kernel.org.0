Return-Path: <linux-media+bounces-32487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A20BEAB6CCD
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FC601B66AFE
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FF727A44E;
	Wed, 14 May 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvpneVxJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F752A1C9;
	Wed, 14 May 2025 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229636; cv=none; b=AggXYT5E+Lv09njjNnBSIIBkQeMlKlt8ZMgn823YNG8UOBH2Am04uJ8p9qP8gccqtfTms1Djic9Mq0AGtH+rPjssc31AusWJ6ehqGuP5XFXmcuiAZgglBUnUnDCgAfl9l4ELneqWO6BsMuaHQlLt3gUN4W3SRNekxJ1sOkhbPqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229636; c=relaxed/simple;
	bh=JkZBRUWlAZrD6dJDIWe0/jn+X6h1LP7wJ9CI+0AFqjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f83wBVxTIegJn7uAOGwVy5NH91zOmp4FO2/gVsbJ4mjvOGC7nVFYg8QHqgf+mBGzIF1A92dKLefG+SDLwiyfOIwDcVNgEyhNaKNtTXYoAOqWgr9ND8zP03JuClCfEzffcqmmKN3OBQ4T+E0KcwzanRAqPHVK17rh9oDRuoW3vxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvpneVxJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFBAC4CEED;
	Wed, 14 May 2025 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747229636;
	bh=JkZBRUWlAZrD6dJDIWe0/jn+X6h1LP7wJ9CI+0AFqjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvpneVxJLLjoBoY9CYOFE0wQiZpdBI5rvXfT/Z+p+h2q4LSQTHOrdUNZMJrVmpYGQ
	 ovXqGVejvMRm0mC8Fojfx4D/M5LjJjtXlbFz9E34JsGwj8SBNsr+hwPb+NvRrE6vnY
	 4Ji0WcSkziOpsNvQ58j25ICa27RXZrS434J+EVWDlxUSC2B6Fm2RWKcnfvB54wTcc8
	 Tv+Fxa2Ciy5nvY4UMw3EZRwAeJ/zYjf/T1hDd4Mwv+iBerXBPe+jxSPm72FXz7Tqp6
	 0ZGvgakCPLzabpILkcnC/24Y8bbqLLS2a6PBvWgiYzA0d2ex+1a7wGubc2S+/feEkL
	 Gs9Izvv1eFKyA==
Date: Wed, 14 May 2025 08:33:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH RESEND v2 2/2] media: dt-bindings: renesas,vsp1: add
 top-level constraints
Message-ID: <174722962611.1969176.16342856670669078969.robh@kernel.org>
References: <20250501173411.134130-3-krzysztof.kozlowski@linaro.org>
 <20250501173411.134130-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501173411.134130-4-krzysztof.kozlowski@linaro.org>


On Thu, 01 May 2025 19:34:13 +0200, Krzysztof Kozlowski wrote:
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
> Changes in v2:
> 1. Add tag
> 2. Move clocks description to top level
> ---
>  .../bindings/media/renesas,vsp1.yaml          | 24 ++++++++++---------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 

Applied, thanks!


