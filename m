Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1EF42E057E
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 05:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgLVEtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 23:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgLVEtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 23:49:53 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E00C0613D3;
        Mon, 21 Dec 2020 20:49:13 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id p5so1364058qvs.7;
        Mon, 21 Dec 2020 20:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWtT9dFNEqcjPHmXbiAmtOVLFIp1sJxP3GkNlraCet8=;
        b=V/xri5jBFHmYbWxVUSImNRGuyAQ0cgIJk2RwCYMPY4Csvdds8VDMvvCmmr+KpbP6PK
         NFtdxVjPR9kkM0wa9wl8we7P4z+SDfpxMwzltE9zqZ4lqCsAWyz7WAmdlWDBCHc2w6Hs
         ZbrtkK3LtVSlaxQiYQQoqafv+3fMqNFHhPa/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWtT9dFNEqcjPHmXbiAmtOVLFIp1sJxP3GkNlraCet8=;
        b=HU8eZGpnLZ/IDr4FyG/0SjXoCCYyl5ZF4MCi9BWfmSyOwKtjusglyQob8xl5D0QJA8
         yE2hmiybZpiZLTe5Y4uHUt1yacisQX5p9uO4ka9ig7lA2+XacDfW7QQ3L8ggBmskTajP
         EDUQ6PVBk6b+DuA7wdpuaaw1E30fwmMPLsVQQ67E4mjuB+S/uUkua9vSLF8zM01fGGQU
         iRxO/7Z2Mzc2YK5LZshW4mRhQPCYLk3AMZCFrGxT6e8O9kW7HGva9rrORFVih84ZU8Sq
         K9SVeDBgyPkQw5609fJ8kw9sRuRC784sx/9nPkfRqKsprMmMngdxpJmfoZivzv9w0dXI
         gFJQ==
X-Gm-Message-State: AOAM530waEBAQwnXJ4VIYxP+ChYyuqhh1xOTPYwnrtiLztOdHRRMY+8D
        FmoD02iQzU7iR1e0AmWi2DY362Y6NEMQH8eT9QLMB+2gMao=
X-Google-Smtp-Source: ABdhPJzaVZU4oIKFfYRAkH3IRIleJXfQL+zGDPUA+rF5Cw9csSVMZYtEy8pQb4tpH5uLqJ2xelCA0hFc/0OlWNwvZYk=
X-Received: by 2002:a0c:b990:: with SMTP id v16mr16780968qvf.16.1608612552612;
 Mon, 21 Dec 2020 20:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net> <20201215024542.18888-4-zev@bewilderbeest.net>
In-Reply-To: <20201215024542.18888-4-zev@bewilderbeest.net>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 22 Dec 2020 04:49:00 +0000
Message-ID: <CACPK8XdAfYaAPeyDL4nsG+04xgr-u3+CQKNNdpHAQb4vG7=54g@mail.gmail.com>
Subject: Re: [PATCH 3/3] aspeed-video: add COMP_READY to VE_SPURIOUS_IRQS
To:     Zev Weiss <zev@bewilderbeest.net>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This joins CAPTURE_COMPLETE and FRAME_COMPLETE in the set of interrupts
> that have been seen asserted by the hardware even when disabled, leading
> to the interrupt eventually getting disabled as described in commit
> 65d270acb2d662c3346793663ac3a759eb4491b8.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I have less experience with this part of the chip, so I defer to Jae
or Ryan for an ack.

> ---
>  drivers/media/platform/aspeed-video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 218aae3be809..48c52bf91a1b 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -564,7 +564,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>   * register.
>   */
>  #define VE_SPURIOUS_IRQS \
> -       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
> +       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE \
> +        | VE_INTERRUPT_COMP_READY)
>
>  static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  {
> --
> 2.29.2
>
