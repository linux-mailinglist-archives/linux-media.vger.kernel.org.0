Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22AB705895
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 22:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjEPUSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 16:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjEPUSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 16:18:42 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456F897
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 13:18:41 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae4c5e12edso600725ad.3
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684268321; x=1686860321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UB7KvHTOxdYfuutEcEFffzDOEyewDG4/NgY1Y/mO/ec=;
        b=XrLcPWx5b85VDO/HHZMuFNnlnUMFjEXRW0HwKQZICuO3bA5WerPDkglr/BQN5QvtNL
         kml5bpuuCw1FkYr36nh1HvrAbs32v8ps1Nxeii7M3fMLWvoQwNxlKwOOYj0Z7WUiejjJ
         UKWVsHICNCX5carltaQmlG+V4G9z+EZdMm+YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684268321; x=1686860321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB7KvHTOxdYfuutEcEFffzDOEyewDG4/NgY1Y/mO/ec=;
        b=OaZqfxWFiL5RbDmnX5fiCz+Rc0wI+1kd5si7LYR1XIO/djTQuWnX0CeF2KyQDCTyF7
         BI9/udawvaCpjcXYT3FS6mGVqUltaoMULzm+K6Qx95eai1JxsiQVdjEQyORCY5ZJdAsa
         6kxtkyN3V7BSrvz1pp8OLLLA9Y7kO9ZDnM8DZ5Ez4iS/db+fYSzrB77DkRmYIwI+twnI
         6zz85Upp2S8rEwG/8gm1s3PEsLOJYNmNAq2eOWNzIMk9V7swV+SZ/5ZR41fqFvXQRyeE
         COvJTi5ZC0lhdyCrETALL+LGdNAoMeoUxU+mVAXy5849rk8MuGdOrSFnm8jZ8c+kgZq3
         n0GA==
X-Gm-Message-State: AC+VfDyZrx57bqB7elOBWUeKvECTRD70G2wnOpB+5g04qNqa0UwGmvSz
        MfhoZMkAgvjh+PxhR/W26k5VVA==
X-Google-Smtp-Source: ACHHUZ7Hgj6TTvcI0iIqmt1f84LzDIuAzkvPnhjlnmX8NdGMsa7uAUyLiVJBpwoTf6Fj3DCOClH6og==
X-Received: by 2002:a17:902:bd06:b0:1ad:fc06:d7c0 with SMTP id p6-20020a170902bd0600b001adfc06d7c0mr13376083pls.1.1684268320847;
        Tue, 16 May 2023 13:18:40 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090adb4b00b0024dee5cbe29sm96260pjx.27.2023.05.16.13.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 13:18:39 -0700 (PDT)
Date:   Tue, 16 May 2023 13:18:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] media: venus: Replace one-element arrays with
 flexible-array members
Message-ID: <202305161318.4AF9203EB@keescook>
References: <ZGPk3PpvYzjD1+0/@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGPk3PpvYzjD1+0/@work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 16, 2023 at 02:17:32PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element arrays with flexible-array
> members in multiple structures, and refactor the rest of the code,
> accordingly.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/291
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Oh fun, a subtraction variant! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
