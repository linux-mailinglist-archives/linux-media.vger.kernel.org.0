Return-Path: <linux-media+bounces-30499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F26A92C37
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 22:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F00BE4A3258
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 20:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FD6207678;
	Thu, 17 Apr 2025 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVE0tjO8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B535948;
	Thu, 17 Apr 2025 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921277; cv=none; b=CdkuJoSHQb+dal2zJGuL9Qkfpb4564UllImjl9u4Yz1yoQuTqXdt8zw8aoSf88lm3jAmATRb3RkawUYT8bKRmS6bY32ogv1Cpg8v0kLoyEUDvd7Mzob2LSAEmmYiwViV/YOY0tiMlVtcaQnMJnN45qLEk9nApVdtpfVgz3/c6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921277; c=relaxed/simple;
	bh=CEt8qG7isBfVRzYLGpLT98c47s6SUJcYrJAgeCSkGUA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IXJV6OYTi63QMvIWKOmZJbLbfqZ8r5mNZPeih01j+MwAC4LhQYzYBMRJ3AayoGlDkUcGuusE55mf6l/Wuseo00owlb22UCOHrh/2wHyBvXJ0AXwUAU+5kKIoOEE7S0Qq1CAZ8tpb6b5/GEV7aHQaLjcsF0S4p1mb742N3eA7gGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVE0tjO8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8886C4CEE4;
	Thu, 17 Apr 2025 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744921276;
	bh=CEt8qG7isBfVRzYLGpLT98c47s6SUJcYrJAgeCSkGUA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GVE0tjO8M31ubwwzBnSQA3SUtLmLSic8WPdDR79FNNRAPiz7w2MfPI+DaHM9AcEt6
	 qPvX3nV0jH82noXbNr62OrkoQ1ZJdTausXXyvtWn/InNvxKG3ClXw58U21RLpH2KDz
	 Kk1b3liLLT4T0PFo0JAKBF4Pkfo6DvX2kt5/IKtNKJL7UBjHw9A2vi5VirjLP5WteI
	 FcyuuMt96urT9jG7YLT4ASq21bgxdEqps98WIBeJMWSOtUZ9yAVef6oWmBmDrz/Ggj
	 4EdOVcaWkJbIiWE/sssi8cy6iGsUdDeraoYizifCzf1+TVjQ1ToNhUwsT3wBHJWwQd
	 jpT6dcg0i3WZw==
Date: Thu, 17 Apr 2025 15:21:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v1-1-67792b39ba21@quicinc.com>
References: <20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com>
 <20250418-qcs8300_iris-v1-1-67792b39ba21@quicinc.com>
Message-Id: <174492127515.871981.11754041216972893769.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator


On Fri, 18 Apr 2025 00:27:31 +0530, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby
> have different(lower) capabilities when compared to SM8550.
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
MAINTAINERS: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250418-qcs8300_iris-v1-1-67792b39ba21@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


