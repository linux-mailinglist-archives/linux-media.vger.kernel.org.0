Return-Path: <linux-media+bounces-32719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F83DABB293
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 02:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B07172A9C
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 00:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A4C1EB1BC;
	Mon, 19 May 2025 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5JAQkSI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A451553AB;
	Mon, 19 May 2025 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747612851; cv=none; b=K0XXuR6fEqe5BhsO4yWPg05lYNCCM2SV7iSDw/YwseSrOpmnu1r4x3WrYbDb+K5Jb6sn5GiHWl4NpQoaueEVbRYv4BeIxrg+Xn+/jHiwjHQ4ap/ncPwCwPhR/jVoP7wkXsIuTu127NUdoNlMpEo35/1RhjKqYMUrsIEh/5gECi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747612851; c=relaxed/simple;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iAHRAzdEHFmC7WF9PM/phbc5AfCHBiQCW1bL4qnkOxTiboFLTxsyPSKLzI9ISL0RJfHhMQwFlsH08rlNtMBkuJcgKzDyhKbUajAsKcBlJuGjH0AneYHXp7If1hOPnmThbHIxwdJ8nh+BwPHpQ/wuQ4ql1Zp3uLa+sTDd1vrKrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5JAQkSI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A70C4CEEB;
	Mon, 19 May 2025 00:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747612850;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=f5JAQkSI7l4QPIWImRFRd4datpge6n/1syb9r7ndVca8ckjHUEVHxnhVR0g+qixZq
	 GymsTpMoA96KBZQLYqWRGOzDJM0ljtWQ/5FApqP0NHikIQ+YRlMJpW/5mqBvjh5tQu
	 yXrknD8ptf3wOQ68pRQ+v8/LIf5CoBKLVLz7ly1EvRTa4uKZ/NrXrvRWX7rS1gxIqi
	 AUMmCgTGIbsVvQVdc4chIKC0M5Lk8kl1xPTt5sjOUZtxchOZY4j9kV7QuAf4LWA5m8
	 Oeqz4XXO2FecFwNbZW/HCHfJTuFiSbokXRswrf9z3YEUx8L8m+3fqNOjrpb/CQ3vGg
	 NBI+8TtPHEx+A==
Date: Sun, 18 May 2025 19:00:48 -0500
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


