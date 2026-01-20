Return-Path: <linux-media+bounces-51107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB5D3C43D
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3948C548CCE
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B3F3E9F76;
	Tue, 20 Jan 2026 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zrb9nNXf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA413A7F67;
	Tue, 20 Jan 2026 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901745; cv=none; b=OAPNwinmdTZPLKCJWl+v752Cv8ZfHq8dcKiVz96fA1RYu+1mJz2ppNB2nf8tH3PMnLNs2eZgNTbZdIz8tH0SRY8QvZAy1dorUFtUX1FSkRrk0tWilWYe7GvuQo7BNlF09U3/xiSefw5c/kKn3u6P6SDSAX2hJ7y2Co5HvDSldUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901745; c=relaxed/simple;
	bh=ptqfUD5PLMIISczLrsvxrCUqIUswyNNGP6+y8QlpWh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT+OJfFgVlyLGsocKeiwcW6EmDKhBPNifDVW5z1MTqzKR7fVQwvxGAYuFD035OCVWLeOCjO4t0H5GOBBt5EK/qWzX5f9/T0KGKy0cfe1rhk3Ti9y8362EjC7Re8MKzEz7CFCs8xuRlzRk6NJb3c/hn90MtPhubxYPABogbmTG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zrb9nNXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A2CC16AAE;
	Tue, 20 Jan 2026 09:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768901745;
	bh=ptqfUD5PLMIISczLrsvxrCUqIUswyNNGP6+y8QlpWh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zrb9nNXfOjFoZpi61rfzo6Q1sugxl1FgLSvw4QNcDGBo+jK+60RfP2HwExqE7/fQr
	 Bq08KJNjAq3kQVden5YdyUW/uAcb8bynP0ccoJcUJxOebgpOWI6RYI1OHn2H5kTACF
	 /RFZguiSrCLnMfVquKBtqGv4tNk7jvsv9As2dE57qJdprxsI6L0KjrOb8iY0vhCgh/
	 Q2Aeke1qt9WfBcp+USUQXXDhoOBvqwy+/5oECTisDAVIPYlcGGnMjozxdHlBTUfS38
	 y2++R+XneWUJXri6FKiZoNREqu/i5/ZnRdrFEG2FP2R0UYnp0RKCUDs2ucsYz/r1c4
	 y7Ip6unGoltEQ==
Date: Tue, 20 Jan 2026 10:35:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com, 
	Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v2 1/5] media: dt-bindings: Add CAMSS device for
 SM8750
Message-ID: <20260120-kickass-taipan-from-hyperborea-e53ea6@quoll>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
 <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>

On Mon, Jan 19, 2026 at 10:42:51PM -0800, Hangxiang Ma wrote:
> +      - description: Registers for RT CDM 1
> +      - description: Registers for RT CDM 2
> +      - description: Registers for RT CDM 3
> +      - description: Registers for RT CDM 4
> +      - description: Registers for TPG 0
> +      - description: Registers for TPG 1
> +      - description: Registers for TPG 2
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5

Same comment as last time - nothing got resolved, nothing got concluded.

And before you claim without supporting arguments "we are not blocking"
let me clarify: yes, you are blocked, because I am not taking bindings
which are known to be incomplete, not finished and already being
changed/worked on.

> +      - const: gcc_axi_hf

Best regards,
Krzysztof


