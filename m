Return-Path: <linux-media+bounces-48465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68FCAFC11
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 12:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 441923094E23
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 11:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037B13203B5;
	Tue,  9 Dec 2025 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjMIUFxw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DE3016F4;
	Tue,  9 Dec 2025 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765279412; cv=none; b=dIFVignUJiN6785fChYHMVecVbY7CRW2AeM+NR3dgEFoROLS2XDHudFV/njYK3b7ioeaFaNk87t+iqkCaAsSJWEaU0OAf4NtAiDxjl1pvkTSP6oQR1nAGayrXc+YPJ05rQGAoYLlg4Lbw+Dgf1EQcIna0LgaL/U1vEX+X5hrZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765279412; c=relaxed/simple;
	bh=N5oJIVp+4IALpgljQBRJEjliA1jkAOpQR+JVZluWVnc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cJpC/6bMO/z7ypFW5lCcMFDP/JC6MHJZY7ryCh79oVIfl8K87XAH5u5J2KCrBJA8FnhPD9U06LOwMPzTg/GyNpaGhE22qs/omlxqmnC+e+jdsmRGpTIDDLAHB6o1SKkmOXxDs4HV3VCsh28mrhpSc7RMl1n4V3FNv3jitzkIR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjMIUFxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF406C4CEF5;
	Tue,  9 Dec 2025 11:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765279412;
	bh=N5oJIVp+4IALpgljQBRJEjliA1jkAOpQR+JVZluWVnc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kjMIUFxw1fkTw9SBIzFE1S94R3JvpSXq12qXUjtx1/q7EVHAVwAn9fE+QPCtMblGX
	 76v+buU+MAM5cTicAj8bD9ShwNNSmV62z3sYkBFCgtoWDbtSAfTTeG3+uP6FQBB/ss
	 DXWOQGq2/YYiOgA00j8UNS/LjC+D5GE3Bn9Y7vrPVYREuRIHcoOT6LymqzQ42nTuZH
	 eCjTW1gDKisYcCIgNDF/vIrBhJ2B15tZCZCodqD6Dls70L5oTjvRBng0KjQtKJEYBI
	 QQb5/geFjVwwS1lbcqW4shnzy4/A3BkJypks7Gr0gA6VztOv+a+Vx4bhjF6F2kKXys
	 ytKavmzqclXbg==
Date: Tue, 09 Dec 2025 05:23:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dongcheng Yan <dongcheng.yan@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Jingjing Xiong <jingjing.xiong@intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, sakari.ailus@linux.intel.com, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, Mehdi Djait <mehdi.djait@linux.intel.com>, 
 krzk+dt@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20251209100017.302518-2-himanshu.bhavani@siliconsignals.io>
References: <20251209100017.302518-1-himanshu.bhavani@siliconsignals.io>
 <20251209100017.302518-2-himanshu.bhavani@siliconsignals.io>
Message-Id: <176527940928.4137935.15790932269373813508.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add os05b10 sensor


On Tue, 09 Dec 2025 15:30:05 +0530, Himanshu Bhavani wrote:
> From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> 
> Add bindings for Omnivision OS05B10 sensor.
> 
> Add MAINTAINERS entry for Omnivision OS05B10 binding documentation
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
>  .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/i2c/ovti,os05b10.example.dts:44.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/media/i2c/ovti,os05b10.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251209100017.302518-2-himanshu.bhavani@siliconsignals.io

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


