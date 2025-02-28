Return-Path: <linux-media+bounces-27189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E4A4923A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB1F93B731A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183311C700F;
	Fri, 28 Feb 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5RTLA1A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3681ABEC1;
	Fri, 28 Feb 2025 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727909; cv=none; b=EsL+FQe/nm991HHaF5ykL6swz5/Ks9b5ZCBD8G0LnswcIhauEiX1l5RYsXdRccEX/CsGIKzloFkAhrPdH4PwlFfF7jKmDTnkcbsaKk+77Q516m6HBiPciyqa3Lp7md/GtiQC3HF3OvTDjVQQsGJZ6NYsNIrn0BGNkMdhZTvHVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727909; c=relaxed/simple;
	bh=0D9P6YhwOxAIWN7+PFlREFxiB7tNgQcmVMx9GdXFmds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/1m4MlwBtCdbgh6PUSu6rzXXTT0193C7s7XqiXs/Zi6yS2uqROe63Zle0ksIcmaSn1/QpVExb3nIz4yKytO6WuJSsWAfJ36QzlwmKPQYtOLTNoa9qnsHrco8sfUU0ghQonIIuEe0wCVvnmiP0n1Dc4CYOvEeNSJWM9NbfDIdBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5RTLA1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48756C4CED6;
	Fri, 28 Feb 2025 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740727909;
	bh=0D9P6YhwOxAIWN7+PFlREFxiB7tNgQcmVMx9GdXFmds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5RTLA1A8mLfA2YbEFmAYDyqZfld6zVIW4fBKsBAE0Ak3WddfaDqjuLqwSvmufY9D
	 6GSdNWfuDPgEwgkUgtd8cY1q3cnwcx2NFJhc/iQZT4SiL2IcmTERPBMwWGzeLCook/
	 zsRO0MNpOGD3B9KDFQ0Y4jw/4RMoNej6A/slQHwU217dd0YMnupglZnL0qQSGUzhSI
	 6174vgASQU6B8z+buCeVnHHUNZr5I2ca8V8RPR0sOwqQOH+G5gY3ew0NHcxFXQC8x7
	 wziZOA56K1ib3XJDwDRlfMZdX6GO1n56a/e3mQUClDLXF87CVL2brQC5TjGooyQfDj
	 FOkOp1aL3OCGQ==
Date: Fri, 28 Feb 2025 08:31:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keke Li <keke.li@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v6 05/10] dt-bindings: media: Add amlogic,c3-isp.yaml
Message-ID: <20250228-mustard-turaco-of-painting-47ec58@krzk-bin>
References: <20250227-c3isp-v6-0-f72e19084d0d@amlogic.com>
 <20250227-c3isp-v6-5-f72e19084d0d@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227-c3isp-v6-5-f72e19084d0d@amlogic.com>

On Thu, Feb 27, 2025 at 03:27:16PM +0800, Keke Li wrote:
> c3-isp is used to process raw image.
> 
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 88 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 94 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


