Return-Path: <linux-media+bounces-17685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4896D958
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 14:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8F481F27CFA
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C73219D09F;
	Thu,  5 Sep 2024 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nME5LTX6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C02E19CD1D;
	Thu,  5 Sep 2024 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540601; cv=none; b=e/m6ARHp0daeqDWo7tPCDKbr5to3xHzcdEnjemuastcE9m0+u28rmTfvHUXY+wamQgVVn0rQR+1CfvvjxAdeIIyiST2VlhGT8NuS/Lx356L5c6d03+EljE/KozNWmBfZU6FaHgAeAv16VYzneIna9RedOEBE3wR2qGcoAu3J40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540601; c=relaxed/simple;
	bh=cIw+QAtl4YZk5XW1E3vytc1C+bSS39eTR1FNLFc6iI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAKkqECTN1OTiy6zp1u1rUZ9ebViwLPBsxOHd/pnsgFrEyJqrO39U7NGt8N7bEWWl+B57ZclpuQGFO39rsgVU5LZpwSy8akdRD3/EtUbec2+O3vi7n3nbDQqhy3d4DTCPmPAA2BiJ8rcgxljbxnccXJDvxViGCKl723UOoTavOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nME5LTX6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f502086419so10300771fa.3;
        Thu, 05 Sep 2024 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725540598; x=1726145398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yCftOa4jmucVlvHgt7144ehPelijHe5p4WCLxgC6UCE=;
        b=nME5LTX6dDpC/s9cjx/WYEDfgO96jmBVSgMC8uJcZeK6EgDKQSgc3preRtr9gdDsl6
         2t7wbExwzMBtfeiD8TqcLEX+aPEpYHIFRwN/2IylNmX1WvWagArlPzgEADn0vZDmII6N
         SkHjt9zFloX9hAE77Zck+YoavjL3UzJceaZCEfAH2ihVi5PEPRmPi9ClBF/z/GN02BF2
         Unh1ZQEqC6K8rR+XhBF4Nv4IKfS2XJy+OQxMHc2Rv38SiITsS9PeC5yho5bxYJDhv24S
         th+fWT9h97eOqtMHu3TYuIv635GL2l/sGIZMmpHxrhcScCwzqZMA4qzP0GkT7bAKz3pW
         6p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540598; x=1726145398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCftOa4jmucVlvHgt7144ehPelijHe5p4WCLxgC6UCE=;
        b=WAxwRBm9dKT5veF/R2L2azOkwRDS4yJDu3deizRtbfc4UOyJiuc458cdmfx1kbNz+B
         AFLGGn9wOuwfO/oCOsnpU0z/iAkXUt+BWubiecGLLFAgTBJ528uMzRkH/CJtiUHnrD+B
         Tuq520WAoyCFudzap3jMT78g+GTdeQeAIR2zSDZkEzt6H4COxHrn2CdWpShWvTydo+7i
         3DoDYfIKoZidi6IOtZN8M5rRv3vurv0mUMArtXkW+A0dArtJcyfU2ONr3A0hNZmWmOZB
         RfNEjaMY4Uh6FTDyfxKWxY7bGTJ37bNAi6iyKyBCYj/AEITZaCITR1/8YCv6PWAtmApG
         dA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHawj8ZPROwpv357ux0l/e9yhNvlT7TksRo4rJS0Lg5YcGLwEZKrMSKYZ8IDTU3ce+pV2c2WIYafJbans=@vger.kernel.org, AJvYcCV5hu1m9WWGy7jxLG1DrycGuYhNhNjPAGZkEXqtb455c6bBpS00JFlcjljx60zx9PSXttLUYSIZh4GpDdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdS0FoPhCRjIq3nLatVJCTrXQ8G18rYQ+szEqPYp3PsZtEC/hP
	Ju44yJ4NYGZT3t+OGKowu4lMlQCZZ+8wVTZ7OpPkEzEyoLPa7GQwp+YtTkQT
X-Google-Smtp-Source: AGHT+IFNhVKRjB2F3s2UeVmIBX884q+1Owt+dJD0N71/mdToPDPsb+L3v2Y18uXKo5lMPeT8/3yvag==
X-Received: by 2002:a2e:a993:0:b0:2ef:2525:be90 with SMTP id 38308e7fff4ca-2f64446dd98mr82829701fa.31.1725540597612;
        Thu, 05 Sep 2024 05:49:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed1471sm28730911fa.21.2024.09.05.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:49:57 -0700 (PDT)
Date: Thu, 5 Sep 2024 15:49:56 +0300
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>

On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>  2 files changed, 120 insertions(+), 1 deletion(-)
> 
> @@ -837,3 +939,20 @@ &usb_2_hsphy {
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> +
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;

Please add

qcom,ath11k-calibration-variant = "name";

> +	};
> +};

-- 
With best wishes
Dmitry

