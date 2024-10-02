Return-Path: <linux-media+bounces-18960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5898CD0E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72B471F24934
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 06:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A3E84E0A;
	Wed,  2 Oct 2024 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRYY1Rbq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ED22581;
	Wed,  2 Oct 2024 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727850063; cv=none; b=CkWCJXYFMwWIFO/Pg39m5rmpDFMgJ6imwzLuBu6nuteKAhJTK9v/TrZ90p2t5V25nq5wb1ECU40earWYDpIZq+OoI1rCaFOiWDjMyHAnh6vOk9BEmoe9oZh20gYx9iW+91vrLn7Y1kuhlVmMPGDDPj2TbAcJjbMIzzO9GgwFmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727850063; c=relaxed/simple;
	bh=GE0pdpKu84/xL8wqM1SJMevuDSgPdzEabdtB/ufiyDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSjojAzeCPjB/ukX8oIpkRhG99KBridQozvloy7si6ln0TZPQUF3PMNpQ+cCRazP3yOT4SVKXP0iianWOYqTF+LxBSYg8IP+08yRodVSVn1swALJKfAehZegSff7yObQF6DrDBbTBPaEJ3nbP7ho0EhRV9yU5289kmNfY8FYd7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRYY1Rbq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5F4C4CEC5;
	Wed,  2 Oct 2024 06:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727850062;
	bh=GE0pdpKu84/xL8wqM1SJMevuDSgPdzEabdtB/ufiyDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRYY1Rbq1h9A/DJuUDhdwPqR7crCogGrTfYyA/J6mk9EhANNzRuR3VGmL2/yBhQjs
	 IZ3harlEHEK2DbEvGd4WfZ7x6F+JW1CDcDG2KVF7xLWk0TM0bBuP5mJ4qU//dWBLQQ
	 8zjTvDN8MpNLiYkTt2tVVEcZaMH1QVxnkpABA2PFWT9/n4XFlKXvq6EZWcClewj7/x
	 5cSPKuf9m2d7Mg5U3rZCt7Dn8EerAuxgW+8gaNhFJarJXLPHemDid388+X0HszRAaZ
	 2IpLpJU0Z9ajYpePMcrMWAUk7DrD39qnDh0HhlDUkON2KOspRi5BRhp9URL+bs0vVG
	 xY02aaW8xcL/g==
Date: Wed, 2 Oct 2024 08:20:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <lbfppnit7d4mkstrlbxgtemjhdu7yno3kjwb7pyfaees6y7v4v@imoqfze6i36r>
References: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
 <20241001-b4-master-24-11-25-ov08x40-v2-2-e478976b20c1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001-b4-master-24-11-25-ov08x40-v2-2-e478976b20c1@linaro.org>

On Tue, Oct 01, 2024 at 02:15:50PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on DT based systems.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov08x40.yaml           | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)

...

> +properties:
> +  compatible:
> +    const: ovti,ov08x40
> +
> +  reg:
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

Drop all three, redundant.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analogue circuit voltage supply.
> +
> +  dovdd-supply:
> +    description: I/O circuit voltage supply.
> +
> +  dvdd-supply:
> +    description: Digital circuit voltage supply.
> +
> +  reset-gpios:
> +    description: Active low GPIO connected to XSHUTDOWN pad of the sensor.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +          link-frequencies: true

Drop, also redundant, unless you provide here constraints from
datasheet.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies

Best regards,
Krzysztof


