Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F412C8A22
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 17:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgK3Q6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 11:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgK3Q6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 11:58:13 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9CBC0613D3
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 08:57:32 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id w15so14826757oie.13
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 08:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xkrbT0g+1vl9dk2t4xOaB+m0Vzv0qAIq0iOp6VSOsTU=;
        b=UC72rtlezumGLo5wevy9zR/ykzlD6jgpFRmHB+87/2TAZUKC3TcQCdwXpI6HJbPgG3
         cNtXI3x7duK2es1P7psyGUop9bHnQf4s3rTsu2gd8gEdVVKr7SOKLDsu/AWB8irxpVlE
         wOehuyOToysiRrhox/9rT19cpQhbvW+ghVSyIGamEW1GEDxzrj3tzrIWy+IDIldRvx56
         N026Ck5S7NgMWlTsBbDl7d4HqfTPiKG4NvTsWqR0+HEV51HTO9nHvdIelxtlxnMspKPP
         kb/z7eUPoVN3p+3ubooPva3B9X3AgPaN7hrvm5gqoJKXxL8mTOmrL0w+kBrQcvh+aq0i
         zg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xkrbT0g+1vl9dk2t4xOaB+m0Vzv0qAIq0iOp6VSOsTU=;
        b=pot/Hy80t/WYyNDBRrNs0Af9SP0cElReyTfQqh+CbNzQjjGAEoO2ZvniHgamYjo/ut
         9CLXv9wXVq+/RlbCOp/1oqdf8Luvy9mnk02I1B6UyybGmDiL/mwfdtHhdGhJXIOBkgPB
         g+LjZors19aDpnnqdHCc5d13WEfsOB25TqSce8DNEmjvzjd5nip5l/u/T/xMFxKLLezZ
         6IP9uMXIGyEEkziL9yXStvqN/MwpEF9u2qZZC2RSGQ//45TrcxBYAgvs4s9QsTxeT6nP
         lXQcIZOGhMtHks+k7NQsd234BjJLLxuvqMmqD1ZOHv49gU8o2LiEvdkCBeTAlzvTqhd9
         takw==
X-Gm-Message-State: AOAM530K8/86O2xoQsXOZwjFgCRsq3sxI8fuEd/VOjEsZe/Z0LiAvWRq
        7HiL8aB5c9LTAMnTsm+HNNbGGw==
X-Google-Smtp-Source: ABdhPJxSK/LvT1BKNuMz8SbQClIWNSLqy74oqZ5Oic5ab8jAH3aOGnqDGelBe9x31aqvC7Ix5oXLVQ==
X-Received: by 2002:aca:b256:: with SMTP id b83mr15879955oif.77.1606755452201;
        Mon, 30 Nov 2020 08:57:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a4sm10071141oot.6.2020.11.30.08.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:57:30 -0800 (PST)
Date:   Mon, 30 Nov 2020 10:57:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 15/17] arm64: dts: sdm845: Add interconnect properties
 for Venus
Message-ID: <X8UkeXhwDbA74GIq@builder.lan>
References: <20201102113529.16152-1-stanimir.varbanov@linaro.org>
 <04afbbe2-0e31-1ca1-8215-504e64186969@linaro.org>
 <cf5470a8-d810-6b08-9490-a9036eeef938@mm-sol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf5470a8-d810-6b08-9490-a9036eeef938@mm-sol.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 30 Nov 04:34 CST 2020, Stanimir Varbanov wrote:

> Bjorn, could you take this for v5.11.
> 

I did apply it a few weeks back, but seems I forgot to reply (and it was
before I asked patchwork-bot to do so for me).

Regards,
Bjorn

> On 11/2/20 2:07 PM, Georgi Djakov wrote:
> > Hi Stan,
> > 
> > On 11/2/20 13:35, Stanimir Varbanov wrote:
> >> Populate Venus DT node with interconnect properties.
> >>
> >> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > 
> > Reviewed-by: Georgi Djakov <georgi.djakov@linaro.org>
> > 
> > Thanks!
> > Georgi
> > 
> >> ---
> >>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> >> index 40e8c11f23ab..aca7e9c954e0 100644
> >> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> >> @@ -3661,6 +3661,9 @@
> >>  			iommus = <&apps_smmu 0x10a0 0x8>,
> >>  				 <&apps_smmu 0x10b0 0x0>;
> >>  			memory-region = <&venus_mem>;
> >> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 0 &mem_noc SLAVE_EBI1 0>,
> >> +					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> >> +			interconnect-names = "video-mem", "cpu-cfg";
> >>  
> >>  			video-core0 {
> >>  				compatible = "venus-decoder";
> >>
> 
> -- 
> regards,
> Stan
