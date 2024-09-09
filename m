Return-Path: <linux-media+bounces-17983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AE97150C
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697892845CC
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 10:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AD31B4C2B;
	Mon,  9 Sep 2024 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4v6sleB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544F1B3F2D;
	Mon,  9 Sep 2024 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725876876; cv=none; b=GPaRCNaSwxaL56EmpSJVpCmA08uJeeHk2ggI5V5ADNw6+gYZf/yI4EmqVVj0NazUaSMoLb+8tf+T7C4jVT2TofCAS9/rDNN0KjffYKT2lGISXUBzAGOG305drSKUbrQ11OeFpCfY5RAh5XJCwug6erSQnmbLS350b5MbHwjbbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725876876; c=relaxed/simple;
	bh=quee2Sfi6OEGLcL66QkEy2Hla+U8BZ52UOC+2+36KKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVhLgdCZ4UqKk1BL/gQx4hN98Eix4zEiCqkdgYcMQnz0+fz1oRosDqSGr2JV2bMPaWmwJb9AOOEJqpUxaKkgR/4tt1fQORYzk5bG8/JXCvR+88AUCued0d0+NbioGp27PLMTT3hhy1Qv5WyeUuuMH0Xhx9IGQzqFofTFnaWlU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4v6sleB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFDAC4CECB;
	Mon,  9 Sep 2024 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876876;
	bh=quee2Sfi6OEGLcL66QkEy2Hla+U8BZ52UOC+2+36KKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4v6sleBYssAuQ4y4wZUSaDocwnuf1dLnq199dn1x/JR0LSRuSWnEMytQf9kW4EYn
	 FgOVT+pwDngCwboQSmFM/lxKPMKnX8SN6yWLBVlPbtvt16Sr5zfLOYy08dPTzhL0mq
	 kH9pBwklytx3VR9GpMiVUJyx/Hj3mKOYvH8NrEkFnaC9GX35K8gIkBdyIL71gHPaAE
	 su5qiyhZ9DJoQ+J/fvrwt8xqRqyvWCj8eiG02A9u/AFQAOOWpoNzAXCkeS80YUNynt
	 momylDS6+ZuOZrePrmpQMFkRKZ/3ZgldTvNZBSftvVhfaqZq0LlEhxvMB3NNNhOYwj
	 4g8aJoK6JkAxA==
Date: Mon, 9 Sep 2024 12:14:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keke Li <keke.li@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v2 3/9] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
Message-ID: <vnn4isdmski5l2so4ktrjcdz2awkwijdhhtikthbdma2a6e3mj@yj5zgpa4e5aw>
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
 <20240909-c3isp-v2-3-3c866a1cea56@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909-c3isp-v2-3-3c866a1cea56@amlogic.com>

On Mon, Sep 09, 2024 at 03:24:13PM +0800, Keke Li wrote:
> c3-mipi-adapter is used to organize mipi data and
> send raw data to ISP module.
> 
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


