Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334D5707157
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 20:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjEQSyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 14:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjEQSya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 14:54:30 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4DC1FC3
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 11:54:28 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-24e01ba9e03so938344a91.1
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684349668; x=1686941668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R54qrXpRXauvJnkZnQVt+Z87JHaYQBFqFu4dbWlWKuU=;
        b=YOBsq8PP05/w38VDa0SXCGmdQh/1emiGk49qoBF9cz1Jc6Eoas/qpQPA7EbPAmB7S0
         aZFk3Z2iHcKzdKa388FofA0Up5h+ZFapgP9NTHcTzV/eRtJZP0CeSe214oQGRChz4F96
         88O5wM9zSkZr8bnOxQ3PwNnFIdFUoMaKhUmNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684349668; x=1686941668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R54qrXpRXauvJnkZnQVt+Z87JHaYQBFqFu4dbWlWKuU=;
        b=IThwvj5bQn49EwnP45YSJEOv0VSplXhpAekrVAX+gy0KVpKD+mOFJ5hF0nfGJIQTL0
         7BbVR4NrNmT+5BhOZbR0Y+Myer1mabWRXjiya6LLr90+IjmyHoLWQQ24lBf9ylckdUdy
         6fWIXVHmA7Uci6CFoCM5lO0bvpuGLc9+3rIejLPaDsBJymQ37emi189W0iJyztUR7M29
         r/pCt/3m0yK8LCewlndy/7MI3Lp4719sXr862ZbkpCL+ayF3Nj+DFnh5zhplyR4iuCbk
         P8ZCfOkMaNVlMN0pDs9WK3zSRjUlulsLWuIFpthgczKfYq5iWY7coA5oEXicyZFJbOqe
         eJWQ==
X-Gm-Message-State: AC+VfDzXWSFiVHPT5ggEio0cxclQcGiOY4wicyQ3giiMez1Q1m7m7R7e
        eWXVs+oz07qEv757LlHsC4yYLA==
X-Google-Smtp-Source: ACHHUZ6+0qmyB748J64aWK2VoC7egUUCgofve5208iCv5bsbGWtl4XBIGCzOemSDxj8LWHRRM1KRTA==
X-Received: by 2002:a17:90b:2398:b0:253:3e9d:f92a with SMTP id mr24-20020a17090b239800b002533e9df92amr633903pjb.29.1684349668336;
        Wed, 17 May 2023 11:54:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id om11-20020a17090b3a8b00b0024e268985b1sm1941458pjb.9.2023.05.17.11.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 11:54:27 -0700 (PDT)
Date:   Wed, 17 May 2023 11:54:27 -0700
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
Subject: Re: [PATCH][next] media: venus: hfi_cmds: Replace fake flex-arrays
 with flexible-array members
Message-ID: <202305171152.79664B158@keescook>
References: <ZGQrSQ/zHu+pk7WU@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGQrSQ/zHu+pk7WU@work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 16, 2023 at 07:18:01PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element arrays with flexible-array
> members in multiple structures.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/294
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

The subject is very close to the related patch (plural vs non-plural):
https://lore.kernel.org/all/e4b13d7b79d1477e775c6d4564f7b23c4cf967f2.1684278538.git.gustavoars@kernel.org/

So it might be nice to name struct hfi_session_set_buffers_pkt
specifically in the other patch's subject, but otherwise:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
