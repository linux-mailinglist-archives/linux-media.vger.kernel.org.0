Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06552730189
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 16:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245529AbjFNOTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245505AbjFNOTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 10:19:15 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F3EE5
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 07:19:13 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7606e639083so119760385a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686752352; x=1689344352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zbkzHLs44ruxAGk+LlSmbqWoGwZGMK/77GVlyd262SI=;
        b=gRSoqfRPpZqAK+aYcvwQVC6f99pgmLGZS7jmWpeGWEP2ZGPor7FtQmsbovNGpi/+ta
         njbYuejtCg9PV1E4qajUuxAowFuUc7AzVB9uDm/J2lRJZtlF3cHGVBFeu0MbvObY4a8r
         xeCBCOTcctE2YYEkEKppzT2EGodEBTTtlSqRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686752352; x=1689344352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbkzHLs44ruxAGk+LlSmbqWoGwZGMK/77GVlyd262SI=;
        b=FPwM+7AMIuDlXKj4EHCny5Cm70Vb52pTpYH+UekdYmr8DBOq2+hTTBnPc2k4umyLI3
         BJAJTMjkRocFPUtcWwY2nEOZ8Bcw3rtFPFqBv+QkVAnPONcappuEJgPcqO4P4ivCB26W
         QZnviJYeRJkFHA2EuW2CVpjyAqqIZPnEaQo0PA4gP5nn9uSClte8zelss9qB6yY5ibgp
         k2j7yHtL9bEwvqDuxPehCNcfWI7h5qu5S/Ze6O9g5dViDLhJsy8icUi8A3HQ10El6Hsw
         drN2D2agUBn5hTDmjso9+RlJncgHlW6PDwFhnZKbxw7P+J3u1fY+K9UzqkoqvpXU1aJc
         HubA==
X-Gm-Message-State: AC+VfDx4Ma1I9u0T/SMBpoEu0WtrG7xeAXj7ZYaA+U9Tzdd/Hco2jXbq
        /CWh6yNqdPobPtKs/1u5XbcIxwy+J2AEzhcgn/8=
X-Google-Smtp-Source: ACHHUZ7NfnMRPPCwC9qP7rLsHcrQJfuBJGMP7ajDPMrmX4x8aSOGMfYbLoqulSzqvzsl+lqlwTThtA==
X-Received: by 2002:a05:620a:4484:b0:75e:b9c2:b1f9 with SMTP id x4-20020a05620a448400b0075eb9c2b1f9mr2389811qkp.8.1686752352454;
        Wed, 14 Jun 2023 07:19:12 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id w27-20020a05620a129b00b0075945c93107sm4311105qki.102.2023.06.14.07.19.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 07:19:11 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-62dee1b51f9so12583146d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 07:19:11 -0700 (PDT)
X-Received: by 2002:a05:6214:1c0a:b0:62d:ddeb:3770 with SMTP id
 u10-20020a0562141c0a00b0062dddeb3770mr1884667qvc.0.1686752351452; Wed, 14 Jun
 2023 07:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
In-Reply-To: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Jun 2023 16:19:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com>
Message-ID: <CANiDSCsmKvOZFmcBCAtc8D971a=FvRcn_rJgO=omKrCR2fvNOA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: uvc_ctrl_get_rel_speed: use 0 as default
To:     Gergo Koteles <soyer@irl.hu>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[Now in plain text mode]

Hi Gergo

Doesn't your patch affect pan and tilt for all the cameras, not only the BCC950?

Also it seems that 1 means that device does not support programmable
speed. Is that correct?

```
The bPanSpeed field is used to specify the speed of the movement for
the Pan direction. A low
number indicates a slow speed and a high number indicates a higher
speed. The GET_MIN,
GET_MAX and GET_RES requests are used to retrieve the range and
resolution for this field.
The GET_DEF request is used to retrieve the default value for this
field. If the control does not
support speed control for the Pan control, it will return the value 1
in this field for all these
requests.
```

When you program that value do you see any difference on the device?
What is max, min and res?

Thanks!

Regards!


On Wed, 14 Jun 2023 at 15:13, Gergo Koteles <soyer@irl.hu> wrote:
>
> The Logitech BCC950 incorrectly reports 1 (the max value)
> for the default values of V4L2_CID_PAN_SPEED,
> V4L2_CID_TILT_SPEED.
>
> This patch sets them to 0, which is the stop value.
>
> Previous discussion
> Link: https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 5e9d3da862dd..e131958c0930 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -444,9 +444,10 @@ static s32 uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
>                 return -data[first+1];
>         case UVC_GET_MAX:
>         case UVC_GET_RES:
> +               return data[first+1];
>         case UVC_GET_DEF:
>         default:
> -               return data[first+1];
> +               return 0;
>         }
>  }
>
>
> base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
> --
> 2.40.1
>


-- 
Ricardo Ribalda
