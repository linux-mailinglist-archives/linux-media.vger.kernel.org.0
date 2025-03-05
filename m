Return-Path: <linux-media+bounces-27555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 053A6A4F7D2
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FDD0188F2BC
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348781EDA2D;
	Wed,  5 Mar 2025 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDdN8v02"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A79284D08;
	Wed,  5 Mar 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741159393; cv=none; b=RF8dqVfZj88HeV6h0xHchY5Ydda7rAGThxNeiWAbufoFptWGgf0SBaFGn3IhiDKwUGVhJhEa2b+i7nkIO/4OMlYZzspX1w5dlJzLxtRyfp4+AcN5tqGwZMqrjfafMkkcHPraDATJ/A705luYsBZ1oMjXB0kALT6P9DRPCF7i7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741159393; c=relaxed/simple;
	bh=GvWw8P7+MkJG2CMdbY3bdVHML1jTS8dX315tfxTG+44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSM+HEeArSwpRbgyctWzpTtpaF/9E8ShqGydDp/DBFMlnP0PDJDCOqd9mStYjEQonRagTDEBozlBH1G4iNqWAfyu+LTS84DSZrsFMxcsUJJt0kYpODZEFUEio1HlSnuLcWQFM3yXJNypJLnO4uXz+RXkt45+smJSUqP8EK6HOj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDdN8v02; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223E6C4CEE2;
	Wed,  5 Mar 2025 07:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741159393;
	bh=GvWw8P7+MkJG2CMdbY3bdVHML1jTS8dX315tfxTG+44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDdN8v02bROoYb/bMhHtVI9RLzeetS6j3zFXp2+Re5Sxo8D/Ipy+NWOOum47L9qcg
	 RDjc16EXDbSdHq71oFhLc/7oi790pO/a39wsDv6MmAuvpZkskygAj9RxbkIUQ0LLgt
	 wnFga9io00dhWACS0z2YdK2QEmuWFfEXIcgTGa5YyTfoFjpfwd8Di/+2qNOATSIqXH
	 bXQhINc0qyvKXvWdqzi1Zvu0FwFteGSWEBxkE7gAnUrIn796mV1e1Mj48KWbLzcOnn
	 YgPx0bkiUB0f53FGo8A6ZIJeDyjY+YVKvtfXu4Qbao3LjeU5vZcsB9MynIxxXtyeD/
	 gO+B+LpxGsPyA==
Date: Wed, 5 Mar 2025 08:23:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasiliy Doylov <nekocwd@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Vitalii Skorkin <nikroks@mainlining.org>, 
	Antonio Rische <nt8r@protonmail.com>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Add entry for Onsemi LC898217XC lens
 voice coil driver
Message-ID: <20250305-voracious-outrageous-jaybird-5eae4b@krzk-bin>
References: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
 <20250304-media-i2c-lc898217xc-initial-driver-v2-1-6a463cef3ea8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304-media-i2c-lc898217xc-initial-driver-v2-1-6a463cef3ea8@mainlining.org>

On Tue, Mar 04, 2025 at 10:32:18PM +0300, Vasiliy Doylov wrote:
> Add entry for Onsemi LC898217XC lens voice coil driver
> 
> Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..c15223f063357a8f89cf12f46ebcb7bd062903f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17781,6 +17781,14 @@ S:	Supported
>  W:	http://www.onsemi.com
>  F:	drivers/net/phy/ncn*
>  
> +ONSEMI LC898217XC LENS VOICE COIL DRIVER
> +M:	Vasiliy Doylov <nekocwd@mainlining.org>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git

Drop, unless *you* are committing there.

> +F:	Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml

There is no such file.

> +F:	drivers/media/i2c/lc898217xc.c

There is no such file, either.

Best regards,
Krzysztof


