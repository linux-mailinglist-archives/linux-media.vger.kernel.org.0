Return-Path: <linux-media+bounces-19440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3799A6FA
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843BC1C2180E
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0E8194A7C;
	Fri, 11 Oct 2024 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmB6MEQF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C417BA2;
	Fri, 11 Oct 2024 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658346; cv=none; b=WRy6Qe6w4bNCrY/2lmxHIXS3JLHqtaJ34VHJRhA0nl8t/tFbnIMuqrhUz5w1yzdSIX0MjhrLtZFvJCiCgXvb1j/nn8cY7KSZrGerDqgszWCQzb+UQuzYftcTzH/E7fjG3DQ+/N83MVMuQLBu/Mfw5I8TzzmDeKKpbCwH9bEcpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658346; c=relaxed/simple;
	bh=CDaJplkccu4hEDe3esLpGxaZAoaNxHaVgBwOAdLBLkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qw6N4WxEPQssIGZZNE4He2PBgHF0OS79jxoQZuIUzqiOnmxX8b3iQ2p01/zaN/qTFwhUnAdykw3nMXPOQuG37FvCiFkghYw2/CtkfGc3TBFwy19byVc0DptFtecgLRf0W+8n9nPNYI/E8kunIGbr/PFHfvIB+kSRJIr7dfd7UXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmB6MEQF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF7EC4CEC3;
	Fri, 11 Oct 2024 14:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728658346;
	bh=CDaJplkccu4hEDe3esLpGxaZAoaNxHaVgBwOAdLBLkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmB6MEQFTZN0mnJPXnbRyDd4PsSmZbUDjXWG6fWxbzZaHgqvah9biGC84g5FZDSGL
	 YUWwv0tzLHCoK6FdGEFZ8MX0R1TNQg4ZZOeUkmefF5kyukZ3UhrwhS6wpFJS4Fsu6N
	 RlYUMa/L0GLnRhz4+xkF0s8Bb/e2Xx4PEZIwAsAZZKyW7YMRPdbIC552r4YPYrU0BW
	 nz79brr+Ye0ZdrydtZRoHkhqQdEECvPRhDnECGySdRWY/wS438sOjRkTKaQ4HGDs9G
	 7eY55AWMO6X81ivQq8yo58OBv+0ZyJ6GkgQIMiQ+KYJuwJp8kUHeBfK3w8oyd95ZAb
	 qJoiXDLIEghBQ==
Date: Fri, 11 Oct 2024 16:52:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <bv7cd7wxukon2ipnqjjzhdsz33cgny6yqwcswdc2xld6xt5pmu@gxxniotohuzm>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-9-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011140932.1744124-9-quic_vikramsa@quicinc.com>

On Fri, Oct 11, 2024 at 07:39:32PM +0530, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/qcs6490-rb3gen2-vision-mezzanine.dts | 61 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 33 ++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index aea1d69db541..7208da1d3697 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -111,6 +111,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts
> new file mode 100644
> index 000000000000..04b5fe80d38d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "qcs6490-rb3gen2.dts"

DTS does not include DTS, but DTSI.

And where is the compatible you wanted to use? This looks sketchy...
mezzanines are supposed to be overlays, I think.

Best regards,
Krzysztof


