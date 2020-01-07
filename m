Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0892D132959
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 15:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgAGOuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 09:50:35 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43038 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgAGOuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 09:50:35 -0500
Received: by mail-ed1-f68.google.com with SMTP id dc19so50525846edb.10
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 06:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zQ0CDE5pR8neEBT96GGd6Zl+e4E1L+wcwPMTPVeUMWY=;
        b=ASA2D1lkB7REIfyPlmaMsYwPz5LXd60dZ9AohAmGkjzBxWCOpIWASOL8ovWalzv+On
         i5Tvfk1jcjx98wXn0txbEcLH03fPO5KjhN3TxU/BTEdmgv9A/SPXRVBMXdZj8wD8G3nW
         oQrXM7aP5bhNr6dSG8GiG3p2eLSSHqw6Up+xkIX8neht8uHyYQJ52EpyfqMQhkecH3RJ
         KCsZp7lk6GTRt9aiZrIwwD/GUU+8sQUeifjpnO7f2YQT9pWxyyEkXcs6Uc8QwPOIdj0L
         37gZ66Fuw+BQ9E7CGVmZ1c7WBXnSTqpPPdram73Q7Mw8akCT3tqYmjBAPwYhqPP6f27H
         boYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zQ0CDE5pR8neEBT96GGd6Zl+e4E1L+wcwPMTPVeUMWY=;
        b=rdL5q5OtqD/Eo2TUv19lWkdlhf63I/inZn6kMX9qYsd1GaUKjlOLTUZaq0PPKF+TIi
         /OKJIZ79id+y3pObP7S4FLLNLuJxM6E39fS0dglmI7Di9OdVLRQH+RbhjC/7KfIbo+e8
         eoZ/ULvWiE/8IoH1dwKx/6oOM5IdNr/TyWsIJ1sGAoNGKEhUxMsoRbfbN1lIpW1jTLLf
         EraRObYFBlBhk695l/T9PEx2ZbzChPPVU8TyHWe4Jj9WVONLRPPc6hYHX3ssB1hDy0jv
         PgeMXgKsqH1hFnFupfVte/zoCyddctctsfpaHjDJx6kGAcWxX1xRSFHE+yORPM6nlnj1
         h4Cg==
X-Gm-Message-State: APjAAAUMg2MiUwoy0PGYGXg8rOx2xMjVVoy1thgEAQKG/iQG3Y6tPotX
        Vr+am/yGLt4/XI9F96DyOWGitw==
X-Google-Smtp-Source: APXvYqxGNZwQ5POBSjPO3k9WdMkYMCzyQNCS/a8BoYustyBBs9XIR4a/2PM5Yq5XnTgqEJ5mv/xGHw==
X-Received: by 2002:a50:cbc3:: with SMTP id l3mr130438edi.258.1578408633124;
        Tue, 07 Jan 2020 06:50:33 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id y21sm543edu.70.2020.01.07.06.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 06:50:32 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: add Venus firmware node on Cheza
To:     Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200107143402.122455-1-acourbot@chromium.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
Date:   Tue, 7 Jan 2020 16:50:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107143402.122455-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 1/7/20 4:34 PM, Alexandre Courbot wrote:
> Cheza boards require this node to probe, so add it.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 9a4ff57fc877..35ba65cd9822 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -1279,3 +1279,9 @@ config {
>  		};
>  	};
>  };
> +
> +&venus_codec {

We have similar patch for sc7180 and call it just "venus". Do you think
we should shorten it here too?

> +	video-firmware {
> +		iommus = <&apps_smmu 0x10b2 0x0>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index ddb1f23c936f..7b913688cc6d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2567,7 +2567,7 @@ usb_2_dwc3: dwc3@a800000 {
>  			};
>  		};
>  
> -		video-codec@aa00000 {
> +		venus_codec: video-codec@aa00000 {
>  			compatible = "qcom,sdm845-venus";
>  			reg = <0 0x0aa00000 0 0xff000>;
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> 

-- 
regards,
Stan
