Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69C9707197
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 21:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjEQTLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 15:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjEQTLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 15:11:50 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686083A8D
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 12:11:48 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64390dc0a7fso283240b3a.1
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684350708; x=1686942708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmRR+LDHi4vpUNfcU4UnpvuCDjrlHXKQ9miogAVxhUc=;
        b=FDNiwE1wBwNXmIbzPtvxKOeuyLv+uey9+OwW+wADK5iqWFO7m04+X+j+7fGCgiWNPq
         o1nMxEcxrUqnKmSqQ7/cx6sY3sunlH3JvM6/vE6FP03x8sb8khI2/boHqXI4JYeMpQJL
         jGNnTk3cf6CUNOTaJYjDV6pkpkZofERqfBMNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350708; x=1686942708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmRR+LDHi4vpUNfcU4UnpvuCDjrlHXKQ9miogAVxhUc=;
        b=aO1ZGMT4bnIyWg/1rhLuXkvPtm8Z2+vyePYiu+4Zamqao6K6ShV3tOSDH8Ar7EK8Af
         qr0fYof+/RqQh0I84KEvM1iC4MYVNLk8FoqaCYS/Fndgp+M88qVL0sUvou2m+/bdOpGQ
         WvNMxtbXpJd3Q6WUlD5+fE4kZLmNBr+fwxivbCpIUx2VPPVfhmrr0OXG9S2EEQbW3T7B
         sm5wu1B2AJuskbjoaKCbS99FcGvJ3LysQsQL40Zqr8nPqRfeYZJukg2wDL+dmK0bWS9Y
         sQxN1nJbDYEu1dMGPWihixXnspZ2QL9Xtjld0BWeAd6yzW+eGBtSQp3Bvguf5PtiKcCE
         7WMg==
X-Gm-Message-State: AC+VfDyhBKVxDU8M/ghmVfUjQX2/6CLh4eO7sa0BYoAz1DRnNCTjV4zS
        eH5rAkNST20KN/d31TLijlVTgA==
X-Google-Smtp-Source: ACHHUZ7wLjrqSTw1UhI0SssyHVt2MDqbCYAvBTTdRW0t5h6nvBmWStNbTIaFvH9ERQgSF8UUFI3Rjw==
X-Received: by 2002:a05:6a00:1901:b0:647:157b:cb61 with SMTP id y1-20020a056a00190100b00647157bcb61mr380822pfi.7.1684350707893;
        Wed, 17 May 2023 12:11:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b006439b7f755bsm15980446pff.98.2023.05.17.12.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 12:11:47 -0700 (PDT)
Date:   Wed, 17 May 2023 12:11:46 -0700
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
Subject: Re: [PATCH 1/2][next] media: venus: hfi_cmds: Replace one-element
 array with flexible-array member
Message-ID: <202305171211.F973001@keescook>
References: <cover.1684278538.git.gustavoars@kernel.org>
 <e4b13d7b79d1477e775c6d4564f7b23c4cf967f2.1684278538.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4b13d7b79d1477e775c6d4564f7b23c4cf967f2.1684278538.git.gustavoars@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 16, 2023 at 05:14:27PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element arrays with flexible-array
> members in struct hfi_session_set_buffers_pkt, and refactor the rest of
> the code, accordingly.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/292
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
