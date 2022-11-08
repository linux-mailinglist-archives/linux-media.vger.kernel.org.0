Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF081621AF2
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 18:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbiKHRmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 12:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbiKHRmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 12:42:43 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16A550F14
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 09:42:42 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id i3so14422165pfc.11
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Im0yQPHmSdZ7qPIzaBXmNF94uDBYKcRV5xdanWSpDA=;
        b=lDx+14mJV6uqtkCQXGvfthPDcMdssB/fm+M8mlaeNQa3Z+7zDBJMcNpuf2o0ONL+ze
         clSfKCXyeCQQeh/tizztdifyYnFySZ5tT/etDTOkFQGAn7S17CymT/08hPjvFfrJRd67
         bDcNgZMD17sLJsBfBF/vLljjr2x6TiX40kV5ouA6gi/dlPTICHxtiZr0nu4nBafukqHC
         J7JslPuUzLKmGv6o8JMFCWPM/OAzJfDwq5ocOI62PXX5zlHCIqDKRm1RpuN12R5Aim6C
         NYs6YrADeGqIqlMrwr0HWHC/rBYV7/jKGjgB9yprHwdL1pirBi4LtYMILMcRb2BE8Qkx
         nifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Im0yQPHmSdZ7qPIzaBXmNF94uDBYKcRV5xdanWSpDA=;
        b=F5NeS47Z1t6LDsnNix6UEuit50K4UxqN4eF8HuzXjjb6J8/Ksr8AvSc/nTUrFYJtfP
         RbedOHhnoruWpPD7LbiyE/ss7RylBE8yyAZXSanQOu+tN13+6GgALcH0Wr0Xxs3OaFk2
         mzwRc//W230mjuA2vVv5wgRDOgcit9bpIdi3qWN9n1w+V6faPmsvwfOYlL+xQtvjoPK2
         zw7avpxY1Ob+5dzTTN6Ia/9B9bnrs6ZJkuySzGH/HnFoMUTcZ0s5gD/AclBeJnvWqt1R
         wYdV2tYCEglCzSWau/RcSKPFbzo7vH8UD0+T9D+OUnP3MmGQGDp/0ekzD+Kr5CuAzfDN
         wA5w==
X-Gm-Message-State: ACrzQf3AqTQBKyTMyoxYvDM+tiBlAigIRfAXRzan/iO8IKzPVcYafetR
        ODptsINjH1ZGEtEoeyGbG4U=
X-Google-Smtp-Source: AMsMyM576YAIG7ZmtXJs7CcxKvRSRSXXUluY9oAf2PySkwW4/2a/qMjfIE4ykuvTjACke9EX17BrJQ==
X-Received: by 2002:a05:6a00:e86:b0:56b:9ae8:ca05 with SMTP id bo6-20020a056a000e8600b0056b9ae8ca05mr1048537pfb.59.1667929362113;
        Tue, 08 Nov 2022 09:42:42 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fb10:b5b0:232e:4afb])
        by smtp.gmail.com with ESMTPSA id o23-20020a63e357000000b00462612c2699sm6002646pgj.86.2022.11.08.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 09:42:41 -0800 (PST)
Date:   Tue, 8 Nov 2022 09:42:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH v7] media: s5k4ecgx: Switch to GPIO descriptors
Message-ID: <Y2qVDvcDIoc1Fb0L@google.com>
References: <20221108121623.1510131-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108121623.1510131-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 08, 2022 at 01:16:23PM +0100, Linus Walleij wrote:
> The driver has an option to pass in GPIO numbers from platform
> data but this is not used in the kernel so delete this and the
> whole platform data mechanism.
> 
> Get GPIO descriptors using the standard API and simplify the code,
> gpiolib will handle any inversions.

I think we should simply delete the driver. It does not currently
support OF, and I see no traces of any boards present in mainline using
it, so why to keep it?

Thanks.

-- 
Dmitry
