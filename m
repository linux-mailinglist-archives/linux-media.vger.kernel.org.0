Return-Path: <linux-media+bounces-19439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6706099A6F0
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7C91F220FE
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7642C194C78;
	Fri, 11 Oct 2024 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHax3Mlz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8A18EFDE;
	Fri, 11 Oct 2024 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658276; cv=none; b=hetm+tSliT+gfM74Ty1MI5zZvrJ66PHiPstMBO6ayBPDesQHzsOLv9x+ZsNDnn/jlwavykM4mahrKFuWJgmgbGNTDHE+kthDjqZCcvTGxZc5wzqnlvsmAOO7vQstY4R3qSh+A2j6oYUwFLA2Ezk/qgFstgZ2LPZsgVRRZHP3nsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658276; c=relaxed/simple;
	bh=MJkV8cNFLGzvR5m4Y3HgSxAQzMt4z038MFboGv4epdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhKjxtezSgMGJ+cFvthdi9L6C1GVP2PYnQcZEoc5I///e7A2EuF6gm43smot4NYVJTudR4qy0bNCfEsFl6Ii6VS8gQPQ0MzPct+inzco89XVOQ/iagJ9HFsXx1bvjP2TdgvfFD09c+0O8Ymy6Byt3irNhCKJOyWUMqeRh1Y2Wjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHax3Mlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DF0C4CEC3;
	Fri, 11 Oct 2024 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728658276;
	bh=MJkV8cNFLGzvR5m4Y3HgSxAQzMt4z038MFboGv4epdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHax3Mlz4Je+nLPvKPMRbIuFsQAHW/MOiMskBJoqUrL3ny1VD3BLI8AlauqVNRQQy
	 9aFOy5jYfYrbH7MrnDMDEW8fGk6D1nwkRS5AvETEP/rBEoZwNEPtT45d3KC0nnuc2H
	 Tnp0IYGrs6VSJjV6OAU//lAF5Dj8dXd4OwZu5l2PPDYAWYE7m59+fErsj47/ysw/D6
	 NYmpUeUTGQ+4Xf7zda91s2EsgIcHCFIDynIyQenIKCCOnUMYWHmBR/1GrO82AekHh0
	 p3FgVzJAkjglwv+bhnNLGZbr60QbakYfq/8mtqtICJQlcFTlwoUjdtHLqtxA0NEOAv
	 phwUtGxIlEohA==
Date: Fri, 11 Oct 2024 16:51:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sc7280: Add support for camss
Message-ID: <4zfuw7ibuxgmrn5ziazrsc6quxyaoltejed5ym37c4b2mgtwbr@wakpgromya44>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-8-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011140932.1744124-8-quic_vikramsa@quicinc.com>

On Fri, Oct 11, 2024 at 07:39:31PM +0530, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 175 +++++++++++++++++++++++++++
>  1 file changed, 175 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index b41230651def..9bab2d8dc1b4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4426,6 +4426,181 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		camss: camss@acaf000 {
> +			compatible = "qcom,sc7280-camss";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				<&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				<&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				<&camcc CAM_CC_IFE_2_CSID_CLK>,
> +				<&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +				<&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> +				<&camcc CAM_CC_CSIPHY0_CLK>,
> +				<&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				<&camcc CAM_CC_CSIPHY1_CLK>,
> +				<&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				<&camcc CAM_CC_CSIPHY2_CLK>,
> +				<&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				<&camcc CAM_CC_CSIPHY3_CLK>,
> +				<&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				<&camcc CAM_CC_CSIPHY4_CLK>,
> +				<&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				<&gcc GCC_CAMERA_AHB_CLK>,
> +				<&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				<&camcc CAM_CC_CPAS_AHB_CLK>,
> +				<&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				<&camcc CAM_CC_IFE_0_CLK>,
> +				<&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				<&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				<&camcc CAM_CC_IFE_1_CLK>,
> +				<&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				<&camcc CAM_CC_IFE_2_AXI_CLK>,
> +				<&camcc CAM_CC_IFE_2_CLK>,
> +				<&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +				<&camcc CAM_CC_IFE_LITE_0_CLK>,
> +				<&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +				<&camcc CAM_CC_IFE_LITE_1_CLK>,
> +				<&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
> +
> +			clock-names = "camnoc_axi",
> +				"csi0",
> +				"csi1",

Everything misaligned here as well.

Best regards,
Krzysztof


