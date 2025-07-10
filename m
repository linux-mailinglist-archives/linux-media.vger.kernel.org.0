Return-Path: <linux-media+bounces-37436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BDCB00F57
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2947D5C4DE7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA0B2C08D7;
	Thu, 10 Jul 2025 23:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVERgpsU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED342BE05F;
	Thu, 10 Jul 2025 23:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189049; cv=none; b=Fnt0Dov3U2imqZZZa/v93K2AzVAKtOi+/CtBl4j//VIMRUdh6KzgKUm0DhPrvLbVIUhxOymyuKl60alQf7D9dEFJXEy22pKuzX9GNcZE7Iulpa6hwohvvvceS1c4QP9HpX26ROfqKd5smKWxhc3eSirXNpGJC2GBeTqa4cCQbXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189049; c=relaxed/simple;
	bh=N965oldzaynsqHiCu3/lSMfQ/ZBx4TiQwSTpKC8AfYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmBWTeDe7kmZgCJEjLrmui3oStfsHceioE8GkB4aI0qjv5SEHyW9MiphXLkhbRicxAGXerbAl93ilSV0j7v1wBbGLmcPuWj/KkSJVymTl/ZYgikaBQh38rzqfI9MauneVklg5vRHzHoZATApY5rOZe/V4hKsi1uzCY13PTG3DeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVERgpsU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBDBC4CEE3;
	Thu, 10 Jul 2025 23:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752189048;
	bh=N965oldzaynsqHiCu3/lSMfQ/ZBx4TiQwSTpKC8AfYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVERgpsUTQEtOWWeqb7z+4L/gKJPmT7ZeI8Qau+4ReCOmJa5z0wprFhHXqKsbQJ7I
	 jU+owzuTD7ELBVJWG3KC18cVFSMnEcswAQBdWE90H1ZRwl7TTsBM80gajpdIezhArN
	 nNUuIP0Dg5kU7STptUKLA9JMzVLBCYYSu5PKH9ApICqrlhHOECAm2F/wSdznSWbDOo
	 RZQviw3BablFWFDcrBYsDJ3NtQZna6hxJ2xFkcc+2FEqMzGzOGB1FJB0oGviehvvq6
	 kvg3bYkEWL3h6VHJy5XmYUB0YUcq68R6NlgrVPqQAOkobFFyS5dE4RZNPYX6OwGFhm
	 r9i4vLFxY8JDA==
Date: Thu, 10 Jul 2025 18:10:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <175218904743.55041.14741952814025685889.robh@kernel.org>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-2-laurent.pinchart@ideasonboard.com>


On Thu, 10 Jul 2025 20:46:57 +0300, Laurent Pinchart wrote:
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
> ---
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
>  .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
>  .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
>  .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
>  .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
>  .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
>  .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
>  .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
>  8 files changed, 30 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


