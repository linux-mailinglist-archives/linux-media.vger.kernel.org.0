Return-Path: <linux-media+bounces-26036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1D3A31F4C
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 07:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5385E1625B1
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 06:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF42A1FE477;
	Wed, 12 Feb 2025 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfUXC0BL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD81FCF62;
	Wed, 12 Feb 2025 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342673; cv=none; b=Khl/6m7kmGOzcslBjLpwdB3ouxCR8g8RM/EHFRg9pTyA9KaxoOeFcLdH6+lISPupa3oo8PQGoGhXAFt7J+LucWF0y9VohWPjDCxpZVUmiJIyZYA0ImJ9/XHz+MvMahyKKuRC7VlErbr6TV0AK1T3vNt1VITp5fjaK3hl6g+wADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342673; c=relaxed/simple;
	bh=Sv9qNL+TN5TjV7dcAh3uCs0tMgt7UdZj63e5XWo0KJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9ZY+SMSF/GeconY578mi4cml/5ou0CNWSxjlc94e4OCnNMdpjJdgJyA9HWzqNAfzkM+ECrwzF+cSmSS/F3OUFxULjMdQ63VBDEjlVEf3kqje3YkYsAhDnHspl+xMTdSI6rKcWvVHCiwD2oZwFcB2No8NMQaMpZY6bzkMnsilnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfUXC0BL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505EEC4CEDF;
	Wed, 12 Feb 2025 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342672;
	bh=Sv9qNL+TN5TjV7dcAh3uCs0tMgt7UdZj63e5XWo0KJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfUXC0BLirlUXBWTvvt0AJzcvF0lHh9wK8R5XaaS+Wl1kkpJ1p251RZ3KuZMnnY4H
	 hHF8g/BHY2ZqEwg9csC76QN/ORdw2gqcmxpwnGKXUNr7EfLik3ayZfaTyNrgtOMGeZ
	 fzH8JvLwuIsqof/UnySBYsbry++vdHDaZ0rj+ifOdJovO0mB6MaYCwdT37ZzMu/me9
	 jqVmmb+GaMwFC1+WfvFoUnehxg6umOkJp3dt7Dwzhm2OYDPWrkVF5t5g43esQPvnAF
	 WaI4tfXxlwkLNy1xuEfxlIuY0638gIUBdtffuu/kBnld5maDpljDOqAn5E4L1lx3nU
	 jhNIek9FoKY+w==
Date: Wed, 12 Feb 2025 07:44:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250212-copper-tortoise-from-hyperborea-8dddcc@krzk-bin>
References: <20250212014711.2181865-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212014711.2181865-1-jammy_huang@aspeedtech.com>

On Wed, Feb 12, 2025 at 09:47:11AM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v5:
>   - Don't put additional changes in this commit.

But it fails then, right? I asked for justification or separate commit,
depending on what is really hapenning here.

Are you sure you tested this? I am pretty confident it will fail :/.

Best regards,
Krzysztof


