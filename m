Return-Path: <linux-media+bounces-43127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645DB9D6DB
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 07:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6270B4A50C7
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 05:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D902E7F11;
	Thu, 25 Sep 2025 05:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fv4fcEwc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF42E7BB4;
	Thu, 25 Sep 2025 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777101; cv=none; b=Gy/4yqRJ57QidgiyTLUuK60+S4EME/yco6QTtMvFG2kPUianb/hJVSDm+MS2uAz3mZ2EGMwrSKomNtsqAjoObjPtC+x+ORWgj1o+QB3ugclHUgQ3PWy8VCbLZAANeBJ5Gd/Ofaz/79S+aKNZLCsRLP0oNFpBjHYf5g09cuCl1Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777101; c=relaxed/simple;
	bh=KRCmad8gpTCEGZzbPJ+vSzMUoizSy+0/nHSK13v/JUg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RwIUjPXzXS7CHQscjRw8Uz9mKeH7Qjb2Q8xbB8KvtAD1+XE1m79RRrzBBee4BKGH53YBWfuteNt+68nKnG6G/snYEVBhlNPr8blWb5lDYg85ljpszX4WJ/kmzX7L5Khz+b/l1o/9YIKg7+rS43Hn4OlOsCEhr7/P8rw/8ezMUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fv4fcEwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6853C4CEF0;
	Thu, 25 Sep 2025 05:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758777101;
	bh=KRCmad8gpTCEGZzbPJ+vSzMUoizSy+0/nHSK13v/JUg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Fv4fcEwclyjPKiFI99RYIOpyTKY922a8mAvXHKQg3SZBC0LRMDM6qQzzzo4MUHfYH
	 2/kl06WeJCrZhxebEBFGOQIUxhBB2y6usnxZu9TaSRDt4N44C4/jUr2d30LCKWQ7qk
	 y3A3ZBLpUUrQe0aFGftYaW9BWtx7L59DWB+KAmEcNjiwWkGBhFD5rgoKR2c0da5e3C
	 +DDBmBIX0Gy7yvsdsz2xxrIiC5LTeIZQhf2FnzjSYd5Te7MD86ncR2gdenxku3+Bzc
	 bXn+Khd58yimiptR+EYtvj2DZKUYF5sn50umanjb3QjRT+PQtYmBSob2AxzCBT3ufF
	 26dnaLHhWUyZA==
Date: Thu, 25 Sep 2025 00:11:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, Vishnu Reddy <quic_bvisredd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
Message-Id: <175877709998.3725789.11141152500856219909.robh@kernel.org>
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding


On Thu, 25 Sep 2025 04:44:39 +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> There are variants of this hardware, where only a single VPP pipe would
> be functional (VPP0), and APV may not be present. In such case, the
> hardware can be enabled without those 2 related power doamins, and
> corresponding clocks. This explains the min entries for power domains
> and clocks.
> Iommus include all the different stream-ids which can be possibly
> generated by vpu4 video hardware in both secure and non secure
> execution mode.
> 
> This patch depends on following patches
> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
>  1 file changed, 236 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dts:24:18: fatal error: dt-bindings/interconnect/qcom,kaanapali-rpmh.h: No such file or directory
   24 |         #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


