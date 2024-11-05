Return-Path: <linux-media+bounces-20865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC079BC749
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1601F2238B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DC81FEFA3;
	Tue,  5 Nov 2024 07:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="a2TrC+Mk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E652AF0B;
	Tue,  5 Nov 2024 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730792915; cv=none; b=ASJ2N6kF1JhcKnlzogbKu/52s51gW6FSfCuBOXMdpP8g6ptTzh0FuPOnoyiGY30361ptzGZvXQoaswIxq40nV5SsyiRvvdZzGThq1J26+d8ykcAfPb3o/+0vZo3+d2DcwCV5LKtBos9tgmoWzuLGWCmKpGLCEa4nPM6THjAON6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730792915; c=relaxed/simple;
	bh=BRyDByHc1x4h+UTPW8KbOka3OgDty57E7fMzunRfbZQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHazmOWiviz4KE2x1sWrWCgHAlQdLYUWCXw1BI33ikOX+HVwfFgTL9A8eq9DZmPEFgPrGWTq0TAnGQijxRBvLLSb2h6sWHI2OtebPQnGwYJFmOJ2pgIMKYaSRTE29XoCE6eKJp40AcqMkHFweCaq01TVT2pJ+uxgHJTcTVltnfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=a2TrC+Mk; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5504Ar010867;
	Tue, 5 Nov 2024 08:48:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=CE1Ann0N54YMVcubl0bdIuho
	D0dbS3Lrp2O1zrujtXA=; b=a2TrC+MkfgqcIksGa6RUg20sxh1OXUUwRo+zdmMw
	o1QMeG0MKNbEu3blOmlFzxX40Fzw0f69u+QlaLa3n7W7/iCsvjNFVcDgMQl8j1E6
	hApY+vKZt1Ud8fO4mN7hIJCC1M3iuYjwdUPHXEohRuL9PBUwYeUxOn58PWhEh7+2
	gsMMGg1SlNxuU7koI6OTq0Hy6sJt2r5M9sW2f1u+/wsS0J+jfMUO7KIIAH3An5uR
	tblBbxA4qqZcl3z1Az+EoewQq+vdlI+F1re/nSqMdqbBeL+YFkPO7/xZ2hEPv0fW
	shza+F96TN+/h+PkAC9V/mXuLh8v/9awt+dTen/lWPa7iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nywn88cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:48:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6230E40046;
	Tue,  5 Nov 2024 08:46:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21D3124A466;
	Tue,  5 Nov 2024 08:45:55 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:45:54 +0100
Date: Tue, 5 Nov 2024 08:45:53 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 15/15] arm64: dts: st: enable imx335/csi/dcmipp pipeline
 on stm32mp257f-ev1
Message-ID: <20241105074553.GC1413559@gnbcxd0016.gnb.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-15-e3fd0ed54b31@foss.st.com>
 <fgxjk5tikvd5vihlzslovhlpy5xbbgnr3kywkvkd62ppx6ttm7@2rbaqvllyb25>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fgxjk5tikvd5vihlzslovhlpy5xbbgnr3kywkvkd62ppx6ttm7@2rbaqvllyb25>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Krzysztof,

On Tue, Oct 08, 2024 at 03:42:42PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 01:18:17PM +0200, Alain Volmat wrote:
> > Enable the camera pipeline with a imx335 sensor connected to the
> > dcmipp via the csi interface.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 87 ++++++++++++++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > index 214191a8322b..599af4801d82 100644
> > --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > @@ -27,6 +27,38 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	clocks {
> > +		clk_ext_camera: clk-ext-camera {
> > +			#clock-cells = <0>;
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <24000000>;
> > +		};
> > +	};
> > +
> > +	imx335_2v9: imx335-2v9 {
> 
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]v[0-9]'
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46

Done in v2 for all 3 fixed-regulators.

> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "imx335-avdd";
> > +		regulator-min-microvolt = <2900000>;
> > +		regulator-max-microvolt = <2900000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	imx335_1v8: imx335-1v8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "imx335-ovdd";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	imx335_1v2: imx335-1v2 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "imx335-dvdd";
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +		regulator-always-on;
> > +	};
> > +
> >  	memory@80000000 {
> >  		device_type = "memory";
> >  		reg = <0x0 0x80000000 0x1 0x0>;
> > @@ -50,6 +82,40 @@ &arm_wdt {
> >  	status = "okay";
> >  };
> >  
> > +&csi {
> > +	vdd-supply =  <&scmi_vddcore>;
> > +	vdda18-supply = <&scmi_v1v8>;
> > +	status = "okay";
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		port@0 {
> > +			reg = <0>;
> > +			csi_sink: endpoint {
> > +				remote-endpoint = <&imx335_ep>;
> > +				data-lanes = <0 1>;
> > +				bus-type = <4>;
> > +			};
> > +		};
> > +		port@1 {
> > +			reg = <1>;
> > +			csi_source: endpoint {
> > +				remote-endpoint = <&dcmipp_0>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&dcmipp {
> > +	status = "okay";
> > +	port {
> > +		dcmipp_0: endpoint {
> > +			remote-endpoint = <&csi_source>;
> > +			bus-type = <4>;
> > +		};
> > +	};
> > +};
> > +
> >  &ethernet2 {
> >  	pinctrl-names = "default", "sleep";
> >  	pinctrl-0 = <&eth2_rgmii_pins_a>;
> > @@ -81,6 +147,27 @@ &i2c2 {
> >  	i2c-scl-falling-time-ns = <13>;
> >  	clock-frequency = <400000>;
> >  	status = "okay";
> > +
> > +	imx335: imx335@1a {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Changed to camera@1a.

> 
> > +		compatible = "sony,imx335";
> > +		reg = <0x1a>;
> > +		clocks = <&clk_ext_camera>;
> > +		avdd-supply = <&imx335_2v9>;
> > +		ovdd-supply = <&imx335_1v8>;
> > +		dvdd-supply = <&imx335_1v2>;
> > +		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> > +		powerdown-gpios = <&gpioi 0 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> > +		status = "okay";
> 
> Why? Didi you disable it anywhere?

status property dropped in v2.  powerdown-gpios property dropped as
well since not necessary nor described in the sensor yaml.
reset-gpios polarity is as well corrected in v2, following an change
within the imx335 sensor.

> 
> Best regards,
> Krzysztof
> 

Regards,
Alain

