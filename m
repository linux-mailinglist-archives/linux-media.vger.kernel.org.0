Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF535EEDD7
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 08:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiI2GYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 02:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233911AbiI2GYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 02:24:10 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670B7E5FB2
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 23:24:09 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id a13so645878edj.0
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=upfZgUoEnqMXhhClVd98V+zFYpidLVy3tCff7B12Ueo=;
        b=HbYTrgWl1Vilxz0kDtuxKoGqS9pEvjO4kfzJB1iXHz7G5UhdbWRr8kneEL7G0lshZr
         n2lxDaGUCW0UCsNlHqbAbLXGjiVPsA9Z0TjkzL9lcSzjPQxhBsuz9tWyq8Fxs5wZtnnU
         z37pfcNYw5UgUFJIGV34Up7YAyHQYs1YHnNPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=upfZgUoEnqMXhhClVd98V+zFYpidLVy3tCff7B12Ueo=;
        b=Lg9FmqI6L26TPwrKRLofupy7toQnPEIe1d5fojwzD8h6hKe8cSo+cyXtEDtSrQH/XA
         H6cW0bVz4eSK8dxdDgmSsmnlYlop33rWQwSluEFtdv8TZNKe65tT+riaGNuFI9FSQC9I
         crv7VvCZJQWsLyeHDEi2ol7pcSg3SKdLQpoMUiU+wgVWbvqtHyUWxakny3kQYbbCSsvZ
         Nk6IeBcrAt/WIwfFBgZgu/Nu1XdzCn6SnGGqgIgW/XjrMbu0eQrMo/Jt6ykYUfDQQGgM
         gIZULqeWJCwbiLpXOXF3k2SlId0PfVcggmgtKVv7hMfth5NvIJH++niWynzNmMJ6IhWm
         5jaA==
X-Gm-Message-State: ACrzQf3+mKBiowDW9Vw4fC45pvm6oOfwoExf4O3smOo6iEeq2f+49EXr
        +pP8PKX7zYUAPgiTFdk2EZl1C2W4r0A0VopC
X-Google-Smtp-Source: AMsMyM7HSqv4z/d0o8U8dnVQQp2igwNrlxMZ0WhNSoliOlJ+UCZC9jo4AhdWD56LHY9rabYvaA6gbA==
X-Received: by 2002:a05:6402:370c:b0:453:9fab:1b53 with SMTP id ek12-20020a056402370c00b004539fab1b53mr1763201edb.28.1664432647874;
        Wed, 28 Sep 2022 23:24:07 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id gh33-20020a1709073c2100b0077d6f628e14sm3433864ejc.83.2022.09.28.23.24.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 23:24:07 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id b2so686754eja.6
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 23:24:06 -0700 (PDT)
X-Received: by 2002:a17:906:2699:b0:781:a473:9791 with SMTP id
 t25-20020a170906269900b00781a4739791mr1361551ejc.644.1664432646492; Wed, 28
 Sep 2022 23:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
In-Reply-To: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 29 Sep 2022 08:23:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCuWSnTQsU2B-Uk14jDp9BXgcohwyjvCJ7-sX=bdU68oGw@mail.gmail.com>
Message-ID: <CANiDSCuWSnTQsU2B-Uk14jDp9BXgcohwyjvCJ7-sX=bdU68oGw@mail.gmail.com>
Subject: Re: [PATCH] Remove priv_user_controls in v4l2-test-controls
To:     Yunke Cao <yunkec@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

nit: mention in the subject that the change is for v4l2-compliance


On Thu, 29 Sept 2022 at 06:12, Yunke Cao <yunkec@chromium.org> wrote:
>
> Removing priv_user_controls and its related checks.
>
> I suspect this is wrong because:
>
> 1. priv_user_controls == priv_user_controls_check is not always true.
>
> priv_user_controls counts the number of controls with
> id >= V4L2_CID_PRIVATE_BASE (0x08000000).
> priv_user_controls_check uses V4L2_CTRL_DRIVER_PRIV ((id) & 0xffff) >= 0x1000).
>
> The private controls defined in V4L2_CID_USER_BASE + 0x1000 will count towards
> priv_user_controls_check, but not priv_user_controls. For example,
> V4L2_CID_USER_MEYE_BASE (include/uapi/linux/v4l2-controls.h#n158).
>
> 2. Line 205 returns error for id >= V4L2_CID_PRIVATE_BASE. Counting
> priv_user_controls will not happen.
>
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> ---
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index 999dbcd7..18c9f638 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -182,7 +182,6 @@ int testQueryExtControls(struct node *node)
>         __u32 which = 0;
>         bool found_ctrl_class = false;
>         unsigned user_controls = 0;
> -       unsigned priv_user_controls = 0;
>         unsigned user_controls_check = 0;
>         unsigned priv_user_controls_check = 0;
>         unsigned class_count = 0;
> @@ -299,30 +298,11 @@ int testQueryExtControls(struct node *node)
>                 user_controls++;
>         }
>
> -       for (id = V4L2_CID_PRIVATE_BASE; ; id++) {
> -               memset(&qctrl, 0xff, sizeof(qctrl));
> -               qctrl.id = id;
> -               ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
> -               if (ret && ret != EINVAL)
> -                       return fail("invalid query_ext_ctrl return code (%d)\n", ret);
> -               if (ret)
> -                       break;
> -               if (qctrl.id != id)
> -                       return fail("qctrl.id (%08x) != id (%08x)\n",
> -                                       qctrl.id, id);
> -               if (checkQCtrl(node, qctrl))
> -                       return fail("invalid control %08x\n", qctrl.id);
> -               priv_user_controls++;
> -       }
> -
> -       if (priv_user_controls + user_controls && node->controls.empty())
> +       if (user_controls && node->controls.empty())
>                 return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
>         if (user_controls != user_controls_check)
>                 return fail("expected %d user controls, got %d\n",
>                         user_controls_check, user_controls);
> -       if (priv_user_controls != priv_user_controls_check)
> -               return fail("expected %d private controls, got %d\n",
> -                       priv_user_controls_check, priv_user_controls);
>         return result;
>  }
>
>
> ---
> base-commit: 7f560aede797b659b585f063ed1f143f58b03df5
> change-id: 20220929-remove_private_control_check-ab8cc38a1b9e
>
> Best regards,
> --
> Yunke Cao <yunkec@chromium.org>


Thanks!
-- 
Ricardo Ribalda
