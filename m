Return-Path: <linux-media+bounces-42644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8DB7E084
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F36486C70
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 07:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E6F30148A;
	Wed, 17 Sep 2025 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R2Krbm7U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D61E2C21C5
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095563; cv=none; b=mMXV5YUtBZWxNA2dCXi3K92WOPG5fKgZ89aa+NSX3H1rHbNTY3oUmegUtqp3tKOqXKSlKje8mZs9vR23oD/UBxpoYIlKYt5J/4YTg1qft16UzE4/zAMSYa0oq7nqHwuUUF5OJQ5/jJh3x6gMpv2plR8ZuY8vhmo0EJUF561EjPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095563; c=relaxed/simple;
	bh=sq+35NiLodqZTUndAQ068vCXGUmPl5MRsZErPDPB4PE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJPF0DSDAPr1AbAa+uTWkbzvddUb6btEtd7C4ntjyrZLs5CK/bX/Eb7r72CCfgoCfWTwvvyNTAjURCPZlftaz98J91nPtPN+TG+ZVrx0FQSnvR/7lJPuxUSV0/7qqr8RYjNYQZlm/H0+P9Dp455zqz2eC3URIwHJGS+ScFtFvPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R2Krbm7U; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9572E4E40CAF;
	Wed, 17 Sep 2025 07:52:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6444A6063E;
	Wed, 17 Sep 2025 07:52:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1A45102F1727;
	Wed, 17 Sep 2025 09:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758095558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ap2y+Npu+kLF/Mrdl1WuStE4nxuZYwysNcBQ5q95FJY=;
	b=R2Krbm7U0/4oorf1biGdW5mKYpGEbYe/25FeznSsZ6Z94DSXAspeBLOFJcukQhLo1NvmUp
	r6kWnLlT1sUnJtIJdL/Y/fxK65YtCCvOGuZyeVfCHHIGMvm/jhOhQ/34nGsmDTv2HCKom7
	PE1qLong5NeYcuvJus3EG7/+aHMPfUI3Id5qcZhAUISqLqFRf/+d1LLBRMfQhwpaSNN+00
	HwMjTZQsYg8iMZnb1n56GBggyn4KnkDnGo+ABUnkMIxr9Sc/qZoduseJpIaAAu2AEMl6jT
	XwsWypEI5qzBUzmTKEc0qkEDzWVEbC5RJGKWl4PI3Gci+tVxPjh9lBY5D1RZ1w==
Date: Wed, 17 Sep 2025 09:52:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Jonas =?UTF-8?B?U2Nod8O2YmVs?=
 <jonasschwoebel@yahoo.de>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 13/23] staging: media: tegra-video: csi: move
 avdd-dsi-csi-supply from VI to CSI
Message-ID: <20250917095215.12c6a7cd@booty>
In-Reply-To: <20250906135345.241229-14-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
	<20250906135345.241229-14-clamor95@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On Sat,  6 Sep 2025 16:53:34 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> The avdd-dsi-csi-supply is CSI power supply not VI, hence move it to
> proper place.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

