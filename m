Return-Path: <linux-media+bounces-35908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E7AE8E7F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 21:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C1417DF3D
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 19:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F052DAFD4;
	Wed, 25 Jun 2025 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxc9OBk5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFB529E0E5;
	Wed, 25 Jun 2025 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879384; cv=none; b=n0bbDLbBxSjJJgdukZtv51DXHAreV79q0QsE+HbhPWkycDCCGKIWazXYD0xfXzoKyUz9eikXKMaXCDoui54lv+J2hlD/J/Ks6zyMoUMOdHXNd2OMAS/3hn24NR0Og3TRZCERBNcfbT0ytotZKQ1OIK5AcIGoyO2y+Jyx5m1CBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879384; c=relaxed/simple;
	bh=lJyhFTuJ2bn202oJ8ZI0ggk8KeMYU2wn0+K2GfvB6QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xr5y8R/l/I97ZW5Nh1AEiKM2O2xFgpT1NlKZS/dnBvAifi+cVIg4oPhEFsTWQ/xoh7CKq6DsC3BrJ61BPTQgfFbiEb9EXd7/ifHjsYC3IZus91gkxZreEhDmnzr4RrI+VIhKI1tbk4G/aN8FwQcGtiXhkjKn522G5ehIkmaLbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxc9OBk5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4D4C4CEEA;
	Wed, 25 Jun 2025 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879383;
	bh=lJyhFTuJ2bn202oJ8ZI0ggk8KeMYU2wn0+K2GfvB6QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxc9OBk5dNVN+NOzkSPzJ4DedenjRdsv8sLs634WixaWQ1lGSi1/TrP7EJbxnV9yi
	 Kw90QSPxq9xuTvVy50cERQ+f3OSvinYTe0q0wEIa8ja96fg3WpZxI0N7sQ+66Y8pZp
	 2o+1TouSlnfeAr4P3kH+60V5r1WTiss2oV0LW5+y6bnkPe0VxBvZBeDQzE1f3vL+Nz
	 c9SzCtw3DAQgcVewcViQwYSJ75n625unDwk7MkWmQFyn/5dOH+44VIxmCKIMBsEhYa
	 qOa5sDMg7UqdqhIR79C7RUiuAWq/OGQycMsDCJdGhHHOEpZT8L1c4TieiD+F+ofB/y
	 UDepFPKMod3fg==
Date: Wed, 25 Jun 2025 14:23:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 5/8] dt-bindings: media: nxp,imx-mipi-csi2: Mark
 clock-frequency as deprecated
Message-ID: <175087938216.2071813.15875759870468220160.robh@kernel.org>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-6-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608235840.23871-6-laurent.pinchart@ideasonboard.com>


On Mon, 09 Jun 2025 02:58:37 +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property, which is already optional, is
> discouraged in favour of using assigned-clock-rates (and
> assigned-clock-parents where needed). Mark the property as deprecated,
> and update the examples accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml  | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


