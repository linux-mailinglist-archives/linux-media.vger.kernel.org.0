Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2948701997
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 22:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjEMUII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 16:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjEMUIH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 16:08:07 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268CC2107
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 13:08:06 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-757741ca000so808002085a.2
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684008485; x=1686600485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdNmNHC84vpIL/xdTBhXhO5chobgOJLGt1mZTKwHFw4=;
        b=C3mmC+HVXHxPik65w0WLQ0CQXp9DTDAWWCXkkxuuT0indLJBs1nd8J56dwR03qmKNk
         5DwMf1/8apfVocyaTpMQuDbCRBL7e0Pm0+lxmNkQcDwfQ2TBjf4gn/ttn5ixOkpTXJrI
         WVOrEehQN9P1HVJ/MLnxy8+9IR2iiNyL51fPFfI5g0FseI/4GPyN2f86njI8gn0oHjHB
         e3yVwvHp6+D8JVB3sxFBp8cZI2+6G+zLMdjUsSD1YFWAiZHbKBwu/xpUF/h0/srjO6ti
         +bzbdvnkK8wkz+8MOtVIS548HrVaLQiwu3UIaQY5cceKPJsrf5P8WvXqJpeI1e6ZXCPl
         1k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684008485; x=1686600485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdNmNHC84vpIL/xdTBhXhO5chobgOJLGt1mZTKwHFw4=;
        b=WxEMBnR/dMX8mpcgENDob5R3/7q+zlnFZjjvu1Ug60YztycyjSrjd5GOYhA2AWw+Jz
         7ZgnWpwm7IoaMcPAN9LeEeqBDUHUw7KU4Hwo1CJwuSALaDsue6nFPz2JD8BJFK3tmAwF
         rwOc4FVrTvbn7ysFFPQcN51XOObp7+mltoIAqkwGf0baQ1fvQAd3QZYe1raaBeIcp9FR
         46v+G2w44uDpaKKS2Fks/eMwc7ed+tZ35MOPilm7xosiPtvRztLzGo1JMogRCgfGZBRN
         LZKQ4iAGzClW4I1uIY8EFF/18Rlilw75W6rlhClFaO8VheeMkjbMW5UvpHFGfRvWOHJd
         lvhQ==
X-Gm-Message-State: AC+VfDwFooTu9//atlWzyKWAjZvDyuTNYomuvoR94Hrcawf4Tyj3QLo0
        tmw2QlMWon0ij8fAWd6Xui6BoujLZCCqAEHJXe0=
X-Google-Smtp-Source: ACHHUZ45u+MZKaF7R2aAfAlewh/oC5OhIc/IL4auXfoEwJ9Rz3s16Dd2aXw6gbPxV2rl2x29RqzuTgV4VfS0ZgFvij8=
X-Received: by 2002:a05:6214:d03:b0:623:46d8:535 with SMTP id
 3-20020a0562140d0300b0062346d80535mr4198128qvh.34.1684008485187; Sat, 13 May
 2023 13:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-6-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-6-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 May 2023 23:07:29 +0300
Message-ID: <CAHp75Ve=G_-8vdtVdK61zhPs45j44sFgF0JwZHV0XW9fMWXwQw@mail.gmail.com>
Subject: Re: [PATCH 05/30] media: atomisp: Replace source-pad checks with
 run-mode checks
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Currently atomisp behavior is determined by a mix of which /dev/video# no=
de
> (which isp-subdev source-pad) is opened + which run-mode is set.
> With various combinations not being allowed and likely leading to crashes
> due to lack of error checking.
>
> Now that we no longer support continuous mode and thus no longer support
> streaming from 2 /dev/video# nodes at the same time, there is no need
> to have a separate /dev/video# node for each run-mode. Instead the plan i=
s
> to support the 3 different run-modes on a single /dev/video# node.
> Since we are moving to a single isp-subdev source-pad, the behavior shoul=
d
> then be solely and consistently be defined by the run-mode.
>
> Replace various source-pad checks with run-mode checks in preparation for
> moving to a single source-pad. In some places the new run-mode checks
> overlap with existing run-mode checks and the checks are folded together
> into a single check.
>
> This removes handling of the ATOMISP_SUBDEV_PAD_SOURCE_VF source-pad,
> this source-pad was only useful for continuous mode, for which support ha=
s
> been removed.
>
> Note that currently the only run-mode which we actually have been able to
> get to work is the video-capture with scaler aka preview mode and as such
> that is also the only run-mode tested. This patch is intended to preserve
> the current (known to not work 100%) behavior of the other run-modes, so
> that those maybe can be enabled later.

...

> @@ -5005,16 +4993,11 @@ static int atomisp_get_pipe_id(struct atomisp_vid=
eo_pipe *pipe)

It seems to me that all 'else':s in this function are redundant.
At least you can probably drop them either here or in a separate change.

>                 return IA_CSS_PIPE_ID_VIDEO;
>         } else if (asd->vfpp->val =3D=3D ATOMISP_VFPP_DISABLE_LOWLAT) {
>                 return IA_CSS_PIPE_ID_CAPTURE;
> -       } else if (pipe =3D=3D &asd->video_out_video_capture) {
> +       } else if (asd->run_mode->val =3D=3D ATOMISP_RUN_MODE_VIDEO) {
>                 return IA_CSS_PIPE_ID_VIDEO;
> -       } else if (pipe =3D=3D &asd->video_out_vf) {
> -               return IA_CSS_PIPE_ID_CAPTURE;
> -       } else if (pipe =3D=3D &asd->video_out_preview) {
> -               if (asd->run_mode->val =3D=3D ATOMISP_RUN_MODE_VIDEO)
> -                       return IA_CSS_PIPE_ID_VIDEO;
> -               else
> -                       return IA_CSS_PIPE_ID_PREVIEW;
> -       } else if (pipe =3D=3D &asd->video_out_capture) {
> +       } else if (asd->run_mode->val =3D=3D ATOMISP_RUN_MODE_PREVIEW) {
> +               return IA_CSS_PIPE_ID_PREVIEW;
> +       } else if (asd->run_mode->val =3D=3D ATOMISP_RUN_MODE_STILL_CAPTU=
RE) {
>                 if (asd->copy_mode)
>                         return IA_CSS_PIPE_ID_COPY;
>                 else

--=20
With Best Regards,
Andy Shevchenko
