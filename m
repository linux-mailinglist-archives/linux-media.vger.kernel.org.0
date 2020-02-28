Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5181730B1
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 06:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgB1F7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 00:59:12 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42832 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgB1F7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 00:59:12 -0500
Received: by mail-pf1-f195.google.com with SMTP id 15so1147107pfo.9
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2020 21:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZKBVIeRSLkTABImhK09WMLdKCBu5/xMvSWiCq5Gk5ew=;
        b=qIWEKs1fiJ9RymzQ9qxGXyQ7zq7OH6AHa4z8jWL/42Gg+Atw6uuPb/zmu224vNoAts
         zpTjotXFlSx9g1eHHYxqA+q0aEGg0rNrwQhTmbHx2KPA/QIkBk20cdBes3KSFsuMlT+R
         b6sfLeYv0F7D/ftpdOi0SdoRVlVwgGLDQqp6S3QkWVneU2qw3OPbAfM9EIcjm5tZdf3c
         6xgenLXUXhdkSgSTaUwHE21DQrdmX2m1DKNq6L7Pe2Zd3werv4IGgdll84y0lups3DdJ
         +Q1V/TZ3USFu3HnByU8y5p9sKzIIwXqG6nrLILShsteZGiNm66CkA0+xoplaP68PVAmv
         DnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZKBVIeRSLkTABImhK09WMLdKCBu5/xMvSWiCq5Gk5ew=;
        b=spwp/m7RmxBwDFeHdg4sDp/iF0oKeG7seEx/QDzeM7NRBW5C6Xmn8Ko4pfakknG/sl
         gt87LwFerwrJ0XEjgI3IvAVT5+YhRbEZmDXjhZIU4QGVq1dBjurcPrb9FAp+46fqFaiS
         Tqup3nEBZknur1z025bqTJl0myklWybOcuAWeuTn+ns9yQfpudAellHT2YSm1L2iLbBN
         Q7pCAKELBCvNiBsiP0yhDpHyyJmwMt4S/Hxehq6/51t4hOEpcTo0ZPtQOczZVnkyYrZl
         dOnYI8N08F9LOGa7g6fwYMce0A54Vo9zu8B368t+OFrND+rJBxa3AR7HxczjG2fBoe7u
         7BTA==
X-Gm-Message-State: APjAAAV7MNklsLeC0FZch3D8hdU2qFhLvVEqd23nBBZQm7bmnU2MQvwe
        Do13byrA5/Neb/wW52NweCwQSw==
X-Google-Smtp-Source: APXvYqxqmURZAi/f55EJv8aex6BUad+OH04tpFm+Z8vGcdyQAIIthi7QVmfey/lpCqGu0Q7enA1Ppw==
X-Received: by 2002:a63:3f44:: with SMTP id m65mr2923728pga.351.1582869551241;
        Thu, 27 Feb 2020 21:59:11 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f3sm8201106pga.38.2020.02.27.21.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 21:59:10 -0800 (PST)
Date:   Thu, 27 Feb 2020 21:59:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
Subject: Re: [PATCH v4 11/12] arm64: dts: sdm845: follow venus-sdm845v2 DT
 binding
Message-ID: <20200228055908.GY3948@builder>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-12-stanimir.varbanov@linaro.org>
 <13ea7221-5253-37fc-595d-e650b2d474c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13ea7221-5253-37fc-595d-e650b2d474c6@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 27 Feb 14:38 PST 2020, Stanimir Varbanov wrote:

> Hi Bjorn,
> 
> Could you take this for v5.7.
> 

Applied, thanks for the ping Stan!

Regards,
Bjorn

> On 1/6/20 5:49 PM, Stanimir Varbanov wrote:
> > Move all pmdomain and clock resources to Venus DT node. And make
> > possible to support dynamic core assignment on v4.
> > 
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index ddb1f23c936f..c5784951d408 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2568,32 +2568,33 @@
> >  		};
> >  
> >  		video-codec@aa00000 {
> > -			compatible = "qcom,sdm845-venus";
> > +			compatible = "qcom,sdm845-venus-v2";
> >  			reg = <0 0x0aa00000 0 0xff000>;
> >  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > -			power-domains = <&videocc VENUS_GDSC>;
> > +			power-domains = <&videocc VENUS_GDSC>,
> > +					<&videocc VCODEC0_GDSC>,
> > +					<&videocc VCODEC1_GDSC>;
> > +			power-domain-names = "venus", "vcodec0", "vcodec1";
> >  			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> >  				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> > -				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
> > -			clock-names = "core", "iface", "bus";
> > +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> > +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> > +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>,
> > +				 <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
> > +				 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
> > +			clock-names = "core", "iface", "bus",
> > +				      "vcodec0_core", "vcodec0_bus",
> > +				      "vcodec1_core", "vcodec1_bus";
> >  			iommus = <&apps_smmu 0x10a0 0x8>,
> >  				 <&apps_smmu 0x10b0 0x0>;
> >  			memory-region = <&venus_mem>;
> >  
> >  			video-core0 {
> >  				compatible = "venus-decoder";
> > -				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> > -					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> > -				clock-names = "core", "bus";
> > -				power-domains = <&videocc VCODEC0_GDSC>;
> >  			};
> >  
> >  			video-core1 {
> >  				compatible = "venus-encoder";
> > -				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
> > -					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
> > -				clock-names = "core", "bus";
> > -				power-domains = <&videocc VCODEC1_GDSC>;
> >  			};
> >  		};
> >  
> > 
> 
> -- 
> regards,
> Stan
