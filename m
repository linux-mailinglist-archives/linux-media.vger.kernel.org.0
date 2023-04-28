Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B1C6F1337
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 10:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345535AbjD1IZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 04:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345289AbjD1IZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 04:25:50 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297B61FF5
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:25:46 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-51fdc1a1270so6852887a12.1
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682670345; x=1685262345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1Xb0WyJGG/D+0MGxESNaZph7OKy/MkMB25+zWwbHaU=;
        b=GLaLXgl213W9dBLMYohrqlVsWLm914IJCCYI2MGmdiXRwD3/Upu9ZoBhKEUYU4yd2F
         0u+FBSu6t8b2bzcyzpA5NmeTuXV6DyJRpRtSMLOjYaxfo7ClcDSRDI2KkSo2vi4cer1m
         bwEoE+se6piTzDzq5d0OQfJz7MVwFCE7JT+dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682670345; x=1685262345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1Xb0WyJGG/D+0MGxESNaZph7OKy/MkMB25+zWwbHaU=;
        b=lcO62g1IFxYCC/cYbwUTVq4mGjgDN8lZzszavDigh8rAc3X/GUunQqkyTQxvD8gd5H
         6+0zJR/z89vwigMJGZiDm/52PsZXZqp8eR6NZniRuOQbVA1V6Soj3Ye63n7hupr0ewhe
         UGsIDxhsK6BEXd4rFhb3HpmJlO1seHMT9slLkbTgb1nPsyKHM2sZSjQDlMCECoUYtObH
         PQ7cyMjCs8A58W5dk9MRs/zEMe19b67Vwo8uscxNSEKe72hH97D3ogJsxH9p/qnPajan
         olOFQh40UXvxTe/yDzG/nSpI8gFYWiqlyFrXKrtdhvE5ikIq1id+w1aPcGw4SoOy+OZf
         loeg==
X-Gm-Message-State: AC+VfDwkyw5ZlBtyPrv/yEHZP4oW0HSM7r8GLc31u33HptvKoSNS8hbc
        ld/WJ0Ad2n12GiY8yEiIBZWclb0oa/4RlVrRWL8=
X-Google-Smtp-Source: ACHHUZ5NL3PWuPIjM4cRtuq+nR04TUFEWYSmOvNg9rzGiQwnsodNnqHMbWFNWrhIEKF2is+df27L3g==
X-Received: by 2002:a17:90a:e294:b0:247:7320:a54a with SMTP id d20-20020a17090ae29400b002477320a54amr4622452pjz.5.1682670345059;
        Fri, 28 Apr 2023 01:25:45 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090ae28800b0023670dbb82fsm984424pjz.25.2023.04.28.01.25.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 01:25:44 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1a69f686345so73574115ad.2
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:25:44 -0700 (PDT)
X-Received: by 2002:a17:90a:c302:b0:24b:af7d:201d with SMTP id
 g2-20020a17090ac30200b0024baf7d201dmr4734123pjt.24.1682670343987; Fri, 28 Apr
 2023 01:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <0477365efa0d45d7bddf9572d4f09c4c@msi.com> <CANiDSCsvuA4f8Kjzp27ncy+HXHft+chMeR5REFAjpj-G4Pc-JA@mail.gmail.com>
 <c19a2cb8f0d04f19bcc884f13b185261@msi.com>
In-Reply-To: <c19a2cb8f0d04f19bcc884f13b185261@msi.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 28 Apr 2023 10:25:32 +0200
X-Gmail-Original-Message-ID: <CANiDSCuG+0w=8hRrcG-UPWhBJLL+As0j+KseShDrB=Dca9JXhw@mail.gmail.com>
Message-ID: <CANiDSCuG+0w=8hRrcG-UPWhBJLL+As0j+KseShDrB=Dca9JXhw@mail.gmail.com>
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

Seems like you can only add mappings for  V4L2_CTRL_TYPE_INTEGER,
V4L2_CTRL_TYPE_BOOLEAN:V4L2_CTRL_TYPE_BUTTON  and V4L2_CTRL_TYPE_MENU.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/media/usb/uvc/uvc_v4l2.c#n130

You are trying to add a map for a V4L2_CTRL_TYPE_STRING

Regards

On Fri, 28 Apr 2023 at 10:20, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hard=
ycheng@msi.com> wrote:
>
> Hi Ricardo,
>
> Thanks for reply,
>
> I replace `_IOWR('u', 0x20, struct uvc_xu_control_mapping)` to ` UVCIOC_C=
TRL_MAP` and got the same error,
> Please check attachment for command output `strace -f ./uvc_xu_v4l_mappin=
g_demo`
>
> Best Regards,
> Hardy
>
> -----Original Message-----
> From: Ricardo Ribalda <ribalda@chromium.org>
> Sent: Friday, April 28, 2023 4:04 PM
> To: hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <hardycheng@msi.com>
> Cc: linux-media@vger.kernel.org
> Subject: Re: UVCIOC_CTRL_MAP not work
>
> Hi Hardy
>
> Why are you using:
>
> result =3D ioctl(fd, _IOWR('u', 0x20, struct uvc_xu_control_mapping), &ma=
pping);
>
> instead of
>
> result =3D ioctl(fd, UVCIOC_CTRL_MAP, &mapping);
>
> Can you return the output of:
>
> strace -f  uvc_xu_v4l_mapping_demo
>
> Thanks!
>
> On Fri, 28 Apr 2023 at 09:15, hardycheng(=E9=84=AD=E6=98=93=E6=98=95) <ha=
rdycheng@msi.com> wrote:
> >
> > Hi,
> >
> > # Environment:
> >
> > OS =3D Ubuntu 22.04 LTS (Linux version 5.19.0-41-generic) Program
> > Language =3D C Language
> >
> > # Overview:
> >
> > We plug in our UVC camera to PC, and try to use `UVCIOC_CTRL_MAP`
> > function on PC to create the v4l2 control mapping, but we got error
> > `UVCIOC_CTRL_MAP: Inappropriate ioctl for device` Development with `C
> > language` in `Ubuntu 22.04 LTS`
> >
> > # Description:
> >
> > We have a custom UVC camera and we can modify the extension unit(XU)
> > by ourself. (USB descriptions reference attachments
> > `uvc_xu_descriptor.PNG` & `usb_decriptions.txt`)
> >
> > We make sure that UVCIOC_CTRL_QUERY is work to control our XU item
> > (demo code in attachment `uvc_xu_ioctl_demo.c`)
> >
> > but UVCIOC_CTRL_MAP function fail with error message `UVCIOC_CTRL_MAP:
> > Inappropriate ioctl for device` (demo code in attachment
> > `uvc_xu_v4l_mapping_demo.c`)
> >
> > # Problems:
> >
> > 1.      Is UVCIOC_CTRL_MAP function using in the PC host?
> > 2.      Can you found any syntax problem in our demo code `uvc_xu_v4l_m=
apping_demo.c`?
> > 3.      Is there any sample code about struct `uvc_xu_control_mapping` =
using?
> >
> > Looking forward to your reply,
> > Best Regards,
> > Hardy#2374
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
