Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9A765FC6C
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 09:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjAFIJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 03:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjAFIJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 03:09:10 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBA078E86
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 00:09:08 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4b6255ce5baso12794357b3.11
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyf8/xdGIeyv+pywCJ7PHhoImivmp2P3M0qiI+bO/c0=;
        b=bKGQNv8uXrlgWUEXeM3i3nMbH++VCHo5Yd2FIZluObPRD9Ni8ZAV5+Rsoj6oUrunux
         XqkRD57gxFntIkgC6ON5sAmTV6SsUhL4LnjDSvm7OynSk0wYYRv0lYIAA5hvdaDLkNDm
         gbPYNbfbsHYnQVp89GzllLyunTyen147ZckzV03lYPlvUbWzd/IMG3WtxVhrIztaC1at
         8pByiUA4KnBXJednw62cSq5dBytKmZgxy1pm2K4dhwhXBQTSmCd2cRG9/SwCwEdly2Jf
         2wi9KSpffb3Kr/v9ydbdEcaJwaBpYIGum2+0u+8ZyUtmyZF2SUXX6YwJAEb7jr/rtBw8
         EGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oyf8/xdGIeyv+pywCJ7PHhoImivmp2P3M0qiI+bO/c0=;
        b=afTOehdDrIAbLX9J7eZYfhshdIJ8w84Sijd1B8VUFt1ZZuoPpov9wqcvuQUAQcdfYB
         0wiJBXnooJd1qQ0kJq/T30qzOCjicJks7UoMad973SiRPRyQtPM4mcuJClSbLM1LU1xr
         NBycx3OGO2kkPP6u5d3A6scKZiimCFZ2Kb/uggLBDwIK0eNUsNvbiDYHcIWdrNVGrXzd
         xUkrWjIV7tp09qxdnSfv+41pfTWBHLb44O21buc+ED6I+8q0XaH0p6+uR5bZRrDqz1Lh
         aMkWgguxHEDsbbSLCdxGKKMpYyKosfEmSQH7vs+89XiEKh2+94mkWMcF3wPd3ZYZWbD/
         IfMQ==
X-Gm-Message-State: AFqh2kp/JMyNoiGfeRn84ambCjZJ6RfO5oq3Fmen4jt/jn36qz7BlbNZ
        zprRvygg/hi3QnSRqkxdxmHLNhTL55m0gQChAQmrRA==
X-Google-Smtp-Source: AMrXdXsLzL9Cvjgf8Y76dGUlcsqoNvKrwQbdhz65NgGzcCjttxAwInXhnzL11PxiUmdUUMCG8BW0VjLcKK8Mr0JOCOQ=
X-Received: by 2002:a81:1e88:0:b0:432:2458:f6ca with SMTP id
 e130-20020a811e88000000b004322458f6camr7411794ywe.138.1672992547775; Fri, 06
 Jan 2023 00:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20230106013824.27208-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230106013824.27208-1-jiasheng@iscas.ac.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Jan 2023 10:08:56 +0200
Message-ID: <CAA8EJpqfssbS8VPmBHv6Y26ubJ-mG69tm+yz68OmYBA5_bP9Gw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add missing check and destroy for alloc_ordered_workqueue
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 6 Jan 2023 at 03:38, Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
>
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Please resend the patch, including freedreno@ to the cc list.

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)



-- 
With best wishes
Dmitry
