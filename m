Return-Path: <linux-media+bounces-32410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A41AB58A8
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 17:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022B93A651D
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB9E1AAE13;
	Tue, 13 May 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwJ4JLIW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F351487FE;
	Tue, 13 May 2025 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150281; cv=none; b=Nx0dsfRrkiXHITHEAxPETifYPC3vJfXc+KsIyOjQv+IYIfxMKZRjmYt6ExOb5KJUQwHS8yEe7Rk/AhvIP7GHUvESRpteJwhMNli6lhMKDQ7Wd4o04e/MTx7iFIQ+NSwusXJOrFPZtdfLM+9F/uvpiXYO/PGTwgUnfQKBUfPcyhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150281; c=relaxed/simple;
	bh=JvaQO1aEn0SuAa1MUUg80d1Woxc3lQHL6iBYOlkywxY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bmxrvct05VoiHTCzquB80CvUr7QjEMKcRFF6tI1Iq2KQrCmsdhmtihhh4YDaR+O1O6R3aTW8ZzFG6z3/0357A19yVO4WhdPv8p+2NkZewrqtnkNSWYQ994EKgHyRhava/D+joMa74TaQV+AVysPY9N0yJ0vXCx43SGrfi5GWEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwJ4JLIW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B79CC4CEE4;
	Tue, 13 May 2025 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747150280;
	bh=JvaQO1aEn0SuAa1MUUg80d1Woxc3lQHL6iBYOlkywxY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KwJ4JLIWrB60eZr9Y1IZ/jzp0OBZFHgwtKERN3ZBTS5sj8UF2h0mAMB+OZY77v1td
	 v7QLszk2Ex+P6EheO3ECVFNWzXdBfGSDOc5sjSbT9D579MjuxMdL1uuzOCNWjkE+px
	 YRoBb2H1sbtLTowbKcIYNheglMc1VaQ9MaO3vcpAiG4oyXvpH3AF5hD8sKVncdLL3f
	 PWZzRumJDexEH9gEINR16sgqV4rW/dy+kQiGBcEaBXFl/lGvuogMJsPwV3MaoL0kp3
	 9w3eLsbtZh8GdLesM/iSmLyhfgHiSPy3Wan5jiQ4LnY+c7vy6k7ZIhep6fOi1K6OYj
	 bONSOsGvEIakg==
Date: Tue, 13 May 2025 10:31:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Todor Tomov <todor.too@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Message-Id: <174715027856.2438585.14868581800831556773.robh@kernel.org>
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY
 schema for CSIPHY IPs


On Tue, 13 May 2025 17:39:18 +0300, Vladimir Zapolskiy wrote:
> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
> MIPI C-/D-PHY interfaces on Qualcomm SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml: port: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


