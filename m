Return-Path: <linux-media+bounces-28350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47FFA64CC2
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0AD57A360F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6570237706;
	Mon, 17 Mar 2025 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlFnLTJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB12356AF;
	Mon, 17 Mar 2025 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211191; cv=none; b=lil3RBjs53bhqD5cuCqL/j4qRNxAY/Mhdbvl5InPK+rvqNEbekghuPKm/8kokgE2TZcjCA+lS4jEAC60q8Xp9oe8DoNnO8c1VtZGuAcdk3KdbRGygsbcD8igKclLtcQS0VBsSBXE6m15sRuRRhcy5taPbmDKH+BPnYmdkRzdvmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211191; c=relaxed/simple;
	bh=7+SXMlX6hmCTfttTROODI2TgrkOoMShK1f8P2gq5+qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PY/V7JJhMkjxi1tQVtwmvOjx3WbEusH8V2JZfMMBK2VIitoDCOZSJsgy6J34h5OqMAWr2EruApIR4pbYJiC9SFIo/rGQt3EkeZS1oQ5eTZTMIV6s6hieY8zmlsKB0XRpSt+PEijKy2jDCI5BHkNc8sPe5XSTfvxYsbURs8V1W+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlFnLTJQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F61CC4CEF0;
	Mon, 17 Mar 2025 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742211190;
	bh=7+SXMlX6hmCTfttTROODI2TgrkOoMShK1f8P2gq5+qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlFnLTJQJGz9JhCyyH0X3J/cVltRzAw8eZGp65e+1jGPvleHM0oAGmNx5b0CeNX2g
	 ++JeV8n5Hjfx0vUG6tYLntzUSOd7WPWYQAwCOWl3g2Ln26lS7aN/A5oiUV3dsHfz+E
	 PCUZvaywyebxapti/1jqLokju4pOmIzgTtaeRwW2wKKTgv5NT+Tc58SCL76VE08BSD
	 zGo/ndI+SibQEigMBWTUvF/5vjf06eryaHv4vKV7Br25dvFsQzdhsjlPHgZGzp4/Vt
	 SsHqD0xXtwTwpvdH00M2axZ8O1UlZNeGjbE0fybJ/zzzTe+LyAKqnUpkrZtFZPzXgB
	 P4N236RFG4lQw==
Date: Mon, 17 Mar 2025 12:33:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
Message-ID: <20250317-furry-independent-clam-33db01@krzk-bin>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>

On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas S=C3=B6derlund wrote:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -103,10 +138,14 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - reg-names
>    - interrupts
> +  - interrupt-names
>    - clocks
> +  - clock-names
>    - power-domains
>    - resets
> +  - reset-names

Another point, this will spawn bunch of warnings for no real reason.
Just drop all the xxx-names from properties and from here.

Best regards,
Krzysztof


