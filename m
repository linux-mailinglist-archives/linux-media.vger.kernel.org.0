Return-Path: <linux-media+bounces-49653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2084CE85D4
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 00:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14B63301C95B
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 23:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3D02FBDF5;
	Mon, 29 Dec 2025 23:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkDjGwqZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E92E7BCA;
	Mon, 29 Dec 2025 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767052499; cv=none; b=i0Cc59GcCpfW0OE996fLNhVY1f49PrFVVRAXjRULQoZDCQ2SC5KEZIOxXRahRZei6xDM/0JMkm6dykScHYITaJ04J8S9mEStKfWZMRyvX1ur/t6rwmvYM8lUKuhD/9QEfdLe6Sk9h7E9Q1rCjpj4l5lJleXyMAgwvlG2IlXmD7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767052499; c=relaxed/simple;
	bh=PUyoqi6U/hDYNBRF9lhIXwwETlRbDyE8AhsD3VGjbdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmgRIvAzaIIEekzmO5gYzx6ueONoRZ39C7EWBzpsRWx1Fm9X9KuLY6GQY8xw0xoLyhZZDl0KhslvIeYbgIiJgXd6xrnMnxc4JTdeekptXcTGHsapgVjHJnzjfa0i6PMaEkZpdJl7qc20L3SuR18/6JIseBPfkiEPAYHx3CtpG6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkDjGwqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B563FC4CEF7;
	Mon, 29 Dec 2025 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767052498;
	bh=PUyoqi6U/hDYNBRF9lhIXwwETlRbDyE8AhsD3VGjbdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkDjGwqZoDLB/QmN++GifQKLewPWEqaRDcGr3pVu3elRgvts/J+uAxhjFbKx6B3dd
	 uK5d3SVEC4iciy0z6+7bNcORN5VfHq97AeYN61HVZI8HiB3Ae5BLruKmvhB3Nb8k/6
	 WI6NQJ+wyZB4gLE/DUQvpYrAmztAGDXlhnR/Wbi04ZqTYHNrd3ymClyPDeqyBXgiCF
	 Jj3eSgECFklIe4GJuiIECYu44sHnDzy0WQKN1xwap0FF1M9dK6fYvbVfkp7ZbgLQUC
	 tWgVxX2QfwJ8nDD4DJieX4vREPsbVyQls5zfoyEIOLLjorEBQatl2XV3lkLWl5p9bs
	 GRmKrc7DUwEhA==
Date: Mon, 29 Dec 2025 17:54:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	krzk+dt@kernel.org, hansg@kernel.org, dongcheng.yan@intel.com,
	u-kumar1@ti.com, linux-kernel@vger.kernel.org, mchehab@kernel.org,
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com,
	conor+dt@kernel.org, ribalda@chromium.org, git@apitzsch.eu,
	jai.luthra@linux.dev, devicetree@vger.kernel.org,
	mehdi.djait@linux.intel.com, vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH V3 1/4] media: dt-bindings: ti,ds90ub960: Refactor port
 definitions
Message-ID: <176705249711.2817246.10046046202740276325.robh@kernel.org>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
 <20251219122955.2078270-2-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219122955.2078270-2-y-abhilashchandra@ti.com>


On Fri, 19 Dec 2025 17:59:52 +0530, Yemike Abhilash Chandra wrote:
> The current bindings duplicate the port definitions for each FPD-Link RX
> and CSI-2 TX ports. This results in a large amount of repeated schema
> blocks and makes it harder to extend the bindings for new devices.
> 
> Refactor the bindings by introducing shared deftinitions for FPD-Link
> input ports and CSI-2 output ports. No functional change intended.
> 
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v3:
> - Remove the | character from the ports description since preserving formatting is not required. (Rob)
> - Wrap the ports description at 80 characters. (Rob)
> 
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 120 +++++++-----------
>  1 file changed, 44 insertions(+), 76 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


