Return-Path: <linux-media+bounces-30833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A55A9945B
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C1C8468049
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE18293B5C;
	Wed, 23 Apr 2025 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLkanpeT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695F28A3F9;
	Wed, 23 Apr 2025 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423287; cv=none; b=jGS/F2TSuzCUo6NX/T7S8/S+2FxKh460RLFe6RIUzLthLsT60AAL/h5UKdxyZVm7kJSubN+Vt82QIDlA3rwoOYvKVvY2pOwfjPsc19R2cVOCVXtSU4hE9vveaEOUNF0kRjDZX726n5dvCSI2VFQdP7yVe2D8k1GRFXxF3oW96Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423287; c=relaxed/simple;
	bh=5DcVpPECgkbSQ0nAcBf8DQaffV9GGV92rgW5m2idKvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9Zhx8pn5aiMxYm+HQYpiHWHmAMtNQxJFmzVzki/DVlaVKvSHg7g0pU+6616p9G7DYyR5Vj7y8L5EsZntGmq94Hid/fNHGOw8097KjKcWf1mX4qBbpZFqRHtOyHrIQmJAAsXLyNgElxky2NwSOZ4lbcg+UFabUn5nk8cjcjrqvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLkanpeT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05413C4CEE2;
	Wed, 23 Apr 2025 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423287;
	bh=5DcVpPECgkbSQ0nAcBf8DQaffV9GGV92rgW5m2idKvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLkanpeTZS70VJW7EpdKIQenT52kn7xlBrjLHATawX5vtzO8m0/fcO8rDElwBM6qt
	 bB8hT91SbuIde1ndyY9Jr5Fi75CfUYiGJvcE6POG+scRFTwAIUSNFF/hVZDbRiBgTF
	 jhZHSBX3utn1Nr7U2MSEqKfJVjgYLQCgpnc04LgBKbkykEHsFF2JtLo6tQ1X2PHaET
	 HOAXo2mbB0cFyiFdXgbfu8i4bsKI/Mq8TekWmtAeT/7WXzAXhK9hK80fE0I3xu2xyW
	 iaFqUWqvHkmCKzp2Gvm3BvzZCYJIgjY+sx3RbEjeEkzK5u3hfFvx6FRQ6DBuj9AAdJ
	 h3pkzYqjOnuqQ==
Date: Wed, 23 Apr 2025 10:48:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
Message-ID: <174542328482.579641.11792893237596536488.robh@kernel.org>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
 <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>


On Mon, 21 Apr 2025 13:12:34 +0200, Niklas Söderlund wrote:
> Some R-Car ISP instances have in addition to the channel selector (CS)
> an ISP core (CORE )to perform operations on an image stream. The core
> function is mapped to a different memory region and have a separate
> interrupt then CS, extend the bindings to allow describing this.
> 
> On the same SoC different instances of the ISP IP may have, or not have,
> the CORE functionality. The CS function on all instances on the SoC are
> the same and the documentation describes the full ISP (CS + CORE) as a
> single IP block. Where instances not having the CORE function simple
> lacking the functionality to modify the image data. There dependencies
> on the CS functionality while operating the CORE functionality.
> 
> In order for the ISP core to function in memory-to-memory mode it needs
> to be feed input data from a Streaming Bridge interface. This interface
> is provided thru the VSP-X device. Add an optional new property
> "renesas,vspx" to provide a phandle to describe this relationship.
> 
> While adding mandatory reg-names and interrupt-names breaks existing
> bindings the driver itself remains backward compatible and provides CS
> functionality if a single unnamed reg and interrupt property is present.
> Furthermore all existing users of the bindings are updated in following
> work to add these new mandatory properties.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Extend the commit message to make it explicit that different ISP
>   instances on the same SoC (same compatible value) can have, or not
>   have, a CORE function block attached.
> - Update documentation for renesas,vspx property.
> - Update example to cover all new properties.
> ---
>  .../bindings/media/renesas,isp.yaml           | 63 ++++++++++++++++---
>  1 file changed, 55 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


