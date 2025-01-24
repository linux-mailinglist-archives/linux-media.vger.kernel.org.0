Return-Path: <linux-media+bounces-25253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8832A1B141
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 09:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8FB016AC76
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 08:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB581DB159;
	Fri, 24 Jan 2025 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qABY0aAI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2863C00;
	Fri, 24 Jan 2025 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705744; cv=none; b=taG89exUEeuRVoIRTKwyWe9xEoRS1lJwBoE8QcNcXodlPkVTzxltGJfrT9sjvMvCH/9ziSyABYRB+qiu74o+XBvYJQOKeh4/RNfpyk5Hd5u/K9GS7sI0RuGj3w5OuhybIgYHp073Ew2EQt42kZekxnUF4JczrGNe9AZ5xZl2hl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705744; c=relaxed/simple;
	bh=LAwl+BinqHAnYvA5dT1Hdywnm9VVQUl1fVNfxglzhhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7rKxbLkYmbQm3unIzLEDax3czh/A87WTuQi6xM3dsamlfpPNKBAWH6+GWTW7rNti+cE9F1KyLHmto+r/p/WDtv1UUsMRTIKbCCUjVZysYCqh8Tz5r3akTS4mvIlZgtImPxG6hAziT6vbw6HXOGoUhlo/xE2dx4n8qW9cHFyn1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qABY0aAI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17885C4CED2;
	Fri, 24 Jan 2025 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737705743;
	bh=LAwl+BinqHAnYvA5dT1Hdywnm9VVQUl1fVNfxglzhhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qABY0aAIX3ZpCuMnQd7hTEjs0aN+YfWymFlijRb1GHmarvWKjwDQOjtfhVIIWgzU3
	 OGXzK4+JeW0Xmmq+Jmc2is82k3kSkJLnW+uYpt/oOnltZY0sfH4IHtx9V7mHNrU0im
	 +AEXfn+E7Ma02eSdahAmNiJVtfIw6qyDohHSVkzjQ51O4+EXqgGlFKlcx0r41NkM5m
	 3DhfOmJNqYg3hc8mwX3NdNBQjy0YU3oS2YXuMGGW4daHP6CamZworPufrLTqAU5WK4
	 7Dd5VuWKyftXKINyiqIdgcP6kN+k0PZRGCgoeZh7X6kdce3vgDd9oMg4ZG0iY0yBdQ
	 oObtVdq76PkIQ==
Date: Fri, 24 Jan 2025 09:02:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org, 
	krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com, 
	robert.chiras@nxp.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com, alain.volmat@foss.st.com, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, alexander.stein@ew.tq-group.com, 
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de, 
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH v3 1/4] dt-bindings: media: i2c: Add OX05B1S sensor
Message-ID: <20250124-lumpy-aquamarine-elephant-9045cc@krzk-bin>
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
 <20250124001243.446511-2-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124001243.446511-2-mirela.rabulea@nxp.com>

On Fri, Jan 24, 2025 at 02:12:40AM +0200, Mirela Rabulea wrote:
> Add bindings for Omnivision OX05B1S sensor.
> Also add compatible for Omnivision OS08A20 sensor.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> 
> Changes in v3:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


