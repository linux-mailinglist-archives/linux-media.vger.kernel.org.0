Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5324F4AAC
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353698AbiDEWub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573084AbiDERza (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 13:55:30 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2466DE09C
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 10:53:30 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id c15so18099312ljr.9
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MYJtsikWi9hIB8NHNY8S76MVB/wVdm4tXnry+6+yiEo=;
        b=ijwBLjjh6lk3Bb+x9kE21mGPVSMbJnI+Yi/zPHj8mem2U9fEgN+edh+EmjEqa+XZcD
         n/lfaXf0Tweh9j3vMEvYaRq5AnA39APG5yQv6NKxIshzQR69mp6t6YhwSPfx9qs+WETe
         qzbk+Vb7I8DycQ3I99Ja5mziLFXJ/cQUDqh9BmEFPMUrEBXvhlToOea+VAhw6cZbQC74
         NLoIe5lNwslTIQJXZenzM6298KtFhaCaJ7H2Dofx9iOBYLBqokApBi/5kHOVzBOSha+8
         N0ViNXCPr1zN2Xi1NpaNTckkmR0R5uQew58xTxPUq6A6fCfWeEH1Zr8aSDV8F7XJ0RBt
         zqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYJtsikWi9hIB8NHNY8S76MVB/wVdm4tXnry+6+yiEo=;
        b=cBjkTqjhvhlOVVMbq5OeGsXFuYJbpzbl36oQu/3uG5GCHEZI/fJ1CvXnCfIsWSwUzP
         RSvp9tWrfiw1n0nL+43LeqKr1goUkZdGzJZWBD9FqK8ss+8JD6yB0VQAsPbtv1Wun2R0
         rSR/aTA7EDl1TQ6ZxV/JdkVH4TsoNyrvwSkSOibzyWTy608jJ2lmvo6QBmJBLA9UXxrz
         3fH1ygVMzAXk5IIPVyKaaBVMGU5NE71c914kVp3kGBffxa4itlhLFfWM5T3hpVy7VP66
         AdQNxTRdfSBjKlKbKlw/nnDm2dHIDothL2u34jIvJ+dcAEdGb9pNCt4wbuKSdiSFOXBD
         aBAQ==
X-Gm-Message-State: AOAM53129HPRVaQZYwL42vstf60+xJ4AJlcUZqCNJ7cI/KRASDfxpcmm
        u162WhEUgTJqZ1v26DRHgAYEJDlB3m1aL6+U/9woSV4yn2qVrg==
X-Google-Smtp-Source: ABdhPJxkfZhW0np+6HFZguzcslyOvUzoSGSv9BMWk5pjhEH5IyVC6Lb8xm3p/2a9i36EyTCg1IFq70K2lSb/IBVbZTs=
X-Received: by 2002:a2e:9ec4:0:b0:24b:115c:aedb with SMTP id
 h4-20020a2e9ec4000000b0024b115caedbmr2807694ljk.235.1649181208750; Tue, 05
 Apr 2022 10:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220319143456.2159540-1-trix@redhat.com>
In-Reply-To: <20220319143456.2159540-1-trix@redhat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 5 Apr 2022 10:53:17 -0700
Message-ID: <CAKwvOdkEnDBFUtio2+UVeV1J3QUwAJOc-YgcubDEUXHWMF5gbw@mail.gmail.com>
Subject: Re: [PATCH] media: platform: return early if the iface is not handled
To:     trix@redhat.com
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        nathan@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Mar 19, 2022 at 7:35 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this issue
> ispcsiphy.c:63:14: warning: The left operand of '<<'
>   is a garbage value
>         reg |= mode << shift;
>                ~~~~ ^
> The iface switch-statement default case falls through
> to ISP_INTERFACE_CCP2B_PHY1.  Which is later checked
> to set the mode.  Since the default case is left out
> of this check mode is never set.  Instead of falling
> through and assuming a ISP_INTERFACE_CCP2B_PHY1
> iface, return.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/media/platform/ti/omap3isp/ispcsiphy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/ti/omap3isp/ispcsiphy.c b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
> index 6dc7359c5131d..1bde76c0adbee 100644
> --- a/drivers/media/platform/ti/omap3isp/ispcsiphy.c
> +++ b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
> @@ -31,7 +31,8 @@ static void csiphy_routing_cfg_3630(struct isp_csiphy *phy,
>
>         switch (iface) {
>         default:
> -       /* Should not happen in practice, but let's keep the compiler happy. */
> +               /* Should not happen in practice, but let's keep the compiler happy. */
> +               return;
>         case ISP_INTERFACE_CCP2B_PHY1:
>                 reg &= ~OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2;
>                 shift = OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_PHY1_SHIFT;
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
