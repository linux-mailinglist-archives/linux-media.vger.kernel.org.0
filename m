Return-Path: <linux-media+bounces-21317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD89C591C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 14:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC90E282465
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D60A15853E;
	Tue, 12 Nov 2024 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwFKUhMS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6281713B2A9;
	Tue, 12 Nov 2024 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418035; cv=none; b=Uvf/KeIZvUrDstB60cUlDnJWQeUrqZF+H15KDIzH8AkyVNLrYjmOs67NCgRJB7Z48m6VDp+N2akLF8YQjteFvyah21KKg8LS+2RWaP2zwOnOPYTD9vnzS1uxmBwdFlHcjgn9y07ydoMGeFwwbuPwmuOKh5xIEVNPI8IjVKC68U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418035; c=relaxed/simple;
	bh=xZ21dk7cMlNWEVAjsJWU/xLylGLey9NY6rymtgKTphE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=C5z0O79YofTdIfZfrUv5X5iNOutygawmT3TXS/jbdIAoYoj0CF5BxI2mlsFhsiO2oLXvbzFZnZigY30kO9QSLmoR3Lb38r4eT0ct9q7QEU7IMTxYdUMNeLcLaNrlPQxQluUlenLoUTgmzIPkX1P4gaLd3YdbiKPhItVkmi4Rjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwFKUhMS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F52C4CECD;
	Tue, 12 Nov 2024 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731418034;
	bh=xZ21dk7cMlNWEVAjsJWU/xLylGLey9NY6rymtgKTphE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FwFKUhMSPaUsM6GTxxDJ6lKxiWdea/L7nldkuVtXbJKQHlgjTvmJd9gSVbyqTmi9y
	 cS+GzDg454tupMC5zQi8/ulAXgkxLZMH4PJZwACs3ewFSVRiIAbHC0VmsrgllBjlZv
	 6fWtsAPRVwD5jgRI66XU4iziTycLHLsZDUftRL1qbkxlq8aH3UwbZV5cG+OC9vpDpy
	 iwkACJ4wQGwWtGLOwcXV1eBXTUzzKiAFBnHR7TjpQRQuVXhJ9tFTg3sClpI+B+QaGg
	 yYasFN0/9Fws2m6lsN3YmIkaFLOBy0uuxgveDBkgxc4cO9d/fuHlplbcCaHTmeQWcp
	 +jng6Irl8p2RA==
Date: Tue, 12 Nov 2024 07:27:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>, 
 linux-media@vger.kernel.org, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com>
Message-Id: <173141803295.771794.12897067124135705292.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: qcom,qcs615-venus: document QCS615
 venus


On Tue, 12 Nov 2024 17:17:57 +0530, Renjiang Han wrote:
> Add support for Qualcomm video acceleration hardware used for video
> stream decoding and encoding on QCOM QCS615.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-venus.yaml          | 181 +++++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,qcs615-venus.example.dts:25:18: fatal error: dt-bindings/clock/qcom,qcs615-videocc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,qcs615-videocc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/media/qcom,qcs615-venus.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


