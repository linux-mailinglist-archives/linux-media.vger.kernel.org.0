Return-Path: <linux-media+bounces-20902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 443039BC8A0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09023283935
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F391CF7AA;
	Tue,  5 Nov 2024 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WS1+4hz+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6218F2F7;
	Tue,  5 Nov 2024 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797563; cv=none; b=knqeBwwZxdmdBLqgG7nicz4ejMhM58OLlqTQ7BF9ZFzbw9TEPBA+euHy6MMdqi4CvM4uwQ9zxeC08SDWXKCVeMt0d7E8VaBdx1NpCZG6Pu1oOgJ2cJMK/opLqjjraN9z2e9OtbcVlKbym7Jfj5gTJemcuoaCVpV3MCIMFb5xsF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797563; c=relaxed/simple;
	bh=GDrGkgkKkKFWd8y1ePnPXiZoFyFPWQH0eSaV5iah2f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNllhWF/n/5uCORuVcpZpzq7GPeS8EXFzenQoQK+r45AeK4nSb5/EnQGSBt5t4N1EAjVLiIi27iBMzIrw3d/wXlZE4no6rmfgMmCoO29u/HQzXRSV4Q/HeSCr6fe/w4d/o4be0iACOOWsUyiOFAqaIs31fJHrxeeQq2emS050lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WS1+4hz+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB98DC4CECF;
	Tue,  5 Nov 2024 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730797563;
	bh=GDrGkgkKkKFWd8y1ePnPXiZoFyFPWQH0eSaV5iah2f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WS1+4hz+FBnCbbuYhdym0r6AnbSbR5LyHs2U4gSrPNv0+8RQSt9pELil70n4xz5hO
	 LlrMg6tgQEMfhR7lILbEbFTrY2aM89H7Hs52yerC/Y4MQ/tiu8YPPsOiuZD9fDg3yn
	 09K727+MPRaRpQMPVWR9FS5p11VjV09BeUeIBcTWQ3HHHEcDIvcWYHpZHr5vQOwdDj
	 G9OjUKg6YSsr+JbrnzbevAHIGEdY4+SydZ/Q+WKKW43tAdvPswyJbDOV/Uw0sFSjzD
	 IGHBuV2GzUPFoT6KNcN0pEbuIeH4dJn6ERG5sOv/rSnFhLWSbB+hnp/5KMjjxqBEOD
	 MZ3TsbL+rZvkg==
Date: Tue, 5 Nov 2024 10:06:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 12/15] dt-bindings: media: add the stm32mp25
 compatible of DCMIPP
Message-ID: <5ummiahsnvp2hx434eqxzic4qtfbys2zkf7ezg6uhwxt7p5a4l@6je6xafal2mh>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-12-b9fc8a7273c2@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-12-b9fc8a7273c2@foss.st.com>

On Tue, Nov 05, 2024 at 08:49:15AM +0100, Alain Volmat wrote:
> Add the stm32mp25 compatible for the DCMIPP.
> The stm32mp25 distinguish with the stm32mp13 by the fact that:
>  - supports also csi inputs in addition to parallel inputs
>  - requires an addition csi clock to be present
> 
> Add also access-controllers, an optional property that
> allows a peripheral to refer to one or more domain access controller(s).
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2:
>   - move allOf after required
>   - reword commit message

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


