Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6717470E300
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 19:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238084AbjEWRW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 13:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238057AbjEWRWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 13:22:24 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671C9E42
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 10:22:01 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d44b198baso94668b3a.0
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684862521; x=1687454521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fHVrD6f1ZBUvDig9B8fW+B2T1eaWt6K+xteWleiUqpM=;
        b=e5PYsZyCe4Epu1Ke/nz+Z7QcMheP3mHbB5OT+nXSLQHtYOVqA0B5S+RVBcCdExHr7O
         PLvUYCGSC+fAdno27iE+11Hiv6vMk2puQ2aeXx+WjolHH54i76xJTjTYLZ1BPZqKTgI0
         IQsOUruJVQH6ptfrpSjbYLmsOSRLfml/Lzv0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684862521; x=1687454521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHVrD6f1ZBUvDig9B8fW+B2T1eaWt6K+xteWleiUqpM=;
        b=ATnnw4d0WTMkbWtkTL3LcaTpqvEfn75KYt0iLUhof/+XkLUmQSh6eF+s/SlrEjgAmQ
         Z6MXKb/QfNcf07mG09H60SOb6WkKof1imYB9XANuOZZuwKp0zWJ2H4q7tpBE1eFZoro9
         86zLOVkZWCn+OtL8+k+d2XqENStYaTBwDC1cBs7TPlTU7YsShtOiXgBGZY6H9hTTYKC+
         eXFNR7Z3sRDs8YFqvjKuKT/T5w2iqLGILeUqwOTRMcWTKjVcfFPRxUOUofksq/9V57wj
         gdRE2KboFnNSm3xtJ1FEWsxfSCCe8svrelCadTJ7+P3hjFW2NMo29Dk5Zm4+8jT3Q+A8
         juug==
X-Gm-Message-State: AC+VfDzvkjxkNTQwrvESnk/NXmOHm7K7JIlVm76kzH6TKyI2uXra4rna
        J2gQZSO9yeYh8G9svsnULMlMAw==
X-Google-Smtp-Source: ACHHUZ7cXxywMhTMsCCeZFCG2v76uB1SI9E//UYkMAB7ugfsk2mA7bx7DzrpyQIaVH5nJKGzE6aICQ==
X-Received: by 2002:a05:6a20:12d1:b0:10c:6956:a23c with SMTP id v17-20020a056a2012d100b0010c6956a23cmr3057009pzg.25.1684862520815;
        Tue, 23 May 2023 10:22:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 139-20020a630591000000b0051baf3f1b3esm6359325pgf.76.2023.05.23.10.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 10:22:00 -0700 (PDT)
Date:   Tue, 23 May 2023 10:21:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-hardening@vger.kernel.org,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf/sw_sync: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305231021.1AF1342BF@keescook>
References: <20230523021943.2406847-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523021943.2406847-1-azeemshaikh38@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 23, 2023 at 02:19:43AM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
