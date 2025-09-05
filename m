Return-Path: <linux-media+bounces-41846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A867B45BDB
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 17:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D0C189147A
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 15:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413EE3728B0;
	Fri,  5 Sep 2025 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6Jgl871"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C9309F09;
	Fri,  5 Sep 2025 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084577; cv=none; b=jl/pwDTupAWNBXBZ82/oE1XNzvt6MdIzraqzyTcW0PbLKJHSK5gHOMApCBCVviUI0jSLKaBqquCEo1Eu8sjJph3dWuuuYymmlF3SMBsJXigum5PST8fC+t8DYvsxSQGOMFutg81mFHypKonWXHeWOEI0ksSsFIxKsg8KEmy6GUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084577; c=relaxed/simple;
	bh=0tSTOuBy2edUU22nf2u/6hjfDK4cj0VMfFcTtP7ysrY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bTi+4/IiNPZAuyJcxxesoEjPRNAJBQgKpuptcl4I/cHd1hArlvibkyM0oLfInNTfdYcPGrrOi+WErpZnlqHRrwq1oun6Uc+SDseLML+wH0ItxNo8Ie+8VATXY6CiXzGmDAWfuJ7AzuXApu2mRGqmKvVQ9jZFSbDo2LCKSFrEHN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6Jgl871; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F108EC4CEF1;
	Fri,  5 Sep 2025 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757084577;
	bh=0tSTOuBy2edUU22nf2u/6hjfDK4cj0VMfFcTtP7ysrY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j6Jgl871ZpOGLLTVIGzZAbMETn7GA9+trGgNUUA2jiCbTiQJLwJcSrdD1PCH+4lLj
	 JM3MKCro/j4AU0DKFB2la6zhfv+7RlZzKxoO941U42scBfrYKi9uKfg3dkplvZIWcW
	 7vOfR7Agjjoe7mDcpcElnCfxrudzh7wcTLPhk2JKsoRrYHfcbXMu+Xc2ErXX9RWfm+
	 7EFZxP+46sNGrLn3w2BSSDIOteP/dxgTGfqqFkkGGipddPlZY1RK3m+EZmfblbmytM
	 OQbgRbyx1yIg/v4z66o1S1CoCwGzFcfOQa/cUhe4FOzO4pxz13P/UJ0EulOvY9Y9d1
	 knm2JLTAQvWCw==
Date: Fri, 05 Sep 2025 10:02:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
In-Reply-To: <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Message-Id: <175708448034.930549.7632913810070724509.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation


On Fri, 05 Sep 2025 09:59:29 +0200, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated properties are not allowed ('led-names', 'leds' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250905-leds-v2-1-ed8f66f56da8@vinarskis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


