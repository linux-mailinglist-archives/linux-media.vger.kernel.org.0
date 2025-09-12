Return-Path: <linux-media+bounces-42475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D1B5595C
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 00:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A96E1C271DD
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 22:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F4A2571DC;
	Fri, 12 Sep 2025 22:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Um4WpDQH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16456254B09
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716911; cv=none; b=Hcpw1u4+yyw9K55N5spTlqIieXd6QWx8WF3Z+7DMwa+vzNDDmndrM8sPMuEKHfFy6F2F15uEd+SO1tYYzbr4fyNZKKWgGatR2GRKaTEdaYSxgaDxAyoeOLZzhNSMylO3KmWPvi0wef1J0vOJf1og6r75l02KS0apjb/feg1SnAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716911; c=relaxed/simple;
	bh=41CPMeB5cMst8rFTr0hIwHXN/45oJmRQ3gqFpa1x3y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yu+epkpY0yUepsWevL2wiPeA7uldB0/kcK0+IHs7h/05kATM+IaNjcBDDpC/9urHKkDfvjzP+85cpK6hZS+aayyB1mq6B2Wq7q835PSung4YlcNhepi6NPMXPbbTFISOX9W9CuyXfXFDl5oaSphYXYVfyH6nQ9l+MO/BHSYUw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Um4WpDQH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=B7vC
	Hc3e+Jy8US7hTTy4b9nsVzGf6UZv+0sVA7/a1y0=; b=Um4WpDQHJJyoDGQGUJlI
	toL1eJ4r/frk7kDy23UEC+FfwIbkQz4MH6fuLgWvXFnQduOCP5AoGVhUs39qkWr3
	9ylizJqtxlvx0xAlC/TQCGxQ8hsYkxw+hVAf6f6dLucBZTPJdQ6qEJ1wAYsPd89B
	t1ZkgBrTCdMg5XVpi/QmQz7vjWDanBQ6xeBdnj8Z40H9V03PzIYAOiK1Q1NKWXvi
	m8+1B6eiVmNMaemuGDOlZEU7TrGi2cyxePRXVPDRhFT0grEQhbQ2gH3hO1q5lmY/
	uY7NwOdVj651c0bX4GJzSW042wt+udthFxosn9FeRvj/aYA4cD0WuEXRh8H9KbNM
	CA==
Received: (qmail 1506839 invoked from network); 13 Sep 2025 00:41:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:41:46 +0200
X-UD-Smtp-Session: l3s3148p1@rqzUW6I+mq0gAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:41:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2.1 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <aMShqlBgHXHIExDC@shikoro>
References: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
 <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Wed, Aug 13, 2025 at 12:49:23PM +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property for camera sensors is discouraged
> in favour of using assigned-clock-rates (and assigned-clock-parents
> where needed). Mark the property as deprecated.
> 
> Update the examples accordingly. In DT examples where the sensor input
> clock appears to come from a programmable clock generator, replace
> clock-frequency by the assigned-clocks and assigned-clock-rates
> properties. Otherwise, just drop clock-frequency.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes since v2:
> 
> - Don't remove clocks property in samsung,exynos4212-fimc-is.yaml
> 
> Changes since v1:
> 
> - Adapt examples in bindings that reference sensors
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--

Can I have this i2c change seperately to avoid dependencies?

Happy hacking,

   Wolfram


