Return-Path: <linux-media+bounces-49654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC42CE85E6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 00:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13FFE3019BA5
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 23:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CF12FCC01;
	Mon, 29 Dec 2025 23:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0w8VBZH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343482FB998;
	Mon, 29 Dec 2025 23:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767052695; cv=none; b=ennQdH4hweLxw3Tay+TYLwubtxvnnJGz5TR0HvonY0H72fXVK24UbfSNzMuQiXQrA6PnobneifSpa/r89rJxQ3AO0O5fjcoNUORp8gz6gLGG181Ud1urRnrYKIpXogkZWc4L+DZMJPMDsDpm01bipNDga4P0Twx6Yy8VXpXHqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767052695; c=relaxed/simple;
	bh=CvpjQwoa8YmBcftDCSze8y5v/sHXB91HXwLMDGnXnzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6fb6xWIGSkKDqgxJqYFjgZFH6tBEVzvJ3IxrN1XnC49u8q8L3bO8+VKK0O6l+wiVYAMKENqwglKBL/Be6v9jdM5fJHnYs82DJ+5MmjeoCY7POsdIzIC0MTpHXGJvm/Fn7GUoPq1Rc+2C5JNPBAyKSowtKXQLR85ndAH3gEzxXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0w8VBZH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1489C4CEF7;
	Mon, 29 Dec 2025 23:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767052694;
	bh=CvpjQwoa8YmBcftDCSze8y5v/sHXB91HXwLMDGnXnzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0w8VBZHoiW3tFFA13LiU7f8Iy/QQ/q8s8O5QtKwywNRAdHeF7u/7hRLB0riSUzo8
	 jTZSDKzyjOD0a5liEEtsdI2dXh4SqDcpuU4bqr4xfUtiVJorl7/HHQyqw9WF0XStJ3
	 XJtGvap/VE0QJjxnt5HE2nJ5D4RRvkRXx8glMqC+OyuJrWMUbscmdrxyGPZm+I5McF
	 XOJebZj0ju9224sJslsrBLP49Z9hGEVtjupk6A3Vm37cDRzlikjwihccgELeuAVeIu
	 cIexwsUAeVVhwADk27ROPJZDoDtzsQL7qhylSLYcNh2LYR9tiyGeXFPk5+dcfnDcks
	 F6muvszKd/PTg==
Date: Mon, 29 Dec 2025 17:58:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: vladimir.zapolskiy@linaro.org, hansg@kernel.org, jai.luthra@linux.dev,
	benjamin.mugnier@foss.st.com, tomi.valkeinen@ideasonboard.com,
	mchehab@kernel.org, mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	dongcheng.yan@intel.com, sakari.ailus@linux.intel.com,
	krzk+dt@kernel.org, ribalda@chromium.org, u-kumar1@ti.com,
	devicetree@vger.kernel.org, git@apitzsch.eu,
	linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	conor+dt@kernel.org
Subject: Re: [PATCH V3 3/4] media: dt-bindings: ti,ds90ub960: Add support for
 DS90UB954-Q1
Message-ID: <176705269181.2820796.8454358224639329739.robh@kernel.org>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
 <20251219122955.2078270-4-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219122955.2078270-4-y-abhilashchandra@ti.com>


On Fri, 19 Dec 2025 17:59:54 +0530, Yemike Abhilash Chandra wrote:
> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
> compatible with DS90UB960-Q1. The main difference is that it supports
> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
> port. Therefore, add support for DS90UB954 within the existing bindings.
> 
> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v3:
> - Remove the example added for DS90UB954, as it is just a subset of the DS90UB960 example. (Rob)
> 
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 113 ++++++++++++------
>  1 file changed, 77 insertions(+), 36 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


