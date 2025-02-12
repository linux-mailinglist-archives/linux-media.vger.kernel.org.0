Return-Path: <linux-media+bounces-26081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F4195A32DAE
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 18:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922963A8C81
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 17:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C3925B69B;
	Wed, 12 Feb 2025 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP5UzRIb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900B25A35E;
	Wed, 12 Feb 2025 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739382170; cv=none; b=A87SI5J1I6OmVm3gS9FXWpWRrmhATj25pPfM9bYqj5TGkIhYE7ptBQ+If5wP79cTN2LfZoDbY0728UuokWj17L0AcGJIBEQ/UgoSBGc6sf5q74WbXaFwL+u3R/4CdLAa0nhV61qlZ8A9QM9kVwqBQnuOq1QcdLji74fGJ8clSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739382170; c=relaxed/simple;
	bh=E6cNkiGlM+mx6zXIkY4aYipq6AuI0NUgzbUxRF/cu2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLDANl76LBRvHGnhZsg/Jqpf7TGhk0gpVGgNaHs0zKn2VMDkPgVpSwa4mmIrkdSxz2kULqiKIzeaLFuOmY5t81Yx+7deZ+v7co9zRfDg+A/X2pUspjZ7nW4kRAMzxko73G4XTqzUD7kk3CNjksUHA/tnTQ+GJRYfOQwVxCK4NjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP5UzRIb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D068CC4CEDF;
	Wed, 12 Feb 2025 17:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739382170;
	bh=E6cNkiGlM+mx6zXIkY4aYipq6AuI0NUgzbUxRF/cu2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JP5UzRIb5KM192+wRhzcnaxKiuha2vhyRQkLR5gufA7WOVKOc0NPeT6JMKSBYx3dE
	 s3A1WEpSJSUk4VKHfNhPY/jcAHbG3WQeT5P6Hnt2m7BZYKRCpWHds6zoeoAJqw6Di9
	 klXDYLHo0Vojm54qQRnVAvzxcoCxUg4ZaIMM1BL0LucXcKJjcUoKi1Nitc41HIxnQm
	 khu2tjISsJn001SesC8EMOWg2N7T8ne6wyYV0RLtR+aN3J0hhJxWbgoYOajcyjArvj
	 AvShS7/zUmvsW4ZhcQz87kR/Q2qaLo6uj8n0iipw6e+w+oNd+B/bNQXRUKRuwMrI9z
	 Q8K7avsP2MYkQ==
Date: Wed, 12 Feb 2025 11:42:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
Message-ID: <173938216843.4032489.8940068343377747667.robh@kernel.org>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>


On Fri, 07 Feb 2025 13:29:55 +0200, Laurentiu Palcu wrote:
> Add 'maxim,override-mode' property to allow the user to toggle the pin
> configured chip operation mode and 'maxim,fsync-config' to configure the
> chip for relaying a frame synchronization signal, received from
> deserializer, to the attached sensor. The latter is needed for
> synchronizing the images in multi-sensor setups.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


