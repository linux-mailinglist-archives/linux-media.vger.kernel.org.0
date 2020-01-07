Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 409F4132849
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 15:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgAGOBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 09:01:18 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45940 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbgAGOBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 09:01:18 -0500
Received: by mail-ed1-f68.google.com with SMTP id v28so50361168edw.12
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 06:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+90cyf4uCue1WitBn6EURq8L8npermjRUJaY8IVQ3o0=;
        b=DBUN+/LNYToXvlGc4wur3eoDDfxXHaJxAQSC9h9hO+wuGf3aIOmi/NIuVnQ9YZuGDC
         OhkfM24emqJgy+MHAaLzlG1xjwkAPI+xun02gWQ5VtJieumgdSsLpxuKusWSe6jn8m6V
         udwif7qLa6nGrXmBWlmhIP9Krk2+mAGVW3Pltww1RNeqFBv+wZZD5dsOAmCMSb3S5RMK
         PrgY36/tpph59ezpzzSXS+VV+/Nb9v0xw+UYiCrJwAEKpNPKl439WHgtFZzrVlyVOtV8
         hKNcNKJXq6w8XatSbefPePpj7Mb0fiHw6ST1dmgFcjtPSncF0fj+ChjvAWeR7lPLfJsQ
         FX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+90cyf4uCue1WitBn6EURq8L8npermjRUJaY8IVQ3o0=;
        b=Uq22khC0Su2A4K8jALaPLjWoJ5pYLbDjQdSw7pROwQrWM+bOQt+UDfM4Ke22QwNqL/
         7U44OD4G5g82r69ns6mu8nVL8lfh0GQPHlu6JoLuP+JTpeXJnQiBznm9hpelbTipf6YE
         KOLD1y5L/q+Cvy4M7+nV11VCdtlHzn9xfgIXi8KPTJFUPqvBrRKuNMEX/q6+8dyY5o7t
         yPjyIH+P8lXIOBxRBzlMb7sEf201czmvfVmT4aZvy+rN1FAAJYEdYJEOdUXaxuRHA4Z3
         0CFxXG2Rp2TzxEkndjnKLs8kmJsn2yOTBg5XJGR0HHp8ifxRffD4Q6ZYKkW2nu6ekCQM
         4Tew==
X-Gm-Message-State: APjAAAXv3uE3PIUCA9lk+49WW98ytW9YV1GewFk0shOQcBTSLHt/CxzR
        9u8gw4TcbbarL3KKAdVKJxvlzA==
X-Google-Smtp-Source: APXvYqwDb/Sw2bFEL+GZhLau62Pc/gbapCMPuZYvYm7i6neHzkD2rdCQTSQR01s2I5Z2FEmRbMdEfw==
X-Received: by 2002:a17:906:4e07:: with SMTP id z7mr113972530eju.201.1578405676355;
        Tue, 07 Jan 2020 06:01:16 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id b4sm6809527ejb.37.2020.01.07.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 06:01:15 -0800 (PST)
Subject: Re: [PATCH V3 4/4] arm64: dts: sc7180: Add Venus firmware subnode
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1577971501-3732-1-git-send-email-dikshita@codeaurora.org>
 <1577971501-3732-5-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7bf626f2-e943-5538-7405-b6edeb02bfba@linaro.org>
Date:   Tue, 7 Jan 2020 16:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577971501-3732-5-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/2/20 3:25 PM, Dikshita Agarwal wrote:
> This adds Venus firmware subnode for non-TZ platform.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..2f82510 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -287,6 +287,12 @@
>  	vdda-pll-supply = <&vreg_l4a_0p8>;
>  };
>  
> +&venus {
> +	video-firmware {
> +		iommus = <&apps_smmu 0x0c42 0x0>;
> +	};
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
>  &qspi_clk {
> 

-- 
regards,
Stan
