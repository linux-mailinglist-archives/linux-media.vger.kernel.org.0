Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06687D8975
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 22:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344764AbjJZUI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 16:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjJZUI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 16:08:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC64DC
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 13:08:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-508126afc88so1997641e87.1
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 13:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698350901; x=1698955701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=in296aXKitJNMXPUX/nmqhi/sS6stnc+qHOsGfoVDJg=;
        b=yA00fGN9pFWRgyUpzF1vKLE24uzMeaa6hfF96NVjZxHTTfxmpeqklhKVbXjcdFQdCC
         +Q5HFPhdd/8HJaqkOi6h2J8R0C4H3nzBxL357mXs3W4PEe3tVOATHD6hwJYc8HiKigyi
         32Z7usS8HjZLRnIORoEkePQ2yudUHRBa+NF/pd64qG8r7PSOAI8Unhf45/xEDVzMfm2N
         4jm16yKfYHB+H4UK/HDqIYyUVEZSSv5Y3ZFUCZrrN8WJCUWx9EPDxnfKyhtHLvpspcVE
         uMoWHSBoCGs5q+Gr2UZCgN74Fg18au70QiWC14QTgyBBarmP6wGDUyl7BG3x9NHqYNy5
         nhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698350901; x=1698955701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=in296aXKitJNMXPUX/nmqhi/sS6stnc+qHOsGfoVDJg=;
        b=T6SmmqQxG85Rhn45IqPKemVZA1CT9e1EP+68sxVeJixgT8abnbfqm2UjEYJRv+hKTq
         J0KjrepXOWMLw85EocZ132QYviA69cjKsKbT2K159voPPPJD+Dw0qIlSjPSNUvViuN4P
         SLjcAUyK4E/JaP4F/QedyxUkdmgjqM+Ndp2XCedgyca8slc0i/V7J9xOYkyBfoVkn1xh
         XQ/CWFSk/2POTyXnyIbu4qlu7FS8v4CpB+23STZQpjG1HkloLR9RfTadnw9Fn+j7syp6
         Df6SR7n8SZgFyuEbuSXXBgVoxOsSZ0VfSRHDbtiuViYuyuMvTSbFQi9/6gMK2FRHOeRe
         IE+Q==
X-Gm-Message-State: AOJu0Yyi01L7Gsy357N1q6BvVDryCSS9a86iUdP+Y4c9jSpvJ8Oy1QJq
        iVSCglS/xSh8FeGtGn3kqLQA4Q==
X-Google-Smtp-Source: AGHT+IFicE3Na+hQ9S8OZTbwLGfd7Vgc2t3vVhEM4RVc32If6IqOEece8WLGiS6tLpA2qh+Pj8lQYg==
X-Received: by 2002:a19:9112:0:b0:507:9ef2:fb1c with SMTP id t18-20020a199112000000b005079ef2fb1cmr338886lfd.2.1698350900853;
        Thu, 26 Oct 2023 13:08:20 -0700 (PDT)
Received: from [172.30.205.86] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c14-20020a056512324e00b005079fd88326sm3110814lfr.45.2023.10.26.13.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 13:08:20 -0700 (PDT)
Message-ID: <8a36e61a-5397-4513-ae0d-eb68ccd8e584@linaro.org>
Date:   Thu, 26 Oct 2023 22:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: qcom: camss: Convert to per-VFE pointer for
 power-domain linkages
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, andersson@kernel.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231026155042.551731-1-bryan.odonoghue@linaro.org>
 <20231026155042.551731-3-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231026155042.551731-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/26/23 17:50, Bryan O'Donoghue wrote:
> Right now we use the top-level camss structure to provide pointers via
> VFE id index back to genpd linkages.
> 
> In effect this hard-codes VFE indexes to power-domain indexes in the
> dtsi and mandates a very particular ordering of power domains in the
> dtsi, which bears no relationship to a real hardware dependency.
> 
> As a first step to rationalising the VFE power-domain code and breaking
> the magic indexing in dtsi use per-VFE pointers to genpd linkages.
> 
> The top-level index in msm_vfe_subdev_init is still used to attain the
> initial so no functional or logical change arises from this change.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

> +	if (vfe->id >= camss->res->vfe_num)
>   		return 0;
P.S. this seems better suited for some warning, I think
