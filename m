Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFEE474CF5E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 10:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjGJIDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 04:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbjGJIDP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 04:03:15 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E48BB
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 01:03:14 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso46881645e9.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688976193; x=1691568193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8lzVobEOeTxqsg8+m/lWFEcb6TPsN4IGxl7QTiUpuk=;
        b=ELON6IkYA4ODSGKdXnZWMOAMKJ/Lvpi8t6K6T2/7iBPopaMxRNKHTVCiCtHEAehkmP
         lCqqM+Gj00/hBSRWszBhD/9Ap4WXtJNIyrsGH5RJVkbYtnTsw+y8sKXgvXyWiFtTz/Hm
         ABx3ale2tG/olJG4h6wVRJDVTKeocuvCfLAFB3Yn4/+6AaFqpkOpdVftHKr+cjV1zJPX
         frSJWltFk6kIef/foHM62BH1bjaLoPnfodrWJSeR59kBxt1hbnSBxhazq7GQiY6JNxhI
         tmTJK41X8DKEnS6EaB4xI2037aveV15aduXD2GV+SiZbyojfbkiQ33fcP3jAvrgKJIa4
         2JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976193; x=1691568193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8lzVobEOeTxqsg8+m/lWFEcb6TPsN4IGxl7QTiUpuk=;
        b=SdxuRc7NQbKnSKjY3mg6jGcu2AycOpgfl8gA2SFoAFdTlT3NwGIwZLx3GEXr6phYgf
         /S7frnm2HS8BD6JU+gGfVJij1foq6CMR5EXJMzLQ4S9rDiC3zUzrmi054q+Di2fDFZSr
         E4DGVyoa5/ULJ9tNcHo5kawdFGvFwAAVuwC+11f2LLEbs1YruCkN7nbKT7Tfq5Pl+Bgk
         c9TUU8ESpj3JcPrvIri3JZ1SQhf8DWPONG7Td8ZdrS4dkqQlxNwmYpcQ0IazIg8bzOkN
         YD6lTdgHMaNHrCxkKG09DSgLVdMx9ll9Zs5D/WKIxqPgBxdkEa8hxc5kJi0hQt027L8j
         PkEQ==
X-Gm-Message-State: ABy/qLY+fGRZ7cZ43TRRklpb2eEv8psey5+fhBcbbsbHzeXpOg/rE3/I
        agIjWWP6isUQu1QMot7oN/mmXQ==
X-Google-Smtp-Source: APBJJlHwQQqAsShbyMxPedDZrn9+7MYDyhIBN8tCLdUkMekvyuZfXGgLAS1dNaKgWZm6rKqdI+Crrw==
X-Received: by 2002:a7b:c5d6:0:b0:3f7:3991:e12e with SMTP id n22-20020a7bc5d6000000b003f73991e12emr11256174wmk.1.1688976193095;
        Mon, 10 Jul 2023 01:03:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f6-20020a1c6a06000000b003fc05b89e5bsm6316477wmc.34.2023.07.10.01.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 01:03:11 -0700 (PDT)
Date:   Mon, 10 Jul 2023 11:03:07 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "venus: pm_helpers: Fix error check in
 vcodec_domains_get()"
Message-ID: <7d684c80-d9c7-42ca-9ef6-0d4c38ee1876@kadam.mountain>
References: <e1e46cfd-8d95-4792-ac8f-1237d2af7171@moroto.mountain>
 <7550a762-7b00-514d-07a4-d304a6342ae4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7550a762-7b00-514d-07a4-d304a6342ae4@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 10, 2023 at 12:59:22PM +0530, Vikash Garodia wrote:
> Hi Dan,
> 
> On 7/3/2023 9:00 PM, Dan Carpenter wrote:
> > This reverts commit 0f6e8d8c94a82e85e1b9b62a7671990740dc6f70.
> > 
> > The reverted commit was based on static analysis and a misunderstanding
> > of how PTR_ERR() and NULLs are supposed to work.  When a function
> > returns both pointer errors and NULL then normally the NULL means
> > "continue operating without a feature because it was deliberately
> > turned off".  The NULL should not be treated as a failure.  If a driver
> > cannot work when that feature is disabled then the KConfig should
> > enforce that the function cannot return NULL.  We should not need to
> > test for it.
> > 
> > In this code, the patch breaks the venus driver if CONFIG_PM is
> > disabled.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This patch is also based on static analysis and review so probably best
> > to be cautious.  My guess is that very few people disable CONFIG_PM
> > these days so that's why the bug wasn't caught.
> > 
> >  drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > index 48c9084bb4db..c93d2906e4c7 100644
> > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > @@ -869,8 +869,8 @@ static int vcodec_domains_get(struct venus_core *core)
> >  	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
> >  		pd = dev_pm_domain_attach_by_name(dev,
> >  						  res->vcodec_pmdomains[i]);
> > -		if (IS_ERR_OR_NULL(pd))
> > -			return PTR_ERR(pd) ? : -ENODATA;
> > +		if (IS_ERR(pd))
> > +			return PTR_ERR(pd);
> Trying to understand if pm domains for Venus (pd) is returned NULL here, how
> would the driver be able to enable and disable those power domains at [1]. And
> without that, video usecase would be functional ?
> 
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/pm_helpers.c#L1043

I don't understand.  The CONFIG_PM is Power Management.  If you
deliberately disable power management then then, obviously, power
domains are not going to be enabled.  The __pm_runtime_resume() function
turns into:

include/linux/pm_runtime.h
   268  static inline int __pm_runtime_resume(struct device *dev, int rpmflags)
   269  {
   270          return 1;
   271  }

In real life, most people are going to want power management.

This is a video accelerator.  I would expect that it could still work
without power management.  If it really can't then that should be
enforced in the Kconfig.  Having this code here which says "We can't
load without CONFIG_PM" is wrong, it should be "We can't compile without
CONFIG_PM".

regards,
dan carpenter
