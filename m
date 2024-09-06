Return-Path: <linux-media+bounces-17756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71996F18B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655B31F23D7E
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CAC1C9EBE;
	Fri,  6 Sep 2024 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Huz3806B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9DB13AD2F;
	Fri,  6 Sep 2024 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618734; cv=none; b=ETtPBhDJUPMd8DjydZEb7Hc7ou2cC0J6rHBEu2ZbTJTygxOoHMqxp934OjuNmv0B055IIfekazkFVgwV1FzlkYjJPKBJ3EvXrWwFx82X2BfHvwyEHiY+dodOXRwaOgcjFk1D458GusQBcdsEkVgMP5h3dpCSfz1m88UT9/Alcj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618734; c=relaxed/simple;
	bh=/24HjU/gwEFKxHeeQqOdh4W01/WQWCFqVP49a9UytYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7aAAvgGW0JTdWOSFAJEVeg+F+Ze7ZOEutFWePbkMKvSWrFqh9soh3hWyJLG63FGxbj/Y5oY+Qk5ro5KLXAKMkAldHOZdcfMTHiFqT+nPaULoE9RjEYyay8HGG42ibOu9LziMvWZ7pNwt6Us362Sd/6FXuAqcOB0X41tbD8JymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Huz3806B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30F7C4CEC4;
	Fri,  6 Sep 2024 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618734;
	bh=/24HjU/gwEFKxHeeQqOdh4W01/WQWCFqVP49a9UytYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Huz3806B5CN7I7hf9LpszjFkClunKKzrxyqtMT7NnJ5R6Ukl/TVz2um2GcByypu82
	 DhAeSvXhbUul02JqAzDjJouURIfX8JKTwiZUmF2bwKfDhDP8GyfrzTBuZEhtl14j9/
	 kH60okv2butr8idFp1odZrMf9SWh5AoeQUgCW/RNn+VeXpMc43/epTIAEj2JBSs9Vl
	 30JfyZOE2QGBvpmzHm2Ltbo7pKGUmQODGkmoRjw5NqaPQFOzEWKZsLU1Ucy+UtaLCZ
	 uoKni+Yzj4p0aXy5fSPyjNEG4TROUjfWtGcaRfTGE7gVMEl+tKF2Usrkt91SdAYah/
	 DazMyRM6VEXog==
Date: Fri, 6 Sep 2024 12:32:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] media: dt-bindings: media: qcom,sm8250-camss: Fix
 interrupt types
Message-ID: <bgbmk6to7klqeamytaziacfsu264iqx2s42qw2fkxozwymmjgf@e46kic7qxhr6>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-4-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905164142.3475873-4-vladimir.zapolskiy@linaro.org>

On Thu, Sep 05, 2024 at 07:41:39PM +0300, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the documented example from CAMSS device tree bindings for SM8250.
> 
> Fixes: 46f8ac8497c5 ("media: dt-bindings: media: camss: Add qcom,sm8250-camss binding")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Subject - drop duplicated media.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


