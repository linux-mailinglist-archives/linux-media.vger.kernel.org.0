Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86F3F54D752
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 03:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347164AbiFPBss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 21:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350750AbiFPBsl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 21:48:41 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D8F580E5
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 18:48:40 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id y16-20020a9d5190000000b0060c1292a5b9so88507otg.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=zsAR485NAoLbuB4xy+EFaubp0HCxCBbW1Ts4crF5Tow=;
        b=fFbJr2IbEynRy8sloZIbFIKtAgvnSDsMcczI/pilKtebnbmnffln9+D+JvgqFqHmy7
         fzDj+BWsTbjUnXVamZs6LUKx6o6jah5DOhR8WSbCv+r+stXp8b6G5Ed5Zl5FwwIK4QEG
         nyIq0y7qYeh/9hb6l0sXqUB47+yv1g9WB8IAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=zsAR485NAoLbuB4xy+EFaubp0HCxCBbW1Ts4crF5Tow=;
        b=ckGmKcW+/8dc7wolPby/KVD055fwoQFPAGt2wnLnd9FzUAmzNNRumW62P+qHeClKKk
         yTfFV350WEx/tGzVKkuO3AiYq1YfKP/klwWWC7lTLekjP84ZcPN2/Kh/sfktlBAt3t7H
         Eamvh3EiAMREFJT2I6kVvAM6heReKyX75Q5nJM8rVznxSRfq9pQJMMslZc1mbo7H379I
         tFkxdDhsnExNFefQZ6FYe/JfapPDTmstTLvqL9N/AQNOoM/b+/Wa1k4fTTKuVuk6cPV9
         xx2vviTPwOvuTnv/4bUBEt7Zs2adbifUUa7njJ/3w8A5UM2U4M4dq5ldl2kKDgjyb6Qe
         pfkw==
X-Gm-Message-State: AJIora91yYVgI+J/dt3bLeqpe75iDg+niTymbD3VbKfT2n+pWSWjqqk8
        UuW8MMmYqM/Drq2un0dk0iDw/bWBe5aRSVAmWRUAoHEFdms=
X-Google-Smtp-Source: AGRyM1vkdG1UsaBWMVNR7pM3j9XT4Pof9Ae4f+42js0Hjj5kjpMoNBueX1tXdoue7LykGv4I9lZ63ndZ012a2vrv43I=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr1212868otj.77.1655344119098; Wed, 15
 Jun 2022 18:48:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jun 2022 18:48:38 -0700
MIME-Version: 1.0
In-Reply-To: <1655285409-19829-1-git-send-email-quic_dikshita@quicinc.com>
References: <1655285409-19829-1-git-send-email-quic_dikshita@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 15 Jun 2022 18:48:38 -0700
Message-ID: <CAE-0n53O7gb9C2uPOiHjyDuAZmxMQyUL9MtLoRa-8Lr666PENw@mail.gmail.com>
Subject: Re: [PATCH v2] venus: Add support for SSR trigger using fault injection
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        quic_vgarodia@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dikshita Agarwal (2022-06-15 02:30:09)
> Here we introduce a new fault injection for SSR trigger.
>
> To trigger the SSR:
>  echo 100 >  /sys/kernel/debug/venus/fail_ssr/probability
>  echo 1 >  /sys/kernel/debug/venus/fail_ssr/times
>
> signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Why is Stan's SoB here?

> diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
> index 52de47f..ec15078 100644
> --- a/drivers/media/platform/qcom/venus/dbgfs.c
> +++ b/drivers/media/platform/qcom/venus/dbgfs.c
> @@ -4,13 +4,34 @@
>   */
>
>  #include <linux/debugfs.h>
> +#include <linux/fault-inject.h>
>
>  #include "core.h"
>
> +#ifdef CONFIG_FAULT_INJECTION
> +static DECLARE_FAULT_ATTR(venus_ssr_attr);
> +#endif

This endif isn't needed.

> +
> +#ifdef CONFIG_FAULT_INJECTION

and this ifdef isn't either. The two can be combined.

> +bool venus_fault_inject_ssr(void)
> +{
> +       return should_fail(&venus_ssr_attr, 1);
> +}
> +#else
> +bool venus_fault_inject_ssr(void)
> +{
> +       return false;
> +}

Put this part in the header file and make it static inline. Then the
compiler is going to inline the false to the if condition and optimize
the entire branch away unless the config is enabled. It would also be
nice to extern the venus_ssr_attr so that the should_fail() can be
directly inlined into the interrupt handler.

> +#endif
> +
>  void venus_dbgfs_init(struct venus_core *core)
>  {
>         core->root = debugfs_create_dir("venus", NULL);
>         debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
> +
> +#ifdef CONFIG_FAULT_INJECTION
> +       fault_create_debugfs_attr("fail_ssr", core->root, &venus_ssr_attr);
> +#endif
>  }
>
>  void venus_dbgfs_deinit(struct venus_core *core)
> diff --git a/drivers/media/platform/qcom/venus/dbgfs.h b/drivers/media/platform/qcom/venus/dbgfs.h
> index b7b621a..b0d0686 100644
> --- a/drivers/media/platform/qcom/venus/dbgfs.h
> +++ b/drivers/media/platform/qcom/venus/dbgfs.h
> @@ -8,5 +8,6 @@ struct venus_core;

+#include <linux/fault-inject.h>

>
>  void venus_dbgfs_init(struct venus_core *core);
>  void venus_dbgfs_deinit(struct venus_core *core);

#ifdef CONFIG_FAULT_INJECTION
extern struct fault_attr venus_ssr_attr;
static inline venus_fault_inject_ssr(void)
{
	return should_fail(&venus_ssr_attr, 1);
}
#else
static inline bool venus_fault_inject_ssr(void) { return false; }
#endif
