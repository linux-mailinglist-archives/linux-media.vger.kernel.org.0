Return-Path: <linux-media+bounces-28764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92660A7120D
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 09:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2AD1171EF4
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 08:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7687C1A23BC;
	Wed, 26 Mar 2025 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gjd2JiN5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEF619FA8D;
	Wed, 26 Mar 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976474; cv=none; b=ccxmBLcOd27TSh5KcYwSMcW38af1imBAEGV8AHzgnICAFpUv8EcR+bbO5E2FK1ACTrHT9utrdWX5PQNoR/3yfdKVBPV9K2+sbysZh9mBTQD+FNLI/W4gO7cW+ZVYC7xXt/XkRtQrf5tDJWGwt5erQ8Ii5r+MLXLm57LAjp70uOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976474; c=relaxed/simple;
	bh=Cv/HmMifyea7NAlVz8PjHghRyG1Kaj1PLfIqdLh/J/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka5oWVkGLX2v2WTCzCjaOP0+fW3TByW0clxCAYB3e2KoPmNvLvdl9vMibvjHh8UMdLM1L9VvFgSvoTjULc+myCQG2oL3xxJ5AjVX461J1PFNE5mbN8EEoInMlJ6HMv/Fw3DcEOWDHmfVfPnvGi7lGe+s420LMDxIekgUSydOJEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gjd2JiN5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4209BC4CEED;
	Wed, 26 Mar 2025 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742976474;
	bh=Cv/HmMifyea7NAlVz8PjHghRyG1Kaj1PLfIqdLh/J/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gjd2JiN5LYm6kxfwZotMRLcmXVKOA6Ci9nWiI6fC5f0QR6cadk9lSz1fNoHKRHZ98
	 S3lLJSvJkUopqEq4AwRJGgvTNm9mWPpsEVGIL8hgwSIUo0PE5mBnHQdZAxvRq/kaEh
	 wbcOFPcCQyerh/skraWZtv/JvR3nhf9EZ479tuFIvhxwZ/qtj0WVH0OdgNsnfPGr/m
	 GEjcgKn8mxgjxHkOlVzpiTC/0RjgSHHRkaqeWfZWJHn594WeBPKxorQAiTy+9CUAL6
	 PfAfYfN3yFfAAQM0X8yBTyaAZsTy3u1q1H04JAFdLZMw2sCtZ+tteVDF9Ht6IGX2+I
	 RTfHUS8ltogrA==
Date: Wed, 26 Mar 2025 09:07:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>, 
	You-Sheng Yang <vicamo.yang@canonical.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add OmniVision OV02E10
Message-ID: <20250326-active-mauve-muskrat-e0fbad@krzk-bin>
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-1-4d933ac8cff6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-1-4d933ac8cff6@linaro.org>

On Tue, Mar 25, 2025 at 02:49:28PM +0000, Bryan O'Donoghue wrote:
> Add bindings for OVO2E10 a two lane MIPI CSI, two megapixel 1080p RGB sensor.

Missing wrapping of commit msg.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


