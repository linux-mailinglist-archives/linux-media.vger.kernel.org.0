Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CB271EE72
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 18:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjFAQPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 12:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjFAQO5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 12:14:57 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AD7137
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 09:14:55 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b00ffb4186so6038135ad.0
        for <linux-media@vger.kernel.org>; Thu, 01 Jun 2023 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685636094; x=1688228094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hf1MMDnk8ATuiHQnpftM3deH6vV2jBlcAPqcuKGi0Ek=;
        b=BLOJsskDJTv8yn+ZTSU8DPbhPH9VAEpQcNphr4RmScmbAmgWrp0GukfjFro2r265wS
         6nmFRGSXXGa7RcbInQP2zovN07D4+fErz4lNsHF1JQiB5r265YWCLnVrXvfV9fIuuPKD
         bp9H8NF/OqTzmF7dGtp2dpe9nzNFgZX5Yid94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685636094; x=1688228094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf1MMDnk8ATuiHQnpftM3deH6vV2jBlcAPqcuKGi0Ek=;
        b=HBId5g9jUqni1axjnYwV7hfCfew5UtdtH+kmEAP6b+HUa2WpD34kYbtSpJl8ZSXV3E
         9y+05mmTa/NQzEl8ReABhYT2Avq4AIjnow6wEHH8japLYVSoRWKzNuc3frJHUD8dSKh6
         zdyEdp8kNjix6wPGT1aiQs9JgvhxfSu/uv2H/ixBgvTkK6v0RPNesfVbrlq5pt6kILs6
         drToKFDvfX+JuI7wwjY7Ux1qVSwutAUbZmQGzX2IVWxQ+YOW6JSCi3Vi7+VdwzAxLCpv
         Uh7XvrYWAZIPwpR42e/uirt8DalhVPL5gwcl8LjvpkgcCbuU28Maev8nCFZqWKnaTccn
         YaEg==
X-Gm-Message-State: AC+VfDxZRLcHXicJdxQm5oPyI1/0pe0XAWle7fGFu7Qdr8ZYvp1EABPy
        NfxFZE35+Cx0vxntx/AkhZ9rTQ==
X-Google-Smtp-Source: ACHHUZ6ljnrlP3/ilIjQD+BaM7rS5m1dEr3AyuNBWAGikj0kydZDXi/vDU4GxazSWUNgX9O+Y6PY3A==
X-Received: by 2002:a17:902:c20d:b0:1ac:6d4c:c24b with SMTP id 13-20020a170902c20d00b001ac6d4cc24bmr6045835pll.3.1685636094447;
        Thu, 01 Jun 2023 09:14:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g14-20020a1709029f8e00b001b176ba9f17sm3680035plq.149.2023.06.01.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 09:14:53 -0700 (PDT)
Date:   Thu, 1 Jun 2023 09:14:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     kasan-dev@googlegroups.com, ryabinin.a.a@gmail.com,
        glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
        vincenzo.frascino@arm.com, elver@google.com,
        linux-media@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, ardb@kernel.org, mchehab@kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [RFC] ubsan: disallow bounds checking with gcov on
 broken gcc
Message-ID: <202306010909.89C4BED@keescook>
References: <20230601151832.3632525-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601151832.3632525-1-arnd@kernel.org>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 01, 2023 at 05:18:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Combining UBSAN and GCOV in randconfig builds results in a number of
> stack frame size warnings, such as:
> 
> crypto/twofish_common.c:683:1: error: the frame size of 2040 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:1589:1: error: the frame size of 1696 bytes is larger than 1400 bytes [-Werror=frame-larger-than=]
> drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c:754:1: error: the frame size of 1260 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> drivers/staging/media/ipu3/ipu3-css-params.c:1206:1: error: the frame size of 1080 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> drivers/staging/media/rkvdec/rkvdec-vp9.c:1042:1: error: the frame size of 2176 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> drivers/staging/media/rkvdec/rkvdec-vp9.c:995:1: error: the frame size of 1656 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> 
> I managed to track this down to the -fsanitize=bounds option clashing
> with the -fprofile-arcs option, which leads a lot of spilled temporary
> variables in generated instrumentation code.
> 
> Hopefully this can be addressed in future gcc releases the same way
> that clang handles the combination, but for existing compiler releases,
> it seems best to disable one of the two flags. This can be done either
> globally by just not passing both at the same time, or locally using
> the no_sanitize or no_instrument_function attributes in the affected
> functions.
> 
> Try the simplest approach here, and turn off -fsanitize=bounds on
> gcc when GCOV is enabled, leaving the rest of UBSAN working. Doing
> this globally also helps avoid inefficient code from the same
> problem that did not push the build over the warning limit.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Link: https://lore.kernel.org/stable/6b1a0ee6-c78b-4873-bfd5-89798fce9899@kili.mountain/
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110074
> Link: https://godbolt.org/z/zvf7YqK5K
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I think more production systems will have CONFIG_UBSAN_BOUNDS enabled
(e.g. Ubuntu has had it enabled for more than a year now) than GCOV,
so I'd prefer we maintain all*config coverage for the more commonly
used config.

> ---
>  lib/Kconfig.ubsan | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index f7cbbad2bb2f4..8f71ff8f27576 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -29,6 +29,8 @@ config UBSAN_TRAP
>  
>  config CC_HAS_UBSAN_BOUNDS_STRICT
>  	def_bool $(cc-option,-fsanitize=bounds-strict)
> +	# work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110074
> +	depends on GCC_VERSION > 140000 || !GCOV_PROFILE_ALL
>  	help
>  	  The -fsanitize=bounds-strict option is only available on GCC,
>  	  but uses the more strict handling of arrays that includes knowledge

Alternatively, how about falling back to -fsanitize=bounds instead, as
that (which has less coverage) wasn't triggering the stack frame
warnings?

i.e. fall back through these:
	-fsanitize=array-bounds (Clang)
	-fsanitize=bounds-strict (!GCOV || bug fixed in GCC)
	-fsanitize=bounds

-- 
Kees Cook
