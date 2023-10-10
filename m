Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6217BF45D
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442444AbjJJHew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442324AbjJJHew (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:34:52 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0FE92
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:34:49 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so26356a12.1
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696923288; x=1697528088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DXcWZSIOJ/cwcEN5vE5PO/Y4AxLwEaQgF0sAPaprEo=;
        b=qEZlZTmFcza4+NKl2Psn+QyoeQ10FG+0lqFMNWeU/uEDAKec/Zb4YLXjfyCcEWy5mn
         7rqjNnPJrP15aKkytgX56EcKYF3KRkDdNjvSgFtN9VpqYjFTRE94ryz3E1BK+WmzHCKT
         Tjkj7ScFtSuBIS9oM6RQCgd0ZO3NPR9QLmd7g+Ni+qf/JxRW2SVGFw+PPg1MiZSqEtA/
         e3T+XUTTwktFVsKWBkGwfk4tUL1nqT45e6ICE0p4rgqstcNbcWEsFmYHRoSA9bVDC5pl
         cbDlvSc2EUKfAlYV3r2HXN7pnRjsDlr9XDEarJj4ERakCWUjAajqZ82d1TRpTB4ksBas
         VYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696923288; x=1697528088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DXcWZSIOJ/cwcEN5vE5PO/Y4AxLwEaQgF0sAPaprEo=;
        b=NKlm0w6k9FOOctZbT1TzTTTOSyki4VN2JsIyQO0PpgmeMNs4G6JWQo6/Sxg4CZqOeH
         6fDdan/b0zM8nTbgjPqVK8Mqn6vnB/x2Y0T6JnjzGACcIERNXj8yNtiL42Y9hY4X59f9
         LKfZhU3U9FCrz+opJo2+vPOODHNIg34la5S+zu3OJ5M2wwPSpLU26eRdWENkwrlojAxz
         YW5tdujR3Pwq4Cpo9r2V/xjUNu1q5FShLYaGnucmADvHQo20DniVyXOM+xqA/YIGaJny
         f3CNXEOtKOs2G0yPIts3mzGLEb6Bo7BblilWOSlgnXXk+yxHDoc/0L1+6weU+v7leizf
         U+nw==
X-Gm-Message-State: AOJu0YxH2rnXAYEa0g2gcsdHay17NRBG+8vt4cs0XMeD3o7ZyNG7SihB
        RgNtKWzFUqpamA5KA+DnbcJF2X3qpNvLXm4ED4Ajj52vbzGZbjDLj/CXwg==
X-Google-Smtp-Source: AGHT+IFMrZiu6io8Kp0I1vS+sXuuXKJeaniZ1JoiNPXWb/J7BflwLV2CPr9MgHSkTi/jMIFok87/637NYRdjMaG/Dp4=
X-Received: by 2002:a50:c051:0:b0:538:1d3a:d704 with SMTP id
 u17-20020a50c051000000b005381d3ad704mr493926edd.1.1696923287745; Tue, 10 Oct
 2023 00:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com> <20231010022136.1504015-7-yunkec@google.com>
 <49e32b1d-fd2e-4fd0-bcfe-78ff57adb588@xs4all.nl>
In-Reply-To: <49e32b1d-fd2e-4fd0-bcfe-78ff57adb588@xs4all.nl>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 10 Oct 2023 16:34:35 +0900
Message-ID: <CANqU6Fe8FeQ97btXTa97-qUWZRgnSavS5hd3TV=PhvNiyXR27Q@mail.gmail.com>
Subject: Re: [PATCH v13 06/11] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Oct 10, 2023 at 4:20=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> Hi Yunke,
>
> Just one remaining issue:
>
> On 10/10/2023 04:21, Yunke Cao wrote:
>
> <snip>
>
> > @@ -723,17 +741,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(st=
ruct v4l2_ctrl_handler *hdl,
> >   * @ops:       The control ops.
> >   * @id:        The control ID.
> >   * @p_def:     The control's default value.
> > + * @p_min:     The control's minimum value.
> > + * @p_max:     The control's maximum value.
> >   *
> > - * Sames as v4l2_ctrl_new_std(), but with support to compound controls=
, thanks
> > - * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def fr=
om a
> > - * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
> > - * compound control should be all zeroes.
> > + * Same as v4l2_ctrl_new_std(), but with support to compound controls,=
 thanks
> > + * to the @p_def/min/max fields. Use v4l2_ctrl_ptr_create() to create
> > + * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if th=
e
> > + * default, minimum and maximum value of the compound control should b=
e all
> > + * zeroes. Use v4l2_ctrl_ptr_create(NULL) if the min/max value of the =
compound
> > + * control is not defined, -ENODATA will be returned in this case.
>
> This still refers to ENODATA, but the text should be improved anyway, eve=
n
> the original wasn't very good. How about:
>
>  * Same as v4l2_ctrl_new_std(), but with support for compound controls.
>  * To fill in the @p_def, @p_min and @p_max fields, use v4l2_ctrl_ptr_cre=
ate()
>  * to convert a pointer to a const union v4l2_ctrl_ptr.
>  * Use v4l2_ctrl_ptr_create(NULL) if you want the default, minimum or max=
imum
>  * value of the compound control to be all zeroes.
>  * If the compound control does not set the ``V4L2_CTRL_FLAG_HAS_WHICH_MI=
N_MAX``
>  * flag, then it does not has minimum and maximum values. In that case ju=
st use
>  * v4l2_ctrl_ptr_create(NULL) for the @p_min and @p_max arguments.
>

Thanks for the suggestion! This sounds good to me.

Do you mind also reviewing patch 07/11 (the VIVID test control) and
https://patchwork.linuxtv.org/project/linux-media/list/?series=3D11069
(v4l-utils)?
So that I can address the comments together in the next version.

Best,
Yunke

> >   *
> >   */
> >  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler =
*hdl,
> >                                            const struct v4l2_ctrl_ops *=
ops,
> >                                            u32 id,
> > -                                          const union v4l2_ctrl_ptr p_=
def);
> > +                                          const union v4l2_ctrl_ptr p_=
def,
> > +                                          const union v4l2_ctrl_ptr p_=
min,
> > +                                          const union v4l2_ctrl_ptr p_=
max);
> >
> >  /**
> >   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu =
control.
>
> Other than this the controls part of this series looks good to me.
>
> Regards,
>
>         Hans
>
