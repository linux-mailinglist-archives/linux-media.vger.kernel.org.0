Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65346F1368
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 10:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345402AbjD1Iou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 04:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjD1Ior (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 04:44:47 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F112728
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:44:45 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-51b5490c6f0so8986361a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682671485; x=1685263485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPh0O7pHWwEBAdsL8MNBmF6QBTLCoWabe6JNza9m6Ik=;
        b=Oa6TLwn2sUAzkJsarcoJv//JDmp2Uph23eVgwojuMKMkLkk1Z3P/i74Ixqy33ewHsN
         oKCoVpNUBN43zAHvEa3wbh22qMuMeMiAcFpTzwh62l+BqkNoxIINh/6mVnANDAg4etLA
         /RECpfA7v72KsPWct0pUbFnoZqpW8g4Z+0XfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671485; x=1685263485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPh0O7pHWwEBAdsL8MNBmF6QBTLCoWabe6JNza9m6Ik=;
        b=WqKfek3RxVi9a1Kn/U/6pOprs/r/PspomtEQjKhPQFEeHameRGcQW7+PJgKfSGFC9Z
         zQPb57PjLmDgV3jSqP1kj+Hx0uvexTsuFOW0toh7ir2VuRJhR23SIk4KLyV6O+JwlQ5B
         vghO8yW8mYX2OefjNUb0uvEubiiWQtkM5MyexdlJm46LVKTgUsQC4qcnMncHFpXz/0q6
         3npFS6pchnIFy2/nCyS7gIHVVzSdLj7C8qqADqxca5H9e4pXdBT5E5PNYxoIRgc8qI8k
         /UtU/b1+FLm7Lk9HDMPIxnZFzYZax2N271bAl7LmHch4EcbD9k34pi28LO68LZ2vvHUm
         Jkww==
X-Gm-Message-State: AC+VfDyKzx5w4uC7aPZzfL6TVHrroNOi2bJvOhxvoy9VvsCeimEl1xnB
        GIheQxhtYScNGflLu22lbi8aknWsBv2Wu7wMPtk=
X-Google-Smtp-Source: ACHHUZ4AtD8FaoWhbjW9w6f3l1RpS6hrha/wFimoZqwpte3ipDnoWtan0r5xzpwiWHoRtMgp3eSs+A==
X-Received: by 2002:a17:90a:a502:b0:23f:7666:c8a1 with SMTP id a2-20020a17090aa50200b0023f7666c8a1mr4828519pjq.18.1682671484866;
        Fri, 28 Apr 2023 01:44:44 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id ot2-20020a17090b3b4200b0023cfdbb6496sm14749114pjb.1.2023.04.28.01.44.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 01:44:44 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a8097c1ccfso97434605ad.1
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:44:44 -0700 (PDT)
X-Received: by 2002:a17:903:120f:b0:1a6:5118:cb95 with SMTP id
 l15-20020a170903120f00b001a65118cb95mr5088212plh.23.1682671483635; Fri, 28
 Apr 2023 01:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <0477365efa0d45d7bddf9572d4f09c4c@msi.com> <CANiDSCsvuA4f8Kjzp27ncy+HXHft+chMeR5REFAjpj-G4Pc-JA@mail.gmail.com>
 <c19a2cb8f0d04f19bcc884f13b185261@msi.com> <CANiDSCuG+0w=8hRrcG-UPWhBJLL+As0j+KseShDrB=Dca9JXhw@mail.gmail.com>
 <25bb11b5e14a49718d97156c614c90e1@msi.com>
In-Reply-To: <25bb11b5e14a49718d97156c614c90e1@msi.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 28 Apr 2023 10:44:32 +0200
X-Gmail-Original-Message-ID: <CANiDSCtRp2DZQ4=FCDp+BGMO6S4=-ukkL7bKFUF5Hp36m4aSog@mail.gmail.com>
Message-ID: <CANiDSCtRp2DZQ4=FCDp+BGMO6S4=-ukkL7bKFUF5Hp36m4aSog@mail.gmail.com>
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

try running:

echo 0xffffffff > /sys/module/uvcvideo/parameters/trace

and then your program

and then dmesg

It will tell you where it got stock

Regards!

On Fri, 28 Apr 2023 at 10:38, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hard=
ycheng@msi.com> wrote:
>
> Hi Ricardo,
>
> So I modify the `uvc_xu_control_mapping` struct as follows:
> (full code reference attachment `uvc_xu_v4l_mapping_demo.c`)
> struct uvc_xu_control_mapping mapping =3D {
>         .id =3D 0x01,
>         .name =3D "My Extension Unit",
>         .entity =3D {0x10, 0xbc, 0x46, 0xba, 0x28, 0x5a, 0x4d, 0x7b, 0x97=
, 0x0e, 0xfd, 0x91, 0x46, 0xa5, 0x2f, 0x2d},
>         .selector =3D 0x01,
>         .size =3D 32,
>         .offset =3D 0,
>         .v4l2_type =3D V4L2_CTRL_TYPE_INTEGER,
>         .data_type =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
>         .menu_info =3D NULL,
>         .menu_count =3D 0,
>         .reserved =3D {0},
> };
>
> And I got difference error message `UVCIOC_CTRL_MAP: No such file or dire=
ctory`
> Please check attachment `strace_20230428_2.log` for strace output
>
>
> Best Regards,
> Hardy
>
>
> -----Original Message-----
> From: Ricardo Ribalda <ribalda@chromium.org>
> Sent: Friday, April 28, 2023 4:26 PM
> To: hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hardycheng@msi.com>
> Cc: linux-media@vger.kernel.org
> Subject: Re: UVCIOC_CTRL_MAP not work
>
> Hi Hardy
>
> Seems like you can only add mappings for  V4L2_CTRL_TYPE_INTEGER, V4L2_CT=
RL_TYPE_BOOLEAN:V4L2_CTRL_TYPE_BUTTON  and V4L2_CTRL_TYPE_MENU.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/media/usb/uvc/uvc_v4l2.c#n130
>
> You are trying to add a map for a V4L2_CTRL_TYPE_STRING
>
> Regards
>
> On Fri, 28 Apr 2023 at 10:20, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <ha=
rdycheng@msi.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thanks for reply,
> >
> > I replace `_IOWR('u', 0x20, struct uvc_xu_control_mapping)` to `
> > UVCIOC_CTRL_MAP` and got the same error, Please check attachment for
> > command output `strace -f ./uvc_xu_v4l_mapping_demo`
> >
> > Best Regards,
> > Hardy
> >
> > -----Original Message-----
> > From: Ricardo Ribalda <ribalda@chromium.org>
> > Sent: Friday, April 28, 2023 4:04 PM
> > To: hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hardycheng@msi.com>
> > Cc: linux-media@vger.kernel.org
> > Subject: Re: UVCIOC_CTRL_MAP not work
> >
> > Hi Hardy
> >
> > Why are you using:
> >
> > result =3D ioctl(fd, _IOWR('u', 0x20, struct uvc_xu_control_mapping),
> > &mapping);
> >
> > instead of
> >
> > result =3D ioctl(fd, UVCIOC_CTRL_MAP, &mapping);
> >
> > Can you return the output of:
> >
> > strace -f  uvc_xu_v4l_mapping_demo
> >
> > Thanks!
> >
> > On Fri, 28 Apr 2023 at 09:15, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <=
hardycheng@msi.com> wrote:
> > >
> > > Hi,
> > >
> > > # Environment:
> > >
> > > OS =3D Ubuntu 22.04 LTS (Linux version 5.19.0-41-generic) Program
> > > Language =3D C Language
> > >
> > > # Overview:
> > >
> > > We plug in our UVC camera to PC, and try to use `UVCIOC_CTRL_MAP`
> > > function on PC to create the v4l2 control mapping, but we got error
> > > `UVCIOC_CTRL_MAP: Inappropriate ioctl for device` Development with
> > > `C language` in `Ubuntu 22.04 LTS`
> > >
> > > # Description:
> > >
> > > We have a custom UVC camera and we can modify the extension unit(XU)
> > > by ourself. (USB descriptions reference attachments
> > > `uvc_xu_descriptor.PNG` & `usb_decriptions.txt`)
> > >
> > > We make sure that UVCIOC_CTRL_QUERY is work to control our XU item
> > > (demo code in attachment `uvc_xu_ioctl_demo.c`)
> > >
> > > but UVCIOC_CTRL_MAP function fail with error message `UVCIOC_CTRL_MAP=
:
> > > Inappropriate ioctl for device` (demo code in attachment
> > > `uvc_xu_v4l_mapping_demo.c`)
> > >
> > > # Problems:
> > >
> > > 1.      Is UVCIOC_CTRL_MAP function using in the PC host?
> > > 2.      Can you found any syntax problem in our demo code `uvc_xu_v4l=
_mapping_demo.c`?
> > > 3.      Is there any sample code about struct `uvc_xu_control_mapping=
` using?
> > >
> > > Looking forward to your reply,
> > > Best Regards,
> > > Hardy#2374
> > >
> > > *****CONFIDENTIAL INFORMATION*****
> > >
> > > This email is intended only for the use of the person or entity to
> > > whom it is addressed and contains information that may be subject to
> > > and/or may be restricted from disclosure by contract or applicable
> > > law. If you are not the intended recipient of this email, be advised
> > > that any disclosure, copy, distribution or use of the contents of thi=
s message is strictly prohibited.
> > > If you are not the intended recipient of this email, please notify
> > > the sender that you have received this in error by replying to this
> > > message. Then, please delete it from your system. Our Privacy Policy
> > > is available here https://www.msi.com/page/privacy-policy. Thank you.
> >
> >
> >
> > --
> > Ricardo Ribalda
> >
> >
> > *****CONFIDENTIAL INFORMATION*****
> >
> > This email is intended only for the use of the person or entity to
> > whom it is addressed and contains information that may be subject to
> > and/or may be restricted from disclosure by contract or applicable
> > law. If you are not the intended recipient of this email, be advised
> > that any disclosure, copy, distribution or use of the contents of this =
message is strictly prohibited.
> > If you are not the intended recipient of this email, please notify the
> > sender that you have received this in error by replying to this
> > message. Then, please delete it from your system. Our Privacy Policy
> > is available here https://www.msi.com/page/privacy-policy. Thank you.
>
>
>
> --
> Ricardo Ribalda
>
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
