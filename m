Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A4B6F174C
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 14:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345504AbjD1MMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 08:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjD1MMM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 08:12:12 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1405A1
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 05:12:10 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b5c830d5eso7590978b3a.2
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682683930; x=1685275930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRSnEiCutfZrJXZrWjy8dp/3fJZyhrvy7GWs9SfEwgk=;
        b=UKDnb6wu5wvxzgkni3SM1/2nnCHBN+7TXefTtN0G6rdxWRwdT1vR2S73QDAbmhHt1o
         nxJlgctoChl/0bY/XnnFbXBiEqugL7TGmRLX8NwWAc3XXMYHzWhinB0MsoMA3Ocu73cI
         a4Cl5L8W2Oey21YU9lIleOe3+J6qw/wDYKm5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682683930; x=1685275930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRSnEiCutfZrJXZrWjy8dp/3fJZyhrvy7GWs9SfEwgk=;
        b=SU/0e8bi74TQYV4FsiikOsA8tbdoJ2+nav3FAkCpP6ErGteIuJ1UMOwh0UF6aqzoAF
         WuookIhgwcwQxY0zsnJFXIw0dvN9F+p8L38Lubr7cD9rxUvK5mMPPD3vsLhQmr/JfTWk
         DqTDaHEKARmh9KD38vF53Eefonf6MgCE3Javpb1fwluViKxVNyc8YfabVPfbjM3RpnTd
         pCJ73qGfQYEMfKuMnyW13SeBdbRKjVfbHJ9Sr6HHkMs6PqaS/e0oUhLR1qPEz0IeJSuS
         m9xK+hEW8/CIRX0qcIkCSDhyGRAkKSaseF5hYzf6ILK02kTTnbb9AztwYQcngOmXTp96
         9+eA==
X-Gm-Message-State: AC+VfDzpSp9Pep8AOVCQyh1vDwa/VYVEZaZ0DyyiJswREul/Vtry4SXA
        hNB6zsxUbRsSPAavjZxlwI7kBusr3ncfBPCNCySAkQ==
X-Google-Smtp-Source: ACHHUZ5pZlVXYSlanYBAWJ/Ob1IMdCLt709mNh6x6KFFmt9nguz+Xy7g/2Glo5Kt0c7nyhTQekaczg==
X-Received: by 2002:a05:6a00:2e03:b0:63a:65a9:10db with SMTP id fc3-20020a056a002e0300b0063a65a910dbmr7354121pfb.7.1682683929844;
        Fri, 28 Apr 2023 05:12:09 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00218b00b0063b8ada8777sm15067770pfi.112.2023.04.28.05.12.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 05:12:09 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a682eee3baso71891635ad.0
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 05:12:08 -0700 (PDT)
X-Received: by 2002:a17:902:dad1:b0:1a9:5c41:3f8e with SMTP id
 q17-20020a170902dad100b001a95c413f8emr6208692plx.42.1682683928138; Fri, 28
 Apr 2023 05:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <0477365efa0d45d7bddf9572d4f09c4c@msi.com> <CANiDSCsvuA4f8Kjzp27ncy+HXHft+chMeR5REFAjpj-G4Pc-JA@mail.gmail.com>
 <c19a2cb8f0d04f19bcc884f13b185261@msi.com> <CANiDSCuG+0w=8hRrcG-UPWhBJLL+As0j+KseShDrB=Dca9JXhw@mail.gmail.com>
 <25bb11b5e14a49718d97156c614c90e1@msi.com> <CANiDSCtRp2DZQ4=FCDp+BGMO6S4=-ukkL7bKFUF5Hp36m4aSog@mail.gmail.com>
 <f1f6c629d5184119b8bf1bb8172c5ac7@msi.com> <CANiDSCuBBgxWg=wffyQ-AB0u3rr4-secLWudpjC5iyypBn+Ryg@mail.gmail.com>
 <72f03a2b961f462f89fe592d684121d8@msi.com> <c79d08a32dfd4e85a3e23059805058f3@msi.com>
In-Reply-To: <c79d08a32dfd4e85a3e23059805058f3@msi.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 28 Apr 2023 14:11:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCvcxNL+qGoXPpKZ_tTNVHXCX2-ttjdbdJiTJ3rssG5LFw@mail.gmail.com>
Message-ID: <CANiDSCvcxNL+qGoXPpKZ_tTNVHXCX2-ttjdbdJiTJ3rssG5LFw@mail.gmail.com>
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

On Fri, 28 Apr 2023 at 14:06, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hard=
ycheng@msi.com> wrote:
>
> Hi Ricardo,
>
> I need to sincerely apologize to you for my mistake of implanting the wro=
ng GUID, which resulted in the device not being found.
> This was a foolish error on my part and I am sorry for taking up your val=
uable time.

Absolutely no worries, happy that it works for you now :)

Have a great weekend!

>
> Thank you again for your help.
>
> Best Regards,
> Hardy
>
> -----Original Message-----
> From: hardycheng(=E9=84=AD=E6=98=93=E6=98=95)
> Sent: Friday, April 28, 2023 5:10 PM
> To: Ricardo Ribalda <ribalda@chromium.org>
> Cc: linux-media@vger.kernel.org
> Subject: RE: UVCIOC_CTRL_MAP not work
>
> Hi Ricardo,
>
> Seems like no more message of XU controls, I run my program in time [1024=
6.557462], the relevant message is as follows:
> [10246.557462] usb 1-1: uvc_v4l2_open
> [10246.625260] usb 1-1: Resuming interface 0 [10246.625266] usb 1-1: Resu=
ming interface 1 [10246.645515] usb 1-1: uvc_v4l2_release
>
> Please check attachment of dmseg output `dmesg_20230428.log`
>
>
> Best Regards,
> Hardy#2374
>
>
> -----Original Message-----
> From: Ricardo Ribalda <ribalda@chromium.org>
> Sent: Friday, April 28, 2023 4:58 PM
> To: hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hardycheng@msi.com>
> Cc: linux-media@vger.kernel.org
> Subject: Re: UVCIOC_CTRL_MAP not work
>
> What about:
>
> rmmod uvcvideo
> modprobe uvcvideo trace=3D0xffffffff
>
> then run your program
>
> You might be able to figure out what xu controls are discovered.
>
>
> On Fri, 28 Apr 2023 at 10:50, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <ha=
rdycheng@msi.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for such a quick reply.
> > Follow your advice, but I just got few logs in dmesg
> >
> > [ 9452.677337] usb 1-1: uvc_v4l2_open
> > [ 9452.725254] usb 1-1: Resuming interface 0 [ 9452.725258] usb 1-1:
> > Resuming interface 1 [ 9452.751971] usb 1-1: uvc_v4l2_release [
> > 9455.236973] usb 1-1: Suspending interface 1 [ 9455.236977] usb 1-1:
> > Suspending interface 0
> >
> > Is there any way to get more debug message about this issue?
> >
> >
> > Best Regards,
> > Hardy#2374
> >
> >
> > -----Original Message-----
> > From: Ricardo Ribalda <ribalda@chromium.org>
> > Sent: Friday, April 28, 2023 4:45 PM
> > To: hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hardycheng@msi.com>
> > Cc: linux-media@vger.kernel.org
> > Subject: Re: UVCIOC_CTRL_MAP not work
> >
> > Hi Hardy
> >
> > try running:
> >
> > echo 0xffffffff > /sys/module/uvcvideo/parameters/trace
> >
> > and then your program
> >
> > and then dmesg
> >
> > It will tell you where it got stock
> >
> > Regards!
> >
> > On Fri, 28 Apr 2023 at 10:38, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <=
hardycheng@msi.com> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > So I modify the `uvc_xu_control_mapping` struct as follows:
> > > (full code reference attachment `uvc_xu_v4l_mapping_demo.c`) struct
> > > uvc_xu_control_mapping mapping =3D {
> > >         .id =3D 0x01,
> > >         .name =3D "My Extension Unit",
> > >         .entity =3D {0x10, 0xbc, 0x46, 0xba, 0x28, 0x5a, 0x4d, 0x7b, =
0x97, 0x0e, 0xfd, 0x91, 0x46, 0xa5, 0x2f, 0x2d},
> > >         .selector =3D 0x01,
> > >         .size =3D 32,
> > >         .offset =3D 0,
> > >         .v4l2_type =3D V4L2_CTRL_TYPE_INTEGER,
> > >         .data_type =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > >         .menu_info =3D NULL,
> > >         .menu_count =3D 0,
> > >         .reserved =3D {0},
> > > };
> > >
> > > And I got difference error message `UVCIOC_CTRL_MAP: No such file or
> > > directory` Please check attachment `strace_20230428_2.log` for
> > > strace output
> > >
> > >
> > > Best Regards,
> > > Hardy
> > >
> > >
> > > -----Original Message-----
> > > From: Ricardo Ribalda <ribalda@chromium.org>
> > > Sent: Friday, April 28, 2023 4:26 PM
> > > To: hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hardycheng@msi.com>
> > > Cc: linux-media@vger.kernel.org
> > > Subject: Re: UVCIOC_CTRL_MAP not work
> > >
> > > Hi Hardy
> > >
> > > Seems like you can only add mappings for  V4L2_CTRL_TYPE_INTEGER, V4L=
2_CTRL_TYPE_BOOLEAN:V4L2_CTRL_TYPE_BUTTON  and V4L2_CTRL_TYPE_MENU.
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t
> > > re
> > > e/drivers/media/usb/uvc/uvc_v4l2.c#n130
> > >
> > > You are trying to add a map for a V4L2_CTRL_TYPE_STRING
> > >
> > > Regards
> > >
> > > On Fri, 28 Apr 2023 at 10:20, hardycheng(=E9=84=AD=E6=98=93=E6=98=95)=
 <hardycheng@msi.com> wrote:
> > > >
> > > > Hi Ricardo,
> > > >
> > > > Thanks for reply,
> > > >
> > > > I replace `_IOWR('u', 0x20, struct uvc_xu_control_mapping)` to `
> > > > UVCIOC_CTRL_MAP` and got the same error, Please check attachment
> > > > for command output `strace -f ./uvc_xu_v4l_mapping_demo`
> > > >
> > > > Best Regards,
> > > > Hardy
> > > >
> > > > -----Original Message-----
> > > > From: Ricardo Ribalda <ribalda@chromium.org>
> > > > Sent: Friday, April 28, 2023 4:04 PM
> > > > To: hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hardycheng@msi.com>
> > > > Cc: linux-media@vger.kernel.org
> > > > Subject: Re: UVCIOC_CTRL_MAP not work
> > > >
> > > > Hi Hardy
> > > >
> > > > Why are you using:
> > > >
> > > > result =3D ioctl(fd, _IOWR('u', 0x20, struct
> > > > uvc_xu_control_mapping), &mapping);
> > > >
> > > > instead of
> > > >
> > > > result =3D ioctl(fd, UVCIOC_CTRL_MAP, &mapping);
> > > >
> > > > Can you return the output of:
> > > >
> > > > strace -f  uvc_xu_v4l_mapping_demo
> > > >
> > > > Thanks!
> > > >
> > > > On Fri, 28 Apr 2023 at 09:15, hardycheng(=E9=84=AD=E6=98=93=E6=98=
=95) <hardycheng@msi.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > # Environment:
> > > > >
> > > > > OS =3D Ubuntu 22.04 LTS (Linux version 5.19.0-41-generic) Program
> > > > > Language =3D C Language
> > > > >
> > > > > # Overview:
> > > > >
> > > > > We plug in our UVC camera to PC, and try to use
> > > > > `UVCIOC_CTRL_MAP` function on PC to create the v4l2 control
> > > > > mapping, but we got error
> > > > > `UVCIOC_CTRL_MAP: Inappropriate ioctl for device` Development
> > > > > with `C language` in `Ubuntu 22.04 LTS`
> > > > >
> > > > > # Description:
> > > > >
> > > > > We have a custom UVC camera and we can modify the extension
> > > > > unit(XU) by ourself. (USB descriptions reference attachments
> > > > > `uvc_xu_descriptor.PNG` & `usb_decriptions.txt`)
> > > > >
> > > > > We make sure that UVCIOC_CTRL_QUERY is work to control our XU
> > > > > item (demo code in attachment `uvc_xu_ioctl_demo.c`)
> > > > >
> > > > > but UVCIOC_CTRL_MAP function fail with error message `UVCIOC_CTRL=
_MAP:
> > > > > Inappropriate ioctl for device` (demo code in attachment
> > > > > `uvc_xu_v4l_mapping_demo.c`)
> > > > >
> > > > > # Problems:
> > > > >
> > > > > 1.      Is UVCIOC_CTRL_MAP function using in the PC host?
> > > > > 2.      Can you found any syntax problem in our demo code `uvc_xu=
_v4l_mapping_demo.c`?
> > > > > 3.      Is there any sample code about struct `uvc_xu_control_map=
ping` using?
> > > > >
> > > > > Looking forward to your reply,
> > > > > Best Regards,
> > > > > Hardy#2374
> > > > >
> > > > > *****CONFIDENTIAL INFORMATION*****
> > > > >
> > > > > This email is intended only for the use of the person or entity
> > > > > to whom it is addressed and contains information that may be
> > > > > subject to and/or may be restricted from disclosure by contract
> > > > > or applicable law. If you are not the intended recipient of this
> > > > > email, be advised that any disclosure, copy, distribution or use =
of the contents of this message is strictly prohibited.
> > > > > If you are not the intended recipient of this email, please
> > > > > notify the sender that you have received this in error by
> > > > > replying to this message. Then, please delete it from your
> > > > > system. Our Privacy Policy is available here https://www.msi.com/=
page/privacy-policy. Thank you.
> > > >
> > > >
> > > >
> > > > --
> > > > Ricardo Ribalda
> > > >
> > > >
> > > > *****CONFIDENTIAL INFORMATION*****
> > > >
> > > > This email is intended only for the use of the person or entity to
> > > > whom it is addressed and contains information that may be subject
> > > > to and/or may be restricted from disclosure by contract or
> > > > applicable law. If you are not the intended recipient of this
> > > > email, be advised that any disclosure, copy, distribution or use of=
 the contents of this message is strictly prohibited.
> > > > If you are not the intended recipient of this email, please notify
> > > > the sender that you have received this in error by replying to
> > > > this message. Then, please delete it from your system. Our Privacy
> > > > Policy is available here https://www.msi.com/page/privacy-policy. T=
hank you.
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
> > >
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
