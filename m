Return-Path: <linux-media+bounces-17754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4796F185
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC67A1F23D4B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5A6157E78;
	Fri,  6 Sep 2024 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwc+oU2s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933CD18893F;
	Fri,  6 Sep 2024 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618703; cv=none; b=EM4lwwXTqKJ9TcTS24BXxc1vnDMx8IxEv0dGjFKrWl7+6xoYGhRHl4lEQQrrf9aDLkSjc/fATLR6rZebQz2EXtAIxJ5gDHnmFr/HqjNw9FTXCl+P3Q5cy05l6jQCYxXKEMUbP96x5UqPywckcNgHTYLuKsPgpmhNJNAVPGJ+hoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618703; c=relaxed/simple;
	bh=2h6h41t5nbgEP7RodPI/A3Vxup4nwbdBiDwtRtTLseQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzO7IL4dfVPEfWR6TA96Q12Hpu4F33/iLpsjLkH4LUPOLF2dff7RWJNM6p1E3K/LnyovFe4m1v1aCooqkCtJH9pRNHoYmrVqW4v7J9X3ZD+/W86k0YMYoGcib6Ju5RYcJtcV2SVEVBOcUtbMNgQhtLOiDA3li5jYvPN7/SCzIhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwc+oU2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62892C4CEC4;
	Fri,  6 Sep 2024 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618703;
	bh=2h6h41t5nbgEP7RodPI/A3Vxup4nwbdBiDwtRtTLseQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwc+oU2sC29PZBRp5TSyQv2xR4HkFWOvUidVO4qn3j4Bme6i1Jh7feadoRsx6pKW8
	 Gz5XLjdH60M7o6wIsvr77mINPa+NcU4IlcA37FFDIlk96yJ0IoEbzeLOTR4V1+Tmcl
	 X6qpWF4a1OLscb7Mu+sTV4Ivq671iCg1LMQx5vgGjumxrefb5Rl5fk4SsiVLL/pdyX
	 ehv0dwDcTHqhVGL1fD72BG+uL6y+Bl2n1a4GLnOydT14I3ovQ3I/6oowF4ojkUJSZf
	 HWFO8soKkXehaj6PMpf0v/Dcq8Le/bbfhnsOxiSud02Ee23HA1rybqrTzBRFyeMjb/
	 qcTcai2vYv+Lg==
Date: Fri, 6 Sep 2024 12:31:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] media: dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
Message-ID: <waedb7xxhlestp7wnik3v3ha5e3ckwwd6wedgm46fh4gb6w75t@edninwbzsmks>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905164142.3475873-2-vladimir.zapolskiy@linaro.org>

On Thu, Sep 05, 2024 at 07:41:37PM +0300, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the documented example from CAMSS device tree bindings for sc8280xp.
> 
> Fixes: bc5191e5799e ("media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


