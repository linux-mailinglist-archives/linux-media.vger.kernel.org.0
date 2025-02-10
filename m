Return-Path: <linux-media+bounces-25894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D3A2E968
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83C6F188824B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E261CAA76;
	Mon, 10 Feb 2025 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPjhb7as"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB31B414F;
	Mon, 10 Feb 2025 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183373; cv=none; b=cQKaGG3BYnGVYRL3f1GIccffb2ZBxijPYp2eRTNHqQI8txVwzgTo5vhNMb5eXQmzfBwrehc79S8poXnTdzk/0W68b7ihLAuAJZijZIN0d5EEUhNSeQ1KAwWUX2yyQTj5Xs0/DtP+e7ZhlIf1be5Bc0uy48c7z1UABG78oG5Pq8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183373; c=relaxed/simple;
	bh=33TmnyQ62etwSFwnvL/fzHi+qX4T+4T29KP7HM0RYP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dhk1JTdTd2iDqI1rRFDA8IcH90rWpGYo31tvwn3DxcT34k4UrUIodw5/g24vxHHCUvw2efr1DYGPOFdW0FGR6P1qFU/XEEIvRcPT+omt7SI0uS71wwvJiXroxdiVpDF2sWZVt7WyiUY4tbIXU9vlzEpldO0cOtZ8au9f35qQGXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPjhb7as; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E2CC4CED1;
	Mon, 10 Feb 2025 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739183373;
	bh=33TmnyQ62etwSFwnvL/fzHi+qX4T+4T29KP7HM0RYP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPjhb7asSJnPsUiNzzeMLsh4W0FOdcbrjA2v90FR9nMGG6nTkaHRZuAiGK7YjEjJe
	 I6iUGB6Yo0PtwD1LqSd8aDL2J0j+8j7Tn3PFoCwWvkFXa4Z+vo6GhwbwzqeKNcDaZA
	 I/ReN7ESzLG6sF5Cls6YhjZ7wU9kZRolrxhULHFT5mXmdPMXbncAV/0LEygsJEQ5tQ
	 pqQ0lU/fH9a3UMFbKMxudZyjjZGweRkuAHNJghBZEkcvHBS7WZMLfbnEQTQQXhHCfE
	 3sg2jE7tgeU4aNU+Xw0J9ZX9+ZRxjgsGFoJ3JvYDEQ8HGUGbO2/0v0OR0jlTxNgtil
	 GaIOdG+5MfU0A==
Date: Mon, 10 Feb 2025 11:29:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250210-crow-of-famous-drizzle-a4bb03@krzk-bin>
References: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>

On Fri, Feb 07, 2025 at 06:14:58PM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Additional changes:
> - Two phandle properties, 'aspeed,scu' and 'aspeed,gfx', are added for
>   video engine to capture video from sources other than VGA.

Where is the justification I asked for? I made it even with bold font so
you will notice that this justification is required. Are you adding
these properties because you want new features? If so, that's separate
commit. If not, then what is the real reason of adding them?

> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.

Examples are not binding, so that's not really needed to mention.

Best regards,
Krzysztof


