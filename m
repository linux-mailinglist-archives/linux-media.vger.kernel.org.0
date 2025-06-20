Return-Path: <linux-media+bounces-35502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1EAAE2056
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 18:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96C351C23065
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 16:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA272E92A8;
	Fri, 20 Jun 2025 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="sVSHuI/2"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9FB2E6128;
	Fri, 20 Jun 2025 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437959; cv=none; b=SMfJWVjtixc4F8CfFLY6vU1ZvxzBYyVBvNOdpLxHoeoW3rpYVInNxOdbqn033HvIrpnct1HY7HHob9VgArFoxPcFhnzvOdlknke7nUoQ0ameAga4t7cu71Q6RID9qwmByRWCXPC/FqqWxXhrldLRKPuaQokqvvmNaxPVNJFibis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437959; c=relaxed/simple;
	bh=sjdmo97wxzVageV1Bufk8NEDqg1zSfP/KUea3gQa6p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J89lbMFm9+5AqRA91kU1Ke+c9sDmzBLwPDzJNVieyg931fFXFZ6hKWoaVteoYNAIQmtBDGQSy6V5ccRnFS5Blv6n5WgOJFnyYo4gqKfnOgcrchzmuoEgNID9W7+V/cxdJCqr3k7nPACWXgqa3UV5SfU1ZkQ74Raa0iXZW3izjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=sVSHuI/2; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1750437955; bh=sjdmo97wxzVageV1Bufk8NEDqg1zSfP/KUea3gQa6p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVSHuI/2iOlGwjCEICyCER15kqdK+hPh4oqmD5PXI3+uRAISiB7X74TSqxU5cua6B
	 3kpC1eJf+P2ZCJEumR5R5/PR2fuNsS2bQPfJnRE5ngsxXnpN+kE+T14gJeaoZCw+ob
	 klFdIIBYHqJ8lrUBAto5t/VbB6fXdDRvF5/Hf29eER+NTwWDlLOrXMevLszISc2C0j
	 unhLnMBZFWMOG6Q4nq+GVettaEZB2OxXBEl29blcOMlgC4tOVBTM6wbJuagS6dJspJ
	 /R+micm6++S5HCDw8Iu6hyNvtvixXCZbXveYteXGLAuoYyC5s35fkk+ZHNJDPZ6f8b
	 5mbg0yJpOHfNw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 983C6100741; Fri, 20 Jun 2025 17:45:55 +0100 (BST)
Date: Fri, 20 Jun 2025 17:45:55 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] media: rc: ir-spi: allocate buffer dynamically
Message-ID: <aFWQQwbvMLvB5-EH@gofer.mess.org>
References: <20250613112210.22731-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613112210.22731-1-demonsingur@gmail.com>

On Fri, Jun 13, 2025 at 02:21:50PM +0300, Cosmin Tanislav wrote:
> Replace the static transmit buffer with a dynamically allocated one,
> removing the limit imposed on the number of pulses to transmit.
> 
> Add a check to constrain the carrier frequency inside
> ir_spi_set_tx_carrier().
> 
> Switch to u64 arithmetic to ir_spi_tx() when calculating the number
> of pulses to transmit.

Looks good, I've created a PR to have it merged.

Sean

> 
> V5:
>  * add separate patch to solve overflow issues in ir_spi_tx()
>  * avoid overflow in carrier frequency constraint
> 
> V4:
>  * add separate patch to constrain the carrier frequency
> 
> V3:
>  * move the allocation to be done per-TX operation
> 
> V2:
>  * use devm_krealloc_array
> 
> Cosmin Tanislav (3):
>   media: rc: ir-spi: allocate buffer dynamically
>   media: rc: ir-spi: constrain carrier frequency
>   media: rc: ir-spi: avoid overflow in multiplication
> 
>  drivers/media/rc/ir-spi.c | 40 +++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> -- 
> 2.49.0
> 

