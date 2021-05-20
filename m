Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F40D38AD99
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242380AbhETMId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240989AbhETMIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:08:20 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD821C06EA73
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 03:39:44 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id v13so8769534ple.9
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 03:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/RdGTpHpIlnNqukYMSfOi40wGs3gJ2bxRFA/p/HWmc=;
        b=Vhj8ZxDnRnFsKkjgvE0jTxFiP9E6eGyLcgWFUbcEE6BPCOaYrfiee/sSxQ3bZ3EmIA
         8qUPu2mopXJqA5KvDOG7fLjhRNErG+GGUFexzHbLH4YKa69rcXjN0GBvGE1rsIY05p2e
         VROBlatX93nO4HEMcczfdE1W935uS1GxpIkkQGV0VWsWo71UQYT7Tq39t5h0jiz88DUu
         q13f+kH8jZmY1bdai6bxM2NpJ4rOaf/sGrOVZ3+cn8Z5zd9zHRc5AIobTBTe0Q7cq/zo
         GkW4aBUXx17jLCVVrC8mDrHyqSPGRU0oaLUS2156S3ymDUAjA0k6rDXw736AH2PngNEw
         ENdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/RdGTpHpIlnNqukYMSfOi40wGs3gJ2bxRFA/p/HWmc=;
        b=SDLrwY/VsBpuduP4e9N5w3B7YrRhAk6DrWh8IyegCL3AmvBZUOqEhPR3tU1GsSdrFP
         hhqPFjerQDBYQ21jQeM0p/R1aH9UgP/VPvIWe7PLBv6g7D0ASsx5aJXONXoJANjTysUd
         3BKuDbZdZiZDXRacCuZ5QAQVtvrQBfYaTNiCg5pKzvy9paVMqrZMJBDtxp3fH0ukvQYm
         5TiZsd/gDkX943Q4WS7L48fXV1+KuFiS+7RM0QWu9Lr8aZf0rMCt8umkkMbEhFzRFydM
         K2jaj98O94QQlVOog17QulgN81vVhbD8AJyPT2BxeqtccBYhJffjm/wmOU11TyPzxdVT
         IfNQ==
X-Gm-Message-State: AOAM531v09ABIBxi37jY8f/nj9bO5mEQhZ2XyQGlUazulzX0lW6gbkak
        YnV326bgTVg2bPKa/dyF8IRg+bk9g6iHDOhwfgzrTg==
X-Google-Smtp-Source: ABdhPJzf2fR6d+CPHdEr95MzZvm9RJFlJaLVIyK+Nk/R1dCYvI8lZdQuPG7bvcKxY0sCx8N2rOrD6gLETNVjiPOY5J0=
X-Received: by 2002:a17:902:b70f:b029:f4:5445:cd9f with SMTP id
 d15-20020a170902b70fb02900f45445cd9fmr5262680pls.32.1621507184286; Thu, 20
 May 2021 03:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-6-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-6-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 May 2021 12:39:33 +0200
Message-ID: <CAG3jFytS-SBsgPTwN5Uzn=g9k_o-+ifyN7aPrzTvY1nb_csptA@mail.gmail.com>
Subject: Re: [PATCH 05/17] media: camss: csid-170: don't enable unused irqs
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> csid_isr() only checks for the reset irq, so enabling any other irqs
> doesn't make sense. The "RDI irq" comment is also wrong, the register
> should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
> excessive amount of irqs.
>
> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index a81cc94c075f..2bc695819919 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -443,12 +443,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>         val |= 1 << CSI2_RX_CFG1_MISR_EN;
>         writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
>
> -       /* error irqs start at BIT(11) */
> -       writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
> -
> -       /* RDI irq */
> -       writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
> -
>         val = 1 << RDI_CTRL_HALT_CMD;
>         writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
>  }

Reviewed-by: Robert Foss <robert.foss@linaro.org>
