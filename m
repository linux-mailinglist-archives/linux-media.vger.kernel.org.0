Return-Path: <linux-media+bounces-32713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECEABAF03
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 11:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF7C33B92EA
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 09:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC4D2139B1;
	Sun, 18 May 2025 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4s2czQ9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9553213254;
	Sun, 18 May 2025 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560399; cv=none; b=Ty4dKKzrpYibQPm32WNPkkyI1+jKf3GJKYIdOhntwrHh69q+ahJFCQ2WRoQIA8H+AulDJOkHwP7F1cLIQFG2QD4ASG2mcbNf+31e4KhXnIhrk/Hbyua2+XSkXMP+ur8d0K3gmsFnOnE8G1PxdolKxvcxz97PBCnjTpLB2XCLa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560399; c=relaxed/simple;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pV+ATwzwKp++73CxOd7PJ6vI74oUqcqMgVCk1dHermuR57XTpkxZ39PEe1iHujobc7R4ojZWVgVkJDr4Wf8QPUiLiEEDoZFuixD7bmlpI0al6h/t8dsdo39j8zknNZ7/mQPid3g3LQZt5NpI7eCveLDv3hCVOizD+FVlrFMFtFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4s2czQ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E23C4CEEB;
	Sun, 18 May 2025 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747560398;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=K4s2czQ9tW/l01T0VEU5VjFciPsQyLsrH8qCaQI3woWIwNqnkFDNayY216wnoT7gQ
	 3qpwQhTRPQ/Hb+5VeqNaW+6w3uvL0FA9A2lu9cOFPycGpG65rtgiVq2iJPYQmlffzF
	 gD+Vqjsngl6inAGng7NwryHz87Mdo5DEd1wWN3Vf0yeMr4lOF/rsxDiU1nsuc1st9G
	 1d+yukDy/G/aI7TWHcEYrNRmsLNRCEc3AgIZmo5s26ONA9lG2R+XUVYu5cRNfS9hx/
	 hez/oNpBJhR8cIPp0RC3DgIMDaREybwffbwaBjKoj99dN2sxMpBju1Wdx8OJqANYqn
	 gBdcLmYvXzDFg==
Date: Sun, 18 May 2025 04:26:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Todor Tomov <todor.too@gmail.com>, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
Message-Id: <174755315042.2793587.17691583538434075316.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: Add qcom,qcs615-camss binding


On Sun, 18 May 2025 14:33:07 +0800, Wenmeng Liu wrote:
> Add bindings for qcom,qcs615-camss in order to support the camera
> subsystem for qcs615.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-camss.yaml          | 356 +++++++++++++++++++++
>  1 file changed, 356 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,qcs615-camss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,qcs615-camcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,qcs615-camcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/media/qcom,qcs615-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1524: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


