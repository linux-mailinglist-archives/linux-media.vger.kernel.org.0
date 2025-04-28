Return-Path: <linux-media+bounces-31152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E470BA9EAE9
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 10:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBFBF3B72A7
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 08:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B662725E821;
	Mon, 28 Apr 2025 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRUXQzyT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64E253F02;
	Mon, 28 Apr 2025 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829496; cv=none; b=so5PdeMaQ6F88qcbUxZ2wPF4aW4SCihhl688ACBHp7yshwCb12gQKsHYVrii6qw82qqpF/BFYhCV0FY/apNFWw2sfJyxy0z72guSyQZWb2yicE2rX8dm6GwVxMoy5dfpTwfrXoRe/iUF7YeN1rLJdwGru6bLzmoickE0t3v+c0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829496; c=relaxed/simple;
	bh=IX7uaMoyrktq0xBAn6VHTtGaVdJeibN2qLU0Auh6A40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFgiaF7dFIL6D91xet3+9HOQAx/puIW/sEfcfnhH6SqAcbKxCwyXf7osqSkgb3TUERsQn9aTtqxt+uydUMhkVssWGL3W5WE4PK650LUKXSLayvMZ1qG35wALbTDeE64/6PQQ8VhE6gW0rXOQmbPRSyzL+c/W8Ce2KDTfCG+2QVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRUXQzyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF8FC4CEE4;
	Mon, 28 Apr 2025 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829495;
	bh=IX7uaMoyrktq0xBAn6VHTtGaVdJeibN2qLU0Auh6A40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRUXQzyTnc5p1UtaD090us0IGEgkFTWdz2PYUoExUp3EEGGLxopgJ5TeQIFOtzgkZ
	 JeaTxIdyMNRV/KBMA9bR+3kQVXHOMdnsWB2b3sM5Hdn4kNjVbPVf9+jRfmdPFNyJZZ
	 6bOiFaCHKXwdqaGPVHB8OqHkxGqtHFaK6/2p0mpw+SWbCEgSJr6/8LCmGJPhIW2VOq
	 bhQRbSL+lj4SMf5aVAJ6qfYDH5gFLUHRUR+q4KeT5ejcoKXbuhPwASvD+8p4gf7Hvr
	 DtZ+0m8N7OoD1jX9Dr6i5VQwEzuzSFOjT3fQSMvoedHFhJrt742n4V/D4yvDi17nL4
	 D/wT1SUYwuZ/g==
Date: Mon, 28 Apr 2025 10:38:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: Add OminiVision 0V02C10
Message-ID: <20250428-spry-mustard-flamingo-78ef4d@kuoka>
References: <20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org>

On Sat, Apr 26, 2025 at 11:35:21PM GMT, Bryan O'Donoghue wrote:
> Extend the ov02e10 bindings yaml to describe the ov02c10 sensor which has
> the same bindings with a different compat string and different i2c
> address only.
> 
> Other differences in sensor capabilities exist but are not expressed in
> devicetree.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> I previously submitted a standalone ov02c10 yaml file but, it was pointed
> out to me by Krzysztof that the ov02e10 yaml has exactly the same bindings
> and we should therefore extend the ov02e10 yaml.
> 
> Link: https://lore.kernel.org/linux-media/da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org/
> 
> The accompanying patch:
> 
> - Updates the overall description to differentiate between the two sensors
> - Adds ovti,ov02c10 compat string
> - Adds an example for the ov02c10
> 
> Once merged we can also merge the ov02c10 driver, which contains a compat
> string requiring yaml description as precursor to merge.
> ---
>  .../bindings/media/i2c/ovti,ov02e10.yaml           | 47 ++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml

There is no such file in recent next (0424) and no dependencies
mentioned, so I cannot verify and I just assume that below:

> +        ov02c10: camera@36 {

makes sense and you are not duplicating I2C address on the same bus.

You should document the dependencies.

Best regards,
Krzysztof


