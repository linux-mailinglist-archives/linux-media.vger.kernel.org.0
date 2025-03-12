Return-Path: <linux-media+bounces-28095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23888A5E391
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A64B3189BC6E
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 18:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1140E2571A7;
	Wed, 12 Mar 2025 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRDVx6EL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654C51BD01F;
	Wed, 12 Mar 2025 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741803617; cv=none; b=qICwh45zcpyTMEu/Yh6b/kXJZzfcAK51Vuzz46e8nGpn70PkydcyPbXVJ/NNPjTlYSSc3cGxu3ZxSlRrCQicW6wAW6NxujCcPFF15tgLVJymZZ4p3aqxbAKmtmHRGceqS9oPJ6R2YvA9/efIYO6FdIMX0oWJtEKUy2lxi6MgrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741803617; c=relaxed/simple;
	bh=s+CBHfUJKiD6XbXU4pBoLbV5PYi7tDYYoApHS1ESmVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIDUkIiAd6hp/TLnGCWQN7GuDe3nozbIR/J7neKVEnJcIT5lXMTuB6jOfioPn6D4vQZ9o+Z1qpF+I9ldkoQnzReNw6aMmsrlKAEMAP62jAULmLWdaaKzHkf+tX6ndVlasapO2AgFhQUSUb9aQWeNbbZYYdXrt6PVidrsxyqcQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRDVx6EL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014BDC4CEDD;
	Wed, 12 Mar 2025 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741803616;
	bh=s+CBHfUJKiD6XbXU4pBoLbV5PYi7tDYYoApHS1ESmVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRDVx6ELLnIGPajIveZ5AxcX3uHtI0kgoz+s6zzUvI6MgTxtaSZ5YetJGsdgSJqs3
	 2knoI/zS7oD+s8Sxk9ZBVoH9fqQwTQM+3tIbO1l6kWFDsoPWXV8sHi8/U7i9XpqBtp
	 1t/A9/X0r79AfW77TzVTlvjAyyH2kZugbAi/ZcYf2quDUr605iRadMx1ivTbRVn4c9
	 QhxHMsDmacZkP+uFU+ernfP/8qgWHGqyYv+4KZm1XDQjJcLTZRsedeAT+pWPPBdURk
	 HcQiZbU12fPys/XMAaPP49lflTjZYOpHaLUmQayXRFeOQBlq97W00jtFhXavDfjAa1
	 bjlpd9Gxc4zIg==
Date: Wed, 12 Mar 2025 20:20:11 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-media@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
Message-ID: <xcltpgufdvz3p3uki6xxkvaszkblege5gwixbakxi2v3jhov4f@zdwosub3ajdt>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
 <174177914766.189343.17822607487336311201.robh@kernel.org>
 <ebe9d832-e414-4b67-b78e-f30a7c43a466@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebe9d832-e414-4b67-b78e-f30a7c43a466@linaro.org>

On Wed, Mar 12, 2025 at 08:05:31PM +0200, Vladimir Zapolskiy wrote:
> On 3/12/25 13:33, Rob Herring (Arm) wrote:
> > 
> > On Wed, 12 Mar 2025 02:11:30 +0200, Vladimir Zapolskiy wrote:
> > > Add device tree bindings for Qualcomm SM8650 camera subsystem.
> > > 
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > ---
> > >   .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
> > >   1 file changed, 389 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml: properties:ports:properties: '^port@[0-5]$' does not match '^[#$a-zA-Z][a-zA-Z0-9#,+\\-._@]{0,63}$'
> > 	hint: Expected a valid DT property name
> > 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> > 
> 
> I believe it's a false positive of a regexp unparsed by a regexp, and the warning can be ignored.

Not quite. See properties: vs paternProperties:

-- 
With best wishes
Dmitry

