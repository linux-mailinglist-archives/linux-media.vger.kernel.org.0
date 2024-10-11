Return-Path: <linux-media+bounces-19435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A999A69F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76ED22859DB
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FD4839E4;
	Fri, 11 Oct 2024 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cqh9cYii"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10168405FB;
	Fri, 11 Oct 2024 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728657691; cv=none; b=lMZ4yBdePkEBUr4RguirOIn9l9uqIIsVRzxHdgb1p7XZouNvFAcLdyBqexxRid5dCq8SwfWlTSCVnu70KLlnTY7zodhpISPCCoKmg3znWuWJQ3pUlLmD/lW/NPT0KYBI+2Z9Vcgbl7qAzCEBf4Ul8GXVTzsXMHEBtDBmrin2iS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728657691; c=relaxed/simple;
	bh=Y0MK6Ir1naH6KdRmkyIQkGi5RdptzjZfItnSwsoMv00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUC7z8P4VX/vFi3rYM7wfXTw0cktt0cfSvuKjnoXl+z0vLm5cmRDGs6hPMeBcae6Jeo7oyTmagpQrd+RhSBGBoLTtUEDNIHhqXPzY4fBKTq3/ELurqFK5OrXtZCAO3nASsFE72fK8xr1UzNjVaEviiaUzITVF34vxxjwF1IGfvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cqh9cYii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC59AC4CEC3;
	Fri, 11 Oct 2024 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728657690;
	bh=Y0MK6Ir1naH6KdRmkyIQkGi5RdptzjZfItnSwsoMv00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cqh9cYii9B4DdEJVX9zLDAdWcG/3VUNSV92Z8y2h+dbshUodjcbwa3d6Q8EXKbLf/
	 xy/oxBQz+dGGfq5YldPJ6H9X94o2sSmVvMPmv180t1A6jfarVwdsDM8jSY7+2sgF37
	 h8wTe4tw+oTMFdRalSTxe9gKcrN7zi3xHQkSKD7yWofbStn4JuCNXQgcuZLYvIhKG+
	 grhTFMMyNQWPKhLM/ZiiamT/j2utVRg1oB1xhuguPsp+V0mk7uuf9kOWvDNRRh2jLH
	 ufSAxTXZhBD4c39cHqtOBjX2/1tE6e/jU2w/GiUkeg+pv727iITE8/i35yOZ2cL8mR
	 /216e8mi8SdmQ==
Date: Fri, 11 Oct 2024 09:41:29 -0500
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Message-ID: <20241011144129.GA2295617-robh@kernel.org>
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>

On Fri, Oct 11, 2024 at 09:31:06AM +0100, Bryan O'Donoghue wrote:
> On 11/10/2024 08:14, Vladimir Zapolskiy wrote:
> > 
> > Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
> > qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe
> > from now on
> > it should be assumed that all subsequently added CAMSS IP descriptions
> > to follow
> > the same established policy.
> 
> My preference is sort by address not sort by name => we sort the device
> nodes themselves by address so it seems more consistent to sort by address
> inside of the devices too.

Strictly speaking, the values of addresses are unknown to the binding, 
so you can't sort by address. However, if something is truly a single 
block, then the offsets are probably fixed in order by offset makes 
sense. But when a block is changed, any rule on sorting may go out 
the window since we add new regions on the end.

This one in particular I have to wonder why csiphy is not a separate 
node.

> 
> Which means sorting reg by address and irq too.

IRQs make little sense to sort IMO.

Rob

