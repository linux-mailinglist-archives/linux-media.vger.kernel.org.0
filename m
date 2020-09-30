Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509A727EA4F
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 15:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730296AbgI3Nvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 09:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbgI3Nvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 09:51:31 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D399C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 06:51:31 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g29so1162695pgl.2
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=CQukQSDtZgTOOmy/BAQjSISsmEnMa6EXW1598ppKbt4=;
        b=YYbPRTJy+SWb04YszYad6ITkrlhbUDAUhUdq8SQUqG+ozLsam1AiEQTolpYCiw4y/x
         v5QMbWsXR2O8hQU09svlHf3K7iAFPpSzrwI/lVsCWupoBrA5tRhPdsljb6Qq54HHqCCi
         os0GuidCBj9BcLA1/K73LhkDBeaFblyYAoX36/1kKaNEtNylQFAo2wQgsz503g7R+EBj
         a+G4vLHt8JNfpgbRgoda9Kr+DbsMTuiTk+Asin+dc6JrNrcVmtoWTtXn90sLrJfZZdir
         NgHSe1yHjBU+3jhAohgeM3Dlfh+Dv00DSj4JJ0j2xTkURQtmdFKpLKn2UfRtv91q/eki
         raoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=CQukQSDtZgTOOmy/BAQjSISsmEnMa6EXW1598ppKbt4=;
        b=oZSt4FtSiG0/GHjcyx/HR1wxVPTjuVjFEYN/hwSfu2/VUub6jNcD1QaM4mqQ9B0r29
         oeLF1wWzbXK0DciK7Uh5cHV5QQ3y7AXrpw/cbtcfduGyLJaH3ujE3ycbig5b1iw4ullf
         KjpqSe15/NsZbDr7apXKo8JDp1ZdidFPZFa9ttkQ6uPwbHqKUhjQQWY8eS99k+kwsK07
         cHbYCA25pJdgiM6++fJYps5iFfsVCeYC9G9j/zYbzKpwc2C+oEHuJwnGFCZWiCeM0918
         A7L+jxoxf4VyVHXKT52boU1BU9eooSt2EnIUazcGJjctdZ2i0+YzqfOY1yqo64+vE4OE
         9kIQ==
X-Gm-Message-State: AOAM530PuNGqn40X1bsNfXsWCVOzFB8uFReRVm4J6nPNx6L8C8g7h/Us
        sUBp2TWfMgWExPF0x6vyuoZ/1tElQTe0paqFacI=
X-Google-Smtp-Source: ABdhPJy++QDuHnQtO4TyF5Wh4bTBCHtXkhltcRiK91HACoXKEr/6h679O9DyZ4M3AHG7L3wQMK0DuW1/RQK4Anuo2fo=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr2610921pfn.73.1601473890876; Wed, 30
 Sep 2020 06:51:30 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Sep 2020 16:51:10 +0300
Message-ID: <CAHp75Vfx+GUkSmCFD5BRLThkWwLcZDx=9p4yody29p+kqd525g@mail.gmail.com>
Subject: atomisp doesn't compile
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Mauro.

What is the status of AtomISP? It's already been a few days that it
doesn't compile in Linux Next.


  CC [M]  drivers/staging/media/atomisp/pci/sh_css.o
.../drivers/staging/media/atomisp/pci/sh_css.c: In function =E2=80=98start_=
binary=E2=80=99:
.../drivers/staging/media/atomisp/pci/sh_css.c:1384:6: error: =E2=80=98stre=
am=E2=80=99
undeclared (first use in this function); did you mean =E2=80=98strim=E2=80=
=99?
1384 |  if (stream->reconfigure_css_rx) {
     |      ^~~~~~
     |      strim
.../drivers/staging/media/atomisp/pci/sh_css.c:1384:6: note: each
undeclared identifier is reported only once for each function it
appears in
.../drivers/staging/media/atomisp/pci/sh_css.c: In function
=E2=80=98load_preview_binaries=E2=80=99:
.../drivers/staging/media/atomisp/pci/sh_css.c:2967:38: error:
=E2=80=98continuous=E2=80=99 undeclared (first use in this function)
2967 |   need_isp_copy_binary =3D !online && !continuous;
     |                                      ^~~~~~~~~~

...

--=20
With Best Regards,
Andy Shevchenko
