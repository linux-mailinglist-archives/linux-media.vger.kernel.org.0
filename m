Return-Path: <linux-media+bounces-19433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E838099A655
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 058321C21570
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135FF219C8C;
	Fri, 11 Oct 2024 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqTtpDhM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DDC218D91;
	Fri, 11 Oct 2024 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728656950; cv=none; b=j153wpbkT2YfnAq9u4uf35lFsGpkSuIeLgGVmLzpb2Lg8x0a6rXUMArM+w/uAsVpWi1Gfu0kmSOWZi7S+G5tNqxeHWpt9GTq1g65YhpCu4IDTz14j+wAQqjumNat18SoZ5oz2NU+ZPr2m330EMLPivYvrFx+xmHpIIlVGMBOJKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728656950; c=relaxed/simple;
	bh=x5Yh9ZARIV2G6G4vrTtYlC45ZD0pTEf6aj3oEJa4hpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABiuCRrVZWOGKIkVUyrYL/rFrWpFj/Hs/CWvXNIp4fHa1phk8NZRCpM008NZ9ZQiLvyechWVH17MQxzcZuNVoHPHY6Czjtd4o52vwFi5zYUD3dgCnXh84y470sn9Ltg0v+JcI9r4J4IKimuJ2ecFD4yIVbrZwo3kQt0ps0OUXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqTtpDhM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5565BC4CEC3;
	Fri, 11 Oct 2024 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728656949;
	bh=x5Yh9ZARIV2G6G4vrTtYlC45ZD0pTEf6aj3oEJa4hpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqTtpDhMudcNfXn4+2AIzGFl4B+hCGFhOLfi1nrZI9dX93RK3f1hctLn4rE8+JYB5
	 18QUPCmMRKpB1BNdFm4J4ZD4bTiTnta1UrYWSTn1otbOWhDAyBUKLSxK2YWr4b5niF
	 AQfR/MQmf4yx3HsEX+EXRMojWlPIMXS6XMbLQjHHjmAFnqwa2SJ9I87ICIeGF9Bm6u
	 b9jfYVkmpDn09GyXvZiNGLLeQc8rxgizne3UlhedWoxTKFacJZ5Ov4JGC1QHjh2lmH
	 d6RFRbawDIGxMyOkdtUnRKFYMJNo6rAFrn0vrpnu2Y5S5TQcQ+D09yHT0q8fAWpQZ4
	 motq+D6upjrtg==
Date: Fri, 11 Oct 2024 16:29:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Message-ID: <jcqgsgp4ivbokn545sy2rvfllm3vnygfpbufxagotuicacfmgd@v2hlnohlwzdf>
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>

On Fri, Oct 11, 2024 at 10:14:49AM +0300, Vladimir Zapolskiy wrote:
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        camss@ac65000 {
> > +            compatible = "qcom,sdm670-camss";
> > +
> > +            reg = <0 0x0acb3000 0 0x1000>,
> 
> This is immediately wrong, unit address shall be the same as the address of the
> first value of reg property.
> 
> I still object to the sorting order of reg values dictated by reg-names property.
> 
> There are a few recently added CAMSS device tree binding descriptions, where
> reg values are sorted by address values without a connection to another property
> values, and I believe this is the correct way to go.
> 
> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe from now on
> it should be assumed that all subsequently added CAMSS IP descriptions to follow
> the same established policy.

Heh, sc8280xp introduced entirely different sorting also in interrupt-names.

Just look at interrupts of sm8250 and sc8280xp. Luckily clocks are still
keeping style.

Can you start keeping consistency? All bindings from the same family of
devices, especially if they share something, should have similar order
in lists.

How do you imagine writing drivers and request items by order (not by
name) if the order is different in each flavor?

And such change to randomness in style - sometimes reg sorted that way,
sometimes other, interrupts sometimes like this or like that - should
not come from Linaro.

Best regards,
Krzysztof


