Return-Path: <linux-media+bounces-17751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A496F082
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 11:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAFF62838D5
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756621CB313;
	Fri,  6 Sep 2024 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8TOy0UF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E71C8FDB
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616505; cv=none; b=lQGiFbDKUMmpym3E0dlTw44aDukLgw7WI0kChR70VHrTFIMa3tCrhoadYxH/AqMq5evTJ1ARF0GX0nGX465eYf/21ffv/1+PL1USJAi9VAOUiVZHBR+R9ZBXit2G/kwt3pnPKIM1akV8Dp2/9BnBWL+FaDid3dkw8t1aK5C7+50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616505; c=relaxed/simple;
	bh=TgUfYpNfVCM36W5N/o95NjsehMbaFlikvyBsdPQajJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D10O5XlTx9uW6mHQAjeglcWZm8iK6eRtLE2nF/EVWA58iYPl+MDRp9OPCFyZ0YmrI973ok43n4Eke6RcWhhr2eIKAvNtCXGNpKnHEq511gfgOfUOgvM3HGfJvtB7chJuvIpowt2bcrrUndPfntzGcYEfjAKVXa1fOa9spWKd3CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y8TOy0UF; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f406034874so21026841fa.1
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616501; x=1726221301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s86VyCjnrHQBv7IvvTu3Ou8rPKyNQh1txaGTPumLsys=;
        b=Y8TOy0UFkcNlrbYC9gqSv6npsJYvpSVeq4at/UBGFgx04WCOQGbpmviojj6oNLyiyX
         CP5rCV5/37zxaPnxSDdMwiKO4SZ71GCNg9yIxCyapwUTzANfEJuL6xymqfzQthwwqfcm
         4veDBbL4seCxLjx+NGSGRyBXxPxrR7S/SRjEArRZ86Janl9vS82G+1CVtsafTV/HITsA
         FCvDn3Ini6JNlTeOnEG7koo2Bfsmk59nCYwFFuXGnaAjJxPji9lcUqOCUnSoiURYPlSx
         DjrXWNAylwvGiyQ7PoaBkcjT1K9mjbZW1jqbDWgWI4lS/Xk55OOG5rKLZ9pLJ0eCWwH/
         iCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616501; x=1726221301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s86VyCjnrHQBv7IvvTu3Ou8rPKyNQh1txaGTPumLsys=;
        b=d5zH7DggF94eyBK7tOs3jRJdLy0mkgZsHJRqKmf7RUkdk0OaXTSf3X6/P7uIGgMhqI
         8rLKKB/vXXsVg3FSuGVytLGWgyfhrtclXaQ+EUHU7wydw+S9QYAlw8JBAo4Jlyh1eDLW
         NSGp8mZ9wWsFlAOdegi45Nq1twgXutMX1ixGklDjyzpkUP+wTGsBfQC7lOEpKMh0AGqY
         XhVSCcxENutE0ESobBXQPq7UF7llWsiFxhiNzt5w2iq6Ad/L6Fp03Z4HA2vibM8H3VQl
         rfvm0xjuzYf2OTyS/rRFOhZoDSP3OwzOn4X8enCqmaGqaK+ZMuS/LDFli+tn5Cu2W2kt
         V+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCX+/Cfv2okvqBM7A5i+wZufOKaaRSbM8ZN+kLtCu2ZXEG/GUu6VvaCPJhBbo5dy0Afl2nU2JyqoTTxsfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi61QRinDf9Vg3YI6cDMBF2BiA3pTafNkZLhkc/IYvk8Rj2TV7
	CbT6a/xwDE+MnNoppReVQFmxknbzT1ERmP/KaZZubT3xjYDYLd4KSJfEk1KleD8=
X-Google-Smtp-Source: AGHT+IF844pSrLixRk6wUHI5yRSvPlucQpVGpC8Ewt1wZPUcMFsg9NoBGfApKlFd7JpuCaxLM90GYQ==
X-Received: by 2002:a2e:b8c7:0:b0:2f3:e2f0:2b74 with SMTP id 38308e7fff4ca-2f751f8289amr15670591fa.36.1725616500494;
        Fri, 06 Sep 2024 02:55:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f7518d1c41sm1731481fa.18.2024.09.06.02.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:55:00 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:54:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <on75kpguzpniuwurzfxfumzbgiarsqmthrpvj27mc5wjcebjsl@ol5zoyr2g5l6>
References: <20240906055609.2200641-1-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906055609.2200641-1-quic_miaoqing@quicinc.com>

On Fri, Sep 06, 2024 at 01:56:09PM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>  2 files changed, 120 insertions(+), 1 deletion(-)
> 
> @@ -702,6 +793,23 @@ &pcie1_phy {
>  	status = "okay";
>  };
>  
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

Quoting review for v1:

Please add
qcom,ath11k-calibration-variant = "name"

No, "the WiFi node is for 'drivers/pci/pwrctl'" won't go.

> +	};
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name = "qcom/sa8775p/adsp.mbn";
>  	status = "okay";

-- 
With best wishes
Dmitry

