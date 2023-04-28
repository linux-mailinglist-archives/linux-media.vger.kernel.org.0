Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D246F12F4
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 10:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjD1IEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 04:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjD1IEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 04:04:40 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70BC19BE
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:04:37 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-528c2c89493so31996a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682669077; x=1685261077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZFyVix6Ge0ERwfPTZuxsoKKwu4yWUyBTpj6BAk46oE=;
        b=dukEIG2CeuVFJLk0LBfFr8gQsZ51/qW5yzD4D80vDKKmCAk9jeXJ1Jrnu38rlXek8I
         wiIIrJ+988pHL1tXzmwuj2Qkf7IwYthMPQ45WJ0wre74IYioQGVBGGj1VtLoFysiwWdV
         bA5uFvlXPeCQg01BtJONXobUgTTSZwcmrnZK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669077; x=1685261077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZFyVix6Ge0ERwfPTZuxsoKKwu4yWUyBTpj6BAk46oE=;
        b=hWGOAiXjSJj++MoT9EgmRwECctoNgX+PmyzUMuNef+u/UlPrDwLnLDPq9QvuGb5bCF
         MnFJHAYcYPyz6PeGYL30UGkzCUcN1qaN037AeBIjFstzCI7a+WdV+UWeti8VVJIrg4dn
         XkZ/ZrDWggj1uJUF7IdxwnRB/7jue45kczcWmFMqebm2pea8+hgpqV95fNkGZ+DRTQua
         Qlk6MMAcaQXEIzg9yl7tJ7qQYYeRaLNKR4GSEw/KJ9f1oqZz0e3Gpss6A+RZl2Uq8k3Z
         Qrjx7y4XgEBcH7BEofwW83JwZ4dpsqpnVrV4ZysVl3I7gmUOTTFePKIWh2pk3LT7OH9e
         7zmA==
X-Gm-Message-State: AC+VfDwaxJwLKXouhSw5C4xHcIX2HE6tfSl2/5WpdtmBqHs+zd+TOnjP
        XcsmICWzobFxKXmMq6646S7iRmTB6H9eS325BMc=
X-Google-Smtp-Source: ACHHUZ6mydbj63TBOTdwAjEUWmW5vwh2MVqySzgUMN2QwhQxBYb0x5IWudnv5FQS4Y2hZllph8MSYQ==
X-Received: by 2002:a17:90b:4b01:b0:23d:10f2:bda2 with SMTP id lx1-20020a17090b4b0100b0023d10f2bda2mr4678928pjb.30.1682669076838;
        Fri, 28 Apr 2023 01:04:36 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id np9-20020a17090b4c4900b002367325203fsm14373758pjb.50.2023.04.28.01.04.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 01:04:36 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so7835363b3a.2
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:04:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:54a8:b0:ef:d508:f77e with SMTP id
 i40-20020a056a2054a800b000efd508f77emr5798109pzk.42.1682669075261; Fri, 28
 Apr 2023 01:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <0477365efa0d45d7bddf9572d4f09c4c@msi.com>
In-Reply-To: <0477365efa0d45d7bddf9572d4f09c4c@msi.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 28 Apr 2023 10:04:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCsvuA4f8Kjzp27ncy+HXHft+chMeR5REFAjpj-G4Pc-JA@mail.gmail.com>
Message-ID: <CANiDSCsvuA4f8Kjzp27ncy+HXHft+chMeR5REFAjpj-G4Pc-JA@mail.gmail.com>
Subject: Re: UVCIOC_CTRL_MAP not work
To:     =?UTF-8?B?aGFyZHljaGVuZyjphK3mmJPmmJUp?= <hardycheng@msi.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hardy

Why are you using:

result =3D ioctl(fd, _IOWR('u', 0x20, struct uvc_xu_control_mapping), &mapp=
ing);

instead of

result =3D ioctl(fd, UVCIOC_CTRL_MAP, &mapping);

Can you return the output of:

strace -f  uvc_xu_v4l_mapping_demo

Thanks!

On Fri, 28 Apr 2023 at 09:15, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hard=
ycheng@msi.com> wrote:
>
> Hi,
>
> # Environment:
>
> OS =3D Ubuntu 22.04 LTS (Linux version 5.19.0-41-generic)
> Program Language =3D C Language
>
> # Overview:
>
> We plug in our UVC camera to PC, and try to use `UVCIOC_CTRL_MAP` functio=
n on PC to create the v4l2 control mapping, but we got error `UVCIOC_CTRL_M=
AP: Inappropriate ioctl for device`
> Development with `C language` in `Ubuntu 22.04 LTS`
>
> # Description:
>
> We have a custom UVC camera and we can modify the extension unit(XU) by o=
urself. (USB descriptions reference attachments `uvc_xu_descriptor.PNG` & `=
usb_decriptions.txt`)
>
> We make sure that UVCIOC_CTRL_QUERY is work to control our XU item (demo =
code in attachment `uvc_xu_ioctl_demo.c`)
>
> but UVCIOC_CTRL_MAP function fail with error message `UVCIOC_CTRL_MAP: In=
appropriate ioctl for device` (demo code in attachment `uvc_xu_v4l_mapping_=
demo.c`)
>
> # Problems:
>
> 1.      Is UVCIOC_CTRL_MAP function using in the PC host?
> 2.      Can you found any syntax problem in our demo code `uvc_xu_v4l_map=
ping_demo.c`?
> 3.      Is there any sample code about struct `uvc_xu_control_mapping` us=
ing?
>
> Looking forward to your reply,
> Best Regards,
> Hardy#2374
>
> *****CONFIDENTIAL INFORMATION*****
>
> This email is intended only for the use of the person or entity to whom i=
t is
> addressed and contains information that may be subject to and/or may be
> restricted from disclosure by contract or applicable law. If you are not =
the
> intended recipient of this email, be advised that any disclosure, copy,
> distribution or use of the contents of this message is strictly prohibite=
d.
> If you are not the intended recipient of this email, please notify the se=
nder
> that you have received this in error by replying to this message. Then,
> please delete it from your system. Our Privacy Policy is available here
> https://www.msi.com/page/privacy-policy. Thank you.



--=20
Ricardo Ribalda
