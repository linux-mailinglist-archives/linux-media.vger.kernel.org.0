Return-Path: <linux-media+bounces-20166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7C9ADDEC
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 09:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372791C21963
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A0B1AAE0D;
	Thu, 24 Oct 2024 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaAjK7m7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1659019E97B;
	Thu, 24 Oct 2024 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755712; cv=none; b=UaZ+etIoeWr4SO/Z7BW5HpSi2uWIwtyoXJd91XJRscwG93nOjBdJG3vej7yxFErKzz32mZXYC2WrDJkwd53zcdvqb3SyH1E9vXf2nR0qWo3WaThU40jsqL0OTOCgCCAUgi4W6tBRci5tkpxKetkwXFaek78w7CcLUzNOfsuS6Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755712; c=relaxed/simple;
	bh=Ua9tBHTrpORpuWVXGVnMTsm/OluQSGISJqqykkfb7zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8ulwe2JBKmuX4EANYzyTetjpNH6koyI0kudy2TSSKoSVFVCtpnFtC1ui62g7AVjG+UCpMpZ9OaVrmX2/S8U8D/KF4hq+f93fGUxL3spuLpTKdLgobO2DEaKFue74KuMFZJegKWBZdPeuKoaiTkSNfdbmIPdJvdei0nx1+Z7KU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaAjK7m7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA5AC4CEC7;
	Thu, 24 Oct 2024 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755711;
	bh=Ua9tBHTrpORpuWVXGVnMTsm/OluQSGISJqqykkfb7zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaAjK7m79S1env10bWY8Ob3KJYJeGnSOmCJfe7b8bUM9UQgleW70PIykcibFdP1Y7
	 IkRuMAGBk4jwHzCF/9bUZoAHb0cYEzQo6GiJi0sl/ZeB6b8J7Atc7ZXzZjK0VfuBae
	 hX14U0mN3C/XOWO4kAGZlzhYA8Zhf5RlM9VnWm5EHQHOU+eq+by5dUH4WEQ4022stN
	 NsqYttzS4jNpinIcvCwxSYaO72sW0odQtvAuaG+NBmYrSPXh2aOTBwRpCf0chZuY56
	 +vR91OnvnYmho5Q5gMcNqpz1VuRZwMj+BFMkbceQ1j1PCfbFn3LJkx7TJmCEY3TVQJ
	 fzQdkkdQdYmXQ==
Date: Thu, 24 Oct 2024 09:41:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] media: dt-bindings: adv7180: Document
 'adi,force-bt656-4'
Message-ID: <qekjhuzgyyhyugf7c6qcqckuxtnz64au2eaotbdoly5ucksg2l@5y2va7uaf6ei>
References: <20241023144206.1099622-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023144206.1099622-1-festevam@gmail.com>

On Wed, Oct 23, 2024 at 11:42:04AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The "adv,force-bt656-4" compatible string causes several dt-schema

compatible? Or property?

With above sorted:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


