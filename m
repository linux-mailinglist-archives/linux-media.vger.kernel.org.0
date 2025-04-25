Return-Path: <linux-media+bounces-30989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EECA9C026
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45E551B87F00
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4105A231C9C;
	Fri, 25 Apr 2025 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrOgN343"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9532F2CCA5;
	Fri, 25 Apr 2025 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567683; cv=none; b=jVfZlgFVM+ukvkUY0fuoaCB6cuFhhTDAy8wMA5ZPiHwmFXce1xPYGN1GbHXcf7mg+m5rQgjdWuI/gNkhZs7l5Fmk0XlhCRD0yKDqr8QCab4BF1xxKyo7Dxe6Gmq/V67Di+wR59HSnTzpfbFsKz5UtF7nP9P/+C+VcSSfnFrJEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567683; c=relaxed/simple;
	bh=+Z/GyLY7Y0/ktHgQwu1MvZ+wAxDQGzn307sCugv0wxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWkdOBBu2qG0nu8N6R9U2DyPDmJ7DWc7piyVgZ8bs2guoctJM0SNjEgym+iOVfEdrYb3cudwYAC36gqad0p7XbM9UXoeh86xuBQkXuOfq28klINjfaDejNi5chRSY5G+DtVBBd5DnWLliQ0syawmqciCN6/0tUNSwGuaWF5b0f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrOgN343; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84915C4CEE4;
	Fri, 25 Apr 2025 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745567683;
	bh=+Z/GyLY7Y0/ktHgQwu1MvZ+wAxDQGzn307sCugv0wxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrOgN343F+8SvyBmASs+qd9cxKwkB6TgRYosaXb8+pF/IGRpgBPVVQ/imvii900h1
	 k5sBXWkvNthiWQCZ6HeA2D3l8dqWAzWSoYOKPQXW36tEIlwpJO22fQenc+/jZ5o9uj
	 bL1DdTUZpvZ0i+Yl7Na/b7+LWMnqvyOlUqSz0HDn2PPnnymVXfasj42XEzmzJEusgz
	 5ZzILkSqbtyYBb97qb1zeuKOzG8ie4vVU0b/HiM6rhjlaBt09as4rcLHLlGnWPBjC/
	 bOK0yX+9s9RViVuI8+ubKwg2vV3xifIBHbSQURNFH5e3qlN03P5YDTTefcXGPrDuwu
	 qEwOUf16GHYPQ==
Date: Fri, 25 Apr 2025 09:54:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20250425-grinning-potoo-from-mars-bad749@kuoka>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>

On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
> and BCM2712 / Raspberry Pi 5.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Also:
subject: only one media prefix. You really do not need two prefixes.

See DT submitting patches.

Best regards,
Krzysztof


