Return-Path: <linux-media+bounces-38235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B12B0EE37
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 11:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DA2567739
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 09:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978EB28466F;
	Wed, 23 Jul 2025 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kf3q9YBU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D22586EB;
	Wed, 23 Jul 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753262271; cv=none; b=FiQ9OyHoEf7jqXFK2a4YWHTIUUuvjigsUHhdPdPL65XakKXXYUqqhTt74YMvzdPbIP1zCTpKcDfqtU9PbeM4X5HQyB6lsw94sC4QLB/bMD+zKUvxHBnU+CVEXxxc8LRWjIRiO5pw3ZsWxQseJqIjJlFs9mJnEw0CXLMhVNj05n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753262271; c=relaxed/simple;
	bh=OlVeLtr1mN38+yFX+jAt8pKsGYvaHsP65pKiGwEPXAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+lawzVJXutNX03OzOdnqYpfF/beIbEhm5Fo54aevjaWUeT9/1mtLxS6g3B+kJKJrpeojrWIaMcgYVvCnsOJoOKMfR5o6RqZ8JVJIDhgzSi3IA1USw+9T+OmGURhsWSwbN5CrImKLKuFsLb1US138onDsW0NRmnRSMesjqhsau8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kf3q9YBU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA6D98D4;
	Wed, 23 Jul 2025 11:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753262229;
	bh=OlVeLtr1mN38+yFX+jAt8pKsGYvaHsP65pKiGwEPXAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kf3q9YBUmieNCBlK1x1cC4QheRQ1IpJ/DuGjATJNG3sKYrk8iVsaOJTsgocBA/kvs
	 Vdv6yseZdSCWLtTdQCgOQM8w09aJiw1YCV+/rGsgJOdJPi1nSqEYZPKuLINpzQkMwa
	 yTmRY86hayyF8HVFHwqec/4fZcMxOEyx+vaF4oao=
Date: Wed, 23 Jul 2025 11:17:42 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH 0/2] parse horizontal/vertical flip properties
Message-ID: <ryuew3kxnocj6uqq4nadp3kyaxg27rxlrgnaieyy2hlpz5jkd3@iyetnsbfanee>
References: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>

Hi Fabian

On Wed, Jul 23, 2025 at 10:58:28AM +0200, Fabian Pfitzner wrote:
> There are cameras containing a mirror on their optical path e. g. when
> mounted upside down.

How is this different from 'rotation = 180' ?

>
> Introduce two options to change the device's flip property via device tree.
>
> As there is already support for the panel-common driver [1], add it for cameras in the same way.
>
> [1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")
>
> Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
> ---
> Fabian Pfitzner (2):
>       media: dt-bindings: add flip properties
>       media: v4l: fwnode: parse horizontal/vertical flip properties
>
>  .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
>  drivers/media/v4l2-core/v4l2-fwnode.c                             | 3 +++
>  include/media/v4l2-fwnode.h                                       | 4 ++++
>  3 files changed, 15 insertions(+)
> ---
> base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> change-id: 20250718-fpf-media-dt-flip-7fcad30bcfb7
>
> Best regards,
> --
> Fabian Pfitzner <f.pfitzner@pengutronix.de>
>

