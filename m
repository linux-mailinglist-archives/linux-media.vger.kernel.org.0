Return-Path: <linux-media+bounces-38674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2BB1690D
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 00:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2D697B70C1
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 22:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D64221FF4E;
	Wed, 30 Jul 2025 22:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQwR4sJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C646447;
	Wed, 30 Jul 2025 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753914777; cv=none; b=Ofd8w03hQ5JShNw+YNktZd5UGXubc2MrUnM1LzskRxLXs9w8SU8rK9PGKg5Fw9BnnVqw4nv2XwFMSki3hdVkvPyQrZunx6CXgFJtKqpgIXtUawdHqhDBj5tzbK1SacPqXslZ+zBOI15vMzRR2vIf7YEQCZpD1bnhKt5D4F/gxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753914777; c=relaxed/simple;
	bh=0/43Dm4RK7UdosIUmo7svIQx4uE+Zh+QuL+FU3/cTQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+200S9JvB49NXbqpwRQs3o9GDTi2M+61U5wsLLT7X07lhB3AyAhHbHVr4lr9/zGHeY2gdYywO9/XzdCawzTUB5mDg1orajv2QirQQB9Cj78ROydt0lpASR1RhcMA6Hla0a6zNWHisT1uKp7nptAg0HUCA75j1EJG1VYRNc4Hz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQwR4sJ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C0EC4CEE3;
	Wed, 30 Jul 2025 22:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753914776;
	bh=0/43Dm4RK7UdosIUmo7svIQx4uE+Zh+QuL+FU3/cTQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQwR4sJ/m862mqOrAdvJzk2hxXs+VmnR/AdI2v1ii8hVVhzvCb6KpOph7jHSW9Gs6
	 8Fvrr214SrXqZSxrWkZG1VAmv4miciKP1So1gHNZwznBiOeHyVfmACOtQJGy9mRMui
	 X1Lu96SXm/Pf1+1q/t6eZ22+QXMzwFBsMabhv0P4hyFRf+mYXj8LD0WbnoEKLKDc4V
	 tVc71ZeuP9eYYhg8ygroeB/yxAUbB6EcB1EupGv+3K091BIBeOFYesmWuz3Tu1W/Gd
	 OkxbS1M9O3PMDLE3J/btCcEAJfKJNFpfheaASB9Dewgkdqqk05yea44HgRCT2pFQyz
	 IMZrRciZ/5kmQ==
Date: Wed, 30 Jul 2025 17:32:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add OmniVision OV6211
 image sensor
Message-ID: <175391477370.1822046.15775509903227978474.robh@kernel.org>
References: <20250729231454.242748-1-vladimir.zapolskiy@linaro.org>
 <20250729231454.242748-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729231454.242748-2-vladimir.zapolskiy@linaro.org>


On Wed, 30 Jul 2025 02:14:53 +0300, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation for OmniVision OV6211 image
> sensor.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov6211.yaml       | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


