Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD414E679B
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 18:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352195AbiCXRTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 13:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347522AbiCXRTE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 13:19:04 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B352BB1891
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 10:17:32 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id h1so6426463edj.1
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4vfCnzIPjyv57wSD3+oAjA+7hchoEnWIl5SY06Hv1o=;
        b=TFrPGx7n7uuJ9Ro2Mt6d3S5dk7HGfrXrptj+qZiNhrwZBrvEmM6e3wX2NxV4uJhyEU
         VwHUWpNMYACv8cJYGsCR4818P/h2PLLFw9iUCR7FUjyFDwWoxff9gPTC7AaQaJjeCQRn
         Zfzn+NGVqBluAy3ip8I6dCYjajGtxWh5nXZnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4vfCnzIPjyv57wSD3+oAjA+7hchoEnWIl5SY06Hv1o=;
        b=bdBxxE3pgSggLUcpkNFCqgixg8nSg0Qub1+K6jnir82w3cRA+hm2+XjWeM6p56fUGJ
         5WusdCPWNQoOmaf9SgkdOXR6s6aRT4S56DqDOd799B3mcHDMy2kKQiJjzo1+M839waj7
         5tALdEt4TA+fdfm+UVJN55vozmHHPo5OtNTGW4Jv/rvxUqtUYPqWjQQsEre0xm+TmNyi
         ymDEODgUN56JgXfVsW0kF0Hsq77o5q3JmqBAB5m8lUfdlN5cMBESeOuoXYUBTk/ABVE3
         AvPwtup5kAZtlTV6AAYA38mOasNAhpUDrY2YdHlz/jwQf6+Tg5DDDoSSKFabJqAaH2eg
         SwXw==
X-Gm-Message-State: AOAM530V6A9fFOtOwiUzf3QP/WdNRhK/q4Bh0Mm+oY/hHCUngI53pENK
        aWmY3Sn9jB18hU2sr0uc9ZCeWrFzqosRsA==
X-Google-Smtp-Source: ABdhPJzoHXe77ijNln6kF1dJWlO/919F2qG4mZJg0EPPiNXu72ckG4MnSu6RmIuRpSF1MJBsNjck9w==
X-Received: by 2002:aa7:da90:0:b0:418:d7d3:3ceb with SMTP id q16-20020aa7da90000000b00418d7d33cebmr7853242eds.129.1648142251197;
        Thu, 24 Mar 2022 10:17:31 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090624c500b006cee6661b6esm1380923ejb.10.2022.03.24.10.17.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 10:17:30 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id dr20so10525959ejc.6
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 10:17:29 -0700 (PDT)
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr6658187ejs.40.1648142249489; Thu, 24
 Mar 2022 10:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220324081718.41091-1-hbh25y@gmail.com>
In-Reply-To: <20220324081718.41091-1-hbh25y@gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 24 Mar 2022 18:17:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCvqQqOZ=uigeSz7ihe-y5XDLCRYD9+ZRULDE21td5rvEQ@mail.gmail.com>
Message-ID: <CANiDSCvqQqOZ=uigeSz7ihe-y5XDLCRYD9+ZRULDE21td5rvEQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvc_v4l2: fix possible memory leak in uvc_ioctl_ctrl_map
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Isnt it a dupe of:
https://patchwork.linuxtv.org/project/linux-media/patch/20211008120914.69175-1-ribalda@chromium.org/
?

On Thu, 24 Mar 2022 at 18:13, Hangyu Hua <hbh25y@gmail.com> wrote:
>
> map->name needs to be freed when uvc_ioctl_ctrl_map fails.
>
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 711556d13d03..e46a2f3b06cb 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -93,6 +93,7 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>
>         kfree(map->menu_info);
>  free_map:
> +       kfree(map->name);
>         kfree(map);
>
>         return ret;
> --
> 2.25.1
>


-- 
Ricardo Ribalda
