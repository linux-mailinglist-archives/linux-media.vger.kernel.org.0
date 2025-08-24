Return-Path: <linux-media+bounces-40837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E43B32EBB
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 11:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A681B61F05
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 09:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B077F9E8;
	Sun, 24 Aug 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIt6vTRo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834551A08AF;
	Sun, 24 Aug 2025 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756027332; cv=none; b=XImc7zHl7HM4k0ijOcvo19ltiAIZsuUnbea06zmgmz7QaAF8ez/L77f0NeT71uwsJTPNEJ9Ai+NqXA6uVQdMhW21mdE61G1LCT8vPKKLpjyPAt9Lfe3TQV0wvEzioH3OrKd5Bz86/hTg2sarrwWl8yNVgaHC9Vm8pq8AhHG1h5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756027332; c=relaxed/simple;
	bh=BSrIks9doE993hqtU3AnSQoyxwzAEzKk9Xf9CVL3Avg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWGBTIStDV2GUz5sxTSC5Il9MzWevOBihMnXriApV5IXfFzSIkWQqQAaYWJFpQqkh5hS72t1ugBBg1cJfj4eGDB+mbgNXDBlmeSTNQ07Hc3JPcyA1u11IfxMLZZon4sGl6DiaTP1mV+CN5axWy6+h0Oyp0EgaNi9utBOvEsIJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIt6vTRo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C55C4CEEB;
	Sun, 24 Aug 2025 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756027331;
	bh=BSrIks9doE993hqtU3AnSQoyxwzAEzKk9Xf9CVL3Avg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIt6vTRo2nnpWoMByp5YURa1mviX9l0lBJZg+Yxxsw0icptsQZ96+fhTJUYa5ofx1
	 7n3IlI11pFfXIGhWUJAD3+nPXq6VeucyryxRQJ9+8aAvAoCoqFyEDLMuxrxdDWVSfJ
	 RpaQ4mzeofinK6t2uyftzICIQ+S0vzM44KeugJJdtCSBJTG148qZABWw5cX21cW2eH
	 gZfnRWej63eLwA9DCQPAIqnZyZw1WX2ZK8Z3jH2eCZwn8xmZ/R5Zm/n99k3YuhYuEc
	 9K+T9uN8gCaQPugcjeBKhm65hNRRjjwgew3n3X492THofu7LsQcSFbvCV818NQSB41
	 dh2cYw4ZWL1wA==
Date: Sun, 24 Aug 2025 11:22:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aliaksandr Smirnou <support@pinefeat.co.uk>
Cc: jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Subject: Re: [PATCH v4 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20250824-cuddly-cryptic-porpoise-b66b4a@kuoka>
References: <20250822171041.7340-1-support@pinefeat.co.uk>
 <20250822171041.7340-2-support@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822171041.7340-2-support@pinefeat.co.uk>

On Fri, Aug 22, 2025 at 06:10:40PM +0100, Aliaksandr Smirnou wrote:
> Add the Device Tree schema and examples for the Pinefeat cef168 lens
> control board. This board interfaces Canon EF & EF-S lenses with
> non-Canon camera bodies, enabling electronic control of focus and
> aperture via V4L2.
> 
> Power supply is derived from fixed supplies via connector or GPIO
> header. Therefore, the driver does not manage any regulator, so
> representing any supply in the binding is redundant.
> 
> Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>

From/SoB mismatch.

Best regards,
Krzysztof


